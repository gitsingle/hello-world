show databases;
create database training;
show tables;
use training;
/***************************/
/* Creating tables*/

CREATE TABLE dept (
 DEPTNO              NUMERIC(2) NOT NULL,
 DNAME               CHAR(14),
 LOC                 CHAR(13)
);


CREATE TABLE emp (
 ID	                 NUMERIC(4) NOT NULL,
 ENAME               VARCHAR(10),
 JOB                 VARCHAR(9),
 MGR                 NUMERIC(4) ,
 HIREDATE            date,
 SAL                 NUMERIC(7,2),
 COMM                NUMERIC(7,2),
 DEPTNO              NUMERIC(2) NOT NULL
);


CREATE TABLE salgrade (
 GRADE               NUMERIC,
 LOSAL               NUMERIC,
 HISAL               NUMERIC);


-- Feeding tables with values

INSERT INTO dept(DEPTNO, DNAME, LOC)
VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO dept(DEPTNO, DNAME, LOC)
VALUES (20, 'RESEARCH', 'LONDON');
INSERT INTO dept(DEPTNO, DNAME, LOC)
VALUES (30, 'SALES', 'PARIS');
INSERT INTO dept(DEPTNO, DNAME, LOC)
VALUES (40, 'OPERATIONS', 'BERLIN');

INSERT INTO EMP VALUES (7839,'BUSH','PRESIDENT',NULL,'1981-11-17',5000,NULL,10);
INSERT INTO EMP VALUES (7698,'BLAIR','MANAGER',7839,'1981-05-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'MERKEL','MANAGER',7839,'1981-06-09',2450,NULL,10);
INSERT INTO EMP VALUES (7566,'PUTIN','MANAGER',7839,'1981-04-02',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'CHIRACK','SALESMAN',7698,'1981-09-28',1250,1400,30);
INSERT INTO EMP VALUES (7499,'BAROSSO','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES (7844,'GATES','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES (7900,'BUFFETT','CLERK',7698,'1981-12-03',950,NULL,30);
INSERT INTO EMP VALUES (7521,'WALTON','SALESMAN',7698,'1981-02-22',1250,500,30);
INSERT INTO EMP VALUES (7902,'TOOSK','ANALYST',7566,'1981-12-03',3000,NULL,20);
INSERT INTO EMP VALUES (7369,'THATCHER','CLERK',7902,'1980-12-17',800,NULL,20);
INSERT INTO EMP VALUES (7788,'CARNEGIE','ANALYST',7566,'1982-12-09',3000,NULL,20);
INSERT INTO EMP VALUES (7876,'FORD','CLERK',7788,'1983-01-12',1100,NULL,20);
INSERT INTO EMP VALUES (7934,'ELISON','CLERK',7782,'1982-01-23',1300,NULL,10);

INSERT INTO salgrade VALUES (1,700,1200);
INSERT INTO salgrade VALUES (2,1201,1400);
INSERT INTO salgrade VALUES (3,1401,2000);
INSERT INTO salgrade VALUES (4,2001,3000);
INSERT INTO salgrade VALUES (5,3001,9999);
/*******************************************/

select * from training.emp ;

select 2+2, 2*2, 5*7;
select * from emp;

select sal, comm, sal*12+comm from emp;


create table tmp1 ( name varchar(10), mark decimal (3) , subject varchar(10) );

select * from tmp1;

insert into tmp1 values ( 'sus',45,'eng');
insert into tmp1 values ( 'abc',60,'eng');
insert into tmp1 values ( 'sus',75,'math');
insert into tmp1 values ( 'abc',40,'math');

select tmp1.name,tmp1.subject,tmp1.mark from tmp1 inner join
(select subject,avg(mark) mrk from tmp1 group by subject) as t1 on t1.subject = tmp1.subject
where tmp1.mark > t1.mrk;









