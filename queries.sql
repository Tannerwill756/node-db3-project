-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select Product.Id, Product.ProductName, Category.CategoryName
from product
    INNER JOIN Category on Product.CategoryId = Category.Id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select o.Id, Shipper.CompanyName
from [Order] AS o
    INNER JOIN Shipper on o.shipvia = shipper.id
WHERE o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT orderdetail.quantity,
    product.productName
FROM orderdetail
    INNER JOIN
    product ON orderdetail.productId = product.id
WHERE orderdetail.orderId = 10251
ORDER BY product.ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


SELECT o.id AS OrderID,
    customer.companyname AS CustomerCompanyName,
    employee.lastname AS EmployeeLastName
FROM [order] AS o
    INNER JOIN
    employee ON o.EmployeeId = employee.id
    INNER JOIN
    customer ON o.customerid = customer.id;
