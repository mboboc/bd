create table departamente (
	id_departament 				number(2) not null,
	denumire_departament 		varchar2(30),
	telefon						varchar2(10),
	constraint pk_departament primary key (id_departament),
	constraint uq_departament unique (denumire_departament)			
);

create table grila_salariu (
	grad 			number(2),
	nivel_inferior 	number,
	nivel_superior 	number,
	constraint pk_grila_salariu primary key (grad)
);

create table angajati (
	id_angajat 		number(2) not null,
	nume 			varchar2(30),
	prenume 		varchar2(30),
	functie 		varchar2(20),
	id_sef 			number(4),
	data_angajarii 	date default sysdate,
	salariu 		number (7,2) default 2000,
	comision 		number (7,2),
	id_departament 	number,
	constraint pk_angajati primary key (id_angajat),
	constraint uq_angajati unique (nume, prenume),
	constraint fk_angajati_dep foreign key (id_angajat)
		references departamente (id_departament),
	constraint fk_angajati_ang foreign key (id_sef)
		references angajati (id_angajat)
);


insert into grila_salariu values(1, 1, 1000);
insert into departamente values(10, 'Proiect Software', '3212121');
insert into departamente values(20, 'Asigurarea Calitatii', '3212122');
insert into departamente values(40, 'Resurse umane', '3212123');
insert into departamente values(30, 'Proiect Software', '3212124');

select * from departments;

insert into angajati (
	id_angajat,
	nume,
	prenume,
	functie)
	values (10, 'Ionescu', 'Ion', 'Director');

insert into angajati (
	id_angajat,
	nume,
	prenume,
	functie,
	id_sef,
	salariu,
	id_departament)
	values (12, 'Iodnescu', 'Ionel', 'Angajat', 10, 100, 10);


drop table departments cascade constraints;
drop table employees cascade constraints;
