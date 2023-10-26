-- Criando e personalizando views e usuários
use company;

-- Views
-- Número de empregados por departamento e localidade 
create view empregados_por_departamento as
	select d.Dname as Departamento, dl.Dlocation as Localidade, count(e.Ssn) as Numero_Empregados
		from department d
		join employee e on d.Dnumber = e.Dno
		join dept_locations dl on d.Dnumber = dl.Dnumber
	group by d.Dname, dl.Dlocation;

-- Lista de departamentos e seus gerentes 
create view departamentos_gerentes as
	select d.Dname as Departamento, d.Mgr_ssn as Ssn_Gerente, e.fname as Nome_Gerente
		from department d
		left join employee e on d.Mgr_ssn = e.Ssn;

-- Projetos com maior número de empregados (ex: por ordenação desc) 
create view projetos_maior_num_empregados as
	select p.Pname as Projeto, p.Pnumber as Numero_Projeto, count(w.Essn) as Numero_Empregados
		from project p
		left join works_on w on p.Pnumber = w.Pno
	group by p.Pname, p.Pnumber
	order by Numero_Empregados desc;

-- Lista de projetos, departamentos e gerentes 
create view projetos_departamentos_gerentes as
	select p.Pname as Projeto, d.Dname as Departamento, d.Mgr_ssn as Ssn_Gerente, e.fname as Nome_Gerente
		from project p
		left join department d on p.Dnumber = d.Dnumber
		left join employee e on d.Mgr_ssn = e.Ssn;

-- Quais empregados possuem dependentes e se são gerentes
create view empregados_dependentes_gerentes as
select e.fname as NomeEmpregado, e.Ssn as SsnEmpregado, 
    case
        when d.Relationship is not null then 'Possui Dependente'
        else 'Não Possui Dependente'
    end as StatusDependente,
    case
        when e.Ssn in (select Mgr_ssn from department) then 'É Gerente'
        else 'Não é Gerente'
    end as StatusGerente
from employee e
left join dependent d on e.Ssn = d.Essn;

-- Criando usuários e dando permissões
-- Crie contas de usuário
create user 'gerente'@'localhost' identified by '1597534862';
create user 'empregado'@'localhost' identified by '123987456';

-- Conceda permissões de acesso a views
grant select on company.empregados_por_departamento to 'gerente'@'localhost';
grant select on company.departamentos_gerentes to 'gerente'@'localhost';
grant select on company.projetos_maior_num_empregados to 'gerente'@'localhost';
grant select on company.projetos_departamentos_gerentes to 'gerente'@'localhost';
grant select on company.empregados_dependentes_gerentes to 'gerente'@'localhost';

-- Conceda permissões de acesso limitadas
grant select on company.empregados_por_departamento to 'empregado'@'localhost';