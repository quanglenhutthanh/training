-- liệt kê các sp có số lượng trong kho (UnitsInStock) thuộc khoảng nhỏ hơn 50 hoặc lớn hơn 100
 SELECT *
 FROM [dbo].[Products]
 WHERE [UnitsInStock] < 50 OR [UnitsInStock] > 100;

 --Liệt kê các đơn hàng giao tới Brazil, đã bị giao muộn
 --Ngày cần giao là RequiredDate, ngày giao hàng thực tế là ShippedDate
 SELECT *
 FROM [dbo].[Orders]
 WHERE [ShipCountry] = 'Brazil' AND [RequiredDate]<[ShippedDate];

 -- Lấy ra tất cả sp có giá dưới 100$ và mã thể loại khác 1
 -- Dùng NOT
 SELECT *
 FROM [dbo].[Products] 
 WHERE NOT ([UnitPrice] >= 100 OR [CategoryID]=1);

 -- liệt kê các đơn hàng có giá vận chuyển Freight trong khoảng [50,100] đô la
 SELECT *
 FROM [dbo].[Orders]
 WHERE [Freight] >=50 AND [Freight] <=100;

-- liệt kê các sp có số lượng hàng trong kho (UnitsInStock) lớn hơn 20 và số lượng hàng trong đơn hàng (UnitsOnOrder) nhỏ hơn 20
SELECT *
FROM [dbo].[Products]
WHERE [UnitsInStock] > 20 AND [UnitsOnOrder] < 20;