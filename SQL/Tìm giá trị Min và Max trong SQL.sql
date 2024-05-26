-- tìm giá thấp nhất của các sản phẩm trong bảng Products
 SELECT MIN([UnitPrice]) AS [MinPrice]
 FROM DBO.Products;

 -- lấy ra ngày đặt hàng gần nhất từ bảng "Orders"
 SELECT MAX([OrderDate]) AS [LatestDate]
 FROM DBO.Orders;

 -- tìm số lượng hàng trong kho (UnitsInStock) lớn nhất
 SELECT MAX([UnitsInStock]) AS [MaxUnitsInStock]
 FROM dbo.Products;

 -- cho biết tuổi đời nhân viên lớn nhất công ty 
 -- ngày sinh càng nhỏ càng lớn tuổi
 SELECT MIN([BirthDate]) AS [OldestEmployee]
 FROM DBO.Employees;