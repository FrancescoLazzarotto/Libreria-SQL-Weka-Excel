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
