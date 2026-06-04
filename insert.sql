
-- 1. Uživatelé (Minimálně 7 záznamů)

INSERT INTO Uzivatel (id_uzivatel, pseudonym, pgp_klic, zustatek_monero, role_na_trhu, reputacni_skore) VALUES
(1, 'CyberGhost', 'BEGIN PGP PUBLIC KEY BLOCK...', 1500.50, 'Prodejce', 98),
(2, 'DocRipper', 'BEGIN PGP PUBLIC KEY BLOCK...', 320.00, 'Prodejce', 85),
(3, 'ShadowBroker', 'BEGIN PGP PUBLIC KEY BLOCK...', 8900.00, 'Syndikat', 99),
(4, 'NightOwl', 'BEGIN PGP PUBLIC KEY BLOCK...', 45.20, 'Kupujici', 12),
(5, 'Vulture', 'BEGIN PGP PUBLIC KEY BLOCK...', 12.00, 'Kupujici', 5),
(6, 'IronFist', 'BEGIN PGP PUBLIC KEY BLOCK...', 750.00, 'Prodejce', 76),
(7, 'SilentWhisper', 'BEGIN PGP PUBLIC KEY BLOCK...', 2100.00, 'Kupujici', 60);

-- 2. Mrtvé schránky (Minimálně 7 záznamů)

INSERT INTO Mrtva_Schranka (id_schranka, gps_sirka, gps_delka, instrukce_k_vyzvednuti) VALUES
(1, 50.087811, 14.420460, 'Pod třetím kamenem u starého dubu v parku.'),
(2, 49.195061, 16.606836, 'Zakopáno 20cm hluboko, hledej modrou pásku na větvi.'),
(3, 50.736021, 15.050478, 'Opuštěná továrna, 2. patro, v nefunkční ventilaci.'),
(4, 48.974495, 14.474342, 'Ve starém sudu u rybníka, kód zámku 4591.'),
(5, 50.231853, 12.871960, 'Kufr opřený za popelnicí v zadní uličce.'),
(6, 49.593778, 17.250879, 'Vydlážděná stezka, dutá cihla ve zdi u hřbitova.'),
(7, 50.040751, 15.776590, 'Zahrabáno v lese, použij detektor kovu.');

-- 3. Zboží - Hlavní tabulka (21 záznamů, 7 pro každou kategorii)

INSERT INTO Zbozi_Kontraband (id_zbozi, id_prodejce, nazev_polozky, kategorie, cena_monero, lokace_puvodu) VALUES
-- Zbraně (ID 1-7, Prodejce 1 a 6)
(1, 1, 'AK-47', 'Zbran', 15.50, 'Rusko'),
(2, 1, 'Glock 19', 'Zbran', 8.00, 'Rakousko'),
(3, 6, 'C4 Plasticka trhavina (1kg)', 'Zbran', 25.00, 'Neznama'),
(4, 1, 'M4A1 Karabina', 'Zbran', 22.00, 'USA'),
(5, 6, 'Tlumic pro 9mm', 'Zbran', 5.50, 'Domaci vyroba'),
(6, 1, 'Desert Eagle .50 AE', 'Zbran', 12.00, 'Izrael'),
(7, 6, 'RPG-7', 'Zbran', 85.00, 'Balkan'),
-- Orgány (ID 8-14, Prodejce 2)
(8, 2, 'Leva Ledvina', 'Organ', 120.00, 'Vychodni Evropa'),
(9, 2, 'Zdrave Srdce', 'Organ', 450.00, 'Jizni Amerika'),
(10, 2, 'Prave Plico', 'Organ', 80.00, 'Vychodni Evropa'),
(11, 2, 'Ocak (Rohovka)', 'Organ', 35.00, 'Asie'),
(12, 2, 'Kostni dren (Ampule)', 'Organ', 250.00, 'Balkan'),
(13, 2, 'Jatra (Cely lalok)', 'Organ', 180.00, 'Stredni Vychod'),
(14, 2, 'Prava Ledvina', 'Organ', 110.00, 'Vychodni Evropa'),
-- Lidé (ID 15-21, Prodejce 3)
(15, 3, 'Subjekt Alfa - Byvaly vojak', 'Lidsky subjekt', 500.00, 'Rusko'),
(16, 3, 'Subjekt Beta - Fyzicka prace', 'Lidsky subjekt', 150.00, 'Jizni Amerika'),
(17, 3, 'Subjekt Gama - Hacker', 'Lidsky subjekt', 800.00, 'Asie'),
(18, 3, 'Subjekt Delta - Testovani leku', 'Lidsky subjekt', 50.00, 'Neznama'),
(19, 3, 'Subjekt Epsilon - Ochrana', 'Lidsky subjekt', 400.00, 'Balkan'),
(20, 3, 'Subjekt Zeta - Fyzicka prace', 'Lidsky subjekt', 140.00, 'Afrika'),
(21, 3, 'Subjekt Omega - Rychly ridic', 'Lidsky subjekt', 350.00, 'Evropa');

-- 4. Specifikace zbraní (7 záznamů pro ID 1-7)

INSERT INTO Specifikace_Zbrane (id_zbozi, typ_zbrane, raze_munice, vyrobce, stav_opotrebeni_procenta) VALUES
(1, 'Utocna puska', '7.62x39mm', 'Kalashnikov Concern', 15),
(2, 'Pistole', '9x19mm Parabellum', 'Glock Ges.m.b.H.', 5),
(3, 'Vybusnina', 'N/A', 'Neznamy', 0),
(4, 'Utocna puska', '5.56x45mm NATO', 'Colt', 25),
(5, 'Prislusenstvi', '9mm', 'Podomacku', 10),
(6, 'Tezka pistole', '.50 Action Express', 'Magnum Research', 2),
(7, 'Protitankova zbran', '85mm', 'Bazalt', 40);


-- 5. Biometrika orgánů (7 záznamů pro ID 8-14)

INSERT INTO Biometrika_Organu (id_zbozi, typ_organu, krevni_skupina, datum_extrakce, max_doba_prevozu_hodin) VALUES
(8, 'Ledvina', 'O-', '2026-06-03', 36),
(9, 'Srdce', 'A+', '2026-06-04', 6),
(10, 'Plice', 'B-', '2026-06-02', 12),
(11, 'Rohovka', 'AB+', '2026-06-01', 48),
(12, 'Kostni dren', 'O+', '2026-06-04', 24),
(13, 'Jatra', 'A-', '2026-06-03', 15),
(14, 'Ledvina', 'B+', '2026-06-02', 36);


-- 6. Lidské subjekty (7 záznamů pro ID 15-21)

INSERT INTO Lidsky_Subjekt (id_zbozi, vek, pohlavi, ucel_subjektu, zdravotni_stav) VALUES
(15, 34, 'Muz', 'Zoldak', 'Vyborny'),
(16, 22, 'Muz', 'Manualni prace', 'Dobry'),
(17, 28, 'Zena', 'Kybernetika', 'Prumerny'),
(18, 45, 'Muz', 'Klinicke testy', 'Zhorseny'),
(19, 31, 'Zena', 'Osobni strazce', 'Vyborny'),
(20, 19, 'Muz', 'Manualni prace', 'Vyborny'),
(21, 26, 'Muz', 'Ridic a paserak', 'Dobry');


-- 7. Objednávky (Minimálně 7 záznamů)

INSERT INTO Objednavka (id_objednavka, id_kupujici, id_schranka, stav_vyrizeni) VALUES
(1, 4, 1, 'Doruceno'),
(2, 5, 2, 'Ceka na platbu'),
(3, 7, 3, 'Odeslano'),
(4, 4, 4, 'Zpracovava se'),
(5, 5, 5, 'Doruceno'),
(6, 7, 6, 'Zruseno'),
(7, 4, 7, 'Odeslano');


-- 8. Položky objednávky (Minimálně 7 záznamů)

INSERT INTO Polozka_Objednavky (id_objednavka, id_zbozi, mnozstvi, cena_v_dobe_nakupu) VALUES
(1, 2, 1, 8.00),     -- NightOwl si koupil Glock
(1, 5, 1, 5.50),     -- A k tomu tlumič
(2, 16, 2, 150.00),  -- Vulture bere 2 subjekty na manuální práci
(3, 8, 1, 120.00),   -- SilentWhisper objednal ledvinu
(4, 3, 5, 25.00),    -- NightOwl kupuje 5kg C4
(5, 15, 1, 500.00),  -- Vulture kupuje žoldáka
(6, 7, 1, 85.00),    -- Zrušená objednávka RPG
(7, 1, 3, 15.50);    -- NightOwl kupuje 3x AK-47