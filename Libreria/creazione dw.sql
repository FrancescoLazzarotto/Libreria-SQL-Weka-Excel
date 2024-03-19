
CREATE TABLE FASCIA (
    Cod_Fascia INT PRIMARY KEY,
    Fascia_Eta VARCHAR(50) NOT NULL
);



CREATE TABLE ETA (
    Cod_eta INT PRIMARY KEY,
    Id_fascia INT NOT NULL,
    Eta_Autore INT NOT NULL,
    FOREIGN KEY (Id_fascia) REFERENCES FASCIA(Cod_Fascia)
);

CREATE TABLE AUTORE (
    CodAutore INT PRIMARY KEY,
    Id_eta INT NOT NULL,
    Sesso VARCHAR(10) NOT NULL CHECK (Sesso IN ('Maschio', 'Femmina')),
    FOREIGN KEY (Id_eta) REFERENCES ETA(Cod_eta)
);

CREATE TABLE STATO (
    Cod_Stato INT PRIMARY KEY,
    Stato_Editore VARCHAR(50) NOT NULL
);

CREATE TABLE REGIONE (
    Cod_Regione INT PRIMARY KEY,
    Regione_Editore VARCHAR(50) NOT NULL,
    Id_Stato INT NOT NULL,
    FOREIGN KEY (Id_Stato) REFERENCES STATO(Cod_Stato)
);

CREATE TABLE PROVINCIA (
    Cod_Provincia INT PRIMARY KEY,
    Provincia_Editore VARCHAR(50) NOT NULL,
    Id_Regione INT NOT NULL,
    FOREIGN KEY (Id_Regione) REFERENCES REGIONE(Cod_Regione)
);


CREATE TABLE GENERE (
    Cod_Genere INT PRIMARY KEY,
    Nome_Genere VARCHAR(50) NOT NULL
);
CREATE TABLE EDITORE (
    Cod_Editore INT PRIMARY KEY,
    Id_Provincia INT NOT NULL,
    Nome char(30) NOT NULL,
    FOREIGN KEY (Id_Provincia) REFERENCES PROVINCIA(Cod_Provincia)
);

CREATE TABLE PUBBLICAZIONE_LIBRO (
    Id_Libro_Pub INT PRIMARY KEY,
    Anno INT NOT NULL,
    Titolo VARCHAR(100) NOT NULL,
    Id_Genere INT NOT NULL,
    Id_Autore INT NOT NULL,
    Id_Editore INT NOT NULL,
    FOREIGN KEY (Id_Genere) REFERENCES GENERE(Cod_Genere),
    FOREIGN KEY (Id_Autore) REFERENCES AUTORE(CodAutore),
    FOREIGN KEY (Id_Editore) REFERENCES EDITORE(Cod_Editore)
);



SELECT
    PUBBLICAZIONE_LIBRO.Id_Libro_Pub AS id_libro,
    AUTORE.Sesso,
    ETA.Eta_Autore,
    CASE
        WHEN ETA.Id_Fascia  = 1 THEN 'Adolescente'
        WHEN ETA.Id_Fascia = 2 THEN 'Adulto'
        WHEN ETA.Id_Fascia = 3 THEN 'Anziano'

    END AS fascia_eta,
    EDITORE.Nome AS nome_editore,
    PUBBLICAZIONE_LIBRO.Anno,
    PUBBLICAZIONE_LIBRO.Titolo,
    GENERE.Nome_Genere AS genere

FROM
    PUBBLICAZIONE_LIBRO
    JOIN AUTORE ON PUBBLICAZIONE_LIBRO.Id_Autore = AUTORE.CodAutore
    JOIN ETA ON AUTORE.Id_eta = ETA.Cod_eta
    JOIN EDITORE ON PUBBLICAZIONE_LIBRO.Id_Editore = EDITORE.Cod_Editore
    JOIN GENERE ON PUBBLICAZIONE_LIBRO.Id_Genere = GENERE.Cod_Genere


SELECT
    PUBBLICAZIONE_LIBRO.Id_Libro_Pub AS id_libro,
    AUTORE.Sesso,
    ETA.Eta_Autore,
    CASE
        WHEN ETA.Eta_Autore BETWEEN 0 AND 30 THEN 'Giovane'
        WHEN ETA.Eta_Autore BETWEEN 31 AND 60 THEN 'Adulto'
        ELSE 'Anziano'
    END AS fascia_eta,
    EDITORE.Nome AS nome_editore,
    PUBBLICAZIONE_LIBRO.Anno,
    PUBBLICAZIONE_LIBRO.Titolo,
    GENERE.Nome_Genere AS genere,
    PROVINCIA.Provincia_Editore,
    REGIONE.Regione_Editore,
    STATO.Stato_Editore
FROM
    PUBBLICAZIONE_LIBRO
    JOIN AUTORE ON PUBBLICAZIONE_LIBRO.Id_Autore = AUTORE.CodAutore
    JOIN ETA ON AUTORE.Id_eta = ETA.Cod_eta
    JOIN EDITORE ON PUBBLICAZIONE_LIBRO.Id_Editore = EDITORE.Cod_Editore
    JOIN GENERE ON PUBBLICAZIONE_LIBRO.Id_Genere = GENERE.Cod_Genere
    JOIN PROVINCIA ON EDITORE.Id_Provincia = PROVINCIA.Cod_Provincia
    JOIN REGIONE ON PROVINCIA.Id_Regione = REGIONE.Cod_Regione
    JOIN STATO ON REGIONE.Id_Stato = STATO.Cod_Stato
    ORDER BY Id_Libro
    
