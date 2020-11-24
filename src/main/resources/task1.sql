###################################1-st
#Write a SQL query for a report that provides the following information for each person in the Person table,
# regardless if there is an address for each of those people: FirstName, LastName, City, State

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