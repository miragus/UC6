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
('Rua Professor Bartolomeu Fagundes', 'Petrópolis', 'Natal', 'RN', '59014010'),
('Rua Manoel de Castro', 'Cidade da Esperança', 'Natal', 'RN', '59070700'),
('Rua Marte', 'Igapó', 'Natal', 'RN', '59106180'),
('Rua Augusto Severo Neto', 'Ponta Negra', 'Natal', 'RN', '59090182')


/*('Rua Maria Ortiga Rosado', 'Monsenhor Américo', 'Mossoró', 'RN', '59613705')
('Rua José Monteiro', 'Nova Esperança', 'Parnamirim', 'RN', '59144822'),
('Rua Simon Bolívar', 'Neópolis', 'Natal', 'RN', '59080540'),
('Rua José Monteiro', 'Nova Esperança', 'Parnamirim', 'RN', '59144822'),
('Rua Lagoa de Extremoz', 'Pajuçara', 'Natal', 'RN', '59123570')*/
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
	data_fim date,
	unidade nvarchar(50)
);
insert into curso(nome, duracao, modalidade, area, vagas_disp, alunos_mat, data_inicio, data_fim, unidade)
values
('Comércio', '60h', 'Presencial', 'Comercial', 15, 0, '2024-01-01', '2024-01-20', 'Senac Zona Norte');

ALTER TABLE curso ADD unidade nvarchar(50);

update curso set unidade = 'Senac Zona Norte' where id_curso = 5;
update curso set unidade = 'Senac Zona Leste' where id_curso = 3;
update curso set alunos_mat = '5' where id_curso = 7;
update curso set vagas_disp = '10' where id_curso = 7;
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

(13, '36104145450', 'Mara Zanetti', 'mara.gayoso@gmail.com', '1990-04-19', '84973994649', 2000.50, '2024-01-25', 'Feminino')
(11, '07544905489', 'Jorge', 'jorge.belmiro@gmail.com', '1979-03-12', '84969478184', 3300.70, '2010-11-09', 'Masculino'),
(7,'62136547470', 'Edna', 'EdNa@gmail.com', '1989-08-15', '84993473279', 2010.15, '2015-07-19', 'Feminino'),
(9,'87931159462', 'Thomas', 'tom@gmail.com', '1992-04-22', '8424525447', 2005.20, '2018-03-02', 'Masculino')

select * from funcionario;
----------------------------------------------------------------------------------------------------------
create table professor(
	matricula_f int primary key,
	especializacao varchar(50),
	area varchar(50),
	foreign key (matricula_f) references funcionario(matricula_f)
);
insert into professor(matricula_f, especializacao, area)
values
(1, 'Desenvolvimento Full Stack', 'TI'),
(5, 'Marketing', 'Comercial'),
(4, 'Análise e Desenvolvimento de Sistemas', 'TI')
select * from professor;
----------------------------------------------------------------------------------------------------------
create table coordenador(
	matricula_f char(10),
	graduacao varchar(50),
	foreign key (matricula_f) references funcionario(matricula_f)
);
----------------------------------------------------------------------------------------------------------
create table aluno(
	id_endereco int,
	matricula_a int IDENTITY (1,1) primary key,
	cpf char(11),
	nome varchar(50),
	email varchar(50),
	telefone char(11),
	data_nascimento date,
	genero nvarchar(20),
	curso nvarchar(50),
	qnt_cursos int
	foreign key	(id_endereco) references endereco(id_endereco)
);

insert into aluno(id_endereco, cpf, nome, email, telefone, data_nascimento, genero, curso, qnt_cursos)
values
(21, '57835957485', 'Valéria', 'valeria.sodre@gmail.com', '84998328485', '2005-05-17', 'Feminino', 'Técnico em desenvolvimento de sistemas', 1),
(19, '11667438450', 'Mateus', 'matheus.paixao@gmail.com', '84983261139', '2000-03-10', 'Masculino', 'Técnico em desenvolvimento de sistemas', 1),
(17, '86450619457', 'Lorenzo', 'lorentralha@gmail.com', '84984816207', '2002-11-08', 'Masculino', 'Desenvolvedor Fullstack', 1),
(15, '72746163403', 'Júlia', 'jullinhabay@gmail.com', '84991504148', '1998-01-09', 'Feminino', 'Comércio e Dev Fullstack', 2);
select * from aluno;

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




