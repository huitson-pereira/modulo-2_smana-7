-- Exercicio 7

--Criação da tabela Usuario
CREATE TABLE Usuario (
	id_usuario SERIAL PRIMARY KEY,
	nome_usuario varchar(100)
);

--Criação da tabela Produto
CREATE TABLE Produto (
	id_produto SERIAL PRIMARY KEY,
	nome_produto varchar(100)
);

--Criação da tabela Venda
CREATE TABLE Venda (
	id_usuario INTEGER,
	id_produto INTEGER,
	valor_produto FLOAT,
	quantidade_produto INTEGER,
	dt_compra Date,
	FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
	FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

SELECT Usuario.nome_usuario, SUM(Venda.valor_produto * Venda.quantidade_produto) AS valor_total_gasto
FROM Usuario
INNER JOIN Venda ON Usuario.id_usuario = Venda.id_usuario
WHERE EXTRACT(MONTH FROM Venda.dt_compra) = 11
GROUP BY Usuario.nome_usuario
ORDER BY valor_total_gasto DESC;


