

-- Creazione della tabella Autore
CREATE TABLE Autore (
    CodAutore INT PRIMARY KEY,
    Nome_Autore VARCHAR(50) NOT NULL,
    Cognome_Autore VARCHAR(50) NOT NULL,
    Sesso_Autore CHAR(1) NOT NULL,
    Anno_Nascita INT NOT NULL
);

-- Creazione della tabella Genere
CREATE TABLE Genere (
    Categoria_Libro VARCHAR(50) PRIMARY KEY NOT NULL,
    Descrizione VARCHAR(255)
);



-- Creazione della tabella Casa_Editrice
CREATE TABLE Casa_Editrice (
    Id_Editore INT PRIMARY KEY,
    Sede VARCHAR(255) NOT NULL
);

-- Creazione della tabella Libro
CREATE TABLE Libro (
    ISBN VARCHAR(13) PRIMARY KEY NOT NULL,
    Titolo VARCHAR(100) NOT NULL,
    Anno_Pubblicazione INT NOT NULL,
    Id_Casa_Editrice INT,
    FOREIGN KEY (Id_Casa_Editrice) REFERENCES Casa_Editrice(Id_Editore)
);

-- Creazione della tabella Membro_Associato
CREATE TABLE Membro_Associato (
    Id_Membro INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Cognome VARCHAR(50) NOT NULL,
    Indirizzo VARCHAR(255) NOT NULL
);

-- Creazione della tabella Prestito
CREATE TABLE Prestito (
    Id_Prestito INT PRIMARY KEY,
    Id_Libro VARCHAR(13) NOT NULL,
    Id_Membro_Prestito INT NOT NULL,
    Data_Prestito DATE NOT NULL,
    FOREIGN KEY (Id_Libro) REFERENCES Libro(ISBN),
    FOREIGN KEY (Id_Membro_Prestito) REFERENCES Membro_Associato(Id_Membro)
);

CREATE TABLE Categorizzato (
    ISBN VARCHAR(13) NOT NULL,
    Genere VARCHAR(50) NOT NULL,
    PRIMARY KEY (ISBN, Genere),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    FOREIGN KEY (Genere) REFERENCES Genere(Categoria_Libro)
);

CREATE TABLE Scritto (
    ISBN VARCHAR(13) NOT NULL,
    CodAutore INT NOT NULL,
    PRIMARY KEY (ISBN, CodAutore),
    FOREIGN KEY (ISBN) REFERENCES Libro(ISBN),
    FOREIGN KEY (CodAutore) REFERENCES Autore(CodAutore)
);
