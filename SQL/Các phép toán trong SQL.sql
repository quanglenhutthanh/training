-- Tính số lượng sp còn lại trong kho (UnitsInStock) sau khi bán hết các sp đã đc đặt hàng
-- StockRemaining = UnitsInStock - UnitsOnOrder
SELECT [ProductID],
	[ProductName],
	[UnitsInStock],
	[UnitsOnOrder],
	([UnitsInStock]-[UnitsOnOrder]) AS [StockRemaining]
FROM DBO.Products;

-- Tính giá trị đơn hàng tất cả các sp trong bảng (OrderDetails)
-- OrderDetails = UnitPrice x Quantity
SELECT *,
	([UnitPrice])*([Quantity]) AS [OrderDetailValue]
FROM [dbo].[Order Details];

-- Tính tỷ lệ giá vận chuyển đơn đặt hàng (Freight) trung bình của các đơn hàng trong bảng (Orders) so với giá trị vận chuyển của 
-- đơn hàng cao nhất (MaxFreight)
-- FreightRatio = AVG(Freight)/MAX(Freight)
SELECT AVG([Freight])/MAX([Freight]) AS [FreightRatio]
FROM [dbo].[Orders];

-- liệt kê danh sách các sản phẩm, giá của từng sản phẩm sẽ được giảm đi 10%
-- C1: dùng phép nhân + phép chia
-- C2: chỉ dùng phép nhân
SELECT [ProductName],
	[UnitPrice],
	([UnitPrice])*0.9 AS [Discounted Product]
FROM [dbo].[Products];