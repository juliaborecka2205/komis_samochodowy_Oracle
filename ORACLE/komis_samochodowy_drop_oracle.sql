-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-30 14:18:49.825

-- foreign keys
ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_Klienci;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_Marki;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_Modele;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_Stany;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_Statusy;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_TypyNadwozia;

ALTER TABLE Oferty
    DROP CONSTRAINT Oferty_TypySilnika;

ALTER TABLE Transakcje
    DROP CONSTRAINT Transakcje_Klienci;

ALTER TABLE Transakcje
    DROP CONSTRAINT Transakcje_Oferty;

-- tables
DROP TABLE Klienci;

DROP TABLE Marki;

DROP TABLE Modele;

DROP TABLE Oferty;

DROP TABLE Stany;

DROP TABLE Statusy;

DROP TABLE Transakcje;

DROP TABLE TypyNadwozia;

DROP TABLE TypySilnika;

-- End of file.

