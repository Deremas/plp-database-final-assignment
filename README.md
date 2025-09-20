# E-Commerce CRUD Application

## Week 8 Final Project – E-commerce Store

This project is a **full-stack E-commerce CRUD application** built with **Node.js (Express)** and **MySQL**.  
It demonstrates how to manage Customers, Products, Orders, Categories, OrderItems, and Staff in a relational database with proper relationships and constraints.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Database Schema](#database-schema)
- [File Structure](#file-structure)
- [Environment Variables](#environment-variables)
- [Installation](#installation)
- [API Endpoints](#api-endpoints)

---

## Project Overview

The application implements a relational database for an e-commerce store with the following entities:

- **Customers**: Stores customer information.
- **Products**: Stores product details.
- **Categories**: Product categories (Many-to-Many with Products).
- **Orders**: Orders made by customers.
- **OrderItems**: Products in each order.
- **Staff**: Staff members managing the store.

All relationships, primary keys, foreign keys, and indexes are defined in the `answer.sql` file.

---

## Features

- CRUD operations for **Customers** and **Products**.
- Many-to-Many relationship between **Products** and **Categories**.
- One-to-Many relationships: **Customer → Orders**, **Order → OrderItems**.
- Automatic timestamps for created records.
- Sample data preloaded in the database for testing.

---

## Database Schema

- MySQL database: `ECommerceDB`
- Tables:

  - `Customers`
  - `Categories`
  - `Products`
  - `ProductCategories`
  - `Orders`
  - `OrderItems`
  - `Staff`

- Sample data included for quick testing.

---

## File Structure

`ecommerce-crud/
│
├─ server.js # Entry point of Express app
├─ .env # Environment variables
├─ .env.example # Example environment variables
├─ routes/
│ ├─ customers.js # CRUD routes for Customers
│ └─ products.js # CRUD routes for Products
├─ db/
│ └─ connection.js # MySQL connection setup
├─ answer.sql # Database schema and sample data
└─ package.json # Node.js dependencies`

`

## Environment Variables

Create a `.env` file in the root directory:

```env
DB_HOST=localhost or your-host-name
DB_USER=your-username
DB_PASSWORD=your-password
DB_NAME=your-database
PORT= your-post
```

## Installation

1. Clone the repository

```bash
git clone git@github.com:Deremas/plp-database-final-assignment.git
cd plp-database-final-assignment
```

2. Install dependencies

```bash
npm install
```

3. Import the database and fill your database password

```bash
mysql -u root -p < answer.sql
```

4. Set up .env file as shown above.

5. Start the Express server with:

```bash
node server.js
```

## API Endpoints

Customers

- GET /customers – Get all customers
- GET /customers/:id – Get customer by ID
- POST /customers – Create a new customer
- PUT /customers/:id – Update customer
- DELETE /customers/:id – Delete customer

Products

- GET /products – Get all products
- GET /products/:id – Get product by ID
- POST /products – Create a new product
- PUT /products/:id – Update product
- DELETE /products/:id – Delete product

(Routes for Orders, OrderItems, Categories, and Staff can be added similarly.)

---
## 👨‍💻 Developer
> **Name:** Dereje Masresha  
> **GitHub:** [Deremas](https://github.com/Deremas)  
> **LinkedIn:** [Dereje Masresha](https://www.linkedin.com/in/derejemasresha)
---
