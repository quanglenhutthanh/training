-- lấy 'CompanyName' thay thế = 'Công ty'
-- 'PostalCode' = 'Mã bưu điện'
SELECT [CompanyName] AS [Công ty],
		[PostalCode] AS "Mã bưu điện",
		[City] "Thành phố"
FROM dbo.Customers;

-- đổi "LastName" = "Họ"
-- đổi "FirstName" = "Tên"
SELECT LastName AS [Họ],
		FirstName AS [Tên]
FROM DBO.Employees;

-- lấy ra 15 dòng đầu tất cả các cột bảng Orders
-- đặt bảng "Orders" = "o"
SELECT TOP 15 *
FROM dbo.Orders AS [o];

-- đổi "ProductName" = "Tên sản phẩm" 
-- "SupplierID" = "Mã nhà cung cấp"
-- "CategoryID" = "Mã thể loại"
SELECT TOP 5 [p]. ProductName AS [Tên sản phẩm],
				SupplierID AS [Mã nhà cung cấp],
				CategoryID AS [Mã thể loại]
FROM dbo.Products AS [p];