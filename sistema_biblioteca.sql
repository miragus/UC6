use sistema_biblioteca;

--Quest�o 01

select count(*)
as TOTAL_LIVROS 
from LIVRO_BIBLIOTECA
where cnpj = '12345678000123';

--Quest�o 02

select * 
from BIBLIOTECARIO 
order by matricula;

--Quest�o 03

select titulo, autor
from LIVRO
where numero_registro = 10;

--Quest�o 04

select * 
from evento
where tipo='workshop' and custo >150;

--Quest�o 05

select LIVRO.titulo
from LIVRO
join TECNOLOGIA
on LIVRO.numero_registro = TECNOLOGIA.numero_registro;

--Quest�o 06

select nome
from ATENDENTE;

--Quest�o 07

select titulo, ano_publicacao
from PERIODICO
where ano_publicacao = '2023';

--Quest�o 08

select LIVRO.titulo
from LIVRO
join SOCIOLOGIA
on LIVRO.numero_registro = SOCIOLOGIA.numero_registro;

--Quest�o 09

select matricula, nome
from EDUCADOR;

--Quest�o 10

select PERIODICO.titulo
from PERIODICO
where titulo like 'c%';

--Quest�o 11

select EVENTO.data, EVENTO.tipo
from EVENTO
where tipo = 'palestra' and data < '2022';

--Quest�o 12

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
join CIENCIA
on LIVRO.numero_registro = CIENCIA.numero_registro and ano_publicacao > '2015';

--Quest�o 13

select TECNICO_TI.nome
from TECNICO_TI
where nome like '%rodrigo%';

--Quest�o 14

select FUNCIONARIO.nome
from FUNCIONARIO
join ASSISTENTE
on FUNCIONARIO.matricula = ASSISTENTE.matricula;

--Quest�o 15

select LIVRO.titulo
from LIVRO
where titulo like '%programa��o%';

--Quest�o 16

select PERIODICO.titulo
from PERIODICO
where titulo like '%sa�de%';

--Quest�o 17

select FUNCIONARIO.nome
from FUNCIONARIO
join GERENTE
on FUNCIONARIO.matricula = GERENTE.matricula
where GERENTE.nome like 'c%';

--Quest�o 18 obrigado bard

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
where ano_publicacao between '2010' and '2020'
order by LIVRO.ano_publicacao;

--jeito do professor

select LIVRO.titulo, LIVRO.ano_publicacao
from LIVRO
where ano_publicacao > '2010' and ano_publicacao < '2020'
order by LIVRO.ano_publicacao;

--Quest�o 19

select ESTAGIARIO.nome
from ESTAGIARIO
where nome like '%lima%';

--jeito do professor 

select FUNCIONARIO.nome
from FUNCIONARIO
join ESTAGIARIO
on ESTAGIARIO.matricula = FUNCIONARIO.matricula
where ESTAGIARIO.nome like '%lima%';