-- wypełnianie tabeli Klienci danymi
BEGIN
    FOR i IN 1..9 LOOP
        INSERT INTO Klienci (KlientID, Imie, Nazwisko, Telefon, Email, Adres) 
            VALUES (i,
                'Imie' || i,
                'Nazwisko' || i, 
                123000000 + i, 
                'user' || i || '@test.com',
                'ul. Testowa ' || i || '/' || (i+2) || ', 0' || i || '-' || i || i || i || ', Warszawa'
            );
    END LOOP;
    COMMIT;
END;
/
-- wypełnianie tabeli Marki danymi
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO Marki (MarkaID, NazwaMarki, KrajPochodzenia, StronaProducenta)
        VALUES (
            i, 
            CASE i
                WHEN 1 THEN 'Toyota' WHEN 2 THEN 'Volkswagen' WHEN 3 THEN 'Ford'
                WHEN 4 THEN 'BMW' WHEN 5 THEN 'Mercedes-Benz' WHEN 6 THEN 'Audi'
                WHEN 7 THEN 'Honda' WHEN 8 THEN 'Hyundai' WHEN 9 THEN 'Renault'
                ELSE 'Volvo'
            END,
            CASE i
                WHEN 1 THEN 'Japonia' WHEN 2 THEN 'Niemcy' WHEN 3 THEN 'USA'
                WHEN 4 THEN 'Niemcy' WHEN 5 THEN 'Niemcy' WHEN 6 THEN 'Niemcy'
                WHEN 7 THEN 'Japonia' WHEN 8 THEN 'Korea Poludniowa' WHEN 9 THEN 'Francja'
                ELSE 'Szwecja'
            END,
            CASE i
                WHEN 1 THEN 'toyota.jp' 
                WHEN 2 THEN 'vw.com' 
                WHEN 3 THEN 'ford.com'
                WHEN 4 THEN 'bmw.de'
                WHEN 5 THEN 'mercedes-benz.de'
                WHEN 6 THEN 'audi.de'
                WHEN 7 THEN 'honda.jp'
                WHEN 8 THEN 'hyundai.com/kr'
                WHEN 9 THEN 'renault.fr'
                WHEN 10 THEN 'volvocars.com/se'
                ELSE 'producent_' || i || '.com'
            END
        );
    END LOOP;
    COMMIT;
END;
/
-- wypełnianie tabeli Modele danymi
BEGIN
    FOR i IN 1..22 LOOP
        INSERT INTO Modele(ModelID, NazwaModelu)
        VALUES (
            i,
            CASE i
                WHEN 1 THEN 'Corolla'
                WHEN 2 THEN 'RAV4'
                WHEN 3 THEN 'Camry'
                WHEN 4 THEN 'Golf'
                WHEN 5 THEN 'Passat'
                WHEN 6 THEN 'Tiguan'
                WHEN 7 THEN 'Focus'
                WHEN 8 THEN 'Mustang'
                WHEN 9 THEN 'Kuga'
                WHEN 10 THEN 'F30'
                WHEN 11 THEN 'X5'
                WHEN 12 THEN 'W204'
                WHEN 13 THEN 'GLE'
                WHEN 14 THEN 'A4'
                WHEN 15 THEN 'Q5'
                WHEN 16 THEN 'Civic'
                WHEN 17 THEN 'CR-V'
                WHEN 18 THEN 'Tucson'
                WHEN 19 THEN 'Megane'
                WHEN 20 THEN 'XC60'
                WHEN 21 THEN 'i20'
                ELSE 'i30'
            END
        );
    END LOOP;
    COMMIT;
END;
/      
-- wypełnianie tabeli TypyNadwozia danymi
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO TypyNadwozia (TypNadwoziaID, NazwaNadwozia)
        VALUES (
            i, 
            CASE i
                WHEN 1 THEN 'Microcar'
                WHEN 2 THEN 'Hatchback'
                WHEN 3 THEN 'Sedan'
                WHEN 4 THEN 'Kombi'
                WHEN 5 THEN 'SUV' 
                WHEN 6 THEN 'Crossover'
                WHEN 7 THEN 'Coupe'
                WHEN 8 THEN 'Kabriolet' 
                WHEN 9 THEN 'Minivan' 
                ELSE 'Pick-up'
            END
        );
    END LOOP;
    COMMIT;
END;
/
-- wypełnianie tabeli TypySilnika danymi
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO TypySilnika (TypSilnikaID, NazwaSilnika, Producent, Pojemnosc, Paliwo)
        VALUES (
            i,
            CASE i
                WHEN 1 THEN '1.0 Turbo R3'
                WHEN 2 THEN '1.6 MPI'
                WHEN 3 THEN '2.0 Turbo R4'
                WHEN 4 THEN '2.0 Diesel CR'
                WHEN 5 THEN '1.5 Diesel'
                WHEN 6 THEN '1.8 Hybrid'
                WHEN 7 THEN '2.5 Hybrid'
                WHEN 8 THEN '3.0 V6 Turbo'
                WHEN 9 THEN 'Electric 150kW'
                ELSE '1.2 PureTech'
            END,
            CASE 
                WHEN i IN (3, 4, 8) THEN 'Global Engine'
                WHEN i = 6 THEN 'Hybrid Tech'
                WHEN i = 9 THEN 'Electric Core'
                ELSE 'Universal Motors'
            END,
            CASE i
                WHEN 1 THEN 1.0
                WHEN 2 THEN 1.6
                WHEN 3 THEN 2.0
                WHEN 4 THEN 2.0
                WHEN 5 THEN 1.5
                WHEN 6 THEN 1.8
                WHEN 7 THEN 2.5
                WHEN 8 THEN 3.0
                WHEN 9 THEN 0.0
                ELSE 1.2
            END,
            CASE 
                WHEN i IN (1, 2, 3, 8, 10) THEN 'Benzyna'
                WHEN i IN (4, 5) THEN 'Diesel'
                WHEN i IN (6, 7) THEN 'Hybryda'
                ELSE 'Elektryczny'
            END
        );
    END LOOP;
    COMMIT;
END;
/

--wypełnianie tabeli Stany danymi
INSERT INTO Stany (StanID, NazwaStanu) 
    VALUES (1, 'Nowy');
INSERT INTO Stany (StanID, NazwaStanu)
    VALUES (2, 'Bardzo dobry');
INSERT INTO Stany (StanID, NazwaStanu)
    VALUES (3, 'Dobry');
INSERT INTO Stany (StanID, NazwaStanu)
    VALUES (4, 'Powypadkowy');
    
--wypełnianie tabeli Statusy danymi
INSERT INTO Statusy (StatusID, NazwaStatusu)
    VALUES (1, 'Dostępny');
INSERT INTO Statusy (StatusID, NazwaStatusu)
    VALUES(2, 'Sprzedany');
INSERT INTO Statusy (StatusID, NazwaStatusu)
    VALUES(3, 'Zutylizowany');

-- wypełnianie tabeli Oferty danymi
BEGIN
    FOR i IN 1..12 LOOP
        INSERT INTO Oferty (
            OfertaID, MarkaID, ModelID, TypNadwoziaID, Kolor, 
            TypSilnikaID, Przebieg, VIN, RokProdukcji, StanID, 
            SprzedajacyID, CenaWywolawcza, StatusID)
        VALUES (
            i,
            CASE
                WHEN i IN (1, 2, 7) THEN 1
                WHEN i IN (11, 12) THEN 2
                WHEN i IN (8, 10) THEN 4
                WHEN i = 9 THEN 5
                WHEN i = 3 THEN 6
                WHEN i = 4 THEN 7
                WHEN i = 5 THEN 8
                ELSE 9
            END,
            CASE i
                WHEN 1 THEN 3
                WHEN 2 THEN 2
                WHEN 3 THEN 15
                WHEN 4 THEN 16
                WHEN 5 THEN 21
                WHEN 6 THEN 19
                WHEN 7 THEN 1
                WHEN 8 THEN 11
                WHEN 9 THEN 12
                WHEN 10 THEN 10
                WHEN 11 THEN 5
                ELSE 4
            END,
            CASE
                WHEN i IN (1, 5, 6, 7, 19, 11) THEN 3
                WHEN i IN (2, 3, 8) THEN 5
                WHEN i IN (4, 12) THEN 2
                ELSE 7
            END,
            CASE
                WHEN i IN (1, 2, 8, 10) THEN 'niebieski'
                WHEN i IN (3, 7) THEN 'biały'
                WHEN i IN (4, 9, 11) THEN 'czarny'
                WHEN i = 5 THEN 'srebrny'
                WHEN i = 6 THEN 'zielony'
                ELSE 'różowy'
            END,
            CASE 
                WHEN i IN (1, 8) THEN 8
                WHEN i IN (2, 3, 9, 10) THEN 3
                WHEN i IN (4, 6, 7) THEN 2
                WHEN i = 5 THEN 1
                WHEN i = 11 THEN 5
                ELSE 4
            END,
            CASE 
                WHEN i IN (1, 10) THEN 250000
                WHEN i = 2 THEN 150000
                WHEN i IN (3, 9) THEN 200000
                WHEN i IN (4, 11) THEN 700000
                WHEN i IN (5, 12) THEN 320000
                WHEN i IN (6, 7) THEN 300000
                ELSE 125000
            END,
            CASE i
                WHEN 1 THEN 'JTDKB3FU1N1000001'
                WHEN 2 THEN 'JTDFB4G31M1000002'
                WHEN 3 THEN 'WAUZZZ8W3J2000003'
                WHEN 4 THEN 'SHHFC1640F3000004'
                WHEN 5 THEN 'KMHCT41CPG4000005'
                WHEN 6 THEN 'VF1RFB00665000006'
                WHEN 7 THEN 'JTDKH22A4L6000007'
                WHEN 8 THEN 'WBA8E310X07000008'
                WHEN 9 THEN 'W1K20504218000009'
                WHEN 10 THEN 'WBA7A110X09000010'
                WHEN 11 THEN 'WVWZZZAN4L1000011'
                ELSE 'WVWZZZ3CZK1100012'
            END,
            CASE i
                WHEN 1 THEN 1998
                WHEN 2 THEN 1998
                WHEN 3 THEN 2016
                WHEN 4 THEN 1984
                WHEN 5 THEN 2014
                WHEN 6 THEN 2002
                WHEN 7 THEN 1982
                WHEN 8 THEN 2013
                WHEN 9 THEN 2010
                WHEN 10 THEN 2015
                WHEN 11 THEN 1988
                ELSE 2004
            END,
            CASE
                WHEN i IN (1, 7) THEN 4
                WHEN i IN (2, 3, 5, 6, 8, 9, 10) THEN 2
                WHEN i IN (4, 11, 12) THEN 3
                ELSE 1
            END,
            CASE
                WHEN i IN (1, 3) THEN 9
                WHEN i = 2 THEN 4
                WHEN i IN (5, 6, 7) THEN 1
                WHEN i IN (4, 9) THEN 8
                WHEN i IN (8, 10) THEN 3
                WHEN i = 11 THEN 5
                ELSE 7
            END,
            CASE
                WHEN i = 1 THEN 7500
                WHEN i = 2 THEN 20000
                WHEN i = 3 THEN 55000
                WHEN i = 4 THEN 10000
                WHEN i IN (5, 11) THEN 12000
                WHEN i IN (6, 9, 10) THEN 30000
                WHEN i IN (7, 12) THEN 15000
                ELSE 60000
            END,
            CASE
                WHEN i IN (1, 11) THEN 3
                WHEN i IN (2, 3, 4, 7, 8, 12) THEN 1
                ELSE 2
            END
        );
    END LOOP;
    COMMIT;
END;
/

-- wypełnianie tabeli Transakcje danymi
BEGIN
    FOR i IN 1..4 LOOP
        INSERT INTO Transakcje (TransakcjaID, DataTransakcji, OfertaID, KupujacyID, CenaOstateczna) 
        VALUES (
            i, 
            CASE 
                WHEN i IN (1,3) THEN DATE '2024-05-20' 
                ELSE DATE '2024-05-27' 
            END,
            CASE i 
                WHEN 1 THEN 5
                WHEN 2 THEN 6
                WHEN 3 THEN 9
                ELSE 10
            END,
            CASE i 
                WHEN 1 THEN 2
                WHEN 2 THEN 4
                WHEN 3 THEN 2
                ELSE 5
            END,
            CASE i 
                WHEN 1 THEN 10000 
                WHEN 2 THEN 29500 
                WHEN 3 THEN 28000 
                ELSE 27000 
            END
        );
    END LOOP;
    COMMIT;
END;
/
            
    