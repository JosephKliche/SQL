-- Criando triggers para o BD company
use company;

-- Gatilho de Remoção (Before Delete) - Mantendo Dados de Funcionários Removidos
-- Este gatilho é acionado antes da exclusão de registros da tabela employee
-- Ele move os dados do funcionário que está sendo excluído para uma tabela de histórico
-- chamada employee_deletion_history antes de efetivamente excluí-lo. Isso mantém um registro de funcionários excluídos.

delimiter //
create trigger before_employee_delete
before delete on employee for each row
begin
    insert into employee_deletion_history (Ssn, fname, lname, deleted_at)
    values (old.Ssn, old.fname, old.lname, now());
end;
//
delimiter ;


-- Gatilho de Atualização (Before Update) - Inserção de Novos Funcionários e Atualização do Salário Base
-- Este gatilho é acionado antes da atualização de registros na tabela employee.
-- Ele verifica se o funcionário sendo atualizado já existe. Se o funcionário não existir (ou seja, é uma nova inserção),
-- ele insere um registro em uma tabela de histórico chamada new_employees.
-- Se o funcionário já existir, atualiza o salário base do funcionário antes de concluir a atualização.

delimiter //
create trigger before_employee_update
before update on employee for each row
begin
    -- Verifica se o funcionário já existe na tabela de histórico de novos funcionários
    if (select count(*) from new_employees where new_employees.Ssn = new.Ssn) = 0 then
        -- Inserção de novo funcionário na tabela de histórico de novos funcionários
        insert into new_employees (Ssn, fname, lname, Salary, created_at)
        values (new.Ssn, new.fname, new.lname, new.Salary, now());
    else
        -- Atualiza o salário base do funcionário
        set new.Salary = new.Salary;
    end if;
end;
//
delimiter ;
