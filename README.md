# Transaction Monitoring & AML Portfolio — FinTech Compliance Specialist

## About

FinTech Compliance Analyst with 2+ years of continuous client risk monitoring (KYC/KYB) and 1+ year of transaction-level financial profiling. This portfolio demonstrates the technical and regulatory skills I apply to suspicious transaction detection, SAR writing, and AML compliance within a French-regulated FinTech environment.

Note: This portfolio focuses on transaction monitoring and financial 
crime detection, complementing a core background in KYB/KYC continuous 
monitoring and corporate risk assessment (UBO identification, beneficial 
ownership structures, nominee director detection).

**Core expertise:** Variance analysis between declared revenue and actual transaction volumes, AML typology detection (structuring, pass-through, layering), formal escalation workflows, and French regulatory compliance (Tracfin, ACPR, CNRLT).

---

## Repository Structure

```
aml-portfolio/
│
├── README.md
│
├── sql-queries/
│   ├── 01_velocity_detection.sql
│   ├── 02_pass_through_detection.sql
│   ├── 03_income_variance_analysis.sql
│   ├── 04_circular_pattern_detection.sql
│   └── 05_multi_recipient_dispersion.sql
│
├── sars/
│   ├── SAR_01_Elena_Popescu_Velocity.md
│   └── SAR_02_Bogdan_M_PassThrough.md
│
├── case-studies/
│   └── money_mule_investigation_kevin_osei.md
│
├── regulatory-docs/
│   ├── Tracfin_Procedures_Guide.md
│   └── CNRLT_Red_Flags.md
│
└── schema/
    └── sample_database_schema.sql
```

---

## SQL Queries — AML Detection

Five production-ready queries designed to automate suspicious transaction detection. Each query includes extensive comments explaining the AML use case, regulatory basis, real-world application, and false positive reduction strategies.

| # | Query | Typology Detected | Key Metrics |
|---|-------|------------------|-------------|
| 1 | **Velocity Detection** | Rapid account depletion after funding | Time-to-drain, outgoing ratio within 72h window |
| 2 | **Pass-Through Detection** | Funds transit without retention | Incoming ≈ outgoing within short time window, low retention ratio |
| 3 | **Income Variance Analysis** | Declared revenue vs. actual volume | Variance %, risk categorisation thresholds |
| 4 | **Circular Pattern Detection** | Account loops (A→B→C→A) | Bidirectional flows, network analysis |
| 5 | **Multi-Recipient Dispersion** | One account funding many recipients | Recipient count, geographic spread, time clustering |

> **Note on Query #3 — Income Variance Analysis:** This query directly automates my current manual workflow. In my role, I aggregate 12-month transaction data per client and compare it against declared revenue to calculate variance. This query performs the same analysis in real-time, enabling continuous monitoring rather than periodic review.

---

## Suspicious Activity Reports (SARs)

Two complete Tracfin-compliant SARs written using the 5W framework and incorporating the quality standards from **Tracfin's 2024 Activity Review**. Each SAR includes full subject identification, transaction analysis, suspected underlying offences with legal references, customer communication assessment, and a checklist of red flags.

| # | Case | Risk Level | Key Typologies | Suspected Offences |
|---|------|-----------|----------------|-------------------|
| 1 | **Elena Popescu** | HIGH | Velocity + profile mismatch + pass-through | ML (Art. 324-1 CP), money mule, structuring |
| 2 | **Bogdan M.** | CRITICAL | Circular flows + shell companies + crypto layering + cash structuring | Organised ML (Art. 324-2 CP), structuring, BO obscuring, tax evasion |

> **Important:** These are fictional cases created for portfolio demonstration. No real persons or transactions are represented.

**Tracfin 2024 compliance:** Both SARs follow the specific best practices outlined in Tracfin's latest activity review — substantiated analysis (not defensive filings), suspected underlying offences identified, customer communication assessed, and all structured fields documented.

---

## Case Study

**Money Mule Investigation — Kevin Osei**

End-to-end investigation demonstrating how SQL detection queries, transaction analysis, and SAR writing work together to identify and report a money mule operation. Covers detection triggers, investigation workflow, regulatory failures, and lessons learned.

---

## Regulatory Documentation

| Document | Contents |
|----------|----------|
| **Tracfin Procedures Guide** | Complete reference: Tracfin structure, 5-day deadline, droit d'opposition, droits de communication, post-SAR process, good faith protection, penalty structure, 2024 best practices, SAR writing checklist |
| **CNRLT Red Flags** | French AML/CFT red flag indicators: transaction, customer, crypto-specific, and geographic risk factors |

---

## Technical Environment

- **SQL:** SQLite (queries tested on sqliteonline.com, compatible with PostgreSQL/MySQL with minor syntax adjustments)
- **Regulatory framework:** French AML/CFT (Code monétaire et financier, Code pénal, CNRLT, Tracfin, ACPR, FATF, EU 5th/6th Directives, MiCA)
- **SAR format:** Tracfin/ERMES compliant

---

## Why This Portfolio

Most compliance professionals describe their skills on a CV. This portfolio **demonstrates** them:

- The SQL queries show I can write detection logic, not just review alerts
- The SARs show I can produce regulatory-grade output following Tracfin's own quality standards
- The case study shows I can connect detection to investigation to reporting
- The regulatory documentation shows I understand the framework I operate within

---

## Contact

- **Email:** a.montagnac.pro@gmail.com
- **LinkedIn:** https://www.linkedin.com/in/a-montagnac-8915a03ba
- **Location:** Paris, France — available for remote positions across EU

---

*This portfolio is maintained as a living document and updated as new detection queries, case studies, and regulatory developments are added.*
