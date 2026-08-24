# Retail Store Management — SQL Project

## Overview

This project is a **Retail Store Management Database** developed using SQL to manage and analyse data across multiple retail stores.

The database covers key business areas including **stores, staff, suppliers, purchase orders, products, inventory, customer orders, online and in-store sales, and payments**.

The project demonstrates my ability to design relational databases, establish relationships between business entities, populate datasets, and write SQL queries to generate meaningful business insights.

---

## Project Objectives

The main objectives of this project are to:

* Design a structured relational database for a retail business
* Manage multiple physical store locations
* Maintain staff and manager information
* Manage supplier and purchasing information
* Track products and their prices
* Monitor inventory across stores
* Manage online and in-store orders
* Analyse customer and sales data
* Track payments and revenue
* Generate business reports using SQL

---

## Database Structure

The database contains multiple interconnected entities representing different parts of the retail operation.

### Core Tables

| Table            | Purpose                                                     |
| ---------------- | ----------------------------------------------------------- |
| `Store`          | Stores information about retail branches and locations      |
| `Staff`          | Stores employee, role, shift and commission information     |
| `Supplier`       | Maintains supplier details and contact information          |
| `Purchase_order` | Tracks product purchases from suppliers                     |
| `Product`        | Stores product descriptions and selling prices              |
| `Inventory`      | Tracks product availability across stores                   |
| `Orders`         | Maintains customer order information                        |
| `Instore`        | Stores details of in-store purchases                        |
| `Online`         | Stores details of online purchases and delivery information |
| `Payment`        | Maintains payment and transaction information               |

---

## SQL Concepts Demonstrated

This project demonstrates practical use of:

* `CREATE TABLE`
* `INSERT`
* `SELECT`
* `JOIN`
* `INNER JOIN`
* `UNION ALL`
* `GROUP BY`
* `ORDER BY`
* Aggregate functions
* `COUNT()`
* `SUM()`
* `MIN()`
* `DISTINCT`
* `CASE`
* Common Table Expressions (`WITH`)
* Window functions
* `DENSE_RANK()`
* `PARTITION BY`
* `FOREIGN KEY`
* `PRIMARY KEY`
* `CHECK` constraints
* `UNIQUE` constraints
* `BOOLEAN` fields
* Data transformation using `TO_CHAR()`

---

## Technology

**Database:** PostgreSQL

**Language:** SQL

**Key Skills:**

* Relational Database Design
* Data Modelling
* Data Manipulation
* Data Transformation
* Query Development
* Business Analysis
* Reporting & Analytics
* Query Optimization

---

## Project Files

```text
Retail Store Management/
│
├── Insertion Script.sql
│
├── SQL script.sql
│
├── ERD.png
│
└── README.md
```

---

## Business Questions Answered

This project uses SQL to answer questions such as:

1. List of customers per city for a specific time period
2. List down all products with description and prices
3. Order record and delivery details.
4. Report of product availability and their location
5. Monthly income generated per city/location
---

## Key Takeaway

This project demonstrates how a relational database can be used to bring together **sales, inventory, purchasing, staffing, supplier, and payment data** and transform it into meaningful business information.

The focus is not only on writing SQL queries, but on using SQL to **solve practical business problems and support data-driven decision making**.

---

### Skills Demonstrated

**SQL • PostgreSQL • Database Design • Data Analysis • Data Transformation • Joins • Window Functions • Business Reporting • Relational Data Modelling**
