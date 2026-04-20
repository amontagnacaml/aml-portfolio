# SUSPICIOUS TRANSACTION REPORT (STR) — DÉCLARATION DE SOUPÇON

## CASE REF: DS-2026-0067 | RISK LEVEL: CRITICAL

> **Portfolio Note:** This is a fictional SAR created for educational and demonstration purposes. It follows the Tracfin submission format and incorporates the quality standards outlined in Tracfin's 2024 Activity Review. No real persons or transactions are represented.

---

## 1. REPORTING ENTITY INFORMATION (DÉCLARANT)

| Field | Details |
|-------|---------|
| **Entity Name** | Fintech SA |
| **Registration** | PSAN registered — AMF / ACPR supervised |
| **Address** | [Registered Office], Paris, France |
| **Declarant Role** | FinCrime Specialist — Tracfin Declarant |
| **ERMES Platform** | Submitted via ERMES secure portal |
| **Report Date** | 2026-04-16 |
| **Tracfin 5-Day Deadline** | Suspicion formalised 2026-04-12 → Deadline 2026-04-19 ✅ |
| **Urgency Flag** | ⚠️ Tracfin contact notified by email on 2026-04-13 due to case complexity and volume |

---

## 2. PERSON(S) SUBJECT TO SUSPICION — IDENTIFICATION

### 2.1 Primary Subject

| Field | Details |
|-------|---------|
| **Surname** | M. |
| **First Name** | Bogdan |
| **Date of Birth** | 1989-07-22 |
| **Nationality** | Bulgarian |
| **Place of Residence** | Anonymised, 75019 Paris, France |
| **Declared Occupation** | Import/Export Consultant |
| **SIREN** | 000 000 001 (auto-entrepreneur, registered 2025-06-15) |
| **Account Opening Date** | 2025-07-01 |
| **KYC Documents on File** | Bulgarian passport (valid), French residence permit (temporary), proof of address, auto-entrepreneur registration, no Kbis (individual enterprise) |
| **Customer Risk Rating at Onboarding** | MEDIUM (non-EU nationality + import/export sector) |

### 2.2 Related Entities and Persons — Network Map

| Role | Name / Entity | Jurisdiction | Relationship |
|------|--------------|-------------|--------------|
| **Company #1** | EUROBRIDGE TRADING EOOD | Bulgaria (Sofia) | Registered to Bogdan M.'s brother, Dimitar M. — sends large SEPA transfers |
| **Company #2** | VARNA LOGISTICS SRL | Romania (Bucharest) | Director: PETRESCU, Ion — receives transfers from Bogdan M. |
| **Company #3** | STARLINE SERVICES LTD | UK (London, Companies House) | Director: MORRIS, James — appears in circular flow |
| **Individual #1** | M., Dimitar | Bulgarian national, Sofia | Bogdan M.'s brother, director of Eurobridge Trading |
| **Individual #2** | PETRESCU, Ion | Romanian national, Bucharest | Director of Varna Logistics, receives funds |
| **Individual #3** | KOVACS, Tamas | Hungarian national, Budapest | Sends crypto (USDT) to Bogdan M.'s wallet |
| **Crypto Wallet** | 0x7aB3...f91E | Ethereum | Bogdan M.'s declared wallet, receives USDT |

---

## 3. SUSPICIOUS TRANSACTIONS — DESCRIPTION AND ANALYSIS

### 3.1 Transaction Overview

| Metric | Value |
|--------|-------|
| **Period Under Review** | 2025-07-01 to 2026-04-10 (9 months) |
| **Total Incoming Volume** | €312,400 |
| **Total Outgoing Volume** | €298,700 (95.6% of incoming) |
| **Declared Annual Revenue** | €35,000 (auto-entrepreneur declaration) |
| **Variance** | Incoming volume is **892%** above declared annual revenue (pro-rated to 9 months) |
| **Number of Incoming Transactions** | 89 |
| **Number of Outgoing Transactions** | 64 |
| **Current Account Balance** | €13,700 |
| **Average Retention Time** | 1.8 days |

### 3.2 Incoming Transaction Pattern

| Source | Country | Total Received | # Transfers | Avg Amount | Pattern |
|--------|---------|---------------|-------------|------------|---------|
| Eurobridge Trading EOOD | Bulgaria | €168,500 | 34 | €4,956 | Regular, weekly, amounts vary between €3,000-€8,000 |
| KOVACS, T. (via USDT → fiat) | Hungary | €52,300 | 18 | €2,906 | USDT received on-chain, converted to EUR via Deblock |
| Starline Services LTD | UK | €48,600 | 15 | €3,240 | Monthly clusters of 3-4 transfers within 48h |
| Various individuals | Multiple | €43,000 | 22 | €1,955 | Sporadic, mostly from Eastern European IBANs |

**Key observations:**
- **54% of all incoming funds originate from a single entity (Eurobridge Trading)** which is directed by the subject's brother. This familial connection, combined with the volume, raises concerns about beneficial ownership obscuring — Bogdan M. may be the de facto controller of Eurobridge Trading using his brother as a nominee director.
- USDT transfers from KOVACS are converted to fiat within hours of receipt. The on-chain analysis shows the USDT originates from a decentralised exchange (DEX) with no KYC requirements, making the original source of funds untraceable.
- Starline Services LTD was incorporated in the UK only 4 months before the first transfer. Companies House records show a single director (MORRIS, James), no employees, and a registered address that is a virtual office service. These are characteristics commonly associated with shell companies (CNRLT red flag).

### 3.3 Outgoing Transaction Pattern

| Recipient | Country | Total Sent | # Transfers | Method | Avg Amount |
|-----------|---------|-----------|-------------|--------|------------|
| Varna Logistics SRL | Romania | €124,800 | 26 | SEPA transfer | €4,800 |
| Starline Services LTD | UK | €67,200 | 14 | SEPA transfer | €4,800 |
| Cash withdrawals | France | €38,400 | 48 | ATM (multiple locations) | €800 |
| Crypto purchases (ETH) | N/A | €42,500 | 12 | On-platform purchase → external wallet | €3,542 |
| Bogdan M. personal accounts | France (other bank) | €25,800 | 8 | Internal SEPA | €3,225 |

**Key observations:**
- **Varna Logistics SRL receives 42% of all outgoing funds** — this Romanian entity has no visible online presence, no website, and its registered address corresponds to a residential building in a Bucharest suburb.
- Cash withdrawals of €800 per transaction (consistently below the €1,000 reporting threshold) across 48 separate ATM transactions at 14 different ATM locations in Paris — this is structuring.
- Crypto purchases (ETH) are immediately transferred to an external wallet not controlled by Deblock. The destination wallet shows on-chain activity consistent with mixer usage (multiple small outflows to unrelated addresses within 24h of receipt).

### 3.4 Circular Flow Detection — CRITICAL FINDING

Cross-referencing incoming and outgoing transactions reveals a **circular pattern**:

```
Eurobridge Trading (Bulgaria)
        ↓ €168,500
  Bogdan M. (Deblock account)
        ↓ €67,200
  Starline Services (UK)
        ↓ €48,600
  Bogdan M. (Deblock account)    ← RETURN FLOW
        ↓ €124,800
  Varna Logistics (Romania)
        ↓ [suspected return to Eurobridge via Romanian banking system]
```

**Analysis:** Starline Services LTD sends €48,600 to Bogdan M. and receives €67,200 from Bogdan M. — the entity is both a source and a destination. The net flow from Bogdan M. to Starline is €18,600, but the gross volume creates a circular pattern of €115,800 that artificially inflates transaction volumes and obscures the true origin of funds. This is consistent with **layering** — the second phase of money laundering where funds are moved through multiple accounts and jurisdictions to distance them from their criminal origin.

The suspected full circuit (Bulgaria → France → UK → France → Romania → Bulgaria) spans **4 jurisdictions** and uses a combination of SEPA transfers, crypto conversion, and cash withdrawals, making end-to-end tracing extremely difficult without cross-border cooperation.

### 3.5 Velocity and Escalation Timeline

| Month | Incoming | Outgoing | Retention % | Notable Events |
|-------|----------|----------|-------------|----------------|
| Jul 2025 | €8,200 | €4,100 | 50% | Account opened, low activity |
| Aug 2025 | €14,500 | €11,200 | 23% | First Eurobridge transfer |
| Sep 2025 | €22,800 | €20,400 | 11% | First Starline transfer, first crypto purchase |
| Oct 2025 | €31,500 | €29,800 | 5% | Volume doubles, cash withdrawals begin |
| Nov 2025 | €38,200 | €37,100 | 3% | KOVACS USDT transfers begin |
| Dec 2025 | €42,600 | €41,500 | 3% | Peak month, Varna Logistics first appears |
| Jan 2026 | €46,800 | €45,900 | 2% | Structuring pattern stabilises |
| Feb 2026 | €44,300 | €43,500 | 2% | Consistent with established pattern |
| Mar 2026 | €40,100 | €39,200 | 2% | Slight decrease — possible network awareness |
| Apr 2026 | €23,400 | €26,000 | -11% | Outgoing exceeds incoming — account drainage |

The pattern shows a classic money mule lifecycle: **ramp-up → peak exploitation → stabilisation → potential wind-down**. The April data showing outgoing exceeding incoming suggests the network may be preparing to abandon this account.

---

## 4. NATURE OF SUSPICION — ANALYSIS

### 4.1 Suspected Underlying Offences

1. **Money Laundering (Article 324-1 Code pénal)** — The circular transaction pattern across 4 jurisdictions, combined with the use of shell companies, crypto conversion, mixer usage, and cash structuring, is consistent with a sophisticated layering operation designed to obscure the origin of illicit funds.

2. **Operating as Part of an Organised Money Laundering Network (Article 324-2 Code pénal — aggravating circumstance)** — The coordination between multiple entities (Eurobridge, Starline, Varna Logistics) with familial connections (Bogdan/Dimitar M.) and the systematic nature of the operation suggest an organised network rather than individual criminal activity.

3. **Structuring / Smurfing (Article L.561-15 CMF)** — 48 cash withdrawals of approximately €800 each, distributed across 14 ATM locations, constitute deliberate fragmentation to avoid detection thresholds.

4. **Beneficial Ownership Obscuring** — Eurobridge Trading is directed by the subject's brother, suggesting Bogdan M. may be the economic beneficiary of the entity while using a nominee structure to avoid direct association.

5. **Potential Tax Evasion (Article 1741 CGI)** — €312,400 transited through the account against a declared annual revenue of €35,000. Even accounting for pass-through funds, the €38,400 in cash withdrawals and €25,800 in personal transfers (€64,200 total personal extraction) far exceed declared income.

### 4.2 Red Flags Identified (CNRLT / Tracfin / FATF Indicators)

| # | Red Flag | Observation |
|---|----------|-------------|
| 1 | **Circular transaction pattern** | Bulgaria → France → UK → France → Romania — layering across 4 jurisdictions |
| 2 | **Income variance: 892%** | €312k received vs. €35k declared — grossly inconsistent |
| 3 | **Pass-through ratio: 95.6%** | Average retention 1.8 days — account is a transit point |
| 4 | **Shell company indicators** | Starline Services: recent incorporation, virtual office, no employees, no visible activity |
| 5 | **Familial network** | Brother controls primary sending entity — nominee structure suspected |
| 6 | **Cash structuring** | 48 ATM withdrawals × €800, 14 locations — systematic fragmentation |
| 7 | **Crypto layering** | USDT from DEX (no KYC) → fiat conversion + ETH purchases → mixer-associated wallet |
| 8 | **Multi-jurisdictional complexity** | Bulgaria, France, UK, Romania, Hungary — designed to exceed single-jurisdiction oversight |
| 9 | **Account lifecycle pattern** | Ramp-up → peak → stabilisation → drainage — consistent with controlled exploitation |
| 10 | **Rapid entity creation** | Auto-entrepreneur + Starline both created within months of account opening |

### 4.3 Customer Communication Assessment

On **2026-02-20**, enhanced due diligence was triggered by the TM system. The compliance team contacted Bogdan M. via email requesting:
- Invoices or contracts supporting the Eurobridge Trading transfers
- Explanation of the business relationship with Starline Services and Varna Logistics
- Source of wealth documentation
- Explanation of the USDT transfers from KOVACS

**Subject's response (2026-02-25):**
- Stated Eurobridge Trading is his brother's company and he provides "consulting services" for their European expansion
- Provided a single-page "consulting agreement" dated 2025-06-20, with no specific scope of work, deliverables, or payment schedule — the document appears templated
- Stated Starline Services is a "logistics partner" but could not explain why funds flow in both directions
- Stated Varna Logistics handles "warehousing" but could not provide any shipping documents, customs declarations, or warehouse agreements
- Regarding KOVACS and USDT: stated this is "payment from a Hungarian client for separate consulting work" — no supporting documentation provided
- When asked about cash withdrawals, stated "I prefer to pay suppliers in cash" but could not name any suppliers

**Assessment:** The subject's explanations are vague, unsubstantiated, and internally inconsistent. The single "consulting agreement" provided lacks the specificity expected for a €168,500 relationship. The inability to explain bidirectional flows with Starline is particularly significant — in a legitimate business relationship, one party is typically a client and the other a service provider, not both simultaneously. The cash withdrawal justification is not credible given the systematic structuring pattern observed.

**Behaviour during communication:** The subject responded within 5 days (not unusually delayed) but provided minimal documentation. No follow-up responses were received after the initial exchange. The subject has not attempted to close the account, which may indicate either unawareness of the investigation or confidence that the activity will not be flagged.

### 4.4 Why This Is Not a Defensive Filing

This report is the result of a substantiated investigation process:
- **Detection:** TM system flagged pass-through ratio and velocity anomaly
- **Investigation:** Manual review identified circular pattern, shell company indicators, and structuring
- **Enhanced due diligence:** Customer was contacted, explanations were assessed and found inadequate
- **Network analysis:** Cross-referencing revealed familial connections and multi-jurisdictional coordination
- **Conclusion:** Multiple converging indicators establish a clear suspicion of organised money laundering

This is not an atypical-but-explainable situation. The combination of circular flows, shell entities, crypto layering, cash structuring, and unsubstantiated explanations constitutes a substantiated suspicion as defined in Tracfin's 2024 guidance.

---

## 5. RISK ASSESSMENT

| Factor | Level | Justification |
|--------|-------|---------------|
| **Customer Risk** | CRITICAL | Nominee structure suspected, unable to justify SOF/SOW, organised network indicators |
| **Geographic Risk** | CRITICAL | 4 jurisdictions (BG, FR, UK, RO) + Hungary (crypto) — designed to exploit cross-border gaps |
| **Transaction Risk** | CRITICAL | 892% variance, 95.6% pass-through, circular flows, velocity lifecycle |
| **Product Risk** | CRITICAL | Crypto (DEX-sourced USDT, mixer-associated ETH wallet) + cash structuring |
| **Network Risk** | CRITICAL | Multiple entities with familial/nominee connections operating across jurisdictions |
| **Overall Case Risk** | **CRITICAL** | Organised, multi-jurisdictional layering operation with all major risk indicators present |

**Recommendation:** Immediate Tracfin investigation recommended. Given the complexity and multi-jurisdictional nature, this case may warrant referral to Europol/FIU.net for cross-border coordination. Account restrictions have been applied pending Tracfin guidance. Tracfin's right to object (droit d'opposition) may be considered if further large outgoing transfers are attempted.

---

## 6. SUPPORTING DOCUMENTS ATTACHED

| # | Document | Format |
|---|----------|--------|
| 1 | Full account statement (2025-07-01 to 2026-04-10) | Excel + PDF |
| 2 | KYC file: passport, residence permit, proof of address, auto-entrepreneur registration | PDF |
| 3 | "Consulting agreement" provided by subject (Eurobridge ↔ Bogdan M.) | PDF |
| 4 | Companies House extract — Starline Services LTD | PDF |
| 5 | Email communication log (compliance ↔ subject, 2026-02-20 to 2026-02-25) | PDF |
| 6 | Circular flow diagram with amounts and dates | PDF |
| 7 | On-chain analysis report: USDT incoming sources + ETH outgoing wallet activity | PDF |
| 8 | ATM withdrawal log: dates, locations, amounts | Excel |
| 9 | Internal risk scoring output and TM alert history | PDF |
| 10 | OSINT report: Varna Logistics SRL (no web presence, residential address) | PDF |

---

## 7. DECLARATION

This report is submitted in accordance with Article L.561-15 of the Code monétaire et financier. The reporting entity has acted in good faith and benefits from the protections outlined in Article L.561-22 CMF. No disclosure of this report has been or will be made to the subject or any third party (Article L.561-19 CMF — tipping-off prohibition).

Given the case complexity and financial volume, Tracfin was notified via direct email contact on 2026-04-13 in accordance with the best practice for urgent/sensitive cases outlined in Tracfin's 2024 operational guidance.

**Submitted by:** FinCrime Specialist, Deblock SA
**Date:** 2026-04-16
**Platform:** ERMES

---

## 8. METHODOLOGY NOTES (PORTFOLIO ANNOTATION)

### How This SAR Follows Tracfin 2024 Best Practices

| Tracfin Requirement | How This SAR Addresses It |
|---------------------|--------------------------|
| **"State the nature of the suspicion"** | Section 4.1 identifies 5 specific suspected offences with legal article references |
| **"Mention the suspected crime"** | ML (Art. 324-1), organised ML (Art. 324-2), structuring, BO obscuring, tax evasion (Art. 1741 CGI) |
| **"Be exhaustive"** | Full identification of 3 entities + 3 individuals, SIREN provided, all KYC docs attached, bank statements in Excel + PDF |
| **"Describe, analyse, explain"** | Circular pattern not just listed but diagrammed, explained as layering, and contextualised within money mule lifecycle |
| **"Include customer communication"** | Section 4.3: full exchange, subject's explanations, credibility assessment, behavioural observations |
| **"Fill in structured fields correctly"** | Amounts calculated per ERMES methodology, all identification fields complete |
| **"Submit in good time"** | Filed within 5-day deadline + Tracfin contacted directly for urgent/sensitive case |
| **"Notify Tracfin of urgent cases"** | Email notification sent 2026-04-13 per Tracfin guidance for complex/high-volume cases |
| **"Avoid defensive filings"** | Section 4.4 documents the full investigation process from detection to conclusion |

### Why CRITICAL vs. HIGH (Decision Logic)

| Factor | Elena Popescu (HIGH) | Bogdan M. (CRITICAL) |
|--------|---------------------|---------------------|
| Volume | €47k | €312k |
| Network | Individual + unknown senders | Organised network with 3 entities + familial connections |
| Pattern | Linear pass-through | Circular flows across 4 jurisdictions |
| Crypto | BTC purchase, basic | USDT from DEX (no KYC) + ETH to mixer-associated wallet |
| Cash | None | Systematic structuring (48 × €800) |
| Response to EDD | Weak explanations | Weak explanations + fabricated documentation |
| Lifecycle | Early stage | Full lifecycle (ramp-up → peak → drainage) |

### SQL Detection Queries That Would Flag This Case

| Query | Detection Point |
|-------|----------------|
| **Pass-Through Detection** | 95.6% outgoing ratio, 1.8-day average retention |
| **Circular Pattern Detection** | Starline as both source AND destination — auto-flag |
| **Income Variance Analysis** | 892% variance — immediate CRITICAL escalation |
| **Multi-Recipient Dispersion** | 1 account → 3 entities + crypto + cash across 4 countries |
| **Velocity Detection** | Monthly volume increase from €8k to €46k in 6 months |
