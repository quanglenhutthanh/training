--Lấy danh sách các sản phẩm có giá bán trong 10 đến 20
SELECT *
FROM [dbo].[Products]3
WHERE [UnitPrice] BETWEEN 10 AND 20;

--Lấy danh sách các đơn đặt hàng được đặt trong khoảng thời gian từ ngày 1996-07-01 đến ngày 1996-07-31
SELECT *
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';

--tính tổng tiền vận chuyển (Freight) các đơn hàng được đặt trong khoảng từ '1996-07-01' đến '1996-07-31'
SELECT SUM([Freight]) AS [TotalJulyFreight]
FROM [dbo].[Orders]
WHERE [OrderDate] BETWEEN '1996-07-01' AND '1996-07-31';

-- Lấy ds các đơn hàng có ngày từ 1/1/1997 đến 31/12/1997 và đc vận chuyển bằng đường thủy (ShipVia=3)
SELECT *
FROM [dbo].[Orders]
WHERE [ShipVia] = 3 AND [OrderDate] BETWEEN '1997-01-01' AND '1997-12-31';