-- Dados persistidos no database company
-- dados na table "employee"
INSERT INTO employee (fname, minit, lname, Ssn, Bdate, Address, sex, Salary, Super_ssn, Dno)
VALUES
  ('John', 'D', 'Doe', '123456789', '1980-05-10', '123 Main St', 'M', 50000.00, '987654321', 1),
  ('Jane', 'A', 'Smith', '987654321', '1975-12-15', '456 Elm St', 'F', 60000.00, '555112233', 2),
  ('Robert', 'K', 'Johnson', '555112233', '1988-07-20', '789 Oak St', 'M', 45000.00, '123456789', 1),
  ('Emily', 'R', 'Williams', '111223333', '1990-03-05', '567 Birch St', 'F', 55000.00, '987654321', 2),
  ('Michael', 'L', 'Brown', '777889999', '1985-09-30', '321 Pine St', 'M', 52000.00, '555112233', 3),
  ('Sarah', 'L', 'Johnson', '888445566', '1992-08-12', '432 Cedar St', 'F', 52000.00, '123456789', 1),
  ('William', 'T', 'Anderson', '665544332', '1986-04-25', '567 Maple St', 'M', 48000.00, '555112233', 2),
  ('Linda', 'K', 'Martinez', '332211667', '1980-11-15', '789 Birch St', 'F', 54000.00, '987654321', 2),
  ('James', 'S', 'Garcia', '773377733', '1987-07-19', '321 Oak St', 'M', 49000.00, '555112233', 3),
  ('Mary', 'C', 'Hernandez', '112233665', '1991-05-30', '654 Elm St', 'F', 50500.00, '123456789', 3),
  ('David', 'P', 'Brown', '554433221', '1989-02-20', '567 Pine St', 'M', 47000.00, '555112233', 4),
  ('Jennifer', 'M', 'Miller', '667788995', '1993-01-10', '456 Cedar St', 'F', 52500.00, '987654321', 4),
  ('Michael', 'R', 'Taylor', '778899001', '1995-09-05', '789 Oak St', 'M', 48000.00, '555112233', 5),
  ('Patricia', 'D', 'Wilson', '889900112', '1990-03-15', '321 Birch St', 'F', 55000.00, '123456789', 5),
  ('Richard', 'E', 'Moore', '332211990', '1987-11-25', '432 Elm St', 'M', 51000.00, '987654321', 1);
  
-- dados na table "department"
INSERT INTO department (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES
  ('Sales', 1, '123456789', '2022-01-15'),
  ('Marketing', 2, '987654321', '2022-02-20'),
  ('Engineering', 3, '555112233', '2022-03-30'),
  ('HR', 4, '111223333', '2022-04-10'),
  ('Finance', 5, '777889999', '2022-05-25');
  
-- dados na table "dept_locations"
INSERT INTO dept_locations (Dnumber, Dlocation)
VALUES
  (1, 'New York'),
  (2, 'Los Angeles'),
  (3, 'San Francisco'),
  (4, 'Chicago'),
  (5, 'Houston');
  
-- dados na table "project"
INSERT INTO project (Pname, Pnumber, Plocation, Dnumber)
VALUES
  ('Project A', 1, 'New York', 1),
  ('Project B', 2, 'Los Angeles', 2),
  ('Project C', 3, 'San Francisco', 3),
  ('Project D', 4, 'Chicago', 4),
  ('Project E', 5, 'Houston', 5);
  
-- dados na table "works_on"
INSERT INTO works_on (Essn, Pno, Hours)
VALUES
  ('123456789', 1, 40.0),
  ('987654321', 2, 35.5),
  ('555112233', 3, 38.5),
  ('111223333', 4, 42.0),
  ('777889999', 5, 37.0),
  ('555112233', 1, 39.0),
  ('123456789', 2, 37.5),
  ('987654321', 3, 40.5),
  ('111223333', 5, 36.0),
  ('777889999', 4, 34.0),
  ('888445566', 2, 38.0),
  ('665544332', 3, 41.0),
  ('332211667', 1, 37.0),
  ('773377733', 4, 35.5),
  ('112233665', 5, 39.5),
  ('554433221', 3, 36.0),
  ('667788995', 2, 38.0),
  ('778899001', 1, 37.5),
  ('889900112', 4, 40.0),
  ('332211990', 5, 36.5),
  ('554433221', 2, 38.0),
  ('667788995', 3, 41.0);

-- dados na table "dependent"
INSERT INTO dependent (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES
  ('123456789', 'Emily', 'F', '2001-03-10', 'Filho(a)'),
  ('987654321', 'Michael', 'M', '1999-05-15', 'Filho(a)'),
  ('555112233', 'Sophia', 'F', '2002-07-20', 'Filho(a)'),
  ('111223333', 'Jacob', 'M', '2010-09-25', 'Filho(a)'),
  ('555112233', 'Emma', 'F', '1990-01-05', 'Cônjuge'),
  ('123456789', 'William', 'M', '1994-03-20', 'Cônjuge'),
  ('987654321', 'Isabella', 'F', '1971-08-25', 'Cônjuge'),
  ('111223333', 'Liam', 'M', '1983-06-10', 'Cônjuge'),
  ('777889999', 'Ava', 'F', '1967-11-15', 'Cônjuge'),
  ('555112233', 'Noah', 'M', '2010-02-02', 'Filho(a)'),
  ('123456789', 'Sophia', 'F', '2006-01-08', 'Filho(a)'),
  ('777889999', 'Liam', 'M', '2007-12-25', 'Filho(a)'),
  ('555112233', 'Olivia', 'F', '1995-05-30', 'Cônjuge'),
  ('111223333', 'Noah', 'M', '1984-02-15', 'Cônjuge'),
  ('987654321', 'Emma', 'F', '2016-05-25', 'Filho(a)'),
  ('123456789', 'Isabella', 'F', '1990-01-18', 'Cônjuge'),
  ('987654321', 'Noah', 'M', '1985-08-30', 'Cônjuge'),
  ('111223333', 'Ava', 'F', '1988-06-05', 'Cônjuge');