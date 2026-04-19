-- ============================================================
-- QUERY #2: PASS-THROUGH DETECTION
-- ============================================================
-- WHAT IT DOES:
--   Identifies accounts where most incoming funds are
--   immediately redistributed — a key indicator of money
--   mule activity and layering (phase 2 of money laundering).
--
-- AML TYPOLOGY: Pass-through / Transit account
-- REGULATORY BASIS: CNRLT red flags, Tracfin typologies,
--                   FATF Recommendation 1
-- REAL-WORLD USE: Detects accounts used as intermediaries
--                 to move illicit funds between jurisdictions
--
-- AUTHOR: A.M — Compliance Analyst / AML Portfolio
-- ============================================================


-- ============================================================
-- WHAT I DO MANUALLY (current role):
--   Every year, I compare the total incoming transaction
--   volume against the client's declared revenue (chiffre
--   d'affaires). If actual volume significantly exceeds
--   declared income, I flag it and escalate to compliance.
--   That manual process is automated in Query #3
--   (Income Variance Analysis).
--
-- THIS QUERY (pass-through) is a related but distinct
--   detection: it compares what comes IN vs what goes OUT,
--   regardless of declared income. It catches transit
--   accounts used as intermediaries to move illicit funds —
--   not income variance.
--
-- WHAT THIS QUERY DOES:
--   Detects accounts where most incoming funds immediately
--   leave — running on ALL clients at once, in real time.
--   Instead of reviewing one client at a time, the entire
--   customer base is scanned in seconds.
-- ============================================================


SELECT

    -- --------------------------------------------------------
    -- STEP 1: IDENTIFY THE CUSTOMER
    -- We pull customer_id and last_name to know WHO is flagged.
    -- Without this, we'd have numbers with no context.
    -- --------------------------------------------------------
    c.customer_id,
    c.last_name,
    c.declared_income,      -- Annual declared income — used
                            -- later to contextualise the volume

    -- --------------------------------------------------------
    -- STEP 2: CALCULATE TOTAL INCOMING (total_in)
    --
    -- SUM(CASE WHEN ... THEN ... ELSE 0 END) is the core pattern.
    --
    -- CASE WHEN t.direction = 'IN'  → if this transaction is
    --                                  incoming (money received)
    -- THEN t.amount                 → add the amount to the sum
    -- ELSE 0                        → if it's outgoing, add 0
    --                                  (ignore it for this column)
    -- END                           → close the CASE statement
    --
    -- Result: one number = total of all money received
    -- --------------------------------------------------------
    SUM(CASE WHEN t.direction = 'IN'  THEN t.amount ELSE 0 END)
        AS total_in,

    -- --------------------------------------------------------
    -- STEP 3: CALCULATE TOTAL OUTGOING (total_out)
    --
    -- Same pattern, but reversed:
    -- CASE WHEN t.direction = 'OUT' → if this transaction is
    --                                  outgoing (money sent)
    -- THEN t.amount                 → add the amount to the sum
    -- ELSE 0                        → if it's incoming, add 0
    --
    -- Result: one number = total of all money sent out
    -- --------------------------------------------------------
    SUM(CASE WHEN t.direction = 'OUT' THEN t.amount ELSE 0 END)
        AS total_out,

    -- --------------------------------------------------------
    -- STEP 4: CALCULATE THE OUTFLOW RATIO (the key metric)
    --
    -- This is the heart of pass-through detection.
    -- Formula: (total_out / total_in) × 100 = % that left
    --
    -- ROUND(..., 1) → round to 1 decimal place for readability
    --
    -- The * 100.0 (not 100) forces decimal division.
    -- In SQLite, integer / integer = integer (no decimals).
    -- 87600 / 88500 = 0 (wrong)
    -- 87600 * 100.0 / 88500 = 98.9 (correct)
    --
    -- AML interpretation:
    --   < 50%  → customer retains most funds = normal
    --   50-79% → elevated but could be legitimate
    --   80-94% → suspicious — very little retained
    --   95%+   → critical — account is a pure transit point
    -- --------------------------------------------------------
    ROUND(
        SUM(CASE WHEN t.direction = 'OUT' THEN t.amount ELSE 0 END)
        * 100.0 /
        SUM(CASE WHEN t.direction = 'IN'  THEN t.amount ELSE 0 END),
        1
    ) AS outflow_ratio_pct


-- --------------------------------------------------------
-- STEP 5: JOIN THE TWO TABLES
--
-- We need data from TWO tables:
--   customers → customer_id, last_name, declared_income
--   transactions → direction, amount
--
-- JOIN connects them using the shared column: customer_id
-- "c" and "t" are aliases (shortcuts) so we don't have to
-- write the full table name every time.
--
-- FROM customers c        → main table, aliased as "c"
-- JOIN transactions t     → second table, aliased as "t"
-- ON c.customer_id =      → connect them where the
--    t.customer_id          customer_id matches
--
-- Without the JOIN, we'd have customer info but no transactions,
-- or transactions but no customer names.
-- --------------------------------------------------------
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id


-- --------------------------------------------------------
-- STEP 6: GROUP BY — collapse rows into one per customer
--
-- Without GROUP BY, SUM() would add up ALL transactions
-- across ALL customers into one giant number. Useless.
--
-- GROUP BY c.customer_id tells SQL:
-- "Calculate the SUM separately for each customer_id"
--
-- Result: one row per customer, with their individual totals.
-- --------------------------------------------------------
GROUP BY c.customer_id


-- --------------------------------------------------------
-- STEP 7: HAVING — filter AFTER aggregation
--
-- WHY HAVING and not WHERE?
--
-- WHERE filters BEFORE grouping (filters individual rows)
-- HAVING filters AFTER grouping (filters the aggregated result)
--
-- We can't use WHERE here because outflow_ratio_pct doesn't
-- exist yet at the WHERE stage — it's calculated by GROUP BY.
-- HAVING runs after GROUP BY, so the calculated columns exist.
--
-- CONDITION 1: outflow_ratio_pct >= 80
--   Only flag accounts where 80% or more of incoming funds
--   leave the account. Below 80% could be legitimate business.
--
-- CONDITION 2: total_in >= 5000
--   Ignore small amounts. A 90% ratio on €50 is not AML-relevant.
--   This threshold prevents false positives on small accounts.
--   Set at €5,000 here — calibrated for a FinTech customer base
--   with higher average transaction volumes (e.g. Deblock).
--   In traditional banking, €10,000 is more common.
--   This threshold should be tuned against real data to
--   minimise false positives without missing genuine cases
--   — this adjustment process is called "rule tuning".
-- --------------------------------------------------------
HAVING outflow_ratio_pct >= 80
   AND total_in >= 5000


-- --------------------------------------------------------
-- STEP 8: ORDER BY — sort results by highest risk first
--
-- DESC = descending = highest ratio at the top.
-- The most suspicious accounts appear first — priority for review.
-- --------------------------------------------------------
ORDER BY outflow_ratio_pct DESC;


-- ============================================================
-- EXPECTED OUTPUT (with AML practice database):
--
-- customer_id | last_name | declared_income | total_in | total_out | outflow_ratio_pct
-- C010        | Marek     | 35000           | 88500    | 87600     | 99.0  ← CRITICAL
-- C009        | Popescu   | 18000           | 45050    | 44600     | 99.0  ← CRITICAL
-- C014        | Kovacs    | 42000           | 23300    | 22900     | 98.3  ← CRITICAL
-- C013        | Ionescu   | 38000           | 24500    | 23850     | 97.3  ← CRITICAL
-- C015        | Hassan    | 22000           | 41000    | 35200     | 85.9  ← HIGH
--
-- NOTE: C013 and C014 are part of the circular pattern
-- (Viktor → Dragos → Tamas → Viktor). They appear here
-- because the circular flow creates a high pass-through ratio
-- on each individual account in the loop.
-- ============================================================


-- ============================================================
-- FALSE POSITIVE REDUCTION
--
-- Some legitimate accounts may show high outflow ratios:
--
-- 1. Business accounts that pay suppliers regularly
--    → Add tx_count filter: AND COUNT(t.tx_id) > 10
--      (single large transfers are less suspicious than many)
--
-- 2. Accounts that had one unusual month (bonus received + spent)
--    → Add date filter to look at rolling 90 days, not all time
--
-- 3. High-volume legitimate businesses (e-commerce, restaurants)
--    → Cross-reference with declared_income and occupation
--      SELECT ... WHERE c.occupation NOT IN ('Restaurant Owner',...)
--
-- In production: always combine ratio with manual review.
-- A 99% ratio + high-risk jurisdiction counterparty = escalate.
-- A 99% ratio + salary sent to own savings account = close.
-- ============================================================


-- ============================================================
-- CONNECTION TO FINANCIAL PROFILING WORK
--
-- This query directly automates what I do manually:
--
-- Manual process (current role):
--   1. Open client file
--   2. Aggregate all incoming transactions (12 months)
--   3. Aggregate all outgoing transactions (12 months)
--   4. Calculate what % left the account
--   5. Compare to declared revenue
--   6. Escalate if variance is suspicious
--
-- This query does steps 2-5 for ALL clients simultaneously.
-- What takes hours manually runs in milliseconds at scale.
--
-- The declared_income column is included in the SELECT
-- so the analyst reviewing results can immediately see
-- whether the transaction volume is consistent with the
-- customer's declared profile — without opening a separate file.
-- ============================================================
