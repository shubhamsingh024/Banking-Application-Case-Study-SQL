# Banking-Application-Case-Study-SQL
Banking Application – Case Study

This repository contains a complete SQL-based case study for designing and analyzing a Simple Banking Application.
It includes a relational database schema, SQL table creation scripts, sample data insertion, and 15 essential SQL problem statements with solutions.

📌 Overview

This case study models a real-world banking system with the following components:

Customers

Accounts (Checking/Savings)

Transactions (Deposit/Withdrawal)

Branches

Account-Branch Mapping

Loans

The goal is to help learners understand SQL concepts through practical, business-focused queries.

🛠 Database Schema
1. Customers

CustomerID (PK)

FirstName

LastName

Email

Phone

AccountCreationDate


2. Accounts

AccountID (PK)

CustomerID (FK)

AccountType

Balance


3. Transactions

TransactionID (PK)

AccountID (FK)

TransactionDate

Amount

TransactionType


4. Branches

BranchID (PK)

BranchName

BranchAddress

BranchPhone


5. AccountBranches

AccountID (FK)

BranchID (FK)

AssignmentDate


6. Loans

LoanID (PK)

CustomerID (FK)

LoanAmount

InterestRate

StartDate

EndDate

📂 Repository Contents
📁 banking-application
│── README.md
│── banking_application_questions_and_info.docx              
│── banking_application.sql
│── banking_application-Case Study_PPT            

📝 Case Study SQL Tasks
✔ Create Table Queries

All tables are created with appropriate constraints & foreign keys.

✔ Insert Records

At least 10 sample rows inserted per table.

✔ Query Set (Beginner → Advanced)

Select transactions above $500

Accounts with balance between 1000–5000 AND type checking

Customers whose last name starts with "J" (LIKE operator)

CASE statement → Active/Inactive accounts

Subquery to find customers above average balance

Total balance per AccountType (GROUP BY)

Customers with more than 2 accounts (HAVING)

Top 5 customers with highest loan amount

INNER JOIN between transactions & accounts

OUTER JOIN to get all accounts with/without transactions

Total accounts per branch

Branches managing >100,000 total balance (subquery + join)

Advanced JOIN → Customer + Account + Transactions

(All SQL answers are included in queries.sql.)

🎯 Purpose of this Case Study

Understand designing relational schemas

Practice SQL CRUD operations

Learn JOINs, Aggregations, Subqueries

Develop real-world data analysis skills
