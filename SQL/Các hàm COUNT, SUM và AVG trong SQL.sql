-- Đếm số lượng khách trong bảng Customers
SELECT COUNT (*) AS [NumberOfCustomers]
FROM dbo.Customers;

-- Tính tổng tiền vận chuyển (Freight) của các đơn đặt hàng
SELECT SUM([Freight]) AS [SumFreight]
FROM DBO.Orders;

-- Tính trung bình số lượng đặt hàng (Quantity) của tất cả sp trong bảng "Order Details"
SELECT AVG([Quantity]) AS [AverageQuantity]
FROM DBO.[Order Details];

-- Đếm số lượng
-- Tính tổng số hàng trong kho 
-- Tính trung bình giá của các sp có trong bảng [Product]
SELECT COUNT (*) AS [NumberOfProducts],
		SUM([UnitsInStock]) AS [TotalUnitsInStock],
		AVG([UnitPrice]) AS [AverageUnitPrice]
FROM DBO.Products;

--Đếm số lượng đơn hàng từ [Orders] với 2 cách
--Cách 1: dùng dấu *
--Cách 2: dùng mã đơn hàng
SELECT COUNT(*) AS [NumberOfOrders]
FROM DBO.Orders;

SELECT COUNT([OrderID]) AS [NumberOfOrders]
FROM DBO.Orders;

--Từ bảng [Order Details]
--Tính trung bình cột [UnitPrice]
--Tính tổng cột [Quantity]
SELECT AVG([UnitPrice]) AS [AveragePrice],
		SUM([Quantity]) AS [TotalQuantity]
FROM [dbo].[Order Details];