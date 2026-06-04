-- Odstranění tabulek, pokud již existují (v opačném pořadí kvůli závislostem)
DROP TABLE IF EXISTS Polozka_Objednavky;
DROP TABLE IF EXISTS Objednavka;
DROP TABLE IF EXISTS Lidsky_Subjekt;
DROP TABLE IF EXISTS Biometrika_Organu;
DROP TABLE IF EXISTS Specifikace_Zbrane;
DROP TABLE IF EXISTS Zbozi_Kontraband;
DROP TABLE IF EXISTS Mrtva_Schranka;
DROP TABLE IF EXISTS Uzivatel;

-- 1. Uživatel (6 atributů)
CREATE TABLE Uzivatel (
    id_uzivatel INT PRIMARY KEY,
    pseudonym VARCHAR(50) NOT NULL,
    pgp_klic TEXT,
    zustatek_monero DECIMAL(10, 2),
    role_na_trhu VARCHAR(20),
    reputacni_skore INT
);

-- 2. Mrtvá Schránka (4 atributy)
CREATE TABLE Mrtva_Schranka (
    id_schranka INT PRIMARY KEY,
    gps_sirka DECIMAL(9, 6),
    gps_delka DECIMAL(9, 6),
    instrukce_k_vyzvednuti TEXT
);

-- 3. Zboží Kontraband (Nadřazená entita - 6 atributů)
CREATE TABLE Zbozi_Kontraband (
    id_zbozi INT PRIMARY KEY,
    id_prodejce INT,
    nazev_polozky VARCHAR(100),
    kategorie VARCHAR(30),
    cena_monero DECIMAL(10, 2),
    lokace_puvodu VARCHAR(50),
    FOREIGN KEY (id_prodejce) REFERENCES Uzivatel(id_uzivatel)
);

-- 4. Specifikace Zbraně (Podtyp - 5 atributů)
CREATE TABLE Specifikace_Zbrane (
    id_zbozi INT PRIMARY KEY,
    typ_zbrane VARCHAR(50),
    raze_munice VARCHAR(20),
    vyrobce VARCHAR(50),
    stav_opotrebeni_procenta INT,
    FOREIGN KEY (id_zbozi) REFERENCES Zbozi_Kontraband(id_zbozi) ON DELETE CASCADE
);

-- 5. Biometrika Orgánu (Podtyp - 5 atributů)
CREATE TABLE Biometrika_Organu (
    id_zbozi INT PRIMARY KEY,
    typ_organu VARCHAR(50),
    krevni_skupina VARCHAR(5),
    datum_extrakce DATE,
    max_doba_prevozu_hodin INT,
    FOREIGN KEY (id_zbozi) REFERENCES Zbozi_Kontraband(id_zbozi) ON DELETE CASCADE
);

-- 6. Lidský Subjekt (Podtyp - 5 atributů)
CREATE TABLE Lidsky_Subjekt (
    id_zbozi INT PRIMARY KEY,
    vek INT,
    pohlavi VARCHAR(10),
    ucel_subjektu VARCHAR(50),
    zdravotni_stav VARCHAR(50),
    FOREIGN KEY (id_zbozi) REFERENCES Zbozi_Kontraband(id_zbozi) ON DELETE CASCADE
);

-- 7. Objednávka (4 atributy)
CREATE TABLE Objednavka (
    id_objednavka INT PRIMARY KEY,
    id_kupujici INT,
    id_schranka INT,
    stav_vyrizeni VARCHAR(30),
    FOREIGN KEY (id_kupujici) REFERENCES Uzivatel(id_uzivatel),
    FOREIGN KEY (id_schranka) REFERENCES Mrtva_Schranka(id_schranka)
);

-- 8. Položka Objednávky (Slabá entita / Identifikační závislost - 4 atributy)
CREATE TABLE Polozka_Objednavky (
    id_objednavka INT,
    id_zbozi INT,
    mnozstvi INT,
    cena_v_dobe_nakupu DECIMAL(10, 2),
    PRIMARY KEY (id_objednavka, id_zbozi),
    FOREIGN KEY (id_objednavka) REFERENCES Objednavka(id_objednavka) ON DELETE CASCADE,
    FOREIGN KEY (id_zbozi) REFERENCES Zbozi_Kontraband(id_zbozi)
);