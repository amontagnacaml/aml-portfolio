# SUSPICIOUS TRANSACTION REPORT (STR) — DÉCLARATION DE SOUPÇON

## CASE REF: DS-2026-0041 | RISK LEVEL: HIGH

> **Portfolio Note:** This is a fictional SAR created for educational and demonstration purposes. It follows the Tracfin submission format and incorporates the quality standards outlined in Tracfin's 2024 Activity Review. No real persons or transactions are represented.

---

## 1. REPORTING ENTITY INFORMATION (DÉCLARANT)

| Field | Details |
|-------|---------|
| **Entity Name** | Deblock SA |
| **Registration** | PSAN registered — AMF / ACPR supervised |
| **Address** | [Registered Office], Paris, France |
| **Declarant Role** | FinCrime Specialist — Tracfin Declarant |
| **ERMES Platform** | Submitted via ERMES secure portal |
| **Report Date** | 2026-04-14 |
| **Tracfin 5-Day Deadline** | Suspicion formalised 2026-04-10 → Deadline 2026-04-17 ✅ |

---

## 2. PERSON(S) SUBJECT TO SUSPICION — IDENTIFICATION

### 2.1 Primary Subject

| Field | Details |
|-------|---------|
| **Surname** | POPESCU |
| **First Name** | Elena |
| **Date of Birth** | 1997-03-14 |
| **Nationality** | Romanian |
| **Place of Residence** | 12 Rue de Belleville, 75020 Paris, France |
| **Declared Occupation** | Freelance Graphic Designer |
| **Account Opening Date** | 2025-11-08 |
| **KYC Documents on File** | Romanian passport (valid), French residence permit, proof of address (utility bill), freelance registration (auto-entrepreneur) |
| **Customer Risk Rating at Onboarding** | LOW |

### 2.2 Related Parties

| Role | Name | Details |
|------|------|---------|
| **Frequent Sender #1** | IONESCU, Andrei | Romanian national, Bucharest-based, sends via Revolut |
| **Frequent Sender #2** | STANESCU, Maria | Romanian national, Cluj-based, sends via Wise |
| **Frequent Sender #3** | Unknown (IBAN only) | DE00 0000 0000 0000 0000 00 — German IBAN, no name match in system |
| **Primary Recipient** | OKAFOR, Chukwuemeka | Nigerian national, Lagos-based, receives via crypto (BTC wallet) |
| **Secondary Recipient** | AHMAD, Khalil | UAE-based, receives via SEPA transfer to Dubai-registered entity "KA Trading FZE" |

---

## 3. SUSPICIOUS TRANSACTIONS — DESCRIPTION AND ANALYSIS

### 3.1 Transaction Overview

| Metric | Value |
|--------|-------|
| **Period Under Review** | 2025-11-08 to 2026-04-08 (5 months) |
| **Total Incoming Volume** | €47,320 |
| **Total Outgoing Volume** | €42,150 (89.1% of incoming) |
| **Declared Annual Revenue** | €18,000 (auto-entrepreneur declaration) |
| **Variance** | Incoming volume is **263%** above declared annual revenue within 5 months |
| **Number of Incoming Transactions** | 74 |
| **Number of Outgoing Transactions** | 31 |
| **Current Account Balance** | €5,170 |

### 3.2 Incoming Transaction Pattern

Over the 5-month period, the account received 74 incoming transfers from 12 distinct sources. Three senders account for 78% of total incoming volume:

| Sender | Country | Total Received | # Transfers | Average Amount | Pattern |
|--------|---------|---------------|-------------|----------------|---------|
| IONESCU, A. | Romania | €16,800 | 22 | €763 | Regular, bi-weekly, round amounts (€500, €750, €1,000) |
| STANESCU, M. | Romania | €11,450 | 18 | €636 | Regular, weekly, amounts just below €1,000 |
| Unknown (DE IBAN) | Germany | €8,650 | 11 | €786 | Irregular, clustered in January and March |
| 9 other senders | Various | €10,420 | 23 | €453 | Sporadic, no clear pattern |

**Key observations:**
- The majority of incoming transfers originate from Romania, which is consistent with the subject's nationality but inconsistent with her declared occupation as a Paris-based freelance graphic designer.
- STANESCU's transfers are consistently just below the €1,000 threshold, suggesting potential structuring to avoid detection triggers.
- The German IBAN sender could not be identified — no name appears in the transfer metadata, which is unusual for SEPA transfers and may indicate a compliance gap at the originating institution.

### 3.3 Outgoing Transaction Pattern

Of the €42,150 outgoing, the pattern shows rapid redistribution:

| Recipient | Country | Total Sent | # Transfers | Method | Average Amount |
|-----------|---------|-----------|-------------|--------|----------------|
| OKAFOR, C. | Nigeria | €18,200 | 8 | Crypto (BTC purchase → external wallet) | €2,275 |
| AHMAD, K. / KA Trading FZE | UAE | €14,500 | 6 | SEPA transfer to Dubai entity | €2,417 |
| Cash withdrawals | France | €6,200 | 12 | ATM withdrawals, Paris locations | €517 |
| Other | Various | €3,250 | 5 | Small transfers to EU accounts | €650 |

**Key observations:**
- **89.1% of incoming funds are redistributed within an average of 3.2 days** — the account functions as a pass-through rather than a savings or operating account.
- The largest outflows go to **high-risk jurisdictions** (Nigeria, UAE) via methods that reduce traceability (crypto conversion, transfer to FZE entity).
- Cash withdrawals of approximately €500 per transaction, spread across different ATMs, suggest a small personal retention from the throughput.
- "KA Trading FZE" is a Free Zone Entity in Dubai — these structures are flagged in CNRLT guidance as vehicles frequently used for layering due to limited beneficial ownership transparency.

### 3.4 Velocity Analysis

The account shows an acceleration pattern:

| Month | Incoming | Outgoing | Retention | Days Active |
|-------|----------|----------|-----------|-------------|
| Nov 2025 | €3,200 | €1,800 | 44% | 8 (partial month) |
| Dec 2025 | €6,750 | €5,400 | 20% | 22 |
| Jan 2026 | €9,800 | €8,900 | 9% | 26 |
| Feb 2026 | €10,450 | €9,800 | 6% | 24 |
| Mar 2026 | €12,120 | €11,450 | 6% | 28 |
| Apr 2026 (partial) | €5,000 | €4,800 | 4% | 8 |

The incoming volume has increased **279%** from the first to the most recent full month, while the retention ratio has dropped from 44% to 4-6%. This acceleration pattern, combined with declining retention, is consistent with a money mule account that is being increasingly exploited as the operator gains confidence that the account is not being monitored.

---

## 4. NATURE OF SUSPICION — ANALYSIS

### 4.1 Suspected Underlying Offences

Based on the transaction patterns, profile inconsistencies, and behavioural indicators described above, the following offences are suspected:

1. **Money Laundering (Article 324-1 Code pénal)** — The account is used to receive funds from multiple sources and rapidly redistribute them to high-risk jurisdictions, consistent with the layering phase of money laundering.

2. **Acting as a Money Mule** — The subject's profile (young freelancer, recently opened account, no prior banking history with Deblock) combined with the transaction throughput significantly exceeding declared income suggests the account holder may be acting as an intermediary, whether knowingly or unknowingly.

3. **Potential Structuring (Article L.561-15 CMF)** — The recurring transfers from STANESCU just below €1,000 suggest deliberate fragmentation to avoid triggering automated detection thresholds.

### 4.2 Red Flags Identified (CNRLT / Tracfin Indicators)

| # | Red Flag | Observation |
|---|----------|-------------|
| 1 | **Transaction volume grossly inconsistent with declared profile** | €47k received in 5 months vs. €18k declared annual revenue — 263% variance |
| 2 | **Account used as pass-through** | 89% outgoing ratio, average 3.2-day retention |
| 3 | **Transfers to high-risk jurisdictions** | Nigeria (FATF grey list considerations), UAE (FZE opacity) |
| 4 | **Crypto conversion for outbound transfers** | BTC purchases followed by immediate transfer to external wallet — reduces traceability |
| 5 | **Structuring indicators** | Multiple transfers just below €1,000 threshold from single sender |
| 6 | **Velocity acceleration** | Monthly incoming volume increased 279% over 5 months with declining retention |
| 7 | **Unidentified sender** | German IBAN with no beneficiary name — potential Travel Rule non-compliance |
| 8 | **Multiple geographic risk factors** | Funds flow: Romania → France → Nigeria / UAE — multi-jurisdictional layering |

### 4.3 Customer Communication Assessment

On **2026-03-15**, the compliance team contacted the subject via in-app messaging to request clarification on the source of funds, specifically:
- The nature of the relationship with IONESCU and STANESCU
- Supporting documentation for the incoming transfers (invoices, contracts)
- The business purpose of transfers to OKAFOR and KA Trading FZE

**Subject's response (2026-03-18):**
- Stated IONESCU and STANESCU are "clients" who pay for graphic design work
- Could not provide invoices — stated she "works informally and invoices are not standard in her industry"
- Regarding OKAFOR: stated this was "a personal investment in a friend's business"
- Regarding KA Trading FZE: stated this was "payment for software licenses"

**Assessment:** The explanations are inconsistent and unsubstantiated. The subject could not provide a single invoice, contract, or evidence of delivered work for €28,250 in alleged freelance income from two clients. The claim that transfers to Nigeria represent a "personal investment" without any documentation is not credible given the amounts and frequency. The "software license" explanation for €14,500 to a Dubai FZE is similarly unsubstantiated.

### 4.4 Why This Is Not a Defensive Filing

This report is not submitted as a precautionary or de-risking measure. The suspicion is substantiated by:
- Quantitative evidence: 263% income variance, 89% pass-through ratio, velocity acceleration
- Qualitative evidence: inability to justify source of funds, unsubstantiated explanations, high-risk destination jurisdictions
- Pattern recognition: the transaction profile is consistent with known money mule typologies as described in CNRLT and Tracfin guidance

---

## 5. RISK ASSESSMENT

| Factor | Level | Justification |
|--------|-------|---------------|
| **Customer Risk** | HIGH | Profile inconsistency, unable to justify SOF |
| **Geographic Risk** | HIGH | Romania (origin), Nigeria (destination), UAE (destination) |
| **Transaction Risk** | HIGH | Volume/declared income variance, pass-through pattern, velocity |
| **Product Risk** | HIGH | Crypto conversion used for outbound transfers |
| **Overall Case Risk** | **HIGH** | Multiple converging risk indicators |

**Recommendation:** This case warrants Tracfin investigation. The account has been placed under enhanced monitoring. No right to object (droit d'opposition) is requested at this stage as the suspicious pattern is ongoing and further monitoring may reveal additional network connections.

---

## 6. SUPPORTING DOCUMENTS ATTACHED

| # | Document | Format |
|---|----------|--------|
| 1 | Full account statement (2025-11-08 to 2026-04-08) | Excel + PDF |
| 2 | KYC file: passport scan, residence permit, proof of address | PDF |
| 3 | Auto-entrepreneur registration certificate | PDF |
| 4 | In-app communication log (compliance ↔ subject, 2026-03-15 to 2026-03-18) | PDF |
| 5 | Transaction flow diagram (incoming/outgoing with counterparties) | PDF |
| 6 | BTC wallet addresses used for outbound transfers | Text file |
| 7 | Internal risk scoring output | PDF |

---

## 7. DECLARATION

This report is submitted in accordance with Article L.561-15 of the Code monétaire et financier. The reporting entity has acted in good faith and benefits from the protections outlined in Article L.561-22 CMF. No disclosure of this report has been or will be made to the subject or any third party (Article L.561-19 CMF — tipping-off prohibition).

**Submitted by:** FinCrime Specialist, Deblock SA
**Date:** 2026-04-14
**Platform:** ERMES

---

## 8. METHODOLOGY NOTES (PORTFOLIO ANNOTATION)

### How This SAR Follows Tracfin 2024 Best Practices

| Tracfin Requirement | How This SAR Addresses It |
|---------------------|--------------------------|
| **"State the nature of the suspicion, not just list facts"** | Section 4.1 identifies specific suspected offences (ML, money mule, structuring) with legal references |
| **"Mention the suspected crime or offence"** | Article 324-1 Code pénal (ML), Article L.561-15 CMF (structuring) explicitly cited |
| **"Be exhaustive — send all available information"** | Full identification (Section 2), complete transaction breakdown (Section 3), all supporting docs attached (Section 6) |
| **"Describe, analyse, explain"** | Each transaction pattern is not just listed but analysed — e.g., velocity acceleration interpreted as increasing exploitation confidence |
| **"Include customer communication assessment"** | Section 4.3 provides full communication log, subject's explanations, and credibility assessment |
| **"Fill in structured fields correctly"** | Amount field calculated per ERMES methodology, SIREN/identification fields complete |
| **"Submit in good time"** | Filed within 5-day deadline (suspicion formalised 04/10, filed 04/14) |
| **"Avoid purely defensive filings"** | Section 4.4 explicitly addresses why this is a substantiated report, not a de-risking exercise |
| **"Not just an atypical transaction — must be suspicious"** | Analysis moves from atypical (high volume) to suspicious (pass-through + high-risk destinations + inability to justify SOF) |

### SQL Detection Queries That Would Flag This Case

| Query | Detection Point |
|-------|----------------|
| **Velocity Detection** | Account drained 89% within average 3.2 days — immediate flag |
| **Income Variance Analysis** | 263% variance between declared €18k and actual €47k — auto-escalation |
| **Pass-Through Detection** | Incoming ≈ outgoing within short time window — pattern match |
| **Multi-Recipient Dispersion** | 1 account → 2 high-risk jurisdictions + crypto + cash — dispersion flag |

### Connection to Financial Profiling Work

This case directly mirrors the annual financial profiling process: comparing declared revenue (chiffre d'affaires) against actual transaction volume. The 263% variance would be immediately flagged in a manual review — the SQL Income Variance query automates this detection in real-time for continuous monitoring.
