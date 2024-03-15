--criar meu banco de dados
create database ifood;
-- usar o banco criado
use ifood;
--criando a tabela 'usuário'
create table usuario(
	id char(7) primary key,
	nome nvarchar(50),
	cpf char(11),
	telefone char(11),
	email nvarchar(50)
);
--criando a tabela 'avaliação'
create table avaliacao(
	id char(7) primary key,
	comentario nvarchar(200),
	classificacao tinyint,
	data_avaliacao date
);
--criando a tabela 'funcionário'
create table funcionario(
	id char(7) primary key,
	nome nvarchar(50),
	cargo nvarchar(50),
	salario decimal,
	data_admissao date
);
--criando a tabela 'categoria'
create table categoria(
	id_categoria char(10),
	nome_categoria nvarchar(50),
	id_produto char(10),
	nome_produto nvarchar(50),
	descricao_produto text,
	preco_produto decimal,
	disponibilidade_produto bit, --bit foi escolhido como forma de definir um "boolean" (true '1' ou false '0')
	id_nao_consumiveis char(10),
	nome_nao_consumiveis nvarchar(50),
	id_consumiveis char(10),
	nome_consumiveis nvarchar(50)
);
--criando a tabela 'promoção'
create table promocao(
	id char(10),
	descricao text,
	data_inicio date,
	data_fim date,
	desconto decimal
);
--criando a tabela 'pedido'
create table pedido(
	id_pedido char(10),
	data_hora datetime,
	status_pedido varchar(50),
	valor_total decimal,
	id_entrega char(10),
	data_hora_entrega datetime,
	status_entrega varchar(50),
	taxa decimal
	primary key(id_pedido, id_entrega)
);
--criando a tabela 'forma de pagamento'
create table forma_pagamento(
	id char(10) primary key,
	tipo bit,
	descricao text
);
--criando a tabela 'restaurante'
create table restaurante(
	id char(10) primary key,
	nome varchar(50),
	tipo varchar(50),
	funcionamento datetime
);
--criando a tabela 'carrinho'
create table carrinho (
	id char(10) primary key,
	quantidade tinyint,
	total_parcial decimal
);
--criando a tabela 'endereço'
create table endereco(
	id char(10) primary key,
	numero smallint,
	rua nvarchar(50),
	bairro nvarchar(50),
	cidade nvarchar(30),
	estado nvarchar(30),
	cep char (8)
);

--chave estrangeira

create 