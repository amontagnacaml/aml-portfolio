# TRACFIN PROCEDURES — COMPLETE REFERENCE GUIDE

## For FinCrime Specialists Operating in French-Regulated FinTech

> **Portfolio Note:** This guide consolidates Tracfin procedural requirements with operational best practices from Tracfin's 2024 Activity Review. Designed as a working reference for SAR writing, escalation workflows, and regulatory compliance.

---

## 1. WHAT IS TRACFIN

Tracfin (Traitement du Renseignement et Action contre les Circuits FINanciers clandestins) is France's Financial Intelligence Unit (FIU), operating under the Ministry of Economy and Finance.

**Core function:** Receive, analyse, and enrich suspicious transaction reports (STRs / déclarations de soupçon) from reporting entities, then transmit actionable intelligence to judicial authorities, tax administration, or partner FIUs.

**Key facts:**
- Created in 1990, reorganised under the Code monétaire et financier (CMF)
- Reports to the Minister of Economy, not to law enforcement — this independence is critical
- Member of the Egmont Group (global FIU network) — enables cross-border intelligence sharing
- Operates the ERMES secure platform for electronic STR submission

**Supervisory ecosystem:** Tracfin works alongside but separately from the ACPR (Autorité de Contrôle Prudentiel et de Résolution), which supervises financial institutions' compliance programs. ACPR inspects your systems; Tracfin receives your reports.

---

## 2. WHO MUST REPORT — REPORTING ENTITIES (ASSUJETTIS)

Under Article L.561-2 CMF, reporting entities include:

**Financial sector:** Banks, payment institutions, e-money issuers, investment firms, insurance companies, crypto-asset service providers (PSANs), crowdfunding platforms.

**Non-financial sector:** Notaries, lawyers (under specific conditions), auditors, accountants, real estate agents, casinos, high-value goods dealers, art market participants, sports agents.

**For Deblock / crypto-native FinTech:** As a PSAN registered with the AMF, Deblock is a reporting entity under both the standard CMF obligations and the specific PSAN requirements. This means dual compliance: general AML/CFT + crypto-specific regulations (MiCA transition).

---

## 3. SUBMISSION DEADLINE

### The Legal Text

Under **Article L.561-15 CMF**, once a suspicion is formalised, the reporting entity must submit the STR **"dans les meilleurs délais"** — meaning "as soon as possible". The law does not specify a fixed number of days.

> **Important precision:** The "5 working days" figure is **not written in law**. It is the operational standard communicated by Tracfin to reporting entities through their guidelines and the ERMES platform, and it reflects ACPR supervisory expectations in practice. In an interview or regulatory context, always state: *"The law requires submission as soon as possible under Article L.561-15 CMF — Tracfin's operational guidance establishes 5 working days as the expected standard from the moment suspicion is formalised."*

### What Triggers the Clock

The deadline starts when the suspicion is **formalised** — meaning when the compliance team has completed its assessment and concluded that the activity is suspicious (not merely atypical). There is no statutory maximum for the investigation phase before formalisation, provided the delay is justified and documented.

| Stage | Status | Clock |
|-------|--------|-------|
| TM system generates alert | Atypical — not yet suspicious | Not started |
| L1 analyst reviews and escalates to L2 | Under investigation | Not started |
| L2 analyst investigates, contacts customer, assesses response | Under investigation | Not started |
| L2/L3 concludes: this is suspicious → escalates to declarant | **Suspicion formalised** | **Clock starts** |
| FinCrime Specialist drafts and submits SAR on ERMES | Submitted | Clock stops |

**Key implication:** A complex investigation may legitimately take weeks before suspicion is formalised. What matters is that once formalised, submission is prompt — and that the entire process is documented in the audit trail.

### Pre-Transaction Reporting

Where possible, Tracfin encourages reporting **before** the suspicious transaction is executed. This enables Tracfin to exercise its **droit d'opposition** (right to object) — a temporary blocking order that prevents the transaction from going through for up to 10 working days (renewable once).

### Consequences of Late or Missing Filing

| Scenario | Risk |
|----------|------|
| Delayed filing without justification | Regulatory criticism, potential ACPR sanction |
| Systematic delays | ACPR formal warning or sanction (€5k–€500k) |
| Failure to file | Criminal liability under Article L.574-1 CMF — up to 5 years imprisonment and €375,000 fine for individuals |
| Tipping off the subject | Criminal offence under Article L.574-1 CMF |

> **Note on "maximum":** There is no statutory maximum deadline in the law. ACPR assesses delays on a case-by-case basis, considering whether the investigation phase was proportionate and whether the audit trail justifies the timeline.

---

## 4. DROIT D'OPPOSITION — RIGHT TO OBJECT

### Mechanism

When Tracfin identifies an imminent risk (typically in fraud or terrorism financing cases), it can issue a **droit d'opposition** ordering the reporting entity to block a specific transaction.

| Parameter | Detail |
|-----------|--------|
| **Duration** | 10 working days, renewable once (total: 20 working days) |
| **Scope** | Specific transaction(s), not the entire account (unless specified) |
| **Communication** | Via ERMES platform — reporting entity must monitor for instructions |
| **Non-compliance** | Executing a blocked transaction = criminal liability |

### Practical Implications for Deblock

In a crypto-native environment, droit d'opposition raises specific challenges: crypto transactions are irreversible once confirmed on-chain. This means the blocking order must be actioned **before** the on-chain transaction is broadcast. Internal procedures must ensure that suspicious crypto transfers can be held in a pending state within the platform before blockchain confirmation.

---

## 5. DROITS DE COMMUNICATION — RIGHT TO INFORMATION

### What It Is

Under Article L.561-26 CMF, Tracfin can request additional information from any reporting entity — not just the one that filed the original report. This is Tracfin's investigative power: it can compel any regulated entity to provide documents, account information, or transaction details related to an ongoing investigation.

### How It Works

| Step | Detail |
|------|--------|
| 1 | Tracfin sends a request via ERMES (or secure letter) |
| 2 | Request specifies the information needed and the persons/accounts concerned |
| 3 | Reporting entity must respond **within the deadline specified** (typically 30 days) |
| 4 | Response must be complete — partial responses trigger follow-up requests |

### What Tracfin Can Request

- Full account statements (Excel + PDF)
- KYC/KYB documentation
- Communication logs with the customer
- Internal risk assessments
- Transaction details (IBANs, counterparties, timestamps)
- Any other document held by the entity related to the persons under investigation

### What You Should Know

- You may receive a droit de communication even if you did **not** file the original report — another institution may have reported a person who is also your client
- Non-response or incomplete response can lead to ACPR sanctions
- The request itself is confidential — do not inform the client that Tracfin has requested their information

---

## 6. WHAT HAPPENS AFTER SAR SUBMISSION

| Phase | Action | Timeline |
|-------|--------|----------|
| **Receipt** | ERMES confirms receipt automatically | Immediate |
| **Triage** | Tracfin categorises by urgency and typology | Days |
| **Enrichment** | Tracfin cross-references with other STRs, tax data, police intelligence, partner FIUs | Weeks to months |
| **Analysis** | Tracfin analysts investigate the case, may issue droits de communication | Weeks to months |
| **Decision** | Tracfin decides: transmit to judiciary, tax administration, or close | Months |
| **Judicial transmission** | If criminal activity confirmed, Tracfin transmits to Procureur de la République | Variable |
| **Feedback** | Tracfin may (but is not required to) inform the reporting entity of the outcome | Rare |

**Important:** Tracfin does **not** systematically inform reporting entities of the outcome of their reports. You may never know what happened with your SAR. This is by design — Tracfin's investigations are confidential. Do not interpret silence as indication that the report was dismissed.

---

## 7. GOOD FAITH PROTECTION

### The Principle

Under Article L.561-22 CMF, any person who files an STR in **good faith** is protected from:
- Civil liability (the client cannot sue you for damages related to the filing)
- Criminal liability (you cannot be prosecuted for breach of professional secrecy related to the filing)
- Disciplinary action (your employer cannot sanction you for filing the report)

### Limits of Good Faith Protection

Good faith protection does **not** cover:
- **Defensive filings** submitted without genuine suspicion, solely to de-risk or shift liability to Tracfin (see Section 8)
- **Bad faith filings** intended to harm the subject without basis
- **Filings made after tipping off** the subject (which is itself a criminal offence)

Tracfin's 2024 Activity Review specifically flagged the problem of defensive filings: *"Some disclosures may be purely defensive, i.e. an attempt to de-risk or cover the reporting entity and shield it from liability. Such disclosures do not substantiate ML/TF suspicions and may not even be made in good faith."*

---

## 8. STR QUALITY — TRACFIN 2024 BEST PRACTICES

### What Tracfin Wants (2024 Activity Review)

Tracfin's 2024 report explicitly states that STR quality is critical and that too many reports — particularly from the non-financial sector — lack substance. For FinTech/financial sector reporting entities, the standard is higher.

### Best Practices (Tracfin 2024)

**1. Be Exhaustive — Send All Available Information**

| Category | What to Include |
|----------|----------------|
| **Identification** | ID documents, Kbis, SIREN, articles of association |
| **Financial** | Account statements (Excel + PDF), all transfers with IBANs and counterparty names, card statements |
| **Technical** | Phone numbers, IP addresses, device fingerprints |
| **Contractual** | Contracts, invoices, business agreements |
| **Legal/Accounting** | Legal documents, accounting records |
| **Amounts** | Calculated per ERMES methodology, entered in correct structured field |
| **Customer communication** | All exchanges with the customer + assessment of their behaviour and credibility |
| **OSINT** | Any publicly available information collected during investigation |

**Attachments must be legible** — avoid scanned documents in PDF format where possible. Bank statements should be provided in both Excel (for Tracfin's data processing) and PDF (for audit trail).

**2. Describe, Analyse, Explain**

This is the most critical requirement. An STR is **not** a list of transactions. It must contain:

| Element | Requirement |
|---------|-------------|
| **Individual identification** | Surname, first name, DOB, nationality, residence, occupation, date relationship established |
| **Entity identification** | Name, SIREN/SIRET, incorporation date, registered address, business sector, manager, beneficial owner |
| **Transaction description** | Not just amounts and dates — explain the flow, the pattern, the context |
| **Analysis** | Why are these transactions suspicious? What typology do they match? What is the suspected underlying offence? |
| **Customer explanation** | What did the customer say when asked? Is it credible? Why or why not? |
| **Warning signs** | Clearly and explicitly state the red flags identified |

**3. Submit in Good Time**

- Before the transaction if possible (enables droit d'opposition)
- As soon as possible after if not
- Timeliness is critical for fund recovery and seizure

**4. Notify Tracfin Directly for Urgent/Sensitive Cases**

If the case involves any of the following, contact your Tracfin liaison directly (email/phone) in addition to the ERMES submission:
- Highly complex fraud
- New/emerging fraud typology
- Person/entity with links to terrorist financing
- Particularly high financial risk
- Time-sensitive situation where funds may be transferred imminently

### What NOT to Do (Tracfin 2024)

| Don't | Why |
|-------|-----|
| **Submit without proper grounds** | An atypical transaction is not automatically suspicious. You must analyse, not just flag. If analysis removes doubts → don't report |
| **Assume someone else will report** | Even if another institution is involved, your unique business knowledge adds value. If suspicion exists, report it |
| **Omit information** | Incomplete reports trigger droits de communication, which wastes everyone's time. Include everything upfront |
| **Fill structured fields incorrectly** | Errors in suspicion type or amount fields hamper Tracfin's prioritisation and processing |
| **Submit purely defensive filings** | No genuine suspicion = no good faith = no legal protection |

### Examples of Unusable STRs (Tracfin 2024)

These are real examples from Tracfin's 2024 review of STRs that **could not be investigated**:

**Non-financial sector failures:**
- "THE PLAYER USES LARGE SUMS OF CASH" — no identification, no analysis, no suspicion stated
- Registration of multiple companies with directors of same nationality — observation without analysis
- Property purchase by non-residents without a loan — listing facts without explaining suspicion

**Financial sector failures:**
- "The YouTube presentation video does not look professional" — irrelevant observation
- Technical blockchain analysis without identifying the persons or stating the suspicion
- "Our client is 18, declared occupation is 'legal_social_cultural' and email appears disposable" — observations without analysis

**Common thread:** In all cases, persons are not identified, suspicious transactions are not described or analysed, and no grounds for suspicion are given. These are exactly what Tracfin calls "unusable."

---

## 9. PENALTY STRUCTURE

| Violation | Authority | Penalty |
|-----------|-----------|---------|
| Failure to file STR | ACPR | €5,000 to €500,000 per violation |
| Systematic compliance failures | ACPR | Up to €100M or 10% of annual turnover |
| Late filing (systematic) | ACPR | Formal warning → financial sanction |
| Failure to respond to droit de communication | ACPR | Financial sanction |
| Tipping off (informing the subject) | Criminal court | Up to 5 years imprisonment + €375,000 fine |
| Individual failure to report (personal liability) | Criminal court | Up to 5 years imprisonment + €375,000 fine |
| Executing a transaction under droit d'opposition | Criminal court | Criminal liability |

---

## 10. CNRLT RED FLAGS — QUICK REFERENCE

The CNRLT (Conseil National des Régulateurs de la Lutte contre le Terrorisme et le Blanchiment) publishes red flag indicators. Key categories:

### Transaction Red Flags
- Transaction volume inconsistent with declared profile/revenue
- Account used as pass-through (high outgoing ratio, low retention)
- Frequent transfers to/from high-risk jurisdictions
- Round amounts, repetitive patterns
- Transfers just below reporting thresholds (structuring)
- Rapid account drainage after funding
- Multiple accounts funded by same source

### Customer Red Flags
- Inability to justify source of funds or wealth
- Reluctance to provide documentation
- Use of nominee structures or shell companies
- Recently created entities with no visible activity
- Discrepancy between declared activity and actual transactions
- Complex corporate structures with no apparent economic rationale

### Crypto-Specific Red Flags
- Conversion from crypto to fiat with immediate withdrawal
- Funds originating from DEX (no KYC) or mixers/tumblers
- Wallet addresses associated with darknet markets
- Rapid movement between multiple wallets before fiat conversion
- Use of privacy coins (Monero, Zcash)
- Travel Rule non-compliance by counterparty institution

### Geographic Red Flags
- Transactions involving FATF grey/black list jurisdictions
- Multi-jurisdictional flows with no apparent business rationale
- Use of Free Zone Entities (FZE) in opaque jurisdictions
- Transfers routed through jurisdictions known for banking secrecy

---

## 11. SAR WRITING CHECKLIST — READY TO USE

Before submitting any STR, verify:

**Identification:**
- [ ] Subject fully identified (name, DOB, nationality, address, occupation)
- [ ] All related parties identified with available details
- [ ] Entity information includes SIREN, incorporation date, registered address, BO
- [ ] KYC documents attached

**Transactions:**
- [ ] Full account statement attached (Excel + PDF)
- [ ] Transactions described with counterparty IBANs and names
- [ ] Patterns identified and explained (not just listed)
- [ ] Amounts calculated correctly per ERMES methodology

**Analysis:**
- [ ] Nature of suspicion explicitly stated
- [ ] Suspected underlying offence(s) identified with legal references
- [ ] Red flags listed and connected to evidence
- [ ] Customer communication included with credibility assessment
- [ ] Analysis explains WHY this is suspicious (not just atypical)
- [ ] Not a defensive filing — genuine substantiated suspicion

**Process:**
- [ ] Filed within 5-day deadline
- [ ] All structured fields completed correctly on ERMES
- [ ] Supporting documents legible and usable
- [ ] Tracfin contacted directly if urgent/sensitive
- [ ] No tipping off of the subject

---

## 12. KEY LEGAL REFERENCES

| Reference | Subject |
|-----------|---------|
| Article L.561-2 CMF | List of reporting entities |
| Article L.561-15 CMF | Obligation to report suspicious transactions |
| Article L.561-19 CMF | Tipping-off prohibition |
| Article L.561-22 CMF | Good faith protection |
| Article L.561-26 CMF | Tracfin's right to information (droit de communication) |
| Article L.574-1 CMF | Criminal penalties for non-compliance |
| Article 324-1 Code pénal | Money laundering |
| Article 324-2 Code pénal | Aggravated money laundering (organised) |
| Article 1741 CGI | Tax evasion |
| FATF Recommendation 16 | Travel Rule |
| EU 5th/6th AML Directives | European framework |
| MiCA Regulation | Crypto-asset service provider obligations |

---

*Last updated: April 2026 — incorporates Tracfin 2024 Activity Review best practices and operational guidance.*
