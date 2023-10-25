-- criação de procedures de gestão de dados do BD

delimiter $$

create procedure ManageData(
	in action int,
    in fname varchar(15),
    in minit char,
    in lname varchar(15),
    in Ssn char(9),
    in Dnumber int)
begin
    -- Variável de controle:
    -- 1 - Inserir dados na tabela employee
    -- 2 - Atualizar dados na tabela employee
    -- 3 - Excluir dados na tabela employee
    -- 4 - Inserir dados na tabela department
    -- 5 - Atualizar dados na tabela department
    -- 6 - Excluir dados na tabela department

    case action
        when 1 then
            -- Inserir dados na tabela employee
            insert into employee (fname, minit, lname, Ssn, Dno) values (fname, minit, lname, Ssn, Dnumber);
        when 2 then
            -- Atualizar dados na tabela employee
            update employee set fname = fname, minit = minit, lname = lname, Dno = Dnumber where Ssn = Ssn;
        when 3 then
            -- Excluir dados na tabela employee
            delete from employee where Ssn = Ssn;
    else
        -- Ação desconhecida
        select 'Ação desconhecida';
    end case;
end $$

delimiter ;

show create procedure ManageData;

drop procedure ManageData;

call ManageData(1, 'George', 'M', 'Smith', '111223344', 2); -- Inserir um novo funcionário na tabela "employee".
call ManageData(2, 'Robert', 'K', 'Johnson', '555112233', 1); -- Atualizar um funcionário existente na tabela "employee".
call ManageData(3, null, null, null, '111223333', null); -- Excluir um funcionário existente na tabela "employee".