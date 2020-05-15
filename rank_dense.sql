show tables;
select * from customers where customernumber = 103; 

select customerNumber,amount as incer_amt from payments
 where incer_amt between 5000 and 12000 order by incer_amt asc; 

select count(distinct (customerNumber)),count(*)
/*,paymentDate,amount,amount+5000 as incer_amt
*/ from payments; 
select * from (select amount,customernumber, rank() over (order by amount) as amt from payments) as tbl where amt = 5;
/* fifth highst*/
///////////////////////////////////*****************************************************************/
with best_sale as
(select * , dense_rank() over (partition by customerNumber order by amount) as dns from payments)
select * from best_sale where dns = 2;
/**************************************************************************/

select * from (select * , dense_rank() over (partition by customerNumber order by amount) as dns from payments) tbl where dns = 4;
/**************************************************************************/

select customernumber from (select *, row_number() over ( partition by customernumber) rnk from payments) as tbl where rnk > 1;

/********************************************************************************************************/

select customernumber,amount, decode( customernumber,103,amount*2) rr from payments;
/****************************************************/

select * from payments a1 inner join payments a2 on a1.customernumber = a2.customernumber where a1.customernumber = 103;

show tables;

select customerNumber,sum(amount) from  payments group by customernumber;

describe pay1;

create table pay1 (cnum int(11),checknum varchar(50), pdate date,amt decimal(10,2));

insert into pay1 (cnum,checknum,pdate,amt) select * from payments;

select * from pay1 order by cnum;

delete from pay1 where cnum in
(select cnum from(select cnum,row_number() over( partition by cnum order by cnum) rn from pay1) t1 where rn <> 1);

update pay1 set amt = (select amt from(select amt*2 as amt from pay1 where cnum = 103 and pdate = '2004-10-19') as t1) 
where cnum = 103 and pdate = '2004-10-19';

truncate table pay1;

select * from employees;
select * from payments;
select * from orders;
select c.customerNumber,c.customerName,p.amount,c.country,c.city, row_number() over (order by p.amount desc) 
as row_num from customers c inner join payments p on c.customernumber=p.customernumber;

create view cust_pay as 
select c.customerNumber,c.customerName,p.amount,c.country,c.city
as row_num from customers c inner join payments p on c.customernumber=p.customernumber;



select * from cust_pay;
/*Window functions*/
/*row-number()*/
select * , row_number() over (order by customernumber) as row_num from cust_pay;
select * , row_number() over (partition by country order by customernumber) as row_num from cust_pay;
/*rank()*/
select * , rank() over (order by customernumber) as rnk from cust_pay;
select * , rank() over (partition by country order by customernumber) as rnk from cust_pay;
/*dense_rank()*/
select * , dense_rank() over (order by customernumber) as dense_rnk from cust_pay;
select * , dense_rank() over (partition by country order by customernumber) as dense_rnk from cust_pay;


select * from (select *, dense_rank() over (order by amount desc) as dns_rn from cust_pay) t1 where dns_rn = 10;











select * from customers;
select * from pay











