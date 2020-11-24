###################################2-nd
###Write a SQL query to get the second highest salary from the Employee table.
DROP table Employee;
Create table If Not Exists Employee
(
    Id     int,
    Salary int
);
Truncate table Employee;
insert into Employee (Id, Salary)
values ('1', '100');
insert into Employee (Id, Salary)
values ('2', '200');
insert into Employee (Id, Salary)
values ('3', '300');
SELECT Salary
FROM (SELECT Salary FROM Employee ORDER BY Salary DESC LIMIT 2) TOPTWO
ORDER BY Salary ASC
LIMIT 1;