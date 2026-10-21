SET SERVEROUTPUT ON;

-- Poprawne dodanie transakcji
BEGIN
DodajTransakcje(7, 2, 14000);
END;
/

-- Oferta nie istnieje
BEGIN
DodajTransakcje(999, 2, 25000);
END;
/

-- Kupujący próbuje kupić własny samochód
BEGIN
DodajTransakcje(8, 3, 58000);
END;
/

-- Trigger: cena ostateczna poniżej 50% ceny wywoławczej
INSERT INTO Transakcje (TransakcjaID, DataTransakcji, OfertaID, KupujacyID, CenaOstateczna)
VALUES (999, SYSDATE, 8, 4, 1000);

-- Trigger: cena ostateczna powyżej 120% ceny wywoławczej
INSERT INTO Transakcje (TransakcjaID, DataTransakcji, OfertaID, KupujacyID, CenaOstateczna)
VALUES (1000, SYSDATE, 8, 4, 999999);

-- Status oferty przed sprzedażą
SELECT OfertaID, StatusID
FROM Oferty
WHERE OfertaID = 12;

-- Sprzedaż samochodu i automatyczna zmiana statusu przez trigger
BEGIN
DodajTransakcje(12, 4, 14500);
END;
/

-- Status oferty po sprzedaży
SELECT OfertaID, StatusID
FROM Oferty
WHERE OfertaID = 12;

-- Trigger: blokada usunięcia sprzedanej oferty
DELETE FROM Oferty
WHERE OfertaID = 12;

-- Procedura raportująca sprzedaż z użyciem kursora
BEGIN
RaportSprzedazy(DATE '2020-01-01', DATE '2030-12-31');
END;
/

-- Dane po wykonaniu testów
SELECT * FROM Transakcje;

SELECT OfertaID, StatusID
FROM Oferty
ORDER BY OfertaID;


ROLLBACK;