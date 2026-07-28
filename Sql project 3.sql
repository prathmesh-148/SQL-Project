
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
insert into accounts(AccountID, AccountType, Balance, CustomerID) value(106, "paid", 60000, 6); 
show tables;
desc customres;
desc accounts;
desc branches;
insert into branches(branches, branchesname, branchesAddress, branchesphone)
value (1001, "Dader", "mumbai", 9854756321),(1002, "kotak", "thane", 9542147896),
(1003, "vasi", "navi mumbai", 9854672159);

select * from accounts;
#to find the unique account type
select distinct (AccountType) from accounts;
#group by 
select min(balance), accountType from accounts group by accountType;
select max(balance), accountType from accounts group by accountType;
select sum(balance), accountType from accounts group by accountType;
select count(balance), accountType from accounts group by accountType;
select avg(balance), accountType from accounts group by accountType;
select min(balance) as minimum_account, max(balance), sum(balance), count(balance), avg(balance),accountType
from account group by accountType;

select * from customers;
select * from customers where email is Null;
select * from customers where lastname is null;
select * from customers where email is not null;

select * from customers;
select * from customers where email is null;
select * from customers where lastname is null;
select * from customers where firstname  is null;
insert into loans (loanID, loanamount, StartData, EndDate)
value (20, 40000, "2025-07-23", "2028-07-20");
insert into loans (loanID, loanamount, StartData, EndDate)
value (21, 50000, "2024-07-23", "2027-07-20");

select * from loans where StartDate>"2024-06-20";
select max(interstRate) from loans;
select interestrate from loans order by interstRate desc limit 1;
#cases

select * from Customers;
SELECT AccountID, Balance,
RANK() OVER (ORDER BY Balance DESC) AS Rank_No
FROM Accounts;

select AccountId, Balance, dense_rank() over 
(order by balance desc) from accounts;
update Accounts set  Balance= 70000 where AccountID=104;
select AccountID, Balance, AccountType, rank() over (partition by AccountType
 order by Balance desc) typewise_ranking from accounts;
 select accountID, Balance, accountType, dense_rank() 
 over (partition by accountType order by Balance desc) typewise_ranking from accounts;
 select AccountID, Balance, AccountType, percent_rank() over
 (partition by AccountType order by Balance desc)typewise_ranking from accounts;

# lead and lag without partition
select AccountId, Balance, lead(Balance) over
 (order by  Balance Desc) as lead_balance from accounts;
 select AccountId, Balance, lag(Balance) over
 (order by  Balance Desc) as lead_balance from accounts;
 
 select AccountID, AccountType, Balance from accounts where AccountType= "Savings" or 
AccountType= "Current";
select * from Accounts;
select AccountID, AccountType, Balance from accounts where AccountType 
in ("Savings", "Current");

select LoanID, LoanAmount, rank() over
 (order by LoanAmount desc) from Loans;
 #with partition Loans table Windows function
select LoanId, LoanAmount, InterestRate,
 rank() over (order by LoanAmount desc) as type_wise_ranking
 from Loans;
 select LoanId, LoanAmount, InterestRate, percent_rank()
 over (order by LoanAmount desc)
as type_wise_ranking from Loans;
 select LoanID, LoanAmount, lead(LoanAmount) over (order by LoanAmount desc)
 as lead_LoanAmount from Loans;
select LoanID, LoanAmount, lag(LoanAmount) over (order by LoanAmount
 desc) as lead_LoanAmount from Loans;
 
 #having Clause
 select min(Balance), AccountType from accounts
 group by AccountType;
select min(Balance), AccountType from accounts group by 
AccountType order by min(Balance);
select min(Balance), AccountType from Accounts group by AccountType
having (min(Balance)>9000) order by min(Balance);
select AccountType from accounts group by AccountType;
select distinct AccountType from accounts;
select now();
select current_date();
select sysdate();
select * from Transactions;
insert into Transaction( TransactionID, TransactionDate, Amount, TransactionType)
values( 1, "2024-08-03",1000000.20,"Cash");
insert into Transaction( TransactionID, TransactionDate, Amount, TransactionType)
values( 2, "2024-12-18",13000000.32,"UPI"), (3, "2022-05-02",2500000.56, "Card"),
(4 , "2023-01-13",2660000.67, "Cash"), (5, "2022-04-17", 50000000.82, "Card"),
(6, "2020-03-12", 7800000, "UPI");
select * from Transaction;

#inbutilt function in SQL
select now();
select * from Transaction;
select year(transactionDate) as year_of_creation from Transaction;
select mounth(transactionDate) as month_of_creation from Transaction;
select day(transactionDate) as day_of_creation from Transaction;
select now();
select current_date();
select sysdate();
select current_timestamp();
select datediff(now(), transactionDate) as total_Days
from transaction order by tatal_Days limit 1;

select * from loans;
select datediff(EndDate, StartData) as duration_loan from loans;
select date_add(now(), interval 6 month);
select date_add(now(), interval 6 day);
select transactionID,date_add(accountcreation_Date), interval 6 month)
as lockinperiod from transaction;
select greatest(startData, EndDate) from loans;
select greatest("2026-07-16", "2026-08-16", "2025-08-17") as the_greatest_value from transaction;
select greatest(450,345,234,567) from accounts limit 1;

#stringfunction
select upper(firstname), lower(lastname),
lower(concat(firstname," ",lastname)) as full_name from customers;
select length(firstname) from customers;
select left(firstname, 2), right(firstname,2) from customers;
#mathfunction
select 3+5, 3-5, 5*2, 3/4, 7%5;
select * from accounts;
update accounts set Balance= Balance-1000 where accountID-101;
set sql_safe_updates=0;
select round(207.34, 1), floor(234.23);
select ceil(207,54), floor(234.53);
select truncate(207.544,2);
select round(20.54,1), truncate(20.54,1);
select abs(-207), abs(207);
select mod(27, 7), 24%5;
select power(5,6);
select exp(5);
select * from customers;
select * from accounts;
#joins 
select c.customerid, c.firstname, a.balance, a.accountID from customers c
inner join accounts a
on c.customerid = a.customerId;
select c.customerid, c.firstname, a.balance, a.accountID from customers c
left join accounts a
on c.customerid = a.customerId;
select c.customerid, c.firstname, a.balance, a.accountID from customers c
right join accounts a
on c.customerid = a.customerId;
alter table transaction add column accountID int;
alter table transaction rename column accountID to customerid;
update transaction set customerid=1 where transactionID=1;
set sql_safe_updates=0;
select * from transaction;
select * from customers;
insert into customers values (7, "visall", "pothem", "visall@ABCgmail.com", "9856471235", "2026-07-02");
select c.customerid, c.firstname, t.Amount, t.customerid from customers c
inner join transaction t on c.customerid = t.customerid where c.customerid=1;

select c.customerid, c.firstname, c.lastname, t.transactionDate,
t.Amount from customers c join transaction t
on c.customerid =t.customerid where t.customerid=2;

#cross join
select c.customerid, c.firstname, c.lastname, t.transactionDate,
t.Amount from customers c join transaction t
on c.customerid =t.customerid where t.customerid;
select * from transaction;

select c.customerid, sum(t.amount) from customers c
inner join transaction t on c.customerid= t.customerid
group by c.customerid;

select max(Balance), accountID, accountType, customerId, AccountType from Accounts group by AccountType
having (max(Balance)>30000) order by min(Balance);
select * from accounts;

#SUBQUERY
select * from accounts having
balance = (select max(balance) from accounts);
select max(balance) from accounts;

select * from accounts having
balance > (select avg(Balance) from accounts);

select * from transaction having
Amount > (select avg(Amount) from transaction);

select c.*, a.balance from
customers c inner join accounts a
on c.customerid = a .customerid
where balance >(select max(balance) from accounts);
#stop 2 balance
create view top_3 as
select accountID, balance from accounts order by balance desc limit 5;
select * from top_3 limit 5;

create view top_5 as 
select accountID, balance from accounts order by balance desc limit 6;
select * from top_5 limit 6;

create view top_2 as
select customerid, firstname  from customers order by firstname desc limit 4;
select transactionID, Amount from transaction order by Amount desc limit 4;

select * from top_2 limit 4;
CREATE VIEW top_5 AS
SELECT c.customerid, c.firstname, t.transactionID, t.Amount
FROM customers c JOIN transaction t
ON c.customerid = t.customerid
ORDER BY t.Amount DESC
LIMIT 4;
select * from top_2;
create index idx_firstname on customers(Customerid);
describe customers;
select ifnull(email, "not available") from customers;
select if(year(now())=2026 , "current year", "previous year");
select Balance,if(Balance>10000, "maintained", "not Maintained") from accounts;
select accountID, balance, row_number() over (order by balance)
from accounts;
select accountID, balance, sum(balance) over (order by balance)
from accounts;
select loanID, loanamount, row_number() over (order by loanamount)
from loans;
select loanID, loanamount, sum(loanamount) over (order by loanamount)
from loans;
select accountID, balance, accountType, row_number() over (partition by
accountType order by balance desc)
from accounts;

select * from transaction;
select customer.firstname, customer. customerid, transaction.amount
from customers join transaction
on customer.customerid = transaction.customerid
where transaction.amount is null;

select customer.customerid, customer.firstname, accounts.balance, transactions.amount, transactionid
from customer join transactions
on customr.customerid = transaction.customerid
join accounts
on customer.customerid = accounts.customerid
where accounts.balance>30000









