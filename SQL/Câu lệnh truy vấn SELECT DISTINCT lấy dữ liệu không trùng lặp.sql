-- lấy ra tên các quốc gia (Country) khác nhau từ bảng khách hàng (Customers)
SELECT DISTINCT [Country]
FROM [dbo].[Customers];

-- lấy ra mã số bưu điện (PostalCode) khác nhau từ nhà cung cấp (Suppliers)
SELECT DISTINCT [PostalCode]
FROM [dbo].[Suppliers];

-- lấy ra họ của nhân viên (LastName) và danh hiệu lịch sự (TitleOfCourtesy) từ bảng (Employees)
SELECT DISTINCT LastName, TitleOfCourtesy
FROM DBO.Employees;

SELECT LastName, TitleOfCourtesy
FROM DBO.Employees;

-- lấy ra mã đơn vị vận chuyển (ShipVia) từ (Orders)
SELECT DISTINCT ShipVia
FROM dbo.Orders;