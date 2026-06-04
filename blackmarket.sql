-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Počítač: localhost
-- Vytvořeno: Čtv 04. čen 2026, 07:00
-- Verze serveru: 5.7.11
-- Verze PHP: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `blackmarket`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `biometrika_organu`
--

CREATE TABLE `biometrika_organu` (
  `id_zbozi` int(11) NOT NULL,
  `typ_organu` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `krevni_skupina` varchar(5) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `datum_extrakce` date DEFAULT NULL,
  `max_doba_prevozu_hodin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `biometrika_organu`
--

INSERT INTO `biometrika_organu` (`id_zbozi`, `typ_organu`, `krevni_skupina`, `datum_extrakce`, `max_doba_prevozu_hodin`) VALUES
(8, 'Ledvina', 'O-', '2026-06-03', 36),
(9, 'Srdce', 'A+', '2026-06-04', 6),
(10, 'Plice', 'B-', '2026-06-02', 12),
(11, 'Rohovka', 'AB+', '2026-06-01', 48),
(12, 'Kostni dren', 'O+', '2026-06-04', 24),
(13, 'Jatra', 'A-', '2026-06-03', 15),
(14, 'Ledvina', 'B+', '2026-06-02', 36);

-- --------------------------------------------------------

--
-- Struktura tabulky `lidsky_subjekt`
--

CREATE TABLE `lidsky_subjekt` (
  `id_zbozi` int(11) NOT NULL,
  `vek` int(11) DEFAULT NULL,
  `pohlavi` varchar(10) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `ucel_subjektu` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `zdravotni_stav` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `lidsky_subjekt`
--

INSERT INTO `lidsky_subjekt` (`id_zbozi`, `vek`, `pohlavi`, `ucel_subjektu`, `zdravotni_stav`) VALUES
(15, 34, 'Muz', 'Zoldak', 'Vyborny'),
(16, 22, 'Muz', 'Manualni prace', 'Dobry'),
(17, 28, 'Zena', 'Kybernetika', 'Prumerny'),
(18, 45, 'Muz', 'Klinicke testy', 'Zhorseny'),
(19, 31, 'Zena', 'Osobni strazce', 'Vyborny'),
(20, 19, 'Muz', 'Manualni prace', 'Vyborny'),
(21, 26, 'Muz', 'Ridic a paserak', 'Dobry');

-- --------------------------------------------------------

--
-- Struktura tabulky `mrtva_schranka`
--

CREATE TABLE `mrtva_schranka` (
  `id_schranka` int(11) NOT NULL,
  `gps_sirka` decimal(9,6) DEFAULT NULL,
  `gps_delka` decimal(9,6) DEFAULT NULL,
  `instrukce_k_vyzvednuti` text COLLATE utf8mb4_czech_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `mrtva_schranka`
--

INSERT INTO `mrtva_schranka` (`id_schranka`, `gps_sirka`, `gps_delka`, `instrukce_k_vyzvednuti`) VALUES
(1, '50.087811', '14.420460', 'Pod třetím kamenem u starého dubu v parku.'),
(2, '49.195061', '16.606836', 'Zakopáno 20cm hluboko, hledej modrou pásku na větvi.'),
(3, '50.736021', '15.050478', 'Opuštěná továrna, 2. patro, v nefunkční ventilaci.'),
(4, '48.974495', '14.474342', 'Ve starém sudu u rybníka, kód zámku 4591.'),
(5, '50.231853', '12.871960', 'Kufr opřený za popelnicí v zadní uličce.'),
(6, '49.593778', '17.250879', 'Vydlážděná stezka, dutá cihla ve zdi u hřbitova.'),
(7, '50.040751', '15.776590', 'Zahrabáno v lese, použij detektor kovu.');

-- --------------------------------------------------------

--
-- Struktura tabulky `objednavka`
--

CREATE TABLE `objednavka` (
  `id_objednavka` int(11) NOT NULL,
  `id_kupujici` int(11) DEFAULT NULL,
  `id_schranka` int(11) DEFAULT NULL,
  `stav_vyrizeni` varchar(30) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `objednavka`
--

INSERT INTO `objednavka` (`id_objednavka`, `id_kupujici`, `id_schranka`, `stav_vyrizeni`) VALUES
(1, 4, 1, 'Doruceno'),
(2, 5, 2, 'Ceka na platbu'),
(3, 7, 3, 'Odeslano'),
(4, 4, 4, 'Zpracovava se'),
(5, 5, 5, 'Doruceno'),
(6, 7, 6, 'Zruseno'),
(7, 4, 7, 'Odeslano');

-- --------------------------------------------------------

--
-- Struktura tabulky `polozka_objednavky`
--

CREATE TABLE `polozka_objednavky` (
  `id_objednavka` int(11) NOT NULL,
  `id_zbozi` int(11) NOT NULL,
  `mnozstvi` int(11) DEFAULT NULL,
  `cena_v_dobe_nakupu` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `polozka_objednavky`
--

INSERT INTO `polozka_objednavky` (`id_objednavka`, `id_zbozi`, `mnozstvi`, `cena_v_dobe_nakupu`) VALUES
(1, 2, 1, '8.00'),
(1, 5, 1, '5.50'),
(2, 16, 2, '150.00'),
(3, 8, 1, '120.00'),
(4, 3, 5, '25.00'),
(5, 15, 1, '500.00'),
(6, 7, 1, '85.00'),
(7, 1, 3, '15.50');

-- --------------------------------------------------------

--
-- Struktura tabulky `specifikace_zbrane`
--

CREATE TABLE `specifikace_zbrane` (
  `id_zbozi` int(11) NOT NULL,
  `typ_zbrane` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `raze_munice` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `vyrobce` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `stav_opotrebeni_procenta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `specifikace_zbrane`
--

INSERT INTO `specifikace_zbrane` (`id_zbozi`, `typ_zbrane`, `raze_munice`, `vyrobce`, `stav_opotrebeni_procenta`) VALUES
(1, 'Utocna puska', '7.62x39mm', 'Kalashnikov Concern', 15),
(2, 'Pistole', '9x19mm Parabellum', 'Glock Ges.m.b.H.', 5),
(3, 'Vybusnina', 'N/A', 'Neznamy', 0),
(4, 'Utocna puska', '5.56x45mm NATO', 'Colt', 25),
(5, 'Prislusenstvi', '9mm', 'Podomacku', 10),
(6, 'Tezka pistole', '.50 Action Express', 'Magnum Research', 2),
(7, 'Protitankova zbran', '85mm', 'Bazalt', 40);

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatel`
--

CREATE TABLE `uzivatel` (
  `id_uzivatel` int(11) NOT NULL,
  `pseudonym` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `pgp_klic` text COLLATE utf8mb4_czech_ci,
  `zustatek_monero` decimal(10,2) DEFAULT NULL,
  `role_na_trhu` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `reputacni_skore` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatel`
--

INSERT INTO `uzivatel` (`id_uzivatel`, `pseudonym`, `pgp_klic`, `zustatek_monero`, `role_na_trhu`, `reputacni_skore`) VALUES
(1, 'CyberGhost', 'BEGIN PGP PUBLIC KEY BLOCK...', '1500.50', 'Prodejce', 98),
(2, 'DocRipper', 'BEGIN PGP PUBLIC KEY BLOCK...', '320.00', 'Prodejce', 85),
(3, 'ShadowBroker', 'BEGIN PGP PUBLIC KEY BLOCK...', '8900.00', 'Syndikat', 99),
(4, 'NightOwl', 'BEGIN PGP PUBLIC KEY BLOCK...', '45.20', 'Kupujici', 12),
(5, 'Vulture', 'BEGIN PGP PUBLIC KEY BLOCK...', '12.00', 'Kupujici', 5),
(6, 'IronFist', 'BEGIN PGP PUBLIC KEY BLOCK...', '750.00', 'Prodejce', 76),
(7, 'SilentWhisper', 'BEGIN PGP PUBLIC KEY BLOCK...', '2100.00', 'Kupujici', 60);

-- --------------------------------------------------------

--
-- Struktura tabulky `zbozi_kontraband`
--

CREATE TABLE `zbozi_kontraband` (
  `id_zbozi` int(11) NOT NULL,
  `id_prodejce` int(11) DEFAULT NULL,
  `nazev_polozky` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kategorie` varchar(30) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cena_monero` decimal(10,2) DEFAULT NULL,
  `lokace_puvodu` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;

--
-- Vypisuji data pro tabulku `zbozi_kontraband`
--

INSERT INTO `zbozi_kontraband` (`id_zbozi`, `id_prodejce`, `nazev_polozky`, `kategorie`, `cena_monero`, `lokace_puvodu`) VALUES
(1, 1, 'AK-47', 'Zbran', '15.50', 'Rusko'),
(2, 1, 'Glock 19', 'Zbran', '8.00', 'Rakousko'),
(3, 6, 'C4 Plasticka trhavina (1kg)', 'Zbran', '25.00', 'Neznama'),
(4, 1, 'M4A1 Karabina', 'Zbran', '22.00', 'USA'),
(5, 6, 'Tlumic pro 9mm', 'Zbran', '5.50', 'Domaci vyroba'),
(6, 1, 'Desert Eagle .50 AE', 'Zbran', '12.00', 'Izrael'),
(7, 6, 'RPG-7', 'Zbran', '85.00', 'Balkan'),
(8, 2, 'Leva Ledvina', 'Organ', '120.00', 'Vychodni Evropa'),
(9, 2, 'Zdrave Srdce', 'Organ', '450.00', 'Jizni Amerika'),
(10, 2, 'Prave Plico', 'Organ', '80.00', 'Vychodni Evropa'),
(11, 2, 'Ocak (Rohovka)', 'Organ', '35.00', 'Asie'),
(12, 2, 'Kostni dren (Ampule)', 'Organ', '250.00', 'Balkan'),
(13, 2, 'Jatra (Cely lalok)', 'Organ', '180.00', 'Stredni Vychod'),
(14, 2, 'Prava Ledvina', 'Organ', '110.00', 'Vychodni Evropa'),
(15, 3, 'Subjekt Alfa - Byvaly vojak', 'Lidsky subjekt', '500.00', 'Rusko'),
(16, 3, 'Subjekt Beta - Fyzicka prace', 'Lidsky subjekt', '150.00', 'Jizni Amerika'),
(17, 3, 'Subjekt Gama - Hacker', 'Lidsky subjekt', '800.00', 'Asie'),
(18, 3, 'Subjekt Delta - Testovani leku', 'Lidsky subjekt', '50.00', 'Neznama'),
(19, 3, 'Subjekt Epsilon - Ochrana', 'Lidsky subjekt', '400.00', 'Balkan'),
(20, 3, 'Subjekt Zeta - Fyzicka prace', 'Lidsky subjekt', '140.00', 'Afrika'),
(21, 3, 'Subjekt Omega - Rychly ridic', 'Lidsky subjekt', '350.00', 'Evropa');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `biometrika_organu`
--
ALTER TABLE `biometrika_organu`
  ADD PRIMARY KEY (`id_zbozi`);

--
-- Klíče pro tabulku `lidsky_subjekt`
--
ALTER TABLE `lidsky_subjekt`
  ADD PRIMARY KEY (`id_zbozi`);

--
-- Klíče pro tabulku `mrtva_schranka`
--
ALTER TABLE `mrtva_schranka`
  ADD PRIMARY KEY (`id_schranka`);

--
-- Klíče pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
  ADD PRIMARY KEY (`id_objednavka`),
  ADD KEY `id_kupujici` (`id_kupujici`),
  ADD KEY `id_schranka` (`id_schranka`);

--
-- Klíče pro tabulku `polozka_objednavky`
--
ALTER TABLE `polozka_objednavky`
  ADD PRIMARY KEY (`id_objednavka`,`id_zbozi`),
  ADD KEY `id_zbozi` (`id_zbozi`);

--
-- Klíče pro tabulku `specifikace_zbrane`
--
ALTER TABLE `specifikace_zbrane`
  ADD PRIMARY KEY (`id_zbozi`);

--
-- Klíče pro tabulku `uzivatel`
--
ALTER TABLE `uzivatel`
  ADD PRIMARY KEY (`id_uzivatel`);

--
-- Klíče pro tabulku `zbozi_kontraband`
--
ALTER TABLE `zbozi_kontraband`
  ADD PRIMARY KEY (`id_zbozi`),
  ADD KEY `id_prodejce` (`id_prodejce`);

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `biometrika_organu`
--
ALTER TABLE `biometrika_organu`
  ADD CONSTRAINT `biometrika_organu_ibfk_1` FOREIGN KEY (`id_zbozi`) REFERENCES `zbozi_kontraband` (`id_zbozi`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `lidsky_subjekt`
--
ALTER TABLE `lidsky_subjekt`
  ADD CONSTRAINT `lidsky_subjekt_ibfk_1` FOREIGN KEY (`id_zbozi`) REFERENCES `zbozi_kontraband` (`id_zbozi`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `objednavka`
--
ALTER TABLE `objednavka`
  ADD CONSTRAINT `objednavka_ibfk_1` FOREIGN KEY (`id_kupujici`) REFERENCES `uzivatel` (`id_uzivatel`),
  ADD CONSTRAINT `objednavka_ibfk_2` FOREIGN KEY (`id_schranka`) REFERENCES `mrtva_schranka` (`id_schranka`);

--
-- Omezení pro tabulku `polozka_objednavky`
--
ALTER TABLE `polozka_objednavky`
  ADD CONSTRAINT `polozka_objednavky_ibfk_1` FOREIGN KEY (`id_objednavka`) REFERENCES `objednavka` (`id_objednavka`) ON DELETE CASCADE,
  ADD CONSTRAINT `polozka_objednavky_ibfk_2` FOREIGN KEY (`id_zbozi`) REFERENCES `zbozi_kontraband` (`id_zbozi`);

--
-- Omezení pro tabulku `specifikace_zbrane`
--
ALTER TABLE `specifikace_zbrane`
  ADD CONSTRAINT `specifikace_zbrane_ibfk_1` FOREIGN KEY (`id_zbozi`) REFERENCES `zbozi_kontraband` (`id_zbozi`) ON DELETE CASCADE;

--
-- Omezení pro tabulku `zbozi_kontraband`
--
ALTER TABLE `zbozi_kontraband`
  ADD CONSTRAINT `zbozi_kontraband_ibfk_1` FOREIGN KEY (`id_prodejce`) REFERENCES `uzivatel` (`id_uzivatel`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
