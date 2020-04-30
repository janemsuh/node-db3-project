-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT Product.id, ProductName, CategoryName FROM Product
JOIN Category
ON Product.CategoryId = Category.id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, o.OrderDate, s.CompanyName FROM [Order] AS o
JOIN Shipper as s
ON o.ShipVia = s.id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT od.OrderId, p.id, p.ProductName, od.Quantity FROM Product AS p
JOIN OrderDetail as od
ON p.id = od.ProductId
WHERE od.OrderId = 10251
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id AS Order_ID, o.ShipName AS CompanyName, e.LastName AS employeeLastName FROM [Order] AS o
JOIN Employee as e
ON o.EmployeeId = e.id;