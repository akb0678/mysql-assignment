create table salespeople
(Snum int primary key,Sname varchar(255) unique,city varchar(255),comm double
);

insert into salespeople values
(1001,'Peel','London',.12),
(1002,'Serres','Sanjose',.13),
(1004,'Motika','London',.11),
(1007,'Rifkin','Barcelona',.15),
(1003,'Axelrod','Newyork',.10);

select * from salespeople;

create table customers
(Cnum int primary key,Cname varchar(255),City varchar(255) not null,Snum int ,foreign key(Snum) references salespeople(Snum));

insert into customers values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

select * from customers;


create table Orders
(Onum int primary key,Amt double,Odate text,Cnum int,Snum int,
foreign key(Snum) references salespeople(Snum));

-- alter table orders add foreign key(Cnum) references customers (Cnum);  

insert into Orders values 
(3001,18.69,'3-10-1990',2008,1007),
(3003,767.19,'3-10-1990',2001,1001),
(3002,1900.10,'3-10-1990',2007,1004),
(3005,5160.45,'3-10-1990',2003,1002),
(3006,1098.16,'3-10-1990',2008,1007),
(3009,1713.23,'4-10-1990',2004,1002),
(3007,75.75,'4-10-1990',2004,1002),
(3008,4273.00,'5-10-1990',2006,1001),
(3010,1309.95,'6-10-1990',2004,1002),
(3011,9891.88,'6-10-1990',2006,1001);

select * from orders;


-- Q 1. Count the number of Salesperson whose name begin with ‘a’/’A’.

-- ans)
select count(Sname) from salespeople where Sname like 'A%';

--  Q 2.Display all the Salesperson whose all orders worth is more than Rs. 2000.

-- ans)
select s.Snum,o.Amt
from salespeople as s
left join orders as o
on s.Snum = o.snum
where amt > 2000;


--  Q 3. Count the number of Salesperson belonging to Newyork.

-- ans)
select count(city) as belonging_from_newyork from salespeople where city= 'newyork' ;


--  Q 4. Display the number of Salespeople belonging to London and belonging to Paris.

-- ans)

select count(city) as belonging_london_or_paris from salespeople where city= 'london' or 'paris';


-- Q 5. Display the number of orders taken by each Salesperson and their date of orders.

-- ans)

select s.snum,o.amt,o.odate
from salespeople as s 
left join orders as o
on s.snum=o.snum;

