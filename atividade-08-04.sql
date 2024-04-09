--PROCEDURE

--Questão 1

create procedure sp_livros_sociologia
as
begin
	select *
	from LIVRO
	join SOCIOLOGIA
	on LIVRO.numero_registro = SOCIOLOGIA.numero_registro
end;
exec sp_livros_sociologia

--Questão 2

create procedure sp_nomes_funcionarios
as
begin
	select FUNCIONARIO.nome
	from FUNCIONARIO
	join BIBLIOTECARIO
	on FUNCIONARIO.matricula = BIBLIOTECARIO.matricula
end;
exec sp_nomes_funcionarios;

--Questão 3

create procedure sp_liv_pre_2000
	@ano_publicacao nvarchar(30)
as
begin
	select titulo, ano_publicacao
	from LIVRO
	where ano_publicacao < @ano_publicacao
end;
exec sp_liv_pre_2000 @ano_publicacao = '2000';

	
--Questão 4

create procedure sp_livros_bibliotecas
as
begin
	select cnpj, count(*) as total_livros
	from LIVRO_BIBLIOTECA
	group by cnpj;
end;
exec sp_livros_bibliotecas;

--Questão 5

create procedure sp_ev_pos_2020
	@data nvarchar(30)
as
begin
	select *
	from evento
	where data > @data
end
exec sp_ev_pos_2020 @data = '2020';

--Questão 6

create procedure sp_emp_jan_2023
	@emp_data date 
as
begin
	select nome, emp_data
	from USUARIO
	join EMPRESTIMO
	on USUARIO.id = EMPRESTIMO.id
	where emp_data = @emp_data;
end;
exec sp_emp_jan_2023 @emp_data = month (emp_data) = '01' and year (emp_data) = '2023';

--Questão 7

create procedure sp_buscar_python
	@titulo nvarchar(100)
as 
begin
	select *
	from LIVRO
	join TECNOLOGIA
	on LIVRO.numero_registro = TECNOLOGIA.numero_registro
	where titulo  like '%'+@titulo+'%'
end

exec sp_buscar_python @titulo  = 'python';

--Questão 8

create procedure sp_listar_livro
	@cnpj nvarchar(14)
as
begin
	select titulo
	from PERIODICO
	join PERIODICO_BIBLIOTECA
	on PERIODICO.numero_registro = PERIODICO_BIBLIOTECA.numero_registro
	where cnpj = @cnpj;
end
exec sp_listar_livro @cnpj = '12345678000123';

--Questão 9

create procedure sp_not_ti
as
begin
	select *
	from FUNCIONARIO
	where matricula not like 'T%'
end
exec sp_not_ti;

--Questão 10
create procedure sp_usuario
	@id varchar(20)
as
begin
	select titulo, autor
	from LIVRO
	join EMPRESTIMO
	on LIVRO.numero_registro = EMPRESTIMO.numero_registro
	where id = @id
end
exec sp_usuario @id = 'U0001'

--Questão 11

create procedure sp_palestra
	@custo decimal(6,2)
as
begin
	select *
	from EVENTO
	join PALESTRA
	on EVENTO.id_evento = PALESTRA.id_evento
	where custo < @custo
end
drop procedure sp_palestra
exec sp_palestra @custo = 100

--Questão 12

create procedure sp_ciencia_pos_2010
	@ano_publicacao nvarchar(30)
as
begin
	select titulo
	from LIVRO
	join CIENCIA
	on LIVRO.numero_registro = CIENCIA.numero_registro
	where ano_publicacao > @ano_publicacao
end
exec sp_ciencia_pos_2010 @ano_publicacao = '2010'

--Questão 13

create procedure sp_maria
	@nome nvarchar(50)
as
begin
	select funcionario.nome
	from FUNCIONARIO
	join ATENDENTE
	on FUNCIONARIO.matricula = ATENDENTE.matricula
	where funcionario.nome = @nome
end
exec sp_maria @nome = 'maria'

--Questão 14

create procedure sp_emp_cinco
as
begin
	select livro.titulo
	as emprestimos
	from LIVRO
	join EMPRESTIMO
	on LIVRO.numero_registro = EMPRESTIMO.numero_registro
	where(
	select count(*) from EMPRESTIMO
	where LIVRO.numero_registro = EMPRESTIMO.numero_registro)
	>5;
end
drop procedure sp_emp_cinco
exec sp_emp_cinco

--Questão 15

create procedure sp_user_tec
as
begin
	select nome, titulo
	from USUARIO
	join EMPRESTIMO
	on USUARIO.id = EMPRESTIMO.id
	join LIVRO
	on EMPRESTIMO.numero_registro = LIVRO.numero_registro
	join TECNOLOGIA
	on LIVRO.numero_registro = TECNOLOGIA.numero_registro
	where TECNOLOGIA.numero_registro = EMPRESTIMO.numero_registro
	order by usuario.id
end
exec sp_user_tec

--VIEW

--Questão 1	

create view vwLivros
as
	select * from LIVRO;
	
		select * from vwLivros;

--Questão 2

create view vwFuncionarioGerente
as
	select funcionario.*
	from FUNCIONARIO
	join GERENTE
	on GERENTE.matricula = FUNCIONARIO.matricula;

		select * from vwFuncionarioGerente

--Questão 3

create view vwEventoData
as
	select top 10 evento.*
	from EVENTO
	order by data

		select * from vwEventoData
--Questão 4

create view vwLivrosCat
as
	select livro.*
	from LIVRO
	join TECNOLOGIA
	on TECNOLOGIA.numero_registro = LIVRO.numero_registro
	join SOCIOLOGIA
	on SOCIOLOGIA.numero_registro = LIVRO.numero_registro
	join CIENCIA
	on CIENCIA.numero_registro = LIVRO.numero_registro
	--drop view vwLivrosCat
	select * from vwLivrosCat

--Questão 5
	
	

		
