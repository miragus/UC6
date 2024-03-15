use sistema_biblioteca;

--Questão 01

select count(*)
as TOTAL_LIVROS 
from LIVRO_BIBLIOTECA
where cnpj = '12345678000123';

--Questão 02

select * 
from BIBLIOTECARIO 
order by matricula;

--Questão 03

select titulo, autor
from LIVRO
where numero_registro = 10;

--Questão 04

select * 
from evento
where tipo='workshop' and custo >150;

--Questão 05

select LIVRO.titulo
from LIVRO
join TECNOLOGIA
on LIVRO.numero_registro = TECNOLOGIA.numero_registro;

--Questão 06

select nome
from ATENDENTE;

--Questão 07

select titulo, ano_publicacao
from PERIODICO
where ano_publicacao = '2023';

--Questão 08

select LIVRO.titulo
from LIVRO
join SOCIOLOGIA
on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;

--Questão 09

select matricula, nome
from EDUCADOR;

--Questão 10

select PERIODICO.titulo
from PERIODICO
where titulo like 'c%';

--Questão 11

select EVENTO.data, EVENTO.tipo
from EVENTO
where tipo = 'palestra' and data < '2022';

--Questão 12

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
join CIENCIA
on LIVRO.numero_registro = CIENCIA.numero_registro and ano_publicacao > '2015';

--Questão 13

select TECNICO_TI.nome
from TECNICO_TI
where nome like '%rodrigo%';

--Questão 14

select FUNCIONARIO.nome
from FUNCIONARIO
join ASSISTENTE
on FUNCIONARIO.matricula = ASSISTENTE.matricula;

--Questão 15

select LIVRO.titulo
from LIVRO
where titulo like '%programação%';

--Questão 16

select PERIODICO.titulo
from PERIODICO
where titulo like '%saúde%';

--Questão 17

select FUNCIONARIO.nome
from FUNCIONARIO
join GERENTE
on FUNCIONARIO.matricula = GERENTE.matricula
where GERENTE.nome like 'c%';

--Questão 18 obrigado bard

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
where ano_publicacao between '2010' and '2020'
order by LIVRO.ano_publicacao;

--jeito do professor

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
where ano_publicacao > '2010' and ano_publicacao < '2020'
order by LIVRO.ano_publicacao;

--Questão 19

select ESTAGIARIO.nome
from ESTAGIARIO
where nome like '%lima%';

--jeito do professor 

select FUNCIONARIO.nome
from FUNCIONARIO
join ESTAGIARIO
on ESTAGIARIO.matricula = FUNCIONARIO.matricula
where ESTAGIARIO.nome like '%lima%';