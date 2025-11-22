CREATE DATABASE bankingapp;
USE bankingapp;

#TABLES
#Customers
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY,
FirstName VARCHAR(100),
LastName VARCHAR(100),
Email VARCHAR(150),
Phone VARCHAR(20),
AccountCreationDate DATE
);
#Accounts
CREATE TABLE Accounts (
AccountID INT PRIMARY KEY,
CustomerID INT,
AccountType VARCHAR(50),
Balance DECIMAL(12,2),
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
#Transactions
CREATE TABLE Transactions (
TransactionID INT PRIMARY KEY,
AccountID INT,
TransactionDate DATE,
Amount DECIMAL(12,2),
TransactionType VARCHAR(50),
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
#Branches
CREATE TABLE Branches (
BranchID INT PRIMARY KEY,
BranchName VARCHAR(150),
BranchAddress VARCHAR(200),
BranchPhone VARCHAR(20)
);
#AccountBranches
CREATE TABLE AccountBranches (
AccountID INT,
BranchID INT,
AssignmentDate DATE,
FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
#Loans
CREATE TABLE Loans (
LoanID INT PRIMARY KEY,
CustomerID INT,
LoanAmount DECIMAL(12,2),
InterestRate DECIMAL(5,2),
StartDate DATE,
EndDate DATE,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

#INSERTING DATA
#customers
INSERT INTO Customers VALUES
(1,'John','Johnson','johnj@example.com','9876543201','2022-01-10'),
(2,'Emma','Jackson','emmajack@example.com','9876543202','2021-03-15'),
(3,'Liam','Smith','liams@example.com','9876543203','2020-04-20'),
(4,'Olivia','Jones','oliviaj@example.com','9876543204','2023-02-01'),
(5,'Noah','Brown','noahb@example.com','9876543205','2021-06-10'),
(6,'Ava','James','avaj@example.com','9876543206','2020-09-11'),
(7,'Sophia','Davis','sophiad@example.com','9876543207','2019-11-30'),
(8,'Mason','Johnson','masonj@example.com','9876543208','2022-12-12'),
(9,'Isabella','Taylor','isabellat@example.com','9876543209','2023-01-05'),
(10,'Lucas','Jones','lucasj@example.com','9876543210','2021-07-07');

#accounts
INSERT INTO Accounts VALUES
(101,1,'Checking',90000),
(102,1,'Savings',15000),
(103,1,'Checking',1200),
(104,2,'Checking',2500),
(105,2,'Savings',300),
(106,3,'Savings',7000),
(107,4,'Checking',1800),
(108,4,'Savings',9500),
(109,5,'Checking',400),
(110,6,'Savings',2400),
(111,7,'Checking',500),
(112,8,'Checking',1500),
(113,9,'Savings',11000),
(114,10,'Checking',700),
(115,10,'Savings',2200);

#transactions
INSERT INTO Transactions VALUES
(1,101,'2023-01-01',600,'Deposit'),
(2,102,'2023-01-03',1200,'Deposit'),
(3,103,'2023-01-04',200,'Withdrawal'),
(4,104,'2023-01-05',900,'Deposit'),
(5,106,'2023-01-06',2500,'Deposit'),
(6,107,'2023-01-07',300,'Withdrawal'),
(7,108,'2023-01-08',1500,'Deposit'),
(8,110,'2023-01-09',700,'Deposit'),
(9,112,'2023-01-10',400,'Withdrawal'),
(10,113,'2023-01-11',5000,'Deposit');


#branches
INSERT INTO Branches VALUES
(1,'City Center','City Road','999111222'),
(2,'North Zone','North Street','999111223'),
(3,'South Zone','South Road','999111224'),
(4,'East Zone','East Highway','999111225'),
(5,'West Zone','West Lane','999111226'),
(6,'Metro Branch','Metro Road','999111227'),
(7,'Uptown','Uptown Ave','999111228'),
(8,'Airport Branch','Airport Road','999111229'),
(9,'Old Town','Old Town Road','999111230'),
(10,'Riverfront','River Road','999111231');

#account branches
INSERT INTO AccountBranches VALUES
(101,1,'2023-01-02'),
(102,1,'2023-01-02'),
(103,1,'2023-01-02'),
(104,2,'2023-01-03'),
(105,2,'2023-01-03'),
(106,2,'2023-01-04'),
(107,3,'2023-01-05'),
(108,3,'2023-01-05'),
(109,4,'2023-01-06'),
(110,5,'2023-01-07'),
(111,6,'2023-01-08'),
(112,7,'2023-01-09'),
(113,8,'2023-01-10'),
(114,9,'2023-01-11'),
(115,10,'2023-01-12');

select * from accountbranches;
#loans
INSERT INTO Loans VALUES
(1,1,5000,7.0,'2022-01-01','2024-01-01'),
(2,2,15000,8.0,'2023-01-01','2026-01-01'),
(3,3,22000,7.5,'2021-05-01','2025-05-01'),
(4,4,8000,7.2,'2023-02-01','2024-02-01'),
(5,5,30000,9.1,'2020-01-01','2025-01-01'),
(6,6,12000,8.2,'2022-03-01','2024-03-01'),
(7,7,18000,7.8,'2021-04-01','2026-04-01'),
(8,8,9000,6.9,'2020-05-01','2023-05-01'),
(9,9,11000,6.8,'2023-01-01','2026-01-01'),
(10,10,25000,8.5,'2022-07-01','2027-07-01');


#Questions and Solutions
#Q1) Select transactions amount > $500
SELECT * FROM Transactions
WHERE Amount > 500;

#Q2) Accounts with Balance between 1000 and 5000 AND type Checking
SELECT * FROM Accounts
WHERE Balance BETWEEN 1000 AND 5000
AND AccountType = 'Checking';

#Q3) Customers whose LastName starts with 'J'
SELECT * FROM Customers
WHERE LastName LIKE 'J%';

#Q4) CASE – Account Status
SELECT 
AccountID,Balance,
CASE
WHEN Balance > 1000 THEN 'Active'
ELSE 'Inactive'
END AS AccountStatus
FROM Accounts;

#Q5) Customers with balance > average balance
SELECT DISTINCT CustomerID
FROM Accounts
WHERE Balance > (SELECT AVG(Balance) FROM Accounts);

#Q6) Total balance per AccountType
SELECT AccountType, SUM(Balance) AS TotalBalance
FROM Accounts
GROUP BY AccountType;

#Q7) Customers with more than 2 accounts
SELECT CustomerID, COUNT(*) AS TotalAccounts
FROM Accounts
GROUP BY CustomerID
HAVING COUNT(*) > 2;

#Q8) Top 5 highest loan amounts
SELECT * FROM Loans
ORDER BY LoanAmount DESC
LIMIT 5;

#Q9)Join Transactions with Accounts to get a list of all transactions. #Inner Join
SELECT 
Transactions.TransactionID,
Accounts.AccountID,
Transactions.TransactionDate,
Transactions.Amount
FROM Transactions
INNER JOIN Accounts
ON Transactions.AccountID = Accounts.AccountID;

#Q10) list of all Accounts and any associated Transactions. Include accounts that might not have any transactions. #outer join
SELECT 
Accounts.AccountID,
Transactions.TransactionID,
Transactions.TransactionDate,
Transactions.Amount
FROM Accounts
LEFT JOIN Transactions
ON Accounts.AccountID = Transactions.AccountID;

#Q11) the total number of accounts for each branch. Use an INNER JOIN between AccountBranches and Branches, and group by BranchID.
SELECT 
Branches.BranchID,
Branches.BranchName,
COUNT(AccountBranches.AccountID) AS TotalAccounts
FROM Branches
INNER JOIN AccountBranches
ON Branches.BranchID = AccountBranches.BranchID
GROUP BY Branches.BranchID, Branches.BranchName;

#Q12) Find all Branches that manage accounts with a total 
#balance of more than $100,000. Use a subquery in the WHERE clause to find these BranchIDs.
SELECT BranchTotals.BranchID
FROM (
    SELECT 
        AccountBranches.BranchID,
        SUM(Accounts.Balance) AS TotalBalance
    FROM AccountBranches
    JOIN Accounts 
        ON AccountBranches.AccountID = Accounts.AccountID
    GROUP BY AccountBranches.BranchID
) AS BranchTotals
WHERE BranchTotals.TotalBalance > 100000;

#Q13) list FirstName, LastName, AccountID, and TransactionDate for all transactions. 
#Use INNER JOIN and LEFT JOIN as necessary to get all required details.
SELECT 
Customers.FirstName,
Customers.LastName,
Accounts.AccountID,
Transactions.TransactionDate
FROM Customers
INNER JOIN Accounts
 ON Customers.CustomerID = Accounts.CustomerID
LEFT JOIN Transactions
 ON Accounts.AccountID = Transactions.AccountID;

