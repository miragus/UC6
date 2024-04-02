---Questão 1

select LIVRO.titulo
from LIVRO
join SOCIOLOGIA
on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;

--Questão 2

select FUNCIONARIO.nome
from FUNCIONARIO
join BIBLIOTECARIO
on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula;

--Questão 3

select titulo, ano_publicacao
from LIVRO 
where ano_publicacao < '2000';
select * from LIVRO
--Questão 4

insert into LIVRO_BIBLIOTECA(cnpj, numero_registro)
values
('01234567000112', 1),
('12345678000123', 2),
('23456789000134', 7),
('34567890000145', 28),
('45678901000156', 50),
('56789012000167', 47),
('56789012000167', 23),
('12345678000123', 8),
('12345678000123', 16),
('90123456000101', 10),
('01234567000112', 1),
('34567890000145', 28)

select cnpj, count(*) as total_livros from LIVRO_BIBLIOTECA group by cnpj;

--Questão 5

select id_evento, tipo, data
from EVENTO
where tipo = 'workshop' and year (data) > '2020';

--Questão 6
select * from LIVRO
create table USUARIO(
	id varchar(5) primary key,
	nome varchar(20),
	telefone char(11),
	cpf char(11)
);

create table EMPRESTIMO(
	emp_data date,
	emp_devolucao date,
	prazo int,
	numero_registro int,
	id varchar(5),
	foreign key (id) references usuario (id),
	foreign key (numero_registro) references livro (numero_registro)
);

insert into USUARIO(id, nome, telefone, cpf)
values
('U0001', 'Bill', '84897563214', '86663876457'),
('U0002', 'Arthur', '84986663547', '30577205102'),
('U0003', 'Felipe', '84887416230', '58457328751'),
('U0004', 'Alfredo', '84855624001', '82313141993'),
('U0005', 'Milton', '84866987412', '36740624372')

insert into EMPRESTIMO(emp_data, emp_devolucao, prazo, id, numero_registro)
values
('2023-01-13', '2023-02-15', 30, 'U0002', 8),
('2023-04-01', '2023-05-15', 30, 'U0005', 12),
('2023-08-15', '2023-09-15', 30, 'U0004', 27),
('2023-02-07', '2023-02-28', 30, 'U0001', 16),
('2023-01-03', '2023-02-01', 30, 'U0003', 2)
select usuario.nome, emp_data
from usuario
join EMPRESTIMO
on usuario.id = EMPRESTIMO.id
where MONTH (emp_data) = '01' and year (emp_data) = '2023';

--Questão 7

select LIVRO.titulo, LIVRO.numero_registro
from LIVRO
join TECNOLOGIA
on LIVRO.numero_registro = TECNOLOGIA.numero_registro
where titulo like '%python%';

--Questão 8

select cnpj, titulo
from PERIODICO
join PERIODICO_BIBLIOTECA
on PERIODICO.numero_registro = PERIODICO_BIBLIOTECA.numero_registro
where cnpj = '12345678000123';

--Questão 9

select * from FUNCIONARIO
where matricula not like't%';

--Questão 10

select titulo, autor
from LIVRO
join EMPRESTIMO
on livro.numero_registro = EMPRESTIMO.numero_registro
where id = 'U0001';

--Questão 11

select * from EVENTO
join PALESTRA
on EVENTO.id_evento = PALESTRA.id_evento
where custo > 100.00;

--Questão 12

select titulo, ano_publicacao
from LIVRO
join CIENCIA
on LIVRO.numero_registro = CIENCIA.numero_registro
where year (ano_publicacao) > '2010';

--Questão 13

select funcionario.nome
from FUNCIONARIO
join ATENDENTE
on FUNCIONARIO.matricula = ATENDENTE.matricula
where FUNCIONARIO.nome like '% maria %';

--Questão 14

select LIVRO.titulo
from LIVRO
join EMPRESTIMO
on LIVRO.numero_registro = EMPRESTIMO.numero_registro
where(
	select count(*) from EMPRESTIMO
	where LIVRO.numero_registro = EMPRESTIMO.numero_registro)
	>5;

--Questão 15

select USUARIO.nome, LIVRO.titulo, EMPRESTIMO.id
from USUARIO
join EMPRESTIMO
on USUARIO.id = EMPRESTIMO.id
join TECNOLOGIA
on EMPRESTIMO.numero_registro = TECNOLOGIA.numero_registro
join LIVRO
on TECNOLOGIA.numero_registro = LIVRO.numero_registro
where EMPRESTIMO.numero_registro = TECNOLOGIA.numero_registro
order by id;

--Questão 16

select tipo, data, evento.id_evento
from EVENTO
join PALESTRA
on EVENTO.id_evento = PALESTRA.id_evento
where year (data) = '2022'
order by PALESTRA.id_evento;

--Questão 17

select titulo
from PERIODICO
where titulo like '%saúde%'

--Questão 18

select FUNCIONARIO.nome
from FUNCIONARIO
join ESTAGIARIO 
on FUNCIONARIO.matricula = ESTAGIARIO.matricula
where ESTAGIARIO.nome like 'L%'

--Questão 19

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
join SOCIOLOGIA
on LIVRO.numero_registro = SOCIOLOGIA.numero_registro
where year (ano_publicacao) > '1990' and year (ano_publicacao) < '2000'

--Questão 20

select titulo, autor
from LIVRO
join EMPRESTIMO
on LIVRO.numero_registro = EMPRESTIMO.numero_registro
where MONTH (emp_data) = '02' and year (emp_data) = '2023';

