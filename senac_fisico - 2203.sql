create database senac_fisico;

use senac_fisico;

create table endereco(
	id_endereco int IDENTITY (1,2) primary key,
	rua varchar(50),
	bairro varchar(50),
	cidade varchar(50),
	estado varchar(50),
	cep char (8)
);
insert into endereco(rua, bairro, cidade, estado, cep)
values
--('Rua José Monteiro', 'Nova Esperança', 'Parnamirim', 'RN', '59144822'),
('Rua Simon Bolívar', 'Neópolis', 'Natal', 'RN', '59080540'),
('Rua José Monteiro', 'Nova Esperança', 'Parnamirim', 'RN', '59144822')
select * from endereco;

----------------------------------------------------------------------------------------------------------
create table senac(
	cnpj_senac char(14) primary key,
	id_endereco int,
	unidadade varchar(50) UNIQUE,
	telefone char(10),
	zona varchar(50),
	foreign key	(id_endereco) references endereco(id_endereco)
);

select * from senac;
----------------------------------------------------------------------------------------------------------
create table curso(
	id_curso int IDENTITY (1,2) primary key,
	nome varchar(50),
	duracao nvarchar(50),
	modalidade nvarchar(50),
	area varchar(50),
	vagas_disp decimal,
	alunos_mat decimal,
	data_inicio date,
	data_fim date
);

select * from curso;
----------------------------------------------------------------------------------------------------------
create table vaga(
	cnpj_senac char(14),
	id_curso int,
	foreign key (cnpj_senac) references senac(cnpj_senac),
	foreign key (id_curso) references curso (id_curso)
);
----------------------------------------------------------------------------------------------------------
create table tecnico(
	id_curso int,
	foreign key (id_curso) references curso (id_curso)
);
----------------------------------------------------------------------------------------------------------
create table livre(
	id_curso int,
	foreign key (id_curso) references curso (id_curso)
);
----------------------------------------------------------------------------------------------------------
create table empresa(
	cnpj_empresa char(14) primary key,
	id_endereco int IDENTITY (1,2),
	telefone char(11),
	email varchar(50),
	nome varchar(50),
	foreign key	(id_endereco) references endereco(id_endereco)
);
----------------------------------------------------------------------------------------------------------
create table parceria(
	cnpj_senac char(14),
	cnpj_empresa char (14),
	foreign key (cnpj_senac) references senac(cnpj_senac),
	foreign key (cnpj_empresa) references empresa(cnpj_empresa)
);
----------------------------------------------------------------------------------------------------------
create table funcionario(
	matricula_f int IDENTITY (1,1) primary key,
	id_endereco int,
	cpf char(11),
	email varchar(50),
	nome varchar(50),
	data_nascimento date,
	telefone char(11),
	salario decimal(6,2),
	data_admissao date,
	genero nvarchar(50)
	foreign key	(id_endereco) references endereco(id_endereco)
);
insert into funcionario (id_endereco,cpf, nome, email, data_nascimento, telefone, salario, data_admissao, genero)
values
(7,'62136547470', 'Edna', 'EdNa@gmail.com', '1989-08-15', '84993473279', 2010.15, '2015-07-19', 'Feminino' )
select * from funcionario;
----------------------------------------------------------------------------------------------------------
create table professor(
	matricula_f char(10) primary key,
	graduacao varchar(50),
	area varchar(50),
	foreign key (matricula_f) references funcionario(matricula_f)
);
----------------------------------------------------------------------------------------------------------
create table coordenador(
	matricula_f char(10),
	graduacao varchar(50),
	foreign key (matricula_f) references funcionario(matricula_f)
);
----------------------------------------------------------------------------------------------------------
create table atendente(
	matricula_f char(10) primary key,
	foreign key (matricula_f) references funcionario(matricula_f)
);
----------------------------------------------------------------------------------------------------------
create table aluno(
	matricula_a char(10) primary key,
	cpf char(11),
	nome varchar(50),
	email varchar(50),
	telefone char(11),
	data_nascimento date,
	id_endereco int IDENTITY (1,2),
	genero nvarchar(20)
	foreign key	(id_endereco) references endereco(id_endereco)
);
----------------------------------------------------------------------------------------------------------
create table atendimento(
	matricula_a char(10),
	matricula_f char(10),
	foreign key (matricula_f) references atendente(matricula_f),
	foreign key (matricula_a) references aluno(matricula_a)
);
----------------------------------------------------------------------------------------------------------
create table turma(
	matricula_a char(10),
	matricula_f char(10),
	foreign key (matricula_a) references aluno(matricula_a),
	foreign key (matricula_f) references professor(matricula_f)
);
----------------------------------------------------------------------------------------------------------
create table comercial(
	matricula_a char(10),
	valor decimal(6,2),
	foreign key (matricula_a) references aluno(matricula_a)
);
----------------------------------------------------------------------------------------------------------
create table bolsista(
	matricula_a char(10),
	financiamento decimal(5,2),
	foreign key (matricula_a) references aluno(matricula_a)
);
----------------------------------------------------------------------------------------------------------
create table psg(
	matricula_a char(10),
	foreign key (matricula_a) references aluno(matricula_a)
);
----------------------------------------------------------------------------------------------------------
create table aprendiz(
	matricula_a char(10) primary key,
	cnpj_empresa char(14),
	foreign key (matricula_a) references aluno(matricula_a),
	foreign key (cnpj_empresa) references empresa(cnpj_empresa)
);
----------------------------------------------------------------------------------------------------------
create table contrato(
	matricula_a char(10),
	cnpj_empresa char(14),
	foreign key (matricula_a) references aprendiz(matricula_a),
	foreign key (cnpj_empresa) references empresa(cnpj_empresa)
);