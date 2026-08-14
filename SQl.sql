create database BankingDB333;
use BankingDB333;
create table Customers (
CustomerID int primary key,
    FirstName VARCHAR(50) not null,
    LastName VARCHAR(50) not null,
    Age  int not null,
    CreationDate date not null,
    Phone_number VARCHAR(15) unique,
    Gender VARCHAR(20)
);

create table Accounts (
AccountID int primary key,
IFSCCode varchar (50) not null,
AccountType varchar (50) not null,
Balance float,
CustomerID int
);

create table Transactions (
transactionID INT primary key,
transactionMode varchar (20) not null,
transactionDate date not null,
Amount float ,
TransactionType varchar(20)
);
drop table transactions;
 
 create table Loans (
 Loan_ID int primary key,
 LoanType varchar (50),
 loanStatus varchar (50)
 );
 
 CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ManagerName VARCHAR(100),
    Phone VARCHAR(15)
);
