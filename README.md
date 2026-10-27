# ☕ Cafe Friends — Coffee Shop Management System

### A Java-Based Web Application for Coffee Shop Ordering, Table Reservations, and Administration

**Cafe Friends** is a database-driven Coffee Shop Management System developed using **Java, JSP, JDBC, MySQL, HTML, CSS, JavaScript, and Bootstrap**.

The project provides a web-based platform that allows customers to browse a coffee shop's menu, explore food and beverage items, reserve tables, manage their cart, and place orders.

It also includes a dedicated **Admin Dashboard** for managing products, categories, table reservations, customer orders, and other coffee shop operations.

The application is designed to simplify everyday coffee shop activities by integrating customer-facing services and administrative management into a single system.

**Developed by: Sakshi and Disha**

---

## 🎯 Project Objectives

The main objectives of the Coffee Shop Management System are:

- Develop a user-friendly coffee shop website.
- Provide customers with an interactive digital menu.
- Enable online table reservations.
- Implement a cart-based food and beverage ordering system.
- Manage customer registrations and login sessions.
- Provide a centralized administrative dashboard.
- Allow administrators to manage products, categories, tables, bookings, and orders.
- Integrate a MySQL database for storing and retrieving application data.
- Reduce manual operations by digitizing common coffee shop workflows.

---

## ✨ Key Features

### 👤 1. Customer Registration and Login

The application includes customer registration and authentication functionality.

Features include:

- New customer registration
- Customer login and logout
- Session-based user identification
- Validation of login credentials
- Password-related account management pages
- Storage of customer information in the MySQL database

### 🍽️ 2. Digital Menu and Product Browsing

Customers can explore the available food and beverage items through an interactive menu.

Features include:

- Display of products with images
- Product names and prices
- Menu categories and subcategories
- Coffee, beverages, desserts, and food items
- Product selection for ordering

The menu interface uses Bootstrap and custom styling to provide a visually engaging experience.

### 🛒 3. Shopping Cart Management

The application implements a cart-based ordering workflow.

Customers can:

- Select products from the menu
- Add products to their cart
- View selected items
- Update item quantities
- Remove products from the cart
- Review the total amount
- Proceed to order confirmation

The cart is integrated with the database using JDBC.

### 📅 4. Table Reservation System

Cafe Friends provides a table booking interface that allows customers to reserve tables.

The booking form captures:

- Table ID
- Reservation price
- Customer name
- Email address
- Booking date
- Start time
- End time
- Number of persons

The application also includes booking conflict handling to help prevent reservations for overlapping slots.

### 🧾 5. Order Placement and Billing

The ordering system allows customers to select food and beverage products and proceed through an order confirmation workflow.

Features include:

- Takeaway order form
- Order quantity management
- Order confirmation
- Database-backed order records
- Order history
- Billing-related pages

### 🛠️ 6. Admin Dashboard

The application provides a separate interface for administrators to manage coffee shop operations.

The dashboard displays information such as:

- Registered users
- Available products
- Table bookings
- Customer orders
- Order items
- Booking records

Administrators can access management pages through the admin sidebar.

### 📦 7. Product and Category Management

The admin module contains functionality for managing the coffee shop menu.

Features include:

- Add new products
- Update product information
- Delete products
- Manage product categories
- Manage subcategories
- Upload or update product images

### 🪑 8. Table Management

The system includes administrative pages for managing restaurant tables and table categories.

Features include:

- Add tables
- Update table information
- Remove tables
- Manage table categories
- View table-related records
- Review reservations

---

## 🛠️ Technology Stack

| Category | Technologies |
|---|---|
| Backend | Java |
| Server-Side Web Development | JavaServer Pages (JSP), Java Servlets |
| Frontend | HTML5, CSS3, JavaScript |
| UI Framework | Bootstrap |
| Database | MySQL |
| Database Connectivity | JDBC |
| Web Server | Apache Tomcat |
| Development Environment | Apache NetBeans |
| Build Tool | Apache Ant |
| Version Control | Git, GitHub |

---

## 🏗️ System Architecture

The project follows a traditional Java web application structure, with JSP pages providing server-rendered interfaces and JDBC handling database operations.

```text
                  CUSTOMER
                     |
                     v
             Web Browser
                     |
                     v
          HTML / CSS / JavaScript
                     |
                     v
             Bootstrap UI
                     |
                     v
             JSP Web Pages
                     |
          +----------+----------+
          |                     |
          v                     v
    Customer Module        Admin Module
          |                     |
          +----------+----------+
                     |
                     v
           Java / JSP / Servlets
                     |
                     v
                  JDBC
                     |
                     v
              MySQL Database
```

The database supports persistent storage of user information, products, cart entries, table bookings, orders, and associated records.

---

## ⚙️ Application Workflow

### Customer Workflow

```text
             Open Website
                   |
                   v
           Browse Home Page
                   |
                   v
             Login / Register
                   |
          +--------+--------+
          |                 |
          v                 v
       View Menu        View Tables
          |                 |
          v                 v
     Select Products     Select Table
          |                 |
          v                 v
       Add to Cart      Enter Booking
          |                 Details
          v                 |
    Review Cart             v
          |           Submit Reservation
          v
     Confirm Order
          |
          v
      Order Details
          |
          v
      Order History
```

### Admin Workflow

```text
             Admin Login
                  |
                  v
            Admin Dashboard
                  |
       +----------+----------+
       |          |          |
       v          v          v
    Product     Table      Order
   Management Management Management
       |          |          |
       v          v          v
   Categories  Reservations  Orders
       |          |          |
       +----------+----------+
                  |
                  v
             MySQL Database
```

---

## 📁 Project Structure

```text
Coffee-shop-project/
|
|-- src/
|   |-- java/
|   |   |-- TableAdd.java
|   |   |-- demo2.java
|   |   |-- tblupimg.java
|   |   |-- uploadimg1.java
|   |
|   |-- conf/
|       |-- MANIFEST.MF
|
|-- web/
|   |-- uhome.jsp
|   |-- uhome2.jsp
|   |-- ulogin.jsp
|   |-- userlogcheck.jsp
|   |-- admin_login.jsp
|   |-- admhome.jsp
|   |
|   |-- cardDis.jsp
|   |-- addtocart.jsp
|   |-- cartdisplay.jsp
|   |-- confirmOrder.jsp
|   |-- showOrder.jsp
|   |-- bill.jsp
|   |
|   |-- tblDisplay.jsp
|   |-- bookdemo.jsp
|   |-- bkcode.jsp
|   |-- admbooking.jsp
|   |
|   |-- admorders.jsp
|   |-- cattegoryMng.jsp
|   |-- SubCategoryMng.jsp
|   |-- tablemg.jsp
|   |
|   |-- Common_Bootsrap/
|   |-- cofimg/
|   |-- image/
|   |-- WEB-INF/
|   |-- META-INF/
|
|-- nbproject/
|-- build.xml
|-- .gitignore
|-- README.md
```

The repository also contains additional JSP pages, application assets, and project configuration files.

---

## 🗄️ Database Design

The application uses a MySQL database named:

`coffeeshop`

The source code references several database tables.

| Table | Purpose |
|---|---|
| `user` | Stores customer information |
| `product` | Stores food and beverage product details |
| `o_cart` | Stores customer cart items |
| `orders` | Stores customer orders |
| `order_items` | Stores individual order items |
| `bookings` | Stores table reservation information |
| `booking_items` | Stores booking-related records |

Additional tables are referenced by the management modules.

**Note:** The repository does not provide a complete, verified database schema or SQL export. The database and its required tables must be configured before running the entire application.

---

## 🚀 Installation and Setup

### Prerequisites

Install the following software:

- Java Development Kit (JDK), compatible with the project's Java 8 configuration
- Apache NetBeans IDE
- Apache Tomcat
- MySQL Server
- MySQL Connector/J
- Git

### Step 1: Clone the Repository

```bash
git clone https://github.com/SakshiCC/Coffee-shop-project.git
```

Navigate to the project directory:

```bash
cd Coffee-shop-project
```

### Step 2: Open the Project in NetBeans

1. Open Apache NetBeans IDE.
2. Select **File → Open Project**.
3. Choose the cloned `Coffee-shop-project` directory.
4. Allow NetBeans to load the Ant project configuration.
5. Configure a compatible Apache Tomcat server.

### Step 3: Configure MySQL

Start the MySQL server and create the application database:

```sql
CREATE DATABASE coffeeshop;
```

Create or import the required database tables according to the application's database queries.

The repository does not currently include a complete SQL setup script, so the schema must be prepared separately.

### Step 4: Configure JDBC

Ensure MySQL Connector/J is available in the project's libraries or application runtime.

The existing JSP code connects to MySQL using JDBC.

Example connection format:

```java
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/coffeeshop",
    "YOUR_DB_USERNAME",
    "YOUR_DB_PASSWORD"
);
```

Replace the placeholders with your local database credentials.

**Security note:** Some existing project files contain hardcoded database credentials. These should be removed from source code and replaced with secure configuration before deploying or sharing the application.

### Step 5: Build and Run

1. Select the project in NetBeans.
2. Resolve any missing project libraries.
3. Configure the Tomcat server.
4. Build the project.
5. Run the application.

Once deployed, the application can be accessed through the Tomcat server.

A typical local deployment URL is:

```text
http://localhost:8080/Coffee_Shop/
```

You can access the customer homepage through:

```text
http://localhost:8080/Coffee_Shop/uhome.jsp
```

The exact URL depends on the configured Tomcat deployment context.

---

## 🖥️ Application Modules

### Customer Module

The customer module includes:

- Home page
- Registration and login
- Menu browsing
- Product selection
- Cart management
- Takeaway ordering
- Table booking
- Order history
- Logout

### Administrator Module

The administrator module includes:

- Admin login
- Dashboard
- Product management
- Product categories
- Subcategories
- Table management
- Table categories
- Booking management
- Order management

---

## 📸 Application Preview

The repository contains coffee shop graphics and images used by the interface.

Examples of available product images include coffee beverages, cakes, desserts, and snacks.

Additional screenshots of the home page, menu, reservation form, cart, and admin dashboard can be added here to demonstrate the application's functionality.

---

## 💡 Concepts Implemented

This project demonstrates practical application of several software development concepts:

**Java Web Development**

- JavaServer Pages
- Java Servlets
- HTTP request and response handling
- Session management
- Server-side processing

**Database Management**

- MySQL database connectivity
- JDBC
- SQL queries
- Prepared statements
- Database-backed CRUD operations

**Frontend Development**

- HTML page structure
- CSS styling
- JavaScript interactions
- Bootstrap-based layouts
- Forms and input validation

**Application Development**

- Customer authentication workflows
- Shopping cart functionality
- Table reservations
- Order processing
- Administrative management

---

## ⚠️ Current Limitations

- The application requires manual database setup.
- A complete SQL schema is not included in the repository.
- Some database credentials are hardcoded in existing source files.
- Password handling and authentication security require improvement before production use.
- The application has not been verified for production deployment.
- Additional responsive-design and accessibility improvements may be required.
- Automated testing and deployment workflows are not currently documented.

---

## 🔮 Future Enhancements

- Integrate secure password hashing and stronger authentication.
- Replace hardcoded database credentials with environment-based configuration.
- Add online payment gateway integration.
- Implement real-time table availability updates.
- Introduce email notifications for orders and reservations.
- Improve mobile responsiveness.
- Add advanced order tracking.
- Generate downloadable invoices.
- Implement customer feedback and rating functionality.
- Add sales reports and analytics to the admin dashboard.
- Introduce role-based access controls.
- Improve exception handling and validation.
- Add automated testing and deployment support.

---

## 👩‍💻 Project Developers

This project was collaboratively developed by:

**Sakshi**

**Disha**

The project reflects collaborative work in Java web application development, frontend interface design, database integration, and management-system functionality.

**GitHub Repository:** [Coffee Shop Project](https://github.com/SakshiCC/Coffee-shop-project)

---

## 📜 Project Purpose

Cafe Friends was developed as a software development project to demonstrate the integration of Java-based web technologies with relational database management and interactive frontend design.

It provides hands-on experience in building a database-driven web application with both customer-facing and administrative functionality.

---

## ⭐ Support

If you find this project useful, consider starring the repository on GitHub.

**☕ Cafe Friends — Making Coffee Shop Management Simpler, Smarter, and More Convenient.**

**Developed by Sakshi & Disha**
