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

-- Criar a tabela Jogo_plataforma
CREATE TABLE Jogo_plataforma (
  id SERIAL primary KEY,
  plataforma_id integer,
  foreign key (plataforma_id) references Plataforma(id)
);

-- Criar a tabela Jogo
CREATE TABLE Jogo (
  id SERIAL PRIMARY KEY,
  nome_jogo VARCHAR(40),
  data_lancamento DATE,
  genero_id INTEGER,
  jogo_plataforma_id INTEGER,
  foreign key (genero_id) references Genero(id),
  foreign key (jogo_plataforma_id) references jogo_plataforma(id)  
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