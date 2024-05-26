-- Liệt kê các nhà cung cấp theo thứ tự
-- từ A -> Z
SELECT *
FROM dbo.Suppliers
ORDER BY [CompanyName] ASC; 

SELECT *
FROM dbo.Suppliers
ORDER BY [CompanyName]; 

-- Liệt kê tất cả sản phẩm theo thứ tự giá giảm dần
SELECT *
FROM dbo.Products
ORDER BY [UnitPrice] DESC; 

-- Liệt kê tất cả các nhân viên theo thứ tự
-- Họ và tên đệm A-Z
-- Ko dùng ASC|DESC
SELECT *
FROM dbo.Employees
ORDER BY [LastName], [FirstName];

-- Lấy ra 1 sp có số lượng bán cao nhất từ [Order Details]
-- Ko được dùng Max
SELECT TOP 1 *
FROM [dbo].[Order Details]
ORDER BY [Quantity] DESC;

-- Liệt kê ds các đơn đặt hàng (OrderID) trong bảng (Orders)
-- Theo thứ tự giảm dần của ngày đặt hàng (OrderDate)
SELECT [OrderID], [OrderDate]
FROM dbo.Orders
ORDER BY [OrderDate] DESC;

--Liệt kê tên, dơn giá, số lượng trong kho (UnitsInStock) của tất cả sản phẩm trong bảng (Products)
--Theo thứ tự giảm dần của (UnitsInStock)
SELECT [ProductName], [UnitPrice], [UnitsInStock]
FROM dbo.Products
ORDER BY [UnitsInStock] DESC;