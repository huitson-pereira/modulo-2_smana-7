-- Exercicio 5
-- Criacao da tabela Pais
CREATE TABLE Pais (
  id_pais SERIAL PRIMARY KEY,
  nome_pais varchar(100),
  continente varchar(100)
);
 
 -- Criação da tabela Estado
 CREATE TABLE Estado (
  id_estado SERIAL PRIMARY KEY,
  id_pais INTEGER,
  nome_estado varchar(100),
  foreign key (id_pais) references Pais(id_pais)
);

-- Criação da tabela Cidade
CREATE TABLE Cidade (
  id SERIAL PRIMARY KEY,
  nome_cidade VARCHAR(100),
  id_estado INTEGER,
  capital BOOLEAN,
  qtd_populacao INTEGER,
  foreign key (id_estado) references Estado(id_estado)
);




SELECT Pais.nome_pais, Estado.nome_estado, Cidade.nome_cidade
FROM Cidade
INNER JOIN Estado ON Cidade.id_estado = Estado.id_estado
INNER JOIN Pais ON Estado.id_pais = Pais.id_pais
WHERE Cidade.capital = 'True'
  AND Cidade.qtd_populacao > 500000
  AND (Estado.nome_estado LIKE 'São%' OR Estado.nome_estado LIKE 'San%' OR Estado.nome_estado LIKE 'Saint%')
  AND Pais.continente IN ('América do Norte', 'América Central', 'América do Sul')
ORDER BY Pais.nome_pais, Estado.nome_estado, Cidade.nome_cidade;






