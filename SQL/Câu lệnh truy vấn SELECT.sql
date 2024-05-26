-- Viết câu lệnh SQL lấy ra tên của tất cả sản phẩm
SELECT [ProductName]
FROM [dbo].[Products];

-- Viết câu lệnh SQL lấy ra tên sản phẩm, giá bán trên mỗi đơn vị
SELECT [ProductName], [UnitPrice], [QuantityPerUnit]
FROM [dbo].[Products];

-- Viết câu lệnh lấy ra tên công ty của khách hàng và quốc gia
SELECT [CompanyName], [Country]
FROM [dbo].[Customers];


-- Viết lệnh lấy ra tên và số điện thoại tất cả các nhà cung cấp hàng
SELECT [CompanyName], [Phone]
FROM dbo.Suppliers;

-- Viết lệnh lấy tất cả dữ liệu từ bảng Products
SELECT *
FROM [dbo].[Products];

-- lấy tất cả dữ liệu từ bảng khách hàng
SELECT *
FROM dbo.Customers;