# AML/FinCrime SAR Portfolio

This repository contains a collection of Tracfin-compliant Suspicious Activity Reports (SARs) drafted as part of an ongoing self-directed Financial Crime compliance training programme.

All cases are **entirely fictitious** and created for educational and portfolio purposes only. They follow the 5W framework (Who, What, When, Where, Why) in accordance with Tracfin quality standards and Article L.561-15 of the French Monetary and Financial Code (CMF).

---

## About This Portfolio

The SARs in this repository were drafted to develop hands-on expertise in:
- Tracfin declaration process and ERMES submission standards
- AML typology identification (structuring, layering, integration, chain hopping, money mule)
- Crypto-asset specific risks (USDT-TRC20, VASP exposure, blockchain analytics)
- PEP obligations and Enhanced Due Diligence (EDD)
- French regulatory framework (L.561-15, L.561-10, R.561-18 CMF)

Each SAR is accompanied by a brief **case context note** summarising the typology, subject profile, and key red flags — enabling faster navigation and review.

---

## SAR Index

---

### SAR 001 — Elena Popescu
**Risk Level:** HIGH
**Typology:** Money Mule — Velocity Detection
**Subject:** Individual customer, Romanian national, Paris

**Key Red Flags:**
- Incoming volume inconsistent with declared revenue
- Over 80% of income scattered to multiple unrelated parties
- Transactions with crypto mixers and high-risk jurisdictions
- 200% volume increase in one month
- Funds never retained more than 3 days

**Audit Trail Note:**
This case was identified via a velocity detection query flagging abnormal incoming flow relative to declared income. The investigation revealed a classic money mule pattern with crypto mixer exposure. SAR submitted at HIGH risk level.

---

### SAR 002 — Bogdan M.
**Risk Level:** CRITICAL
**Typology:** Crypto Layering — Circular Flows
**Subject:** Individual customer, multi-jurisdictional exposure

**Key Red Flags:**
- Circular fund flows across 4 countries
- ETH crypto layering
- Cash structuring behaviour
- Multiple entities with no clear business purpose
- Classic integration attempt pattern

**Audit Trail Note:**
This case was escalated to CRITICAL following identification of circular flows across multiple jurisdictions with no legitimate business rationale. ETH layering combined with cash structuring indicated an active integration attempt. SAR submitted at CRITICAL risk level.

---

### SAR 003 — Angela Joly
**Risk Level:** HIGH
**Typology:** USDT-TRC20 Structuring (Smurfing)
**Subject:** Individual customer, French national, salaried employee, Lyon
**Declared Income:** ~2,200€/month

**Key Red Flags:**
- 12 incoming transfers from 12 unrelated individuals
- All amounts systematically below 2,000€ threshold
- 18,200€ received in 6 weeks (x8 monthly income)
- Immediate conversion to USDT-TRC20 via application
- Transfers to 3 unidentified external TRC20 wallets
- Justification: "remboursements entre amis" — no supporting evidence

**Audit Trail Note:**
Alert triggered by incoming velocity and threshold-avoidance behaviour. Investigation confirmed a smurfing pattern — fragmented incoming flows immediately converted to USDT-TRC20 and transferred to anonymous wallets. No legitimate explanation obtained despite formal request. SAR formalised at HIGH risk level under Article L.561-15 CMF.

---

### SAR 004 — Thomas Renard
**Risk Level:** HIGH
**Typology:** Chain Hopping — Multi-Blockchain to USDT-TRC20
**Subject:** Individual customer, French national, freelance developer, Paris
**Declared Income:** ~3,500€/month (variable)

**Key Red Flags:**
- 10 crypto receptions across 3 distinct blockchains (ETH, BTC, SOL)
- 14,100€ received in 8 weeks (x4 monthly income)
- Each reception immediately converted to USDT (<12h)
- All USDT transferred to a single unidentified TRC20 wallet (<6h)
- Source ETH wallet tagged "high risk" on TRONSCAN
- No crypto purchases from account — transit only
- Justification: "trading on various platforms" — no evidence provided

**Audit Trail Note:**
Alert triggered by multi-chain incoming flows converging on the account. Investigation revealed a chain hopping pattern — funds received across Ethereum, Bitcoin and Solana networks, immediately converted to USDT-TRC20 and consolidated into a single anonymous wallet. The use of 3 distinct blockchains renders source tracing impossible without specialised analytics tools. SAR formalised at HIGH risk level under Article L.561-15 CMF.

---

### SAR 005 — Fabien Castelle
**Risk Level:** CRITICAL
**Typology:** PEP — VASP Exposure + Integration via SEPA
**Subject:** Individual customer, French national, Deputy Mayor (domestic PEP), Lyon
**Declared Income:** ~4,800€/month

**Key Red Flags:**
- PEP status — Enhanced Due Diligence applied at onboarding
- 4 transactions from UAE-based unregistered VASP (non-AMF)
- 24,000€ received in 2 months (x5 monthly income)
- Immediate USDC to USDT-TRC20 conversion
- Transfers to 2 unidentified TRC20 wallets
- 3 SEPA transfers in round amounts (3,000€ / 5,000€ / 8,000€) — integration indicator
- Source of wealth not demonstrated despite EDD obligations
- Covers all 3 stages: placement, layering, integration

**Audit Trail Note:**
Alert triggered by behavioural shift after 6 months of normal activity. Investigation revealed funds received from a non-AMF regulated VASP in a high-risk jurisdiction, immediately converted and transferred, while simultaneous round-amount SEPA transfers indicated integration into the legitimate financial circuit. PEP status elevated the risk level to CRITICAL. SAR formalised under Articles L.561-15 and L.561-10 CMF.

---

### SAR 006 — Cherry Cooke
**Risk Level:** HIGH
**Typology:** Money Mule — International Transfers to High-Risk Jurisdictions
**Subject:** Individual customer, British national, real estate agent, Paris
**Declared Income:** ~2,800€/month (variable commissions)

**Key Red Flags:**
- 9 incoming transfers from 9 unrelated French individuals
- All amounts below 2,000€ (structuring behaviour)
- 13,500€ received in 8 weeks (x4.8 monthly income)
- All funds transferred to 3 accounts in Romania, Moldova and Bulgaria (<48h)
- Bulgaria on FATF enhanced monitoring list
- Destination countries not declared at onboarding (only UK declared)
- Justification: "professional transfers — real estate investments abroad" — no evidence
- Account used exclusively as a transit point

**Audit Trail Note:**
Alert triggered by incoming fragmented flows immediately transferred to high-risk jurisdictions. Investigation confirmed a money mule pattern — account used as a transit point between 9 unrelated French individuals and 3 foreign accounts in jurisdictions not declared at onboarding. Justification provided was inconsistent with the observed geographic and financial pattern. SAR formalised at HIGH risk level under Article L.561-15 CMF.

---

## Typology Coverage

| SAR | Smurfing | Chain Hopping | Money Mule | PEP/EDD | Layering | Integration |
|-----|----------|---------------|------------|---------|----------|-------------|
| Elena Popescu | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |
| Bogdan M. | ❌ | ❌ | ❌ | ❌ | ✅ | ✅ |
| Angela Joly | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |
| Thomas Renard | ❌ | ✅ | ❌ | ❌ | ✅ | ❌ |
| Fabien Castelle | ❌ | ❌ | ❌ | ✅ | ✅ | ✅ |
| Cherry Cooke | ✅ | ❌ | ✅ | ❌ | ✅ | ❌ |

---

## Legal Framework

All SARs reference the French regulatory framework:
- **Article L.561-15 CMF** — Obligation de déclaration de soupçon
- **Article L.561-10 CMF** — Mesures de vigilance renforcée (EDD / PEP)
- **Article R.561-18 CMF** — Définition des Personnes Politiquement Exposées
- **ERMES Platform** — Tracfin submission portal
- **MiCA / Travel Rule** — Crypto-asset regulatory framework

---

## SQL Detection Queries

In addition to the SAR portfolio, this repository contains PostgreSQL detection queries covering:
Current queries cover:
- ✅ Velocity detection
- ✅ Pass-through / transit account detection

In progress:
- 🔄 Structuring / threshold avoidance
- 🔄 Layering pattern detection
- 🔄 Multi-wallet analysis
- 🔄 Risk scoring

---

*Portfolio built independently as part of a self-directed FinCrime compliance development programme — not required by current employer.*

*All cases are entirely fictitious. Any resemblance to real persons or entities is coincidental.*
