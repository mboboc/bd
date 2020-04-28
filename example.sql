create table DEPARTMENTS (
    deptno      number,
    name        varchar2(50) not null,
    location    varchar2(50),
    constraint pk_departments primary key (deptno)
);

create table EMPLOYEES (
    empno       number,
    name        varchar2(50) not null,
    job         varchar2(50),
    manager     number,
    hiredate    date,
    salary      number(7,2),
    commission  number(7,2),
    deptno      number,
    constraint pk_employees primary key (empno),
    constraint fk_employees_deptno foreign key (deptno)
        references DEPARTMENTS (deptno)
);

insert into departments (deptno, name, location) values
    (1, 'Finance', 'New York');
    
insert into departments (deptno, name, location) values
    (2, 'Development', 'San Jose');
    
select * from departments;

drop table departments cascade constraints;
drop table employees cascade constraints;