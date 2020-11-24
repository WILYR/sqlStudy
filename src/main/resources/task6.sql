###################################6-th
##Please list out all classes which have more than or equal to 5 students.
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
