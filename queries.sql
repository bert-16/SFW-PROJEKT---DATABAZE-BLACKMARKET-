-- Zobraz všechny uživatele s reputací vyšší než 80
SELECT *
FROM Uzivatel
WHERE reputacni_skore > 80;

-- Vypiš všechny uživatele, kteří mají roli kupujícího
SELECT *
FROM Uzivatel
WHERE role_na_trhu = 'Kupujici';

-- Vypiš všechny uživatele, kteří prodávají zboží
SELECT *
FROM Uzivatel
WHERE role_na_trhu = 'Prodejce';

-- Najdi všechny zbraně dražší než 20 Monero
SELECT *
FROM Zbozi_Kontraband
WHERE kategorie = 'Zbran'
AND cena_monero > 20;

-- Zobraz zboží pocházející z Ruska
SELECT *
FROM Zbozi_Kontraband
WHERE lokace_puvodu = 'Rusko';

-- Vypiš objednávky, které byly odeslány
SELECT *
FROM Objednavka
WHERE stav_vyrizeni = 'Odeslano';

-- Najdi orgány s krevní skupinou A+
SELECT *
FROM Biometrika_Organu
WHERE krevni_skupina = 'A+';

-- Zobraz orgány, které lze převážet déle než 24 hodin
SELECT *
FROM Biometrika_Organu
WHERE max_doba_prevozu_hodin > 24;

-- Najdi všechny subjekty starší než 30 let
SELECT *
FROM Lidsky_Subjekt
WHERE vek > 30;

-- Zobraz zbraně s opotřebením menším než 20 %
SELECT *
FROM Specifikace_Zbrane
WHERE stav_opotrebeni_procenta < 20;

-- Vyhledej uživatele, jejichž pseudonym začíná na Cyber
SELECT *
FROM Uzivatel
WHERE pseudonym LIKE 'Cyber%';

-- Najdi všechny položky obsahující slovo Ledvina
SELECT *
FROM Zbozi_Kontraband
WHERE nazev_polozky LIKE '%Ledvina%';

-- Najdi všechny položky obsahující slovo Subjekt
SELECT *
FROM Zbozi_Kontraband
WHERE nazev_polozky LIKE '%Subjekt%';

-- Zobraz zboží společně s prodejcem, který ho nabízí
SELECT z.nazev_polozky, u.pseudonym
FROM Zbozi_Kontraband z
JOIN Uzivatel u
ON z.id_prodejce = u.id_uzivatel;

-- Zobraz objednávky a jméno kupujícího
SELECT o.id_objednavka, u.pseudonym
FROM Objednavka o
JOIN Uzivatel u
ON o.id_kupujici = u.id_uzivatel;

-- Vypiš položky objednávek a jejich názvy
SELECT po.id_objednavka, z.nazev_polozky
FROM Polozka_Objednavky po
JOIN Zbozi_Kontraband z
ON po.id_zbozi = z.id_zbozi;

-- Zobraz zbraně a jejich technické údaje
SELECT z.nazev_polozky, sz.typ_zbrane
FROM Zbozi_Kontraband z
JOIN Specifikace_Zbrane sz
ON z.id_zbozi = sz.id_zbozi;

-- Zobraz orgány a jejich krevní skupiny
SELECT z.nazev_polozky, b.krevni_skupina
FROM Zbozi_Kontraband z
JOIN Biometrika_Organu b
ON z.id_zbozi = b.id_zbozi;

-- Zobraz lidské subjekty a účel jejich využití
SELECT z.nazev_polozky, ls.ucel_subjektu
FROM Zbozi_Kontraband z
JOIN Lidsky_Subjekt ls
ON z.id_zbozi = ls.id_zbozi;

-- Vypiš všechny uživatele a případné objednávky, které vytvořili
SELECT u.pseudonym, o.id_objednavka
FROM Uzivatel u
LEFT JOIN Objednavka o
ON u.id_uzivatel = o.id_kupujici;

-- Zobraz všechno zboží a případné informace o zbraních
SELECT z.nazev_polozky, sz.typ_zbrane
FROM Zbozi_Kontraband z
LEFT JOIN Specifikace_Zbrane sz
ON z.id_zbozi = sz.id_zbozi;

-- Zobraz pět nejdražších položek v nabídce
SELECT *
FROM Zbozi_Kontraband
ORDER BY cena_monero DESC
LIMIT 5;

-- Zobraz tři uživatele s nejvyšší reputací
SELECT *
FROM Uzivatel
ORDER BY reputacni_skore DESC
LIMIT 3;

-- Spočítej celkový počet registrovaných uživatelů
SELECT COUNT(*) AS pocet_uzivatelu
FROM Uzivatel;

-- Zobraz počet objednávek vytvořených jednotlivými kupujícími
SELECT id_kupujici, COUNT(*) AS pocet_objednavek
FROM Objednavka
GROUP BY id_kupujici
HAVING COUNT(*) >= 1;

-- Vypočítej celkovou cenu jednotlivých položek objednávek
SELECT
    id_objednavka,
    id_zbozi,
    mnozstvi,
    cena_v_dobe_nakupu,
    (mnozstvi * cena_v_dobe_nakupu) AS celkova_cena
FROM Polozka_Objednavky;