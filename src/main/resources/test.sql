###################################1-st
DROP TABLE PERSON;
DROP TABLE ADDRESS;
CREATE TABLE PERSON
(
    PersonId  int not null unique,
    FirstName varchar(255),
    LastName  varchar(255)
);
CREATE table ADDRESS
(
    AdressId int not null unique,
    PersonId int not null unique,
    City     varchar(255),
    State    varchar(255)
);
TRUNCATE TABLE PERSON;
INSERT INTO PERSON (PersonId, FirstName, LastName)
values ('1', 'Wang', 'Allien');
TRUNCATE TABLE ADDRESS;
INSERT INTO ADDRESS(adressid, personid, city, state)
VALUES ('1', '2', 'New York City', 'New York');
INSERT INTO ADDRESS(AdressId, PersonId, City, State)
VALUES ('2', '1', 'New York City', 'New York');
SELECT FirstName, LastName, City, State
From PERSON
         left join ADDRESS ON PERSON.PersonId = ADDRESS.PersonId;

###################################2-nd
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
###################################3-rd
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
###################################4-th
DROP TABLE Person;
Create table If Not Exists Person
(
    Id    int,
    Email varchar(255)
);
Truncate table Person;
insert into Person (Id, Email)
values ('1', 'a@b.com');
insert into Person (Id, Email)
values ('2', 'c@d.com');
insert into Person (Id, Email)
values ('3', 'a@b.com');
SELECT DISTINCT Email
FROM Person
         left join (SELECT DISTINCT (Email) distEmail, (Id) dictId FROM Person) DistPersons
                   on Person.Email = DistPersons.distEmail
where DistPersons.dictId != Person.Id;
###################################5-th
Create table If Not Exists Customers
(
    Id   int,
    Name varchar(255)
);
Create table If Not Exists Orders
(
    Id         int,
    CustomerId int
);
Truncate table Customers;
insert into Customers (Id, Name)
values ('1', 'Joe');
insert into Customers (Id, Name)
values ('2', 'Henry');
insert into Customers (Id, Name)
values ('3', 'Sam');
insert into Customers (Id, Name)
values ('4', 'Max');
Truncate table Orders;
insert into Orders (Id, CustomerId)
values ('1', '3');
insert into Orders (Id, CustomerId)
values ('2', '1');
SELECT Customers.Name
from Customers
         LEFT join Orders on Customers.Id = Orders.CustomerId
where Orders.Id is NULL;
###################################6-th
Create table If Not Exists courses
(
    student varchar(255),
    class   varchar(255)
);
Truncate table courses;
insert into courses (student, class)
values ('A', 'Math');
insert into courses (student, class)
values ('B', 'English');
insert into courses (student, class)
values ('C', 'Math');
insert into courses (student, class)
values ('D', 'Biology');
insert into courses (student, class)
values ('E', 'Math');
insert into courses (student, class)
values ('F', 'Computer');
insert into courses (student, class)
values ('G', 'Math');
insert into courses (student, class)
values ('H', 'Math');
insert into courses (student, class)
values ('I', 'Math');
SELECT class
FROM (SELECT (courses.class) class, (count(courses.class)) countByClass from courses group by courses.class) cond
where cond.countByClass >= 5;


