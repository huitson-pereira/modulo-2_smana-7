-- Criando a tabela Usuario
CREATE TABLE Usuario (
  id SERIAL PRIMARY KEY,
  nome_completo VARCHAR(100),
  cpf VARCHAR(14),
  data_nascimento DATE,
  rg VARCHAR(14),
  email VARCHAR(40),
  login VARCHAR(40),
  senha VARCHAR(40),
  check ((current_date - data_nascimento) >= 18)
);

-- Criando a tabela Genero
CREATE TABLE Genero (
  id SERIAL PRIMARY KEY,
  nome_genero VARCHAR(40)
);

-- Criando a tabela Plataforma
CREATE TABLE Plataforma (
  id SERIAL PRIMARY KEY,
  nome_plataforma VARCHAR(40)
);

-- Criar a tabela Jogo
CREATE TABLE Jogo (
  id SERIAL PRIMARY KEY,
  nome_jogo VARCHAR(40),
  data_lancamento DATE,
  genero_id INTEGER,
  foreign key (genero_id) references Genero(id)  
);

-- Criar a tabela Jogo_plataforma
CREATE TABLE Jogo_plataforma (
  id SERIAL primary KEY,
  plataforma_id integer,
  jogo_id integer,
  foreign key (plataforma_id) references Plataforma(id),
  foreign key (jogo_id) references Jogo(id)
);

-- Criar tabela Midia
CREATE TABLE Midia(
    id SERIAL PRIMARY KEY,
    jogo_id INTEGER,
    tipo VARCHAR(40),
    url VARCHAR(100),
    foreign key (jogo_id) references Jogo(id)
);

-- Criar tabela Compra
CREATE TABLE Compra (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER,
    jogo_id INTEGER,
    data_compra DATE,
    foreign key (usuario_id) references Usuario(id),
    foreign key (jogo_id) references Jogo(id)
);


-- Exercício 3 
-- Inserindo dados na tabela Genero
INSERT INTO Genero (nome_genero)
VALUES
  ('Simulação da vida real');
 
-- Inserindo dados na tabela Plataforma
INSERT INTO Plataforma (nome_plataforma)
VALUES
  ('PlayStation 1'),
  ('PlayStation 2'),
  ('PlayStation 3'),
  ('PlayStation 4'),
  ('PlayStation 5'),
  ('X Box Series S'),
  ('X Box Series X'),
  ('PC');
 
-- Inserindo dados na tabela Jogo
INSERT INTO Jogo (nome_jogo, data_lancamento, genero_id)
VALUES
  ('The Sims 4 Base', '17/06/2023', '1');  
 
-- Inserindo dados na tbela Usuario
INSERT INTO Usuario (nome_completo, cpf, data_nascimento, rg, email, login, senha)
VALUES
  ('Derpson da Silva', '123.123.123-12', '01/01/1991', '4.123.123', 'derpinho91@hotmail.com', 'derpinho', 'derpinho91');
 
--Inserindo dados na tabela Jogo_plataforma
INSERT INTO Jogo_Plataforma (jogo_id, plataforma_id) VALUES
  (1, 4),
  (1, 5),
  (1, 8);


 


 



