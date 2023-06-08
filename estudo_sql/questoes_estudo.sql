---os seguintes dados: nome do funcion�rio, nome do gerente, sal�rio do gerente e classifica��o
---salarial do gerente

select a.first_name as nome, b.first_name as gerente, b.salary as salario
from hr.employees a,hr.employees b
where a.manager_id = b.employee_id
and b.salary > 15000;

 
--. Mostre o n�mero do departamento, o nome, o n�mero de funcion�rios e o sal�rio m�dio de
---todos os departamentos juntamente com os nomes, os sal�rios e os cargos dos funcion�rios
---que trabalham em cada departamento.

 select a.department_name,a.department_id,b.job_id, count (b.employee_id), avg (b.salary)
from hr.departments a, hr.employees b
where a.department_id = b.department_id
group by a.department_name,a.department_id, b.job_id;

---16.Mostre o n�mero do departamento e o menor sal�rio do departamento com o maior
---sal�rio m�dio.

select a.department_id, min (a.salary) MENOR_SALARIO, avg (a.salary) medio
from hr.employees a
group by a.department_id
;

---.Mostre os n�meros, os nomes e os locais dos departamentos em que n�o h� vendedores
---trabalhando

Select a.department_id,A.department_name, a.location_id, A.manager_id, b.employee_id
from hr.departments a
right JOIN hr.employees b
ON a.department_id = b.department_id
WHERE B.JOB_ID = 'SA_MAN';

--- Mostre o n�mero do departamento, o nome do departamento e o n�mero de funcion�rios
---trabalhando em cada departamento que:

--a. Inclua menos de 3 funcion�rios:

select *
from(
select a.department_id
      ,a.department_name
    ,count(b.department_id) as qtd
from hr.departments a 
inner join hr.employees b
on a.department_id = b.department_id
group by a.department_id, a.department_name)
where qtd < 3;



--b. Tenha o maior n�mero de funcion�rios:

select department_id, department_name , qtd
from (
select a.department_id
      ,a.department_name
    ,count(b.department_id) as qtd
from hr.departments a 
inner join hr.employees b
on a.department_id = b.department_id
group by a.department_id, a.department_name
order by count(b.department_id) desc)
where rownum = 1;

--c. Tenha o menor n�mero de funcion�rios

select department_id, department_name , qtd
from (
select a.department_id
      ,a.department_name
    ,count(b.department_id) as qtd
from hr.departments a 
inner join hr.employees b
on a.department_id = b.department_id
group by a.department_id, a.department_name
order by count(b.department_id) asc)
where rownum = 1;



--19.Mostre o n�mero do funcion�rio, o sobrenome, o sal�rio, o n�mero do departamento e o sal�rio
--m�dio de seu departamento para todos os funcion�rios.

select a.employee_id,
a.last_name,
a.salary,
a.department_id,
avg(a.salary) OVER(PARTITION BY DEPARTMENT_ID) AS salario_medio_depto
from hr.employees a
--on a.EMPLOYEE_ID= b.EMPLOYEE_ID
--group by a.employee_id, a.last_name, a.salary,b.department_id;


--20. Mostre todos os funcion�rios admitidos no dia da semana em que foi admitido o maior n�mero
--de funcion�rios.



--21. Crie uma vis�o geral de anivers�rios com base na data de admiss�o dos funcion�rios.
--Classifique os anivers�rios em ordem crescente.

SELECT A.FIRST_NAME, to_char(A.HIRE_DATE,'DD" DE "MONTH') AS anivers�rios
FROM HR.EMPLOYEES A
ORDER BY A.HIRE_DATE;

--22. Localize o cargo que foi preenchido na primeira metade de 1990 e o mesmo cargo que foi
--preenchido durante o mesmo per�odo em 1991.


SELECT A.JOB_ID, A.START_DATE as mes
FROM HR.JOB_HISTORY A
WHERE extract (year from a.start_date) 2001;


--23.Crie uma consulta composta para produzir uma lista de funcion�rios que mostre percentuais de
--aumento, IDs de funcion�rios e aumento de sal�rio antigo e de sal�rio novo. Os funcion�rios
--dos departamentos 10, 50 e 110 recebem um aumento de 5%, os do departamento 60 recebem
--um aumento de 10%, os dos departamentos 20 e 80 recebem um aumento de 15% e os do
--departamento 90 n�o recebem aumento.



SELECT a.department_id,a.employee_id, a.salary,
 CASE a.department_id
 WHEN 10 THEN (a.salary)*1.05
 WHEN 60 THEN (a.salary)*1.10
 WHEN 20 THEN (a.salary)*1.15
 END AS aumento
 From hr.employees a
 order by a.department_id; 
 

 
 select * from hr.departments;

 

---24. Altere a sess�o para definir NLS_DATE_FORMAT como DD-MON-YYYY

ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';


---25. a. Crie consultas para exibir os deslocamentos de fuso hor�rio (TZ_OFFSET) para os seguintes
---fusos hor�rios.
--� ) Austr�lia/Sydney





--- ) Chile/Ilha da P�scoa





---b. Altere a sess�o para definir o valor do par�metro TIME_ZONE como o deslocamento de fuso
---hor�rio de Austr�lia/Sydney



---c. Exiba  para SYSDATE, CURRENT_TIMESTAMP E LOCALTIMESTAMP para
--esta sess�o
--( a sa�da pode ser diferente dependendo da data em que o comando � executado.)

select CURRENT_TIMESTAMP from dual;

select to_char (sysdate,'mm-dd-yyy hh24:MI:SS')"NOW" FROM DUAL;

---d. Altere a sess�o para definir o valor do par�metro TIME_ZONE como o deslocamento de fuso
--hor�rio de Chile/Ilha da P�scoa.

--(Observa��o: os resultados da pergunta anterior baseiam-se em uma data diferente e, em alguns casos,
--n�o corresponder�o aos resultados reais obtidos pelos alunos. Al�m disso, o deslocamento de fuso
--hor�rio dos v�rios pa�ses pode diferir, com base no hor�rio de ver�o.)


.......................................................................................................................................


26. Crie uma consulta para exibir os sobrenomes, o m�s da data de admiss�o e a data de
admiss�o dos funcion�rios admitidos no m�s de janeiro, independente do ano de admiss�o

SELECT A.LAST_NAME,A.HIRE_DATE
FROM HR.EMPLOYEES A 
WHERE extract(month from A.HIRE_DATE) = 1;

27. Crie uma consulta para exibir os seguintes itens referentes aos departamentos cujo ID seja
maior que 80:
� O sal�rio total de cada cargo em um departamento
� O sal�rio total
� O sal�rio total das cidades em que os departamentos est�o localizados
� O sal�rio total de cada cargo, independente do departamento
� O sal�rio total de cada departamento, independente da cidade
� O sal�rio total das cidades em que os departamentos est�o localizados
� O sal�rio total dos departamentos, independente dos cargos e das cidades

select 
a.salary,
a.department_id,
a.job_id,
b.location_id,
sum(a.salary) OVER(PARTITION BY a.department_id) AS salario_cargo,
sum(a.salary) OVER(PARTITION BY b.location_id) AS LOCAL,
sum (a.salary) over( partition by a.job_id) as salario_job
from hr.employees a
inner join hr.departments b
on a.department_id = b.department_id
where a.department_id > 80 
--on a.EMPLOYEE_ID= b.EMPLOYEE_ID 
--group by a.salary,b.department_id,a.job_id,b.location_id;


---28. Crie uma consulta que exiba os seguintes agrupamentos:
--� ID de departamento, ID de cargo
--� ID de cargo, ID de gerente
A consulta deve calcular os sal�rios m�ximo e m�nimo de cada um desses grupos.

select a.department_id, a.job_id, a.manager_id, max (A.SALARY), min (a.salary)
from hr.employees a
group by A.DEPARTMENT_ID,A.JOB_ID, A.MANAGER_ID;


select a.department_id, a.job_id, max(a.salary)
from hr.employees a
group by A.DEPARTMENT_ID,A.JOB_ID;

---29. Crie uma consulta para exibir os tr�s funcion�rios que ganham mais na tabela EMPLOYEES
---Exiba seus sobrenomes e sal�rios

select *
  from
(SELECT a.last_name,MAX(A.SALARY) AS SALY 
FROM HR.EMPLOYEES A
GROUP BY a.last_name
ORDER BY SALY DESC)
WHERE ROWNUM < 4;


---30- Crie uma consulta para exibir o ID e os sobrenomes dos funcion�rios que trabalham no estado
---da Calif�rnia.
---Dica: use subconsultas escalares.

select a.employee_id, a.last_name, b.location_id
from hr.employees a
inner join hr.departments b
ON a.department_id = b.department_id
inner join hr.locations c
ON b.location_id = c.location_id
where c.STATE_PROVINCE = 'California';

OR a (subconsulta)

select a.employee_id, a.last_name, b.location_id
from hr.employees a
inner join hr.departments b
on a.department_id = b.department_id
where b.location_id in (select c.location_id from hr.locations c where c.state_province = 'California');



---31. Crie uma consulta para deletar a linha job_history mais antiga de um funcion�rio
---procurando por MIN ( START_DATE) na tabela job_history do funcion�rio. Delete os
---registros somente dos funcion�rios que alteraram no m�nimo dois cargos. Se sua consulta for
---executada corretamente, voc� receber� o feedback:
--Dica: use um comando DELETE correlacionado.




select * from (
select ROW_NUMBER() OVER(PARTITION BY a.employee_id ORDER BY start_date) as row_num,
a.employee_id,
a.start_date
from hr.job_history a)
where row_num = 1;


SELECT * FROM HR.JOB_HISTORY;

SELECT MIN(A.START_DATE) AS MIN_TEST
FROM hr.job_history a;



---32. Submeta a transa��o a rollback

SELECT MIN(A.START_DATE) AS MIN_TEST
FROM hr.job_history a
ROLLBACK;


---33. Crie uma consulta para exibir os IDs dos cargos cujo sal�rio m�ximo esteja acima da metade
---do sal�rio m�ximo em toda a empresa. Use a cl�usula WITH para criar essa consulta.
---Nomeie a consulta como MAX_SAL_CALC

with banana as (
select a.department_id,A.JOB_ID, max (a.salary) AS MAX_SAL_CALC
from hr.employees a
group by a.department_id, a.job_id)
select banana.MAX_SAL_CALC from banana;

select max(y.salary)/2 as metade_do_salario_maximo
from hr.employees y;

with metade as (
select max(y.salary)/2 as metade_do_salario_maximo 
from hr.employees y
)
select x.job_id, x.salary 
from hr.employees x, metade
where x.salary > metade.metade_do_salario_maximo;


with metade as (
select y.job_id, max(y.salary)/2 as metade_do_salario_maximo, y.salary
from hr.employees y
group by y.job_id, y.salary
)
select JOB_ID, salary, metade_do_salario_maximo
from metade
where salary > metade_do_salario_maximo;

--34.)Crie uma instru��o SQL para exibir o n�mero, o sobrenome, a data inicial e o sal�rio do
--funcion�rio, mostrando:
--a.)Os subordinados diretos de de  De Haan

select a.employee_id,a.last_name,a.hire_date, a.salary
from hr.employees a
where a.last_name = 'De Haan';


-- b.)A �rvore da organiza��o sob De Haan (n�mero de funcion�rio 102)

SELECT * FROM HR.EMPLOYEES;

select * 
from hr.employees a
where a.manager_id = 103;



--35. Crie uma consulta hier�rquica para exibir o n�mero do funcion�rio, o n�mero do gerente
--e o sobrenome de todos os funcion�rios que est�o dois n�veis abaixo do funcion�rio De Haan
--(n�mero de funcion�rio 102). Tamb�m exiba o n�vel do funcion�rio.


select level as nivel, m.*
from hr.employees m
start with m.last_name = 'De Haan'
connect by prior m.employee_id = m.manager_id;


----36. Produza um relat�rio hier�rquico para exibir o n�mero do funcion�rio, o n�mero do gerente,
--a pseudocoluna LEVEL e o sobrenome do funcion�rio. Para cada linha da tabela EMPLOYEES,
--voc� deve imprimir uma estrutura em �rvore mostrando o funcion�rio, o gerente do funcion�rio,
--o gerente do gerente e assim por diante. Use recuos para a coluna NOME.

select level as nivel
               ,m.employee_id
               ,m.first_name
               ,m.last_name
               ,n.employee_id cd_gerente
               ,n.first_name  nome_gerente
               ,n.last_name   sobrenome_gerente
from hr.employees m
    ,hr.employees n
where n.employee_id = m.manager_id    
start with m.last_name = 'De Haan'
connect by prior m.employee_id = m.manager_id;




--37. Crie uma consulta para fazer o seguinte:
--Recuperar os detalhes do ID do funcion�rio, da data de admiss�o, do sal�rio e do ID do
--gerente dos funcion�rios cujo ID seja maior ou igual a 200 na tabela EMPLOYEES.

select a.employee_id,a.hire_date,a.salary,a.manager_id
from hr.employees a
where a.manager_id > 200;




--*Se o sal�rio for menor que US$ 5.000, insira os detalhes do ID e do sal�rio do
--funcion�rio na tabela SPECIAL_SAL


--*Insira os detalhes do ID do funcion�rio, da data de admiss�o e do sal�rio na tabela
--SAL_HISTORY

--*Insira os detalhes do ID do funcion�rio, do ID do gerente e do sal�rio na tabela
--MGR_HISTORY








--38.Consulte as tabelas SPECIAL_SAL, SAL_HISTOTY e MGR_HISTORY para exibir os
--registros inseridos.

--Tabela SPECIAL_SAL

select * from SPECIAL_SAL;

--Tabela SAL_HISTOTY

select * from SAL_HISTOTY;

--SAL_HISTOTY MGR_HISTORY

select * from MGR_HISTORY;







---39. Crie a tabela LOCATIONS_NAMED_INDEX com base no gr�fico de inst�ncia de tabela
--abaixo. Nomeie o �ndice da coluna PRIMARY KEY como LOCATIONS_PK_IDX.

--COLUMN Name _ Deptno _ Dname
--Primary _ Key _ Yes
--Datatype _ Number _ VARCHAR2
--Length _ 4 _ 30 

create table location_pk_id
(
Depto NUMBER(4),
Dname VARCHAR2 (30),
PRIMARY KEY (Depto)
);


---40. Consulte a tabela USER _INDEXES para exibir o INDEX_NAME da tabela
---LOCATIONS_NAMED_INDEX


SELECT * FROM LOCATIONS_NAMED_INDEX;
SELECT * FROM HR.EMPLOYEES;
SELECT * FROM HR.DEPARTMENTS;








