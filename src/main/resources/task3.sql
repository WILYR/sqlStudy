###################################3-rd
###Given the Employee table, write a SQL query that finds out employees who earn more than their managers.

drop table Employee;
Create table If Not Exists Employee
(
    Id        int,
    Name      varchar(255),
    Salary    int,
    ManagerId int
);
Truncate table Employee;
insert into Employee (Id, Name, Salary, ManagerId)
values ('1', 'Joe', '70000', '3');
insert into Employee (Id, Name, Salary, ManagerId)
values ('2', 'Henry', '80000', '4');
insert into Employee (Id, Name, Salary, ManagerId)
values ('3', 'Sam', '60000', NULL);
insert into Employee (Id, Name, Salary, ManagerId)
values ('4', 'Max', '90000', NULL);
SELECT EmpName
FROM (SELECT (Name) EmpName, (Salary) EmpSalary, ManagerId FROM Employee WHERE (ManagerId IS NOT NULL)) Empl
         left join Employee on Empl.ManagerId = Employee.Id
WHERE Empl.EmpSalary > Salary;