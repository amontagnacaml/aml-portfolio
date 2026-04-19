-- ============================================================
-- AML PRACTICE DATABASE — PORTFOLIO DATASET
-- ============================================================
-- Fictional dataset built to develop and test SQL-based
-- AML detection queries. Contains 5 embedded typologies:
--   1. Velocity detection (rapid account drainage)
--   2. Pass-through (funds transit without retention)
--   3. Income variance (actual vs declared revenue)
--   4. Circular patterns (A→B→C→A layering)
--   5. Multi-recipient dispersion (aggregator accounts)
--
-- 20 fictional customers, ~180 transactions, 3 months of data
-- Compatible with SQLite, PostgreSQL, MySQL
--
-- Note: All persons and transactions are entirely fictional.
-- No real data is represented.
-- ============================================================

-- ============================================================
-- TABLE 1: CUSTOMERS
-- ============================================================

CREATE TABLE customers (
    customer_id     TEXT PRIMARY KEY,
    first_name      TEXT NOT NULL,
    last_name       TEXT NOT NULL,
    date_of_birth   DATE,
    nationality     TEXT,
    country         TEXT,
    occupation      TEXT,
    declared_income INTEGER,       -- annual declared income in EUR
    risk_rating     TEXT,          -- LOW, MEDIUM, HIGH
    account_open    DATE,
    kyc_status      TEXT           -- VERIFIED, PENDING, EXPIRED
);

INSERT INTO customers VALUES
-- Clean customers (normal activity)
('C001', 'Marie',    'Dupont',     '1990-05-12', 'FR', 'France',  'Teacher',                    32000,  'LOW',    '2024-09-01', 'VERIFIED'),
('C002', 'Jean',     'Martin',     '1985-11-30', 'FR', 'France',  'Software Engineer',          58000,  'LOW',    '2024-06-15', 'VERIFIED'),
('C003', 'Sophie',   'Bernard',    '1992-03-22', 'FR', 'France',  'Marketing Manager',          45000,  'LOW',    '2024-08-01', 'VERIFIED'),
('C004', 'Pierre',   'Leroy',      '1978-08-14', 'FR', 'France',  'Restaurant Owner',           52000,  'LOW',    '2024-07-10', 'VERIFIED'),
('C005', 'Camille',  'Moreau',     '1995-01-03', 'FR', 'France',  'Nurse',                      29000,  'LOW',    '2024-10-01', 'VERIFIED'),
('C006', 'Lucas',    'Petit',      '1988-06-25', 'FR', 'France',  'Accountant',                 48000,  'LOW',    '2024-05-20', 'VERIFIED'),
('C007', 'Emma',     'Robert',     '1993-09-17', 'FR', 'France',  'Graphic Designer',           35000,  'LOW',    '2024-11-01', 'VERIFIED'),
('C008', 'Antoine',  'Richard',    '1982-12-08', 'FR', 'France',  'Architect',                  62000,  'LOW',    '2024-04-15', 'VERIFIED'),

-- Suspicious: VELOCITY — rapid drainage after large deposit
('C009', 'Elena',    'Popescu',    '1997-03-14', 'RO', 'France',  'Freelance Graphic Designer', 18000,  'LOW',    '2025-11-08', 'VERIFIED'),

-- Suspicious: PASS-THROUGH — money in ≈ money out, low retention
('C010', 'Bogdan',   'Marek',      '1989-07-22', 'BG', 'France',  'Import/Export Consultant',   35000,  'MEDIUM', '2025-07-01', 'VERIFIED'),

-- Suspicious: INCOME VARIANCE — actual volume >> declared income
('C011', 'Fatima',   'Benali',     '2001-10-05', 'FR', 'France',  'Student',                     6000,  'LOW',    '2025-09-01', 'VERIFIED'),

-- Suspicious: CIRCULAR — A sends to B, B sends to C, C sends back to A
('C012', 'Viktor',   'Petrov',     '1986-04-18', 'BG', 'France',  'Consulting',                 40000,  'MEDIUM', '2025-06-01', 'VERIFIED'),
('C013', 'Dragos',   'Ionescu',    '1991-02-28', 'RO', 'France',  'Logistics',                  38000,  'MEDIUM', '2025-06-15', 'VERIFIED'),
('C014', 'Tamas',    'Kovacs',     '1988-11-11', 'HU', 'France',  'IT Consulting',              42000,  'MEDIUM', '2025-07-01', 'VERIFIED'),

-- Suspicious: MULTI-RECIPIENT DISPERSION — one account sends to many
('C015', 'Omar',     'Hassan',     '1994-05-30', 'FR', 'France',  'Delivery Driver',            22000,  'LOW',    '2025-08-01', 'VERIFIED'),

-- More clean customers
('C016', 'Claire',   'Dubois',     '1987-07-19', 'FR', 'France',  'Lawyer',                     75000,  'LOW',    '2024-03-01', 'VERIFIED'),
('C017', 'Thomas',   'Garcia',     '1991-10-02', 'FR', 'France',  'Sales Manager',              51000,  'LOW',    '2024-09-15', 'VERIFIED'),
('C018', 'Julie',    'Roux',       '1996-08-11', 'FR', 'France',  'Freelance Photographer',     28000,  'LOW',    '2025-01-10', 'VERIFIED'),
('C019', 'Marc',     'Fontaine',   '1983-03-27', 'FR', 'France',  'Civil Servant',              36000,  'LOW',    '2024-11-01', 'VERIFIED'),
('C020', 'Lina',     'Mercier',    '1999-12-15', 'FR', 'France',  'Student (Part-time Retail)',   9000,  'LOW',    '2025-02-01', 'VERIFIED');


-- ============================================================
-- TABLE 2: TRANSACTIONS
-- ============================================================

CREATE TABLE transactions (
    tx_id           TEXT PRIMARY KEY,
    customer_id     TEXT NOT NULL,
    tx_date         DATE NOT NULL,
    amount          REAL NOT NULL,
    direction       TEXT NOT NULL,    -- IN or OUT
    tx_type         TEXT,             -- SEPA, CRYPTO, CARD, CASH, INTERNAL
    counterparty    TEXT,
    counterparty_country TEXT,
    description     TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO transactions VALUES

-- ============================================================
-- CLEAN CUSTOMERS — Normal activity
-- ============================================================

-- C001 Marie Dupont (Teacher, €32k) — salary + normal spending
('T001', 'C001', '2026-01-05', 2650.00, 'IN',  'SEPA',     'Ministry of Education',    'FR', 'Salary January'),
('T002', 'C001', '2026-01-08', 45.90,   'OUT', 'CARD',     'Carrefour',                'FR', 'Groceries'),
('T003', 'C001', '2026-01-12', 850.00,  'OUT', 'SEPA',     'Landlord Dupuis',          'FR', 'Rent'),
('T004', 'C001', '2026-01-20', 120.00,  'OUT', 'CARD',     'SNCF',                     'FR', 'Train tickets'),
('T005', 'C001', '2026-02-05', 2650.00, 'IN',  'SEPA',     'Ministry of Education',    'FR', 'Salary February'),
('T006', 'C001', '2026-02-07', 52.30,   'OUT', 'CARD',     'Leclerc',                  'FR', 'Groceries'),
('T007', 'C001', '2026-02-12', 850.00,  'OUT', 'SEPA',     'Landlord Dupuis',          'FR', 'Rent'),
('T008', 'C001', '2026-03-05', 2650.00, 'IN',  'SEPA',     'Ministry of Education',    'FR', 'Salary March'),
('T009', 'C001', '2026-03-12', 850.00,  'OUT', 'SEPA',     'Landlord Dupuis',          'FR', 'Rent'),

-- C002 Jean Martin (Engineer, €58k) — salary + savings + normal
('T010', 'C002', '2026-01-03', 4800.00, 'IN',  'SEPA',     'TechCorp SAS',             'FR', 'Salary January'),
('T011', 'C002', '2026-01-10', 1200.00, 'OUT', 'SEPA',     'BNP Savings',              'FR', 'Savings transfer'),
('T012', 'C002', '2026-01-15', 89.99,   'OUT', 'CARD',     'Amazon',                   'FR', 'Online purchase'),
('T013', 'C002', '2026-02-03', 4800.00, 'IN',  'SEPA',     'TechCorp SAS',             'FR', 'Salary February'),
('T014', 'C002', '2026-02-10', 1200.00, 'OUT', 'SEPA',     'BNP Savings',              'FR', 'Savings transfer'),
('T015', 'C002', '2026-03-03', 4800.00, 'IN',  'SEPA',     'TechCorp SAS',             'FR', 'Salary March'),

-- C003 Sophie Bernard (Marketing, €45k) — normal spending
('T016', 'C003', '2026-01-02', 3700.00, 'IN',  'SEPA',     'AdAgency Paris',           'FR', 'Salary January'),
('T017', 'C003', '2026-01-18', 250.00,  'OUT', 'CARD',     'Zara',                     'FR', 'Shopping'),
('T018', 'C003', '2026-02-02', 3700.00, 'IN',  'SEPA',     'AdAgency Paris',           'FR', 'Salary February'),
('T019', 'C003', '2026-02-14', 180.00,  'OUT', 'CARD',     'Restaurant Le Petit',      'FR', 'Dinner'),
('T020', 'C003', '2026-03-02', 3700.00, 'IN',  'SEPA',     'AdAgency Paris',           'FR', 'Salary March'),

-- C005 Camille Moreau (Nurse, €29k) — small salary, small spending
('T021', 'C005', '2026-01-07', 2400.00, 'IN',  'SEPA',     'APHP',                     'FR', 'Salary January'),
('T022', 'C005', '2026-01-15', 35.00,   'OUT', 'CARD',     'Pharmacie',                'FR', 'Pharmacy'),
('T023', 'C005', '2026-02-07', 2400.00, 'IN',  'SEPA',     'APHP',                     'FR', 'Salary February'),
('T024', 'C005', '2026-03-07', 2400.00, 'IN',  'SEPA',     'APHP',                     'FR', 'Salary March'),

-- C016 Claire Dubois (Lawyer, €75k) — high income, normal patterns
('T025', 'C016', '2026-01-04', 6200.00, 'IN',  'SEPA',     'Cabinet Dubois & Assoc.',  'FR', 'Salary January'),
('T026', 'C016', '2026-01-15', 1800.00, 'OUT', 'SEPA',     'Landlord',                 'FR', 'Rent'),
('T027', 'C016', '2026-01-22', 350.00,  'OUT', 'CARD',     'Galeries Lafayette',       'FR', 'Shopping'),
('T028', 'C016', '2026-02-04', 6200.00, 'IN',  'SEPA',     'Cabinet Dubois & Assoc.',  'FR', 'Salary February'),
('T029', 'C016', '2026-02-15', 1800.00, 'OUT', 'SEPA',     'Landlord',                 'FR', 'Rent'),
('T030', 'C016', '2026-03-04', 6200.00, 'IN',  'SEPA',     'Cabinet Dubois & Assoc.',  'FR', 'Salary March'),

-- C020 Lina Mercier (Student part-time, €9k) — small amounts, normal
('T031', 'C020', '2026-01-10', 750.00,  'IN',  'SEPA',     'Monoprix',                 'FR', 'Part-time salary'),
('T032', 'C020', '2026-01-20', 80.00,   'OUT', 'CARD',     'FNAC',                     'FR', 'Books'),
('T033', 'C020', '2026-02-10', 750.00,  'IN',  'SEPA',     'Monoprix',                 'FR', 'Part-time salary'),
('T034', 'C020', '2026-03-10', 750.00,  'IN',  'SEPA',     'Monoprix',                 'FR', 'Part-time salary'),


-- ============================================================
-- SUSPICIOUS: C009 Elena Popescu — VELOCITY
-- Large deposits followed by rapid drainage within 72h
-- ============================================================

('T100', 'C009', '2026-01-06', 8500.00, 'IN',  'SEPA',     'Ionescu Andrei',           'RO', 'Transfer'),
('T101', 'C009', '2026-01-07', 4200.00, 'OUT', 'CRYPTO',   'External BTC Wallet',      NULL,  'BTC purchase'),
('T102', 'C009', '2026-01-07', 3800.00, 'OUT', 'SEPA',     'Okafor C.',                'NG', 'Transfer'),
('T103', 'C009', '2026-01-08', 400.00,  'OUT', 'CASH',     'ATM Paris 11',             'FR', 'Cash withdrawal'),
('T104', 'C009', '2026-01-15', 6200.00, 'IN',  'SEPA',     'Stanescu Maria',           'RO', 'Transfer'),
('T105', 'C009', '2026-01-16', 5800.00, 'OUT', 'SEPA',     'KA Trading FZE',           'AE', 'Transfer'),
('T106', 'C009', '2026-01-16', 350.00,  'OUT', 'CASH',     'ATM Paris 20',             'FR', 'Cash withdrawal'),
('T107', 'C009', '2026-01-28', 7800.00, 'IN',  'SEPA',     'Ionescu Andrei',           'RO', 'Transfer'),
('T108', 'C009', '2026-01-29', 3500.00, 'OUT', 'CRYPTO',   'External BTC Wallet',      NULL,  'BTC purchase'),
('T109', 'C009', '2026-01-29', 3900.00, 'OUT', 'SEPA',     'Okafor C.',                'NG', 'Transfer'),
('T110', 'C009', '2026-01-30', 300.00,  'OUT', 'CASH',     'ATM Paris 19',             'FR', 'Cash withdrawal'),
('T111', 'C009', '2026-02-10', 5500.00, 'IN',  'SEPA',     'Stanescu Maria',           'RO', 'Transfer'),
('T112', 'C009', '2026-02-10', 950.00,  'IN',  'SEPA',     'Unknown DE IBAN',          'DE', 'Transfer'),
('T113', 'C009', '2026-02-11', 6000.00, 'OUT', 'SEPA',     'KA Trading FZE',           'AE', 'Transfer'),
('T114', 'C009', '2026-02-11', 400.00,  'OUT', 'CASH',     'ATM Paris 20',             'FR', 'Cash withdrawal'),
('T115', 'C009', '2026-02-25', 9200.00, 'IN',  'SEPA',     'Ionescu Andrei',           'RO', 'Transfer'),
('T116', 'C009', '2026-02-26', 4500.00, 'OUT', 'CRYPTO',   'External BTC Wallet',      NULL,  'BTC purchase'),
('T117', 'C009', '2026-02-26', 4200.00, 'OUT', 'SEPA',     'Okafor C.',                'NG', 'Transfer'),
('T118', 'C009', '2026-02-27', 400.00,  'OUT', 'CASH',     'ATM Paris 11',             'FR', 'Cash withdrawal'),
('T119', 'C009', '2026-03-08', 4800.00, 'IN',  'SEPA',     'Stanescu Maria',           'RO', 'Transfer'),
('T120', 'C009', '2026-03-08', 2100.00, 'IN',  'SEPA',     'Unknown DE IBAN',          'DE', 'Transfer'),
('T121', 'C009', '2026-03-09', 6500.00, 'OUT', 'SEPA',     'KA Trading FZE',           'AE', 'Transfer'),
('T122', 'C009', '2026-03-09', 350.00,  'OUT', 'CASH',     'ATM Paris 20',             'FR', 'Cash withdrawal'),


-- ============================================================
-- SUSPICIOUS: C010 Bogdan Marek — PASS-THROUGH
-- High volume, money in ≈ money out, very low retention
-- ============================================================

('T130', 'C010', '2026-01-03', 12000.00, 'IN',  'SEPA',    'Eurobridge Trading EOOD',  'BG', 'Consulting fee'),
('T131', 'C010', '2026-01-04', 11500.00, 'OUT', 'SEPA',    'Varna Logistics SRL',      'RO', 'Payment'),
('T132', 'C010', '2026-01-04', 400.00,   'OUT', 'CASH',    'ATM Paris 19',             'FR', 'Cash withdrawal'),
('T133', 'C010', '2026-01-10', 8500.00,  'IN',  'SEPA',    'Starline Services LTD',    'GB', 'Payment'),
('T134', 'C010', '2026-01-11', 8000.00,  'OUT', 'SEPA',    'Eurobridge Trading EOOD',  'BG', 'Return payment'),
('T135', 'C010', '2026-01-11', 400.00,   'OUT', 'CASH',    'ATM Paris 10',             'FR', 'Cash withdrawal'),
('T136', 'C010', '2026-01-18', 15000.00, 'IN',  'SEPA',    'Eurobridge Trading EOOD',  'BG', 'Consulting fee'),
('T137', 'C010', '2026-01-19', 7500.00,  'OUT', 'SEPA',    'Varna Logistics SRL',      'RO', 'Payment'),
('T138', 'C010', '2026-01-19', 7000.00,  'OUT', 'CRYPTO',  'External ETH Wallet',      NULL,  'ETH purchase'),
('T139', 'C010', '2026-01-19', 400.00,   'OUT', 'CASH',    'ATM Paris 18',             'FR', 'Cash withdrawal'),
('T140', 'C010', '2026-02-01', 10000.00, 'IN',  'SEPA',    'Starline Services LTD',    'GB', 'Payment'),
('T141', 'C010', '2026-02-01', 5000.00,  'IN',  'CRYPTO',  'USDT from Kovacs T.',      'HU', 'USDT conversion'),
('T142', 'C010', '2026-02-02', 14500.00, 'OUT', 'SEPA',    'Varna Logistics SRL',      'RO', 'Payment'),
('T143', 'C010', '2026-02-02', 400.00,   'OUT', 'CASH',    'ATM Paris 19',             'FR', 'Cash withdrawal'),
('T144', 'C010', '2026-02-15', 18000.00, 'IN',  'SEPA',    'Eurobridge Trading EOOD',  'BG', 'Consulting fee'),
('T145', 'C010', '2026-02-16', 9000.00,  'OUT', 'SEPA',    'Starline Services LTD',    'GB', 'Payment'),
('T146', 'C010', '2026-02-16', 8200.00,  'OUT', 'CRYPTO',  'External ETH Wallet',      NULL,  'ETH purchase'),
('T147', 'C010', '2026-02-16', 400.00,   'OUT', 'CASH',    'ATM Paris 10',             'FR', 'Cash withdrawal'),
('T148', 'C010', '2026-03-01', 7000.00,  'IN',  'CRYPTO',  'USDT from Kovacs T.',      'HU', 'USDT conversion'),
('T149', 'C010', '2026-03-01', 13000.00, 'IN',  'SEPA',    'Eurobridge Trading EOOD',  'BG', 'Consulting fee'),
('T150', 'C010', '2026-03-02', 12000.00, 'OUT', 'SEPA',    'Varna Logistics SRL',      'RO', 'Payment'),
('T151', 'C010', '2026-03-02', 7500.00,  'OUT', 'SEPA',    'Starline Services LTD',    'GB', 'Payment'),
('T152', 'C010', '2026-03-02', 400.00,   'OUT', 'CASH',    'ATM Paris 19',             'FR', 'Cash withdrawal'),


-- ============================================================
-- SUSPICIOUS: C011 Fatima Benali — INCOME VARIANCE
-- Student with €6k declared, receiving much more
-- ============================================================

('T160', 'C011', '2026-01-05', 4200.00, 'IN',  'SEPA',     'Unnamed Company LLC',      'AE', 'Payment'),
('T161', 'C011', '2026-01-12', 3800.00, 'IN',  'SEPA',     'Quick Services SARL',      'FR', 'Payment'),
('T162', 'C011', '2026-01-20', 800.00,  'OUT', 'CARD',     'Various shops',            'FR', 'Shopping'),
('T163', 'C011', '2026-01-25', 4500.00, 'IN',  'SEPA',     'Unnamed Company LLC',      'AE', 'Payment'),
('T164', 'C011', '2026-02-03', 3500.00, 'IN',  'SEPA',     'Quick Services SARL',      'FR', 'Payment'),
('T165', 'C011', '2026-02-10', 5000.00, 'IN',  'CRYPTO',   'External USDT',            NULL,  'USDT conversion'),
('T166', 'C011', '2026-02-15', 900.00,  'OUT', 'CARD',     'Various shops',            'FR', 'Shopping'),
('T167', 'C011', '2026-02-22', 4800.00, 'IN',  'SEPA',     'Unnamed Company LLC',      'AE', 'Payment'),
('T168', 'C011', '2026-03-01', 3200.00, 'IN',  'SEPA',     'Quick Services SARL',      'FR', 'Payment'),
('T169', 'C011', '2026-03-10', 4700.00, 'IN',  'SEPA',     'Unnamed Company LLC',      'AE', 'Payment'),
('T170', 'C011', '2026-03-15', 1000.00, 'OUT', 'CARD',     'Various shops',            'FR', 'Shopping'),
('T171', 'C011', '2026-03-20', 5200.00, 'IN',  'CRYPTO',   'External USDT',            NULL,  'USDT conversion'),


-- ============================================================
-- SUSPICIOUS: C012/C013/C014 — CIRCULAR PATTERN
-- Viktor → Dragos → Tamas → Viktor (loop)
-- ============================================================

-- Viktor sends to Dragos
('T180', 'C012', '2026-01-08', 6000.00, 'IN',  'SEPA',     'Client Alpha GmbH',       'DE', 'Consulting'),
('T181', 'C012', '2026-01-09', 5500.00, 'OUT', 'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
-- Dragos receives from Viktor, sends to Tamas
('T182', 'C013', '2026-01-09', 5500.00, 'IN',  'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
('T183', 'C013', '2026-01-10', 5200.00, 'OUT', 'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),
-- Tamas receives from Dragos, sends back to Viktor
('T184', 'C014', '2026-01-10', 5200.00, 'IN',  'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
('T185', 'C014', '2026-01-11', 4900.00, 'OUT', 'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
-- Viktor receives from Tamas — LOOP COMPLETE
('T186', 'C012', '2026-01-11', 4900.00, 'IN',  'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),

-- Round 2 — same pattern, higher amounts
('T187', 'C012', '2026-02-05', 9000.00, 'IN',  'SEPA',     'Client Alpha GmbH',       'DE', 'Consulting'),
('T188', 'C012', '2026-02-06', 8500.00, 'OUT', 'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
('T189', 'C013', '2026-02-06', 8500.00, 'IN',  'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
('T190', 'C013', '2026-02-07', 8100.00, 'OUT', 'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),
('T191', 'C014', '2026-02-07', 8100.00, 'IN',  'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
('T192', 'C014', '2026-02-08', 7800.00, 'OUT', 'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
('T193', 'C012', '2026-02-08', 7800.00, 'IN',  'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),

-- Round 3
('T194', 'C012', '2026-03-03', 11000.00,'IN',  'SEPA',     'Client Alpha GmbH',       'DE', 'Consulting'),
('T195', 'C012', '2026-03-04', 10500.00,'OUT', 'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
('T196', 'C013', '2026-03-04', 10500.00,'IN',  'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
('T197', 'C013', '2026-03-05', 10000.00,'OUT', 'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),
('T198', 'C014', '2026-03-05', 10000.00,'IN',  'SEPA',     'Dragos Ionescu',           'FR', 'Payment'),
('T199', 'C014', '2026-03-06', 9600.00, 'OUT', 'SEPA',     'Viktor Petrov',            'FR', 'Payment'),
('T200', 'C012', '2026-03-06', 9600.00, 'IN',  'SEPA',     'Tamas Kovacs',             'FR', 'Payment'),

-- Cash retained by each (small amounts = personal cut)
('T201', 'C012', '2026-01-15', 300.00,  'OUT', 'CASH',     'ATM Paris 10',             'FR', 'Cash withdrawal'),
('T202', 'C013', '2026-01-15', 250.00,  'OUT', 'CASH',     'ATM Paris 18',             'FR', 'Cash withdrawal'),
('T203', 'C014', '2026-01-15', 280.00,  'OUT', 'CASH',     'ATM Paris 19',             'FR', 'Cash withdrawal'),
('T204', 'C012', '2026-02-15', 350.00,  'OUT', 'CASH',     'ATM Paris 10',             'FR', 'Cash withdrawal'),
('T205', 'C013', '2026-02-15', 300.00,  'OUT', 'CASH',     'ATM Paris 18',             'FR', 'Cash withdrawal'),
('T206', 'C014', '2026-02-15', 320.00,  'OUT', 'CASH',     'ATM Paris 19',             'FR', 'Cash withdrawal'),


-- ============================================================
-- SUSPICIOUS: C015 Omar Hassan — MULTI-RECIPIENT DISPERSION
-- One account distributes to 8+ recipients in short windows
-- ============================================================

-- Large incoming deposits
('T210', 'C015', '2026-01-10', 12000.00, 'IN',  'SEPA',    'Hassan Trading SARL',      'FR', 'Business income'),
-- Dispersed to many recipients within days
('T211', 'C015', '2026-01-11', 1500.00,  'OUT', 'SEPA',    'Recipient A - Ali K.',     'FR', 'Transfer'),
('T212', 'C015', '2026-01-11', 1400.00,  'OUT', 'SEPA',    'Recipient B - Youssef M.', 'FR', 'Transfer'),
('T213', 'C015', '2026-01-11', 1300.00,  'OUT', 'SEPA',    'Recipient C - Mourad S.',  'FR', 'Transfer'),
('T214', 'C015', '2026-01-12', 1600.00,  'OUT', 'SEPA',    'Recipient D - Karim L.',   'FR', 'Transfer'),
('T215', 'C015', '2026-01-12', 1200.00,  'OUT', 'SEPA',    'Recipient E - Samir N.',   'FR', 'Transfer'),
('T216', 'C015', '2026-01-12', 1500.00,  'OUT', 'SEPA',    'Recipient F - Rachid B.',  'MA', 'Transfer'),
('T217', 'C015', '2026-01-13', 1400.00,  'OUT', 'SEPA',    'Recipient G - Mehdi A.',   'FR', 'Transfer'),
('T218', 'C015', '2026-01-13', 900.00,   'OUT', 'CASH',    'ATM Paris 20',             'FR', 'Cash withdrawal'),

-- Second wave
('T220', 'C015', '2026-02-08', 15000.00, 'IN',  'SEPA',    'Hassan Trading SARL',      'FR', 'Business income'),
('T221', 'C015', '2026-02-09', 1800.00,  'OUT', 'SEPA',    'Recipient A - Ali K.',     'FR', 'Transfer'),
('T222', 'C015', '2026-02-09', 1700.00,  'OUT', 'SEPA',    'Recipient B - Youssef M.', 'FR', 'Transfer'),
('T223', 'C015', '2026-02-09', 1500.00,  'OUT', 'SEPA',    'Recipient C - Mourad S.',  'FR', 'Transfer'),
('T224', 'C015', '2026-02-10', 1900.00,  'OUT', 'SEPA',    'Recipient D - Karim L.',   'FR', 'Transfer'),
('T225', 'C015', '2026-02-10', 1600.00,  'OUT', 'SEPA',    'Recipient E - Samir N.',   'FR', 'Transfer'),
('T226', 'C015', '2026-02-10', 1800.00,  'OUT', 'SEPA',    'Recipient H - Nabil F.',   'TN', 'Transfer'),
('T227', 'C015', '2026-02-10', 1500.00,  'OUT', 'SEPA',    'Recipient F - Rachid B.',  'MA', 'Transfer'),
('T228', 'C015', '2026-02-11', 1000.00,  'OUT', 'CASH',    'ATM Paris 20',             'FR', 'Cash withdrawal'),

-- Third wave
('T230', 'C015', '2026-03-05', 14000.00, 'IN',  'SEPA',    'Hassan Trading SARL',      'FR', 'Business income'),
('T231', 'C015', '2026-03-06', 1600.00,  'OUT', 'SEPA',    'Recipient A - Ali K.',     'FR', 'Transfer'),
('T232', 'C015', '2026-03-06', 1500.00,  'OUT', 'SEPA',    'Recipient B - Youssef M.', 'FR', 'Transfer'),
('T233', 'C015', '2026-03-06', 1700.00,  'OUT', 'SEPA',    'Recipient C - Mourad S.',  'FR', 'Transfer'),
('T234', 'C015', '2026-03-07', 1800.00,  'OUT', 'SEPA',    'Recipient D - Karim L.',   'FR', 'Transfer'),
('T235', 'C015', '2026-03-07', 1400.00,  'OUT', 'SEPA',    'Recipient E - Samir N.',   'FR', 'Transfer'),
('T236', 'C015', '2026-03-07', 1500.00,  'OUT', 'SEPA',    'Recipient I - Tarek H.',   'DZ', 'Transfer'),
('T237', 'C015', '2026-03-07', 1300.00,  'OUT', 'SEPA',    'Recipient G - Mehdi A.',   'FR', 'Transfer'),
('T238', 'C015', '2026-03-08', 800.00,   'OUT', 'CASH',    'ATM Paris 20',             'FR', 'Cash withdrawal'),


-- ============================================================
-- MORE CLEAN CUSTOMERS — to add noise
-- ============================================================

-- C004 Pierre Leroy (Restaurant, €52k) — irregular but legitimate
('T240', 'C004', '2026-01-02', 8500.00, 'IN',  'SEPA',     'Various clients',          'FR', 'Restaurant revenue'),
('T241', 'C004', '2026-01-10', 3200.00, 'OUT', 'SEPA',     'Metro Cash & Carry',       'FR', 'Supplier payment'),
('T242', 'C004', '2026-01-15', 2100.00, 'OUT', 'SEPA',     'Staff wages',              'FR', 'Wages'),
('T243', 'C004', '2026-02-02', 7800.00, 'IN',  'SEPA',     'Various clients',          'FR', 'Restaurant revenue'),
('T244', 'C004', '2026-02-10', 3500.00, 'OUT', 'SEPA',     'Metro Cash & Carry',       'FR', 'Supplier payment'),
('T245', 'C004', '2026-02-15', 2100.00, 'OUT', 'SEPA',     'Staff wages',              'FR', 'Wages'),
('T246', 'C004', '2026-03-02', 9200.00, 'IN',  'SEPA',     'Various clients',          'FR', 'Restaurant revenue'),

-- C006 Lucas Petit (Accountant, €48k) — steady
('T250', 'C006', '2026-01-05', 3950.00, 'IN',  'SEPA',     'Fiduciaire Petit',         'FR', 'Salary January'),
('T251', 'C006', '2026-01-20', 150.00,  'OUT', 'CARD',     'Decathlon',                'FR', 'Sports'),
('T252', 'C006', '2026-02-05', 3950.00, 'IN',  'SEPA',     'Fiduciaire Petit',         'FR', 'Salary February'),
('T253', 'C006', '2026-03-05', 3950.00, 'IN',  'SEPA',     'Fiduciaire Petit',         'FR', 'Salary March'),

-- C008 Antoine Richard (Architect, €62k) — occasional large incoming (project payments)
('T260', 'C008', '2026-01-15', 12000.00, 'IN',  'SEPA',    'Client Project SCI',       'FR', 'Project fee'),
('T261', 'C008', '2026-01-20', 1500.00,  'OUT', 'SEPA',    'Landlord',                 'FR', 'Rent'),
('T262', 'C008', '2026-02-28', 15000.00, 'IN',  'SEPA',    'Client Project SCI',       'FR', 'Project fee'),
('T263', 'C008', '2026-03-05', 1500.00,  'OUT', 'SEPA',    'Landlord',                 'FR', 'Rent'),

-- C017 Thomas Garcia (Sales, €51k) — commission spikes (looks atypical but clean)
('T270', 'C017', '2026-01-03', 4200.00, 'IN',  'SEPA',     'SalesForce FR',            'FR', 'Salary January'),
('T271', 'C017', '2026-01-20', 3500.00, 'IN',  'SEPA',     'SalesForce FR',            'FR', 'Q4 commission'),
('T272', 'C017', '2026-02-03', 4200.00, 'IN',  'SEPA',     'SalesForce FR',            'FR', 'Salary February'),
('T273', 'C017', '2026-03-03', 4200.00, 'IN',  'SEPA',     'SalesForce FR',            'FR', 'Salary March'),

-- C018 Julie Roux (Photographer, €28k) — irregular freelance income (clean)
('T280', 'C018', '2026-01-08', 1800.00, 'IN',  'SEPA',     'Wedding Client',           'FR', 'Photo session'),
('T281', 'C018', '2026-01-25', 2500.00, 'IN',  'SEPA',     'Magazine Edit',            'FR', 'Editorial shoot'),
('T282', 'C018', '2026-02-15', 1200.00, 'IN',  'SEPA',     'Portrait Client',          'FR', 'Portrait session'),
('T283', 'C018', '2026-03-10', 3200.00, 'IN',  'SEPA',     'Corporate Client',         'FR', 'Corporate shoot'),

-- C019 Marc Fontaine (Civil servant, €36k) — very stable, boring
('T290', 'C019', '2026-01-04', 2950.00, 'IN',  'SEPA',     'Prefecture de Paris',      'FR', 'Salary January'),
('T291', 'C019', '2026-02-04', 2950.00, 'IN',  'SEPA',     'Prefecture de Paris',      'FR', 'Salary February'),
('T292', 'C019', '2026-03-04', 2950.00, 'IN',  'SEPA',     'Prefecture de Paris',      'FR', 'Salary March');


-- ============================================================
-- VERIFICATION QUERIES (run these to check your data is loaded)
-- ============================================================

-- Should return 20
-- SELECT COUNT(*) FROM customers;

-- Should return ~180
-- SELECT COUNT(*) FROM transactions;

-- Quick overview per customer
-- SELECT c.customer_id, c.last_name, c.declared_income,
--        COUNT(t.tx_id) as tx_count,
--        SUM(CASE WHEN t.direction = 'IN' THEN t.amount ELSE 0 END) as total_in,
--        SUM(CASE WHEN t.direction = 'OUT' THEN t.amount ELSE 0 END) as total_out
-- FROM customers c
-- LEFT JOIN transactions t ON c.customer_id = t.customer_id
-- GROUP BY c.customer_id
-- ORDER BY total_in DESC;
