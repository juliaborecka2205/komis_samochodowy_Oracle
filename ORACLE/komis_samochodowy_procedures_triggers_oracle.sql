CREATE OR REPLACE TRIGGER kontrola_ceny_ostatecznej
BEFORE INSERT ON Transakcje
FOR EACH ROW
DECLARE
    v_cena_wywolawcza Oferty.CenaWywolawcza%TYPE;
BEGIN
    SELECT CenaWywolawcza
    INTO v_cena_wywolawcza
    FROM Oferty
    WHERE OfertaID = :NEW.OfertaID;

    IF :NEW.CenaOstateczna < v_cena_wywolawcza * 0.5 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Cena ostateczna zbyt niska wzgledem ceny wywolawczej'
        );
    END IF;
    
    IF :NEW.CenaOstateczna > v_cena_wywolawcza * 1.2 THEN
        RAISE_APPLICATION_ERROR(
            -20002,'Cena ostateczna zbyt wysoka wzgledem ceny wywolawczej');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER blokuj_usuwanie_ofert
BEFORE DELETE ON Oferty
FOR EACH ROW
BEGIN
    IF :OLD.StatusID = 2 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Nie mozna usunac sprzedanej oferty');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER zmien_status_po_sprzedazy
AFTER INSERT ON Transakcje
FOR EACH ROW
BEGIN
    UPDATE Oferty
    SET StatusID = 2
    WHERE OfertaID = :NEW.OfertaID;
END;
/

CREATE OR REPLACE PROCEDURE DodajTransakcje
(
    p_OfertaID        NUMBER,
    p_KupujacyID      NUMBER,
    p_CenaOstateczna  NUMBER
)
IS
    v_StatusID NUMBER;
    v_LiczbaTransakcji NUMBER;
    v_SprzedajacyID NUMBER;
BEGIN
    SELECT StatusID, SprzedajacyID
    INTO v_StatusID, v_SprzedajacyID
    FROM Oferty
    WHERE OfertaID = p_OfertaID;
    
    IF v_StatusID <> 1 THEN
        RAISE_APPLICATION_ERROR(
            -20004,
            'Oferta nie jest dostepna'
        );
    END IF;

    SELECT COUNT(*)
    INTO v_LiczbaTransakcji
    FROM Transakcje
    WHERE OfertaID = p_OfertaID;
    
    IF v_LiczbaTransakcji > 0 THEN
        RAISE_APPLICATION_ERROR(
            -20005,
            'Dla tej oferty istnieje juz transakcja'
        );
    END IF;
    
    IF p_KupujacyID = v_SprzedajacyID THEN
        RAISE_APPLICATION_ERROR(
            -20006,
            'Nie mozna sprzedac auta jego wlascicielowi'
        );
    END IF;

    INSERT INTO Transakcje
    (
        TransakcjaID,
        DataTransakcji,
        OfertaID,
        KupujacyID,
        CenaOstateczna
    )
    VALUES
    (
        (SELECT NVL(MAX(TransakcjaID),0)+1 FROM Transakcje),
        SYSDATE,
        p_OfertaID,
        p_KupujacyID,
        p_CenaOstateczna
    );

    DBMS_OUTPUT.PUT_LINE('Transakcja dodana poprawnie');
EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20007, 'Oferta nie istnieje');
END;
/

CREATE OR REPLACE PROCEDURE RaportSprzedazy
(
    p_DataPoczatkowa DATE,
    p_DataKoncowa DATE
)
IS
    CURSOR c_raport IS
    SELECT
    m.NazwaMarki,
    SUM(t.CenaOstateczna) AS Suma,
    COUNT(*) AS Ilosc,
    AVG(t.CenaOstateczna) AS Srednia
    FROM Transakcje t
    JOIN Oferty o
    ON t.OfertaID = o.OfertaID
    JOIN Marki m
    ON o.MarkaID = m.MarkaID
    WHERE t.DataTransakcji
    BETWEEN p_DataPoczatkowa
    AND p_DataKoncowa
    GROUP BY m.NazwaMarki;

BEGIN
    FOR rec IN c_raport LOOP
    DBMS_OUTPUT.PUT_LINE('Marka: ' || rec.NazwaMarki);
    DBMS_OUTPUT.PUT_LINE('Suma: ' || rec.Suma);
    DBMS_OUTPUT.PUT_LINE('Ilosc: ' || rec.Ilosc);
    DBMS_OUTPUT.PUT_LINE('Srednia: ' || ROUND(rec.Srednia,2));
END LOOP;
END;
/
