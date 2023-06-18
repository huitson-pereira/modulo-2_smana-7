-- Criação da tabela Ator
CREATE TABLE Ator (
    Id_ator SERIAL PRIMARY KEY,
    Nome_ator VARCHAR(255),
    Data_nascimento DATE,
    Altura FLOAT,
    Peso FLOAT
);


-- Criação da tabela Filme
CREATE TABLE Filme (
    Id_filme SERIAL PRIMARY KEY,
    Nome_filme VARCHAR(255),
    Duracao_minutos INTEGER
);


-- Criação da tabela GeneroFilme
CREATE TABLE GeneroFilme (
    Id_generoFilme SERIAL PRIMARY KEY,
    Nome_generoFilme VARCHAR(255)
);


-- Criação da tabel GeneroFilme_Filme
CREATE TABLE GeneroFilme_Filme (
    Id_filme INTEGER,
    Id_generoFilme INTEGER,
    FOREIGN KEY (Id_filme) REFERENCES Filme(Id_filme),
    FOREIGN KEY (Id_generoFilme) REFERENCES GeneroFilme(Id_generoFilme)
);

SELECT Nome_filme, Duracao_minutos
FROM Filme
WHERE Nome_filme LIKE '%Ação'
ORDER BY Duracao_minutos;