-- SQL DDL Commands 

-- Create

create database if not exists sarvesh;

create table data(
    user_id int, 
    name varchar(255),
    email varchar(255),
    password varchar(255)
);

-- insert

insert into practice.data (user_id, name, email, password)
values 
(1, "sarvesh", "sarvesh@gmail.com", 1234),
(2, "sheetal", "sheetal@gmail.com", 1234),
(3, "rajesh", "rajes@gmail.com", 1234),
(4, "pratibha", "pratibha@gmail.com", 1234);

-- Truncate

truncate table data;

-- Drop

drop database sarvesh;

drop table data;

-- Constraints
-- not null

create table data(
    user_id int not null, 
    name varchar(255) not null,
    email varchar(255),
    password varchar(255)
);

insert into practice.data (user_id, name, email, password)
values 
(1, "sarvesh", "sarvesh@gmail.com", 1234),
(2, "sheetal", "sheetal@gmail.com", 1234),
(3, "rajesh", "rajes@gmail.com", 1234),
(4, "pratibha", "pratibha@gmail.com", 1234);

insert into practice.data (user_id, name, email, password)
values
(1, "sarvesh", "", "");

drop table data;

-- unique

create table data(
    user_id int not null, 
    name varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255) not null
);

insert into practice.data (user_id, name, email, password)
values 
(1, "sarvesh", "sarvesh@gmail.com", 1234),
(2, "sheetal", "sheetal@gmail.com", 1234),
(3, "rajesh", "sheetal@gmail.com", 1234),
(4, "pratibha", "pratibha@gmail.com", 1234);

drop table data;

create table data(
    user_id int not null, 
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    
    constraint data_email_unique unique (name, email)
);

drop table data;

-- primary key

create table data(
    user_id int not null, 
    name varchar(255) not null,
    email varchar(255) not null,
    password varchar(255) not null,
    
    constraint data_email_unique unique (name, email),
    constraint data_user_id_pk primary key (user_id)
);

drop table data;

-- auto increment

create table data(
    user_id int primary key auto_increment, 
    name varchar(255) not null,
    email varchar(255) not null unique,
    password varchar(255) not null
    );
    
insert into practice.data(user_id, name, email, password)
values
(null, "sheetal", "sheetal@gmail.com", 1234);

-- check

create table students(
    student_id int primary key auto_increment,
    name varchar(50) not null,
    age int,
    
    constraint students_age_check check (age>6 and age<30)
);

insert into students(student_id, name, age)
values
(null, "sarvesh", 34);

insert into students(student_id, name, age)
values
(null, "sarvesh", 28);

-- default

create table tickets(
    ticket_id int primary key,
    name varchar (50) not null,
    travel_date datetime default current_timestamp
);

insert into tickets(ticket_id, name)
values
(2, "sarvesh");

-- foreign key

create table customers(
    cid int primary key auto_increment,
    name varchar(50) not null, 
    email varchar(255) unique not null
);

create table orders(
    order_id int primary key auto_increment,
    cid int not null,
    order_date datetime default current_timestamp,
    
    constraint orders_fk foreign key (cid) references customers(cid)
);

drop table customers;

insert into customers(name, email)
values
("sarvesh", "sarvesh@gmail.com"),
("sheetal", "sheetal@gmail.com");

insert into orders(cid)
values
(1),
(2);

drop table orders;

-- cascade

create table orders(
    order_id int primary key auto_increment,
    cid int not null,
    order_date datetime default current_timestamp,
    
    constraint orders_fk foreign key (cid) references customers(cid)
    on delete cascade
    on update cascade
);

insert into orders(cid)
values
(23),
(45);

drop table orders;

-- set null

create table orders(
    order_id int primary key auto_increment,
    cid int not null,
    order_date datetime default current_timestamp,
    
    constraint orders_fk foreign key (cid) references customers(cid)
    on delete set null
    on update set null
);

-- Alter
-- add

alter table customers
add column password varchar(255) not null;

alter table customers
add column surname varchar(255)
after name;

alter table customers
add column pan_no varchar(255) after surname,
add column date_of_joining datetime default current_timestamp;

-- delete

alter table customers
drop column password;

alter table customers
drop column surname,
drop column pan_no;

-- modify

alter table customers
modify date_of_joining datetime;

-- adding constraint with alter

alter table customers 
add column age int not null;

alter table customers
add constraint customers_age_check check (age>=0 and age<30);























