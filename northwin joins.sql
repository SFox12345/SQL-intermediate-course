
SELECT
    od.Quantity
    ,od.UnitPrice
    ,od.unitprice * od.quantity AS TotalPrice
    ,o.OrderDate
    ,c.ContactName
    ,c.CompanyName
    ,p.ProductName
    ,cat.CategoryName
FROM
    [order details] od
    LEFT JOIN orders o ON od.OrderID = o.OrderID
    LEFT JOIN Customers c ON o.CustomerID = c.CustomerID
    LEFT JOIN Products p ON od.ProductID = p.ProductID
    LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID
 