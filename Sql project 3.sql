show databases;
create database BankingDB; 
use bankingDB;
create database BankingDb;
create table customers(
customerid int,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
phone varchar(50), accountcreation_date date
);
Drop table customers; 

create table Accounts (
AccountID int,
accountType varchar(20),
Balance decimal(10,2)
);

create table Transaction (
transactionID INT,
transactionDate date,
Amount decimal(10,2),
TransactionType varchar(20)
);

create table branches (
branches int,
branchesName varchar(100),
branchesAddress varchar (300),
branchesPhone varchar(15)
);

create table loans (
loanID int,
loanamount decimal(10,2),
Interestrate decimal(10,2),
StartData date,
EndDate date
);
alter table customers drop dateOfBirth;

alter table accounts add primary key (accountID); 
alter table accounts add CustomerId int;
select * from accounts;
alter table accounts
add constraint fk_accounts_customers 
foreign key(CustomerId)
references customers(customerid); 
 
 select * from customers;
 insret into customers ;
drop table customers;
drop table accounts;
insert into customers(customerid, firstname, lastname, email, phone, accountcreation_date) values
(1, "Prathamesh", "Ghure", "pg@abc.com", "1234556666", "2026-07-16"),
(2, "dayasager", "mister", "daya@abc.com","1864618562", "2026-07-14"),
(3, "pravin" , "boddupally", "pravin@abc.com","5895214763", "2026-07-11");

update customers set Phone = "9856231985" where customerid= 1;
set sql_safe_updates=0;

update customers set phone = "9623487532" where customerid= 1;
update customers set phone = "9654756321" where fist_name = "Daya";

insert into customers(customerid, firstname, lastname, email, phone, accountcreation_date) values
(5, "pravin" , "boddupally", "pravin@abc.com","5895214763", "2026-07-20");

delete from customers where firstname = "pravin";

select * from customers;
truncate table customers
start transaction;
delete from customers where firstname = "pravin" ;
insert into customers(customerid, firstname, lastname, email, phone) values
(5, "pravin" , "boddupally", "pravin@abc.com","5895214763");
#DQL
select * from customers;
select * from customers where firstname ="dayasager";
select email from customers where firstname= "dayasager";
select email, phone from customers where firstname like "$1";  #endswith
select email, phone from customers where firstname like "$1"; #startswith
select * from customers order by firstname desc;
select * from customers order by accountcreation_date desc;
select * from customers;
select * from accounts;
insert into accounts(AccountID, AccountType, Balance, CustomerID) 
values (101, "savings", 10000, 1);
select * from Accounts;
insert into accounts(AccountID, AccountType, Balance, CustomerID) 
value (102, "current", 20000, 2);
insert into accounts(AccountID, AccountType, Balance, CustomerID) 
value (103, "salary", 30000, 3);
insert into accounts(AccountID, AccountType, Balance, CustomerID) 
value (104, "salary", 40000, 4);
insert into accounts(AccountID, AccountType, Balance, CustomerID) values 
(105, "paid", 50000, 5);
select * from accounts;
select * from accounts order by balance;
select * from accounts order by balance limit 2;
select * from accounts order by balance > 10000;




















