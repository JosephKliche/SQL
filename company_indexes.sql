-- Criação de índices no BD Company
-- índices para dados que possivelmente serão os mais acessados e relevantes no contexto

use company;

-- indice relacionado ao nome dos funcionários
create index idx_fname
	on employee(fname);

-- indice relacionado à relação dos dependentes com os funcionários
create index idx_dependent_relationship
	on dependent(relationship);

-- indice relacionado ao salário dos funcionários
alter table employee
	add index idx_employee_salary
		(salary);

-- Respondendo as perguntas propostas
-- Qual o departamento com maior número de pessoas? 

select Dname as Departamento, COUNT(*) as Número_de_funcionários
from department
join employee ON department.Dnumber = employee.Dno
group by Dname
order by Número_de_funcionários desc
limit 1;


-- Quais são os departamentos por cidade?

select Dname as Departamento, Dlocation as Localização
from department
join dept_locations on department.Dnumber = dept_locations.Dnumber;


-- Relação de empregados por departamento?

SELECT Dname as Department, COUNT(*) as Number_of_Employees
from department
join employee on department.Dnumber = employee.Dno
group by Dname
order by Dname;