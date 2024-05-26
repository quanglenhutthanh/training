-- lấy ra 5 dòng đầu tiên trong bảng Customers
SELECT TOP 5 *
FROM DBO.Customers;

-- lấy ra 30% nhân viên của công ty hiện tại
SELECT TOP 30 PERCENT *
FROM DBO.Employees;

-- lấy ra các mã khách hàng trong bảng đơn hàng
-- mã khách hàng ko trùng lặp 
-- lấy 5 dòng dữ liệu đầu tiên

SELECT DISTINCT TOP 5 CustomerID
FROM DBO.Orders;

-- lấy ra các sản phẩm có mã thể loại ko trùng
-- lấy 3 dòng đầu
SELECT DISTINCT TOP 3 CategoryID
FROM DBO.Products;