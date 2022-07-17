/* Create Foreign Keys To Connect Tables */

DROP TABLE order_details CASCADE;
DROP TABLE orders CASCADE;
DROP TABLE employee_territories CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE territories CASCADE;
DROP TABLE regions CASCADE;
DROP TABLE shippers CASCADE;
DROP TABLE customers CASCADE;
DROP TABLE products CASCADE;
DROP TABLE suppliers CASCADE;
DROP TABLE categories CASCADE;

CREATE TABLE IF NOT EXISTS categories (
    categoryID INT PRIMARY KEY,
    categoryName TEXT,
    description TEXT,
    picture BYTEA
);


CREATE TABLE IF NOT EXISTS customers (
    customerID VARCHAR(10),
    companyName TEXT,
    contactName TEXT,
    contactTitle TEXT,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    phone TEXT,
    fax TEXT
);



CREATE TABLE IF NOT EXISTS employee_territories (
    employeeID INT,
    territoryID INT,
    

    FOREIGN KEY(territoryID)
      REFERENCES territories(territoryID) ON DELETE CASCADE, /* FOREIGN Key - REFERENCES */

    FOREIGN KEY(employeeID)
      REFERENCES employees(employeeID) ON DELETE CASCADE  /* FOREIGN Key - REFERENCES */
);


CREATE TABLE IF NOT EXISTS employees (
    employeeID SERIAL PRIMARY KEY,
    lastName TEXT,
    firstName TEXT,
    title TEXT,
    titleOfCourtesy VARCHAR(10),
    birthDate TIMESTAMP,
    hireDate TIMESTAMP,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    homePhone TEXT,
    extension INT,
    photo BYTEA,
    notes TEXT,
    reportsTo SMALLINT,
    photoPath TEXT,

    FOREIGN KEY(reportsTo) 
        REFERENCES employees(employeeID) ON DELETE CASCADE /* FOREIGN Key - REFERENCES */
);


CREATE TABLE IF NOT EXISTS order_details (
    orderID INT,
    productID INT,
    unitPrice NUMERIC,
    quantity INT,
    discount NUMERIC

    FOREIGN KEY(productID)
      REFERENCES products(productID) ON DELETE CASCADE /* FOREIGN Key - REFERENCES */

);


CREATE TABLE IF NOT EXISTS orders (
    orderID INT,
    customerID VARCHAR(10),
    employeeID INT REFERENCES 
    orderDate TIMESTAMP,
    requiredDate TIMESTAMP,
    shippedDate TIMESTAMP NULL,
    shipVia INT,
    freight NUMERIC,
    shipName TEXT,
    shipAddress TEXT,
    shipCity TEXT,
    shipRegion TEXT,
    shipPostalCode TEXT,
    shipCountry TEXT

);


CREATE TABLE IF NOT EXISTS products (
    productID SERIAL PRIMARY KEY,
    productName TEXT,
    supplierID INT,
    categoryID INT,
    quantityPerUnit TEXT,
    unitPrice NUMERIC,
    unitsInStock INT,
    unitsOnOrder INT,
    reorderLevel INT,
    discontinued INT

    FOREIGN KEY(categoryID)
      REFERENCES categories(categoryID) ON DELETE CASCADE,         /* FOREIGN Key - REFERENCES */

    FOREIGN KEY(supplierID)
      REFERENCES suppliers(supplierID) ON DELETE CASCADE           /* FOREIGN Key - REFERENCES */

);


CREATE TABLE IF NOT EXISTS regions (
    regionID SERIAL PRIMARY KEY,
    regionDescription VARCHAR(10)
);


CREATE TABLE IF NOT EXISTS shippers (
    shipperID SERIAL PRIMARY KEY,
    companyName TEXT,
    phone TEXT
);


CREATE TABLE IF NOT EXISTS suppliers (
    supplierID SERIAL PRIMARY KEY,
    companyName TEXT,
    contactName TEXT,
    contactTitle TEXT,
    address TEXT,
    city TEXT,
    region TEXT,
    postalCode TEXT,
    country TEXT,
    phone TEXT,
    fax TEXT,
    homePage TEXT
);


CREATE TABLE IF NOT EXISTS territories (
    territoryID INT,
    territoryDescription TEXT,

    FOREIGN KEY(regionID)
      REFERENCES regions(regionID) ON DELETE CASCADE    /* FOREIGN Key - REFERENCES */
);


\copy categories FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/categories.csv' DELIMITER ',' CSV HEADER;

\copy customers FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/customers.csv' DELIMITER ',' CSV HEADER;

\copy employee_territories FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/employee_territories.csv' DELIMITER ',' CSV HEADER;

\copy employees FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/employees.csv' DELIMITER ',' CSV HEADER;

\copy order_details FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/order_details.csv' DELIMITER ',' CSV HEADER;

\copy orders FROM '/C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/orders.csv' DELIMITER ',' CSV HEADER;

\copy products FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/products.csv' DELIMITER ',' CSV HEADER;

\copy regions FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/regions.csv' DELIMITER ',' CSV HEADER;

\copy shippers FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/shippers.csv' DELIMITER ',' CSV HEADER;

\copy suppliers FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/suppliers.csv' DELIMITER ',' CSV HEADER;

\copy territories FROM 'C:\Users\hassa\OneDrive\Desktop\spiced_excercises\scikit-cilantro-student-code\week_05/data/territories.csv' DELIMITER ',' CSV HEADER;
