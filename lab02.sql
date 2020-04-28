-- Baze de date 2020
-- Laborator 2
-- https://ocw.cs.pub.ro/courses/bd/laboratoare/02

-- Exemplu
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

select * from departamente;

insert into angajati(id_angajat, nume, prenume, functie, id_sef, id_departament)
    values(10, 'Ionescu', 'Ionel', 'Programator', 10, 10);

insert into angajati (id_angajat, nume, prenume, functie, id_sef, id_departament)
	values(10, 'Ion', 'Ionel', 'Programator', 10, 10);

drop table departamente cascade constraints;
drop table angajati cascade constraints;
drop table grila_salariu


-- Ex1
create table tags (
	id 				number,
	tag_name		varchar2(10),
	constraint pk_tags primary key (id)
);

create table users (
	id 				number,
	username		varchar2(10),
	password		varchar2(12),
	constraint pk_users primary key (id)
);

create table comments (
	id 				number,
	article_comment	varchar2(100),
	id_article		number,
	id_user			number,
	constraint pk_comment primary key (id),
	constraint fk_comment foreign key (id_user)
	references users (id)
);

create table articles (
	id 				number,
	id_user			number,
	title			varchar2(50),
	content			varchar2(200),
	constraint pk_articles primary key (id),
	constraint fk_articles foreign key (id_user)
	references users (id)
);

create table tags_articles (
	id_article		number,
	id_tag			number,
	constraint pk_tags_articles primary key (id_article, id_tag),
	constraint fk_tags_article foreign key (id_article)
	references articles (id),
	constraint fk_tags_tags foreign key (id_tag)
	references tags (id)
);

drop table comments cascade constraints;
drop table users cascade constraints;
drop table tags cascade constraints;
drop table articles cascade constraints;
drop table tags_articles cascade constraints;

-- Ex2 
create table recipes (
	id_recipe		number,
	title 			varchar2(50),
	instructions	varchar2(100),
	constraint pk_recipes primary key (id_recipe)
);

create table link (
	id_recipe 		number,
	id_ingredient	number,
	quantity 		number,
	mu 				varchar2(2),
	constraint pk_link primary key (id_recipe, id_ingredient),
	constraint fk_link_recipes foreign key (id_recipe)
	references recipes (id_recipe)
);

create table categories (
	id_cateogry		number,
	category 		varchar2(10),
	constraint pk_categories primary key (id_cateogry)
);

create table ingredients (
	id_ingredient 	number,
	id_cateogry 	number,
	ingredient 		varchar2(100),
	constraint pk_ingredients primary key (id_ingredient)
);

drop table recipes cascade constraints;
drop table link cascade constraints;
drop table categories cascade constraints;
drop table ingredients cascade constraints;

--Ex3
create table producers (
	id_producer 	number,
	name 			varchar2(10),
	constraint pk_producers primary key (id_producer) 
);

create table car_types (
	id_type 		number,
	type 			varchar2(10),
	constraint pk_car_types primary key (id_type)
);

create table cars (
	id_car 			number,
	id_producer 	number,
	id_type			number,
	registration_no varchar2(10),
	year			number,
	constraint pk_cars primary key (id_car),
	constraint fk_cars_producers foreign key (id_producer)
	references producers (id_producer),
	constraint fk_cars_car_type foreign key (id_type)
	references car_types (id_type)
);

create table drivers (
	id_driver 	number,
	name 		varchar2(10),
	age 		number,
	constraint pk_drivers primary key (id_driver)
);


create table car_drivers (
	id_driver 	number,
	id_car 		number,
	date_c 		date default sysdate,
	constraint pk_car_drivers primary key (id_driver, id_car),
	constraint fk_cd_cars foreign key (id_car)
	references cars (id_car),
	constraint fk_cd_drivers foreign key (id_driver)
	references drivers (id_driver)
);

create table licenses (
	id_license 	number,
	type 	 	varchar2(10),
	constraint pk_licenses primary key (id_license)
);

create table licenses_drivers (
	id_driver	number,
	id_license 	number,
	date_l 		date default sysdate,
	constraint pk_licenses_drivers primary key (id_driver, id_license),
	constraint fk_ld_drivers foreign key (id_driver)
	references drivers (id_driver),
	constraint fk_ld_licenses foreign key (id_license)
	references licenses (id_license)
	);

drop table producers cascade constraints;
drop table car_types cascade constraints;
drop table cars cascade constraints;
drop table car_drivers cascade constraints;
drop table drivers cascade constraints;
drop table licenses cascade constraints;
drop table licenses_drivers cascade constraints;

--Ex4
create table flower_types (
	id_type 	number,
	type 		varchar2(10),
	constraint pk_flower_types primary key (id_type) 
);

create table flowers (
	id_flower 	number,
	name 		varchar2(10),
	price 		number(2, 2),
	color 		varchar2(10),
	quantity 	number,
	id_type 	number,
	constraint pk_flowers primary key (id_flower),
	constraint fk_f_flower_types foreign key (id_type)
	references flower_types (id_type)
);

create table buquettes_types (
	id_type		number,
	types 		varchar2(10),
	constraint pk_buquettte primary key (id_type)
);

create table buquettes (
	id_buquette number,
	name 		varchar2(10),
	id_type 	number,
	constraint pk_buquette primary	key (id_buquette),
	constraint fk_buquette_types foreign key (id_type)
	references buquettes_types (id_type)
);

create table flowers_buquette (
	id_buquette 	number,
	id_flower 		number,
	number_flower 	number,
	constraint pk_flowers_buquette primary key (id_buquette),
	constraint fk_fb_buquette foreign key (id_buquette)
	references buquettes (id_buquette),
	constraint fk_fb_flowers foreign key (id_flower)
	references flowers (id_flower)
);

drop table flower_types cascade constraints;
drop table flowers cascade constraints;
drop table buquettes_types cascade constraints;
drop table buquettes cascade constraints;
drop table flowers_buquette cascade constraints;

--Ex5
create table book_types (
	id_type		number primary key,
	type 		varchar2(10)
);

create table publishers (
	id_publisher	number primary key,
	name 			varchar2(10)
);

create table books (
	id_book 		number primary key,
	id_type			number,
	id_publisher	number,
	title 			varchar2(10),
	no_pages 		number,
	publishing_year number,
	constraint fk_book_types foreign key (id_type)
	references book_types (id_type),
	constraint fk_book_publishers foreign key (id_publisher)
	references publishers (id_publisher)
);

create table authors (
	id_author 		number primary key,
	firstname		varchar2(10),
	lastname 		varchar2(10)
); 

create table book_authors (
	id_book 	number,
	id_author 	number,
	constraint pk_books_authors primary key (id_book, id_author),
	constraint fk_ba_books foreign key (id_book)
	references books (id_book),
	constraint fk_ba_authors foreign key (id_author)
	references authors (id_author)
);

drop table book_types cascade constraints;
drop table books cascade constraints;
drop table publishers cascade constraints;
drop table book_authors cascade constraints;
drop table authors cascade constraints;

--Ex6
create table categories (
	id_cateogry 	number primary key,
	category 		varchar2(10)
);

create table bands (
	id_band 	number primary key,
	name 	 	varchar2(10)
);

create table albums (
	id_album 	number primary key,
	title 		varchar2(10),
	year 		number,
	id_band 	number,
	constraint pk_album_bands foreign key (id_band)
	references bands (id_band)
);

create table artists (
	id_artist		integer primary key,
	id_band 		integer,
	firstname 		varchar2(10),
	lastname 		varchar2(10),
	date_of_birth  	date default sysdate,
	constraint fk_artists_bands foreign key (id_band)
	references bands (id_band)
);

create table songs (
	id_song 	number primary key,
	id_cateogry number,
	id_album 	number,
	title 		varchar2(10),
	length 		number,
	content	 	varchar2(10)
);

create table composers (
	id_song 	integer,
	id_artist 	integer,
	constraint pk_composers primary key (id_song, id_artist),
	constraint fk_composers_songs foreign key (id_song)
	references songs (id_song),
	constraint fk_composers_artist foreign key (id_artist)
	references artists (id_artist)
);

drop table categories cascade constraints;
drop table songs cascade constraints;
drop table albums cascade constraints;
drop table composers cascade constraints;
drop table artists cascade constraints;
drop table bands cascade constraints;
