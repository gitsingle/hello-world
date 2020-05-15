show databases;
show tables;
select * from  classicmodels.employees order by employeenumber;
select * from sys.sys_config;
select * from sakila.actor;
select * from employees;

select e1.firstName,e1.lastName,e2.firstName as managername from employees e1 left join employees e2 on e1.reportsto = e2.employeenumber order by 
managername;

select * from pay1 a1 inner join pay1 a2 pay1 a3 where a1.cnum=a2.cnum and a2.cnum=a3.cnum and a1.cnum=103
	


select * from (select *, dense_rank() over (order by amount desc)rank_va from payments where rank_va = '5' order by amount desc limit 5) as mytable order by amount asc limit 1;



 select lastname,reportsto, rank() over( order by reportsto) as rank_num,row_number() over( order by reportsto )
 as row_n , dense_rank() over (order by reportsto) dense from  employees a 
 group by reportsto order by employeenumber;

select * from employees;


select employeeNumber,count(*) from employees group by reportsto;

show databases;


show tables;

select * from orders;

select * from customers;

create view cust_order as
select c.customerName,c.customerNumber,s.orderNumber from customers c inner join orders s on c.customernumber = s.customernumber;

select * from cust_order;

create index c_ibdx on customers (customernumber);

select * from customers;
select * from sys.sys_config;

show tables;

select employeeNumber,lastName
from employees order by 1 desc;





describe pay1;
describe payments;
describe orders;
select * from customers limit 5 ;

select * from orderdetails;
select * from orders a,orderdetails b where a.ordernumber = b.ordernumber;
select * from customers;
select * from payments;
select c.customerName,c.customerNumber ,count(*),sum(p.amount)
from customers c inner join payments p on c.customernumber=p.customernumber group by c.customerName,c.customerNumber;



show tables;

select * from pay1 as a1 inner join pay1 as a2 on a1.cnum=a2.cnum inner join pay1 as a3 on a1.cnum=a3.cnum;







show tables;

select * from customers;
select * from orders;

select * from customers inner join orders on  1=1;

/***************************************************************/

create table Dumy_dup as
(select  reportsto, jobtitle from employees);

with abc as
(select reportsto, jobtitle, row_number() over  (partition by reportsto, jobtitle order by jobtitle) as rowid
 from Dumy_dup1) 
 
 delete from Dumy_dup where reportsto in
 (
 select reportsto from abc where rowid <> 1)
 
 create table Dumy_dup1 as (select * from Dumy_dup)


	
DELETE FROM Dumy_dup1 
WHERE 
    reportsto IN (
    SELECT 
        reportsto 
    FROM (
        SELECT 
            reportsto,
            ROW_NUMBER() OVER (
                PARTITION BY reportsto,jobtitle
                ORDER BY reportsto,jobtitle) AS row_num
        FROM 
            Dumy_dup1
        
    ) t
    WHERE row_num > 1
);

select reportsto,jobtitle, Count(*) from Dumy_dup1 group by reportsto,jobtitle;


with abc as
(select reportsto, jobtitle, row_number() over  (partition by reportsto, jobtitle order by jobtitle) as rowid
 from Dumy_dup1) 
 

 select * from Dumy_dup1 where reportsto in
 (
 select reportsto from abc where rowid <> 1)












