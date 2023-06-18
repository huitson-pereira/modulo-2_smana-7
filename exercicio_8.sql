-- Exercicio 8

-- Criação da tabela UsuarioViagem
create table UsuarioViagem(
	id_usuarioViagem SERIAL primary key,
	nome_usuarioViagem varchar(100)
);

-- Criação da tabela Viagem
create table Viagem(
	id_viagem SERIAL primary key,
	destino varchar(100),
	data_viagem Date,
	valor_passagem float
);

-- Criação da tabela Reserva
create table Reserva(
	id_usuarioViagem INTEGER,
	id_viagem INTEGER,
	data_reserva Date,
	foreign key (id_usuarioViagem) references UsuarioViagem(id_usuarioViagem),
	foreign key (id_viagem) references Viagem(id_viagem)
);

SELECT UsuarioViagem.nome_usuarioviagem, SUM(Viagem.valor_passagem) AS valor_total_gasto
FROM UsuarioViagem
INNER JOIN Reserva ON UsuarioViagem.id_usuarioViagem = Reserva.id_usuarioViagem
INNER JOIN Viagem ON Reserva.id_viagem = Viagem.id_viagem
WHERE EXTRACT(MONTH FROM Viagem.data_viagem) = 7
GROUP BY UsuarioViagem.nome_usuarioViagem
ORDER BY valor_total_gasto DESC;





















