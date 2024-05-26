-- Liệt kê tất cả các nhân viên đến từ London
SELECT *
FROM dbo.Employees
WHERE [City] = 'London';

-- Liệt kê tất cả các nhân viên đến từ London
-- Sắp xếp kết quả theo LastName từ A-Z
SELECT *
FROM dbo.Employees
WHERE [City] = 'London'
ORDER BY [LastName] ASC;

-- liệt kê các đơn hàng bị giao muộn 
-- ngày cần giao là RequiredDate, ngày giao thực tế là ShippedDate
SELECT [OrderID], [RequiredDate], [ShippedDate]
FROM dbo.Orders
WHERE [ShippedDate] > [RequiredDate];

-- đếm số đơn hàng bị giao muộn 
-- ngày cần giao là RequiredDate, ngày giao thực tế là ShippedDate
SELECT COUNT (*) AS [Number of delayed orders]
FROM dbo.Orders
WHERE [ShippedDate] > [RequiredDate];

-- Lấy ra các đơn hàng chi tiết đc giảm giá nhiều hơn 10%
-- Discount > 0.1
SELECT *
FROM [dbo].[Order Details]
WHERE [Discount] > 0.1;

-- Liệt kê các đơn hàng được gửi đến "France"
SELECT *
FROM [dbo].[Orders]
WHERE [ShipCountry] = 'France';

-- liệt kê các sp có số lượng hàng trong kho (UnitsInStock) lớn hơn 20
SELECT *
FROM [dbo].[Products]
WHERE [UnitsInStock] > 20;