/* Write SQL queries to answer the questions */

/* 1- Get the names and the quantities in stock for each product */

SELECT productname, unitsinstock 
    FROM products 
    LIMIT 10;

/* 2- Get a list of current products (Product ID and name) */

SELECT productid, productname 
    FROM products;

/* 3- Get a list of the most and least expensive products (name and unit price) */

SELECT * FROM products
	ORDER BY unitprice DESC;

/* 4- Get products that cost less than $20 */

SELECT productname, unitPrice
    FROM products
    WHERE unitprice <20
    ORDER BY unitprice DESC;

/* 5- Get products that cost between $15 and $25 */

SELECT * FROM products
	WHERE 15 < unitprice AND unitprice < 25;

/* 6- Find the ten most expensive products */

SELECT * FROM products
	ORDER BY unitprice DESC
    LIMIT 10;

/* 7- Get a list of discontinued products (Product ID and name) */

SELECT productid, productname FROM products 
    WHERE discontinued=1;

/* 8- Count current and discontinued products */

SELECT count(productID), discontinued 
    FROM products 
    GROUP BY discontinued;

/* 9- Find products with less units in stock than the quantity on order */

SELECT productName, unitsInStock 
    FROM products 
    WHERE unitsInStock < unitsOnOrder;

/* 10- Create views and named queries for some of these queries */

CREATE VIEW product_Name_ID AS(
    SELECT productName, productID 
    FROM products);
