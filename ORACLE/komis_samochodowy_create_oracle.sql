-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-30 14:18:49.825

-- tables
-- Table: Klienci
CREATE TABLE Klienci (
    KlientID integer  NOT NULL,
    Imie varchar2(20)  NOT NULL,
    Nazwisko varchar2(20)  NOT NULL,
    Telefon number(9,0)  NOT NULL,
    Email varchar2(255)  NOT NULL,
    Adres varchar2(100)  NOT NULL,
    CONSTRAINT Klienci_pk PRIMARY KEY (KlientID)
) ;

-- Table: Marki
CREATE TABLE Marki (
    MarkaID integer  NOT NULL,
    NazwaMarki varchar2(20)  NOT NULL,
    KrajPochodzenia varchar2(30)  NOT NULL,
    StronaProducenta varchar2(30)  NOT NULL,
    CONSTRAINT NazwaMarki_uq UNIQUE (NazwaMarki),
    CONSTRAINT StronaProducenta_uq UNIQUE (StronaProducenta),
    CONSTRAINT Marki_pk PRIMARY KEY (MarkaID)
) ;

-- Table: Modele
CREATE TABLE Modele (
    ModelID integer  NOT NULL,
    NazwaModelu varchar2(20)  NOT NULL,
    CONSTRAINT Modele_pk PRIMARY KEY (ModelID)
) ;

-- Table: Oferty
CREATE TABLE Oferty (
    OfertaID integer  NOT NULL,
    MarkaID integer  NOT NULL,
    ModelID integer  NOT NULL,
    TypNadwoziaID integer  NOT NULL,
    Kolor varchar2(20)  NOT NULL,
    TypSilnikaID integer  NOT NULL,
    Przebieg number(7,0)  NOT NULL,
    VIN varchar2(17)  NOT NULL,
    RokProdukcji number(4,0)  NOT NULL,
    StanID integer  NOT NULL,
    SprzedajacyID integer  NOT NULL,
    CenaWywolawcza number(7,0)  NOT NULL,
    StatusID integer  NOT NULL,
    CONSTRAINT VIN_uq UNIQUE (VIN),
    CONSTRAINT Oferty_pk PRIMARY KEY (OfertaID)
) ;

-- Table: Stany
CREATE TABLE Stany (
    StanID integer  NOT NULL,
    NazwaStanu varchar2(20)  NOT NULL,
    CONSTRAINT NazwaStanu_uq UNIQUE (NazwaStanu),
    CONSTRAINT Stany_pk PRIMARY KEY (StanID)
) ;

-- Table: Statusy
CREATE TABLE Statusy (
    StatusID integer  NOT NULL,
    NazwaStatusu varchar2(20)  NOT NULL,
    CONSTRAINT NazwaStatusu_uq UNIQUE (NazwaStatusu),
    CONSTRAINT Statusy_pk PRIMARY KEY (StatusID)
) ;

-- Table: Transakcje
CREATE TABLE Transakcje (
    TransakcjaID integer  NOT NULL,
    DataTransakcji date  NOT NULL,
    OfertaID integer  NOT NULL,
    KupujacyID integer  NOT NULL,
    CenaOstateczna number(7,0)  NOT NULL,
    CONSTRAINT OfertaID_uq UNIQUE (OfertaID),
    CONSTRAINT Transakcje_pk PRIMARY KEY (TransakcjaID)
) ;

-- Table: TypyNadwozia
CREATE TABLE TypyNadwozia (
    TypNadwoziaID integer  NOT NULL,
    NazwaNadwozia varchar2(20)  NOT NULL,
    CONSTRAINT TypyNadwozia_pk PRIMARY KEY (TypNadwoziaID)
) ;

-- Table: TypySilnika
CREATE TABLE TypySilnika (
    TypSilnikaID integer  NOT NULL,
    NazwaSilnika varchar2(20)  NOT NULL,
    Producent varchar2(20)  NOT NULL,
    Pojemnosc number(3,1)  NOT NULL,
    Paliwo varchar2(20)  NOT NULL,
    CONSTRAINT TypySilnika_pk PRIMARY KEY (TypSilnikaID)
) ;

-- foreign keys
-- Reference: Oferty_Klienci (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_Klienci
    FOREIGN KEY (SprzedajacyID)
    REFERENCES Klienci (KlientID);

-- Reference: Oferty_Marki (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_Marki
    FOREIGN KEY (MarkaID)
    REFERENCES Marki (MarkaID);

-- Reference: Oferty_Modele (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_Modele
    FOREIGN KEY (ModelID)
    REFERENCES Modele (ModelID);

-- Reference: Oferty_Stany (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_Stany
    FOREIGN KEY (StanID)
    REFERENCES Stany (StanID);

-- Reference: Oferty_Statusy (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_Statusy
    FOREIGN KEY (StatusID)
    REFERENCES Statusy (StatusID);

-- Reference: Oferty_TypyNadwozia (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_TypyNadwozia
    FOREIGN KEY (TypNadwoziaID)
    REFERENCES TypyNadwozia (TypNadwoziaID);

-- Reference: Oferty_TypySilnika (table: Oferty)
ALTER TABLE Oferty ADD CONSTRAINT Oferty_TypySilnika
    FOREIGN KEY (TypSilnikaID)
    REFERENCES TypySilnika (TypSilnikaID);

-- Reference: Transakcje_Klienci (table: Transakcje)
ALTER TABLE Transakcje ADD CONSTRAINT Transakcje_Klienci
    FOREIGN KEY (KupujacyID)
    REFERENCES Klienci (KlientID);

-- Reference: Transakcje_Oferty (table: Transakcje)
ALTER TABLE Transakcje ADD CONSTRAINT Transakcje_Oferty
    FOREIGN KEY (OfertaID)
    REFERENCES Oferty (OfertaID);

-- End of file.

