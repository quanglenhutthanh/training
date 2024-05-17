--Tạo DATABASE
CREATE DATABASE QuanLyCuaHangSach;
USE QuanLyCuaHangSach
GO
--Bảng Thể Loại Sách
CREATE TABLE tblTheLoaiSach (
sMaLoaiSach VARCHAR(15) NOT NULL ,
sTenTheLoai NVARCHAR(50),
CONSTRAINT PK_sMaLoaiSach PRIMARY KEY (sMaLoaiSach)
)
-- Bảng tác giả
CREATE TABLE tblTacGia (
 sMaTacGia VARCHAR(15) NOT NULL ,
 sTenTacGia NVARCHAR(50) ,
 CONSTRAINT PK_sMaTacGia PRIMARY KEY (sMaTacGia)
 )
 -- Bảng Nhà Xuất Bản
CREATE TABLE tblNhaXuatBan (
sMaNXB VARCHAR(15) NOT NULL,
sTenNXB NVARCHAR(50) ,
sSDT VARCHAR(12),
sDiaChi NVARCHAR(50),
CONSTRAINT PK_sMaNXB PRIMARY KEY (sMaNXB)
)
-- Bảng Sách
 CREATE TABLE tblSach (
 sMaSach VARCHAR(15) NOT NULL ,
 sTenSach NVARCHAR(50),
 sMaNXB VARCHAR(15) NOT NULL,
 sMaTacGia VARCHAR(15) NOT NULL ,
 sMaLoaiSach VARCHAR(15) NOT NULL,
 fSoLuong FLOAT,
 fGiaBan FLOAT,
 sDonViTinh VARCHAR(5) DEFAULT ( 'VND' ),
CONSTRAINT PK_sMaSach PRIMARY KEY (sMaSach) ,
CONSTRAINT CK_SoLuong CHECK (fSoLuong >=0),
CONSTRAINT CK_GiaBan CHECK (fGiaBan >0),
CONSTRAINT FK_Sach_LoaiSach FOREIGN KEY (sMaLoaiSach)
REFERENCES tblTheLoaiSach(sMaLoaiSach),
CONSTRAINT FK_Sach_TacGia FOREIGN KEY (sMaTacGia) REFERENCES
tblTacGia(sMaTacGia),
CONSTRAINT FK_Sach_NXB FOREIGN KEY (sMaNXB) REFERENCES
tblNhaXuatBan(sMaNXB)
 )
-- Bảng Khách Hàng
CREATE TABLE tblKhachHang (
sMaKhachHang VARCHAR(15) NOT NULL,
sTenKhachHang NVARCHAR(50),
sDiaChi NVARCHAR(50),
sSDT VARCHAR(12),
CONSTRAINT PK_sMaKhachHang PRIMARY KEY (sMaKhachHang)
)
-- Bảng Nhân Viên
CREATE TABLE tblNhanVien (
sMaNhanVien VARCHAR(15) NOT NULL,
sTenNhanVien NVARCHAR(50),
sGioiTinh NVARCHAR(5),
sDiaChi NVARCHAR(50),
sSDT VARCHAR(12),
dNgaySinh DATE,
dNgayVaoLam DATE,
fLuongCoBan FLOAT,
fPhuCap FLOAT,
CONSTRAINT PK_sMaNhanVien PRIMARY KEY (sMaNhanVien),
CONSTRAINT CK_Tuoi CHECK (DATEDIFF(DAY,
dNgaySinh,dNgayVaoLam) /365 >= 18),
CONSTRAINT CK_Luong CHECK (fLuongCoBan>0),
CONSTRAINT CK_PhuCap CHECK (fPhuCap > 0),
CONSTRAINT CK_GioiTinh
CHECK ( sGioiTinh = N'nam' or sGioiTinh = N'nữ')
);

-- Bảng Chi Tiết HD Mua Hang
CREATE TABLE tblChiTietHDMuaHang(
iSoHDMH INT NOT NULL,
sMaSach VARCHAR(15) NOT NULL ,
fDonGia FLOAT,
fSoLuong FLOAT,
fGiamGia FLOAT,
sMaNhanVien VARCHAR(15) NOT NULL,
sMaKhachHang VARCHAR(15) NOT NULL,
dNgayMuaHang DATE,
CONSTRAINT PK_iSoHDMH_sMaSach PRIMARY KEY (iSoHDMH,
sMaSach),
CONSTRAINT FK_tblChiTietHDMuaHang_Sach FOREIGN KEY (sMaSach)
REFERENCES tblSach(sMaSach),
CONSTRAINT CK_DonGia CHECK (fDonGia > 0),
CONSTRAINT CK_SoLuongMua CHECK (fSoLuong > 0),
CONSTRAINT FK_HoaDonMuaHang_NhanVien FOREIGN KEY
(sMaNhanVien) REFERENCES tblNhanVien(sMaNhanVien),
CONSTRAINT FK_HoaDonMuaHang_KhachHang FOREIGN KEY
(sMaKhachHang) REFERENCES tblKhachHang(sMaKhachHang),
CONSTRAINT CK_NgayMuaHang CHECK (DATEDIFF(DAY,
dNgayMuaHang, GETDATE()) >=0)
);

-- Bảng Chi Tiết HD Nhập Hàng
 CREATE TABLE tblChiTietHDNhapHang (
iSoHDNH INT NOT NULL,
sMaSach VARCHAR(15) NOT NULL ,
fSoLuongNhap FLOAT ,
fGiaNhap FLOAT,
sMaNhanVien VARCHAR(15) NOT NULL,
dNgayNhap DATE,
CONSTRAINT PK_tblChiTietHDNhapHang PRIMARY KEY (iSoHDNH,
sMaSach),
CONSTRAINT FK_tblChiTietHDNhapHang_Sach FOREIGN KEY (sMaSach)
REFERENCES tblSach(sMaSach),
CONSTRAINT CK_GiaNhap CHECK (fGiaNhap >0),
CONSTRAINT CK_SoLuongNhap CHECK (fSoLuongNhap>0),
CONSTRAINT FK_HoaDonNhapHang_NhanVien FOREIGN KEY
(sMaNhanVien) REFERENCES tblNhanVien(sMaNhanVien),
CONSTRAINT CK_NgayNhapHang CHECK (DATEDIFF(DAY, dNgayNhap,
GETDATE()) >=0)
 );

 --2. Nhập dữ liệu
INSERT INTO tblTheLoaiSach
VALUES
('TL01',N'Truyện trinh tham'),
('TL02',N'Truyện thiếu nhi'),
('TL03',N'Truyện cổ tích'),
('TL04',N'Tiểu thuyết'),
('TL05',N'Sách tâm lý'),
('TL06',N'Sách văn học'),
('TL07',N'Sách kinh tế'),
('TL08',N'Sách chính trị'),
('TL09',N'Sách tâm lý'),
('TL10',N'Thơ ca')
INSERT INTO tblTacGia
VALUES
('TG01',N'Tô Hoài'),
('TG02',N'Vũ Trọng Phụng'),
('TG03',N'Nam Cao'),
('TG04',N'Huy Cận'),
('TG05',N'Nguyễn Nhật Ánh'),
('TG06',N'Xuân Diệu'),
('TG07',N'Hoài Thanh'),
('TG08',N'Nguyễn Ngọc Tư'),
('TG09',N'Nguyễn Minh Châu'),
('TG10',N'Iris Cao'),
('TG11',N'Ernest Hemingway'),
('TG12',N'Hector Malot'),
('TG13',N'Nikolai Ostrovsky'),
('TG14',N'Paulo Coelho'),
('TG15',N'Victor Hugo'),
('TG16',N'Dan Brown'),
('TG17',N'Arthur Conan Doyle'),
('TG18',N'Thomas Harris'),
('TG19',N'Agatha Christie'),
('TG20',N'Higashino Keigo'),
('TG21',N'Carlo Collodi'),
('TG22',N'Roald Dahl'),
('TG23',N'Luis Sepúlveda'),
('TG24',N'Grimm'),
('TG25',N'Hans Christian Andersen'),
('TG26',N'Nguyễn Đổng Chi')
INSERT INTO tblNhaXuatBan
VALUES
('NXB01',N'Tuổi Trẻ','0982123211',N'Hà Nội'),
('NXB02',N'Kim Đồng','0812762981',N'Bắc Ninh'),
('NXB03',N'Hội Nhà Văn','0328987612',N'Bắc Giang'),
('NXB04',N'Thanh Niên','0879738274',N'Hà Nội'),
('NXB05',N'Phụ Nữ Việt Nam','0987689872',N'Hà Nội'),
('NXB06',N'Lao Động','0398271872',N'Hà Nội'),
('NXB07',N'Nhã Nam','0982789182',N'TPHCM'), ('NXB08',N'Đông Á','0339798380',N'TPHCM'),
('NXB09',N'Thiếu Nhi','0321987789',N'TPHCM'),
('NXB10',N'Giáo Dục Việt Nam','0123212342',N'Hà Nội')
INSERT INTO tblSach
VALUES
('Sach01',N'Dế mèn phiêu lưu ký ','NXB01','TG01','TL01',30,40000,'VND'),
('Sach02',N'Cô gái quàng khăn đỏ','NXB02','TG02','TL02',4,35000,'VND'),
('Sach03',N'Chiếc chuông vàng','NXB03','TG03','TL03',7,27000,'VND'),
('Sach04',N'Tình vùng trộm','NXB04','TG04','TL04',5,28000,'VND'),
('Sach05',N'Trà sửa cho tâm hồn','NXB05','TG05','TL05',5,10000,'VND'),
('Sach06',N'Hoàng tử bé','NXB06','TG06','TL06',9,19000,'VND'), ('Sach07',N'Kinh tế vĩ mô','NXB07','TG07','TL07',3,50000,'VND'),
('Sach08',N'Triết học','NXB08','TG08','TL08',10,90000,'VND'),
('Sach09',N'Sách cho bé','NXB09','TG09','TL08',15,120000,'VND'),
('Sach10',N'Ca dao dân ca','NXB10','TG10','TL10',25,820000,'VND'),
('Sach11',N'Ông Già Và Biển Cả','NXB02','TG11','TL04',15,32000,'VND'),
('Sach12',N'Không Gia Đình','NXB02','TG12','TL04',8,121000,'VND'),
('Sach13',N'Thép Đã Tôi Thế Đấy ','NXB03','TG13','TL04',5,123000,'VND'),
('Sach14',N'Nhà Giả Kim','NXB04','TG14','TL04',12,60000,'VND'),
('Sach15',N'Những Người Khốn Khổ','NXB02','TG15','TL04',10,250000,'VND'),
('Sach16',N'Mật mã Da Vinci','NXB05','TG16','TL01',21,85000,'VND'),
('Sach17',N'Sherlock Holmes','NXB05','TG16','TL01',5,350000,'VND'),
('Sach18',N'Sự im lặng của bầy cừu','NXB05','TG16','TL01',41,90000,'VND'),
('Sach19',N'Án mạng trên sông Nile','NXB05','TG16','TL01',10,100000,'VND'),
('Sach20',N'Phía sau Nghi can X','NXB05','TG16','TL01',34,87000,'VND'),
('Sach21',N'Những cuộc phiêu lưu của
Pinocchio','NXB02','TG21','TL02',10,70000,'VND'),
('Sach22',N'Charlie và nhà máy
chocolate','NXB02','TG22','TL02',16,60000,'VND'),
('Sach23',N'Chuyện con mèo dạy hải âu
bay','NXB02','TG23','TL02',10,40000,'VND'), ('Sach24',N'Truyện cổ Grimm','NXB06','TG24','TL03',26,117000,'VND'),
('Sach25',N'Truyện cổ Andersen','NXB06','TG25','TL03',3,379000,'VND'),
('Sach26',N'Kho tàng truyện cổ tích Việt
Nam','NXB06','TG26','TL03',5,550000,'VND')
INSERT INTO tblKhachHang
VALUES
('KH01',N'Hoàng',N'Thanh Hóa','0383838331'),
('KH02',N'Độ',N'Hải Phòng','0338768211'),
('KH03',N'Khởi',N'Hà Nam','0987123721'),
('KH04',N'Quý',N'Bình Định','0387928172'),
('KH05',N'Hải Lâm',N'Thái Nguyên','0892028731'),
('KH06',N'Trường',N'Hà Nội','0986482741'),
('KH07',N'Vương',N'Quảng Bình','0376827381'),
('KH08',N'Mùi',N'Cà Mau','0339283123'),
('KH09',N'Tuấn',N'Tuyên Quang','0987652911'),
('KH10',N'Hà',N'Hà Tĩnh','0976829182')
INSERT INTO tblNhanVien
VALUES
('NV01',N'Khởi','Nam',N'Quảng
Nam','0928765182','11/03/2004','4/10/2023',1500000,10000),
('NV02',N'Lan',N'Nữ',N'Hưng
Yên','0987682731','5/03/2004','4/10/2023',1000000,1000),
('NV03',N'Quỳnh',N'Nữ',N'Thái
Bình','0986727621','6/03/2004','4/10/2023',1200000,1000),
('NV04',N'Thái','Nam',N'Hà
Nam','0327891823','11/03/2002','4/10/2023',1200000,1200),
('NV05',N'Sơn','Nam',N'Hải
Phòng','0987598734','11/03/2003','4/10/2023',1300000,1500),
('NV06',N'Trường','Nam',N'Hà
Tĩnh','0967928371','11/03/2001','4/10/2022',1500000,1000),
('NV07',N'Vinh','Nam',N'Cà
Mau','0972587619','9/03/2004','8/19/2023',2000000,1200),
('NV08',N'Quang','Nam',N'Hà
Nội','0981637861','10/03/2002','6/20/2021',1200000,1000),
('NV09',N'Khánh','Nam',N'Hà
Nam','0983274287','1/03/2001','7/17/2020',1200000,2000),
('NV10',N'Vũ','Nam',N'Thanh
Hóa','0338291231','11/03/2000','8/15/2020',1200000,10000)



INSERT INTO tblChiTietHDNhapHang
VALUES
(1,'Sach01',10,12900,'NV01','01/02/2023'),(2,'Sach02',299,33000,'NV02','02/03/2023'),
(3,'Sach03',35,11200,'NV03','03/04/2021'),(4,'Sach04',29,12000,'NV04','02/02/2022'),
(5,'Sach05',32,10200,'NV05','02/02/1022'),(6,'Sach06',99,15000,'NV06','10/12/2020'),
(7,'Sach07',28,18200,'NV07','09/30/2019'),(8,'Sach08',15,100000,'NV08','05/23/2019'),
(9,'Sach09',70,11800,'NV09','02/22/2023'),(10,'Sach10',10,320000,'NV10','07/01/2020')


INSERT INTO tblChiTietHDMuaHang
VALUES
(1,'Sach01',12000,2,0,'NV01','KH01','02/01/2023'),(2,'Sach03',10000,3,1000,'NV02','KH02','07/10/2023'),
(3,'Sach04',11000,1,0,'NV03','KH03','10/01/2023'),(4,'Sach02',18000,2,1000,'NV04','KH04','02/01/2023'),
(5,'Sach02',22000,3,1200,'NV05','KH05','02/21/2023'),(6,'Sach09',30000,1,1500,'NV06','KH06','04/02/2023'),
(7,'Sach03',14000,1,0,'NV07','KH07','03/11/2023'),(8,'Sach07',24000,2,1000,'NV05','KH08','06/12/2023'),
(9,'Sach06',11000,2,1000,'NV09','KH09','08/09/2023'),(10,'Sach01',10000,1,1200,'NV02','KH10','07/12/2023');

--3.1. Lấy ra các nhân viên nữ trong bảng tblNhanVien
SELECT *
FROM tblNhanVien
WHERE sGioiTinh = N'nữ';

--3.2. Lấy ra các nhân viên vào làm trước tháng 6/2023
SELECT *
FROM tblNhanVien
WHERE dNgayVaoLam < '2023-06-01';

--3.3. Lấy ra các cuốn sách có số lượng > 10
SELECT *
FROM tblSach
WHERE fSoLuong > 10;

--3.4. Lấy ra các hóa đơn mua hàng được lập trong tháng 7/2023
SELECT *
FROM tblChiTietHDMuaHang
WHERE MONTH(dNgayMuaHang) = 7 AND YEAR(dNgayMuaHang) = 2023;

--5. Cho biết số tiền phải trả của từng đơn đặt hàng
SELECT iSoHDMH AS [Mã Hóa Đơn], SUM(fDonGia*fSoLuong - fGiamGia) AS [Tổng Tiền]
FROM tblChiTietHDMuaHang
GROUP BY iSoHDMH;

--Truy vấn dữ liệu từ nhiều bảng
--1. Lấy ra các cuốn sách thuộc thể loại 'truyện cổ tích'
SELECT tblSach.sTenSach AS [Tên Sách], tblTheLoaiSach.sTenTheLoai AS [Thể Loại]
FROM tblSach
INNER JOIN tblTheLoaiSach ON tblSach.sMaLoaiSach = tblTheLoaiSach.sMaLoaiSach
WHERE tblTheLoaiSach.sTenTheLoai = N'Truyện cổ tích';

--2. Lấy ra tên các cuốn sách được nhập trong năm 2023
SELECT tblSach.sTenSach AS [Tên Sách], tblChiTietHDNhapHang.dNgayNhap AS [Ngày Nhập]
FROM tblChiTietHDNhapHang
INNER JOIN tblSach ON tblChiTietHDNhapHang.sMaSach = tblSach.sMaSach
WHERE YEAR(tblChiTietHDNhapHang.dNgayNhap) = 2023;

--3. Lấy danh sách khách hàng và tổng tiền đặt hàng của mỗi người
SELECT tblKhachHang.sMaKhachHang AS [Mã Khách Hàng], tblKhachHang.sTenKhachHang AS [Tên Khách Hàng],
    SUM(ISNULL(tblChiTietHDMuaHang.fDonGia*tblChiTietHDMuaHang.fSoLuong - tblChiTietHDMuaHang.fGiamGia, 0)) AS [Tổng Tiền Đặt Hàng]
FROM tblKhachHang
LEFT JOIN tblChiTietHDMuaHang ON tblKhachHang.sMaKhachHang = tblChiTietHDMuaHang.sMaKhachHang
GROUP BY tblKhachHang.sMaKhachHang, tblKhachHang.sTenKhachHang;

--4. Lấy ra những cuốn sách chỉ được mua 1 lần trong năm 2023
-- Lấy ra những cuốn sách chỉ được mua 1 lần trong năm 2023
SELECT tblSach.sMaSach AS [Mã Sách], tblSach.sTenSach AS [Tên Sách]
FROM tblChiTietHDMuaHang
INNER JOIN tblSach ON tblChiTietHDMuaHang.sMaSach = tblSach.sMaSach
GROUP BY tblSach.sMaSach, tblSach.sTenSach
HAVING COUNT(tblChiTietHDMuaHang.sMaSach) = 1 AND YEAR(MAX(tblChiTietHDMuaHang.dNgayMuaHang)) = 2023;


--5. Lấy ra tên sách và số lượng đã được mua của từng cuốn sách
SELECT tblSach.sTenSach AS [Tên sách],
    SUM(ISNULL(tblChiTietHDMuaHang.fSoLuong, 0)) AS [Số Lượng Đặt Hàng]
FROM tblSach
LEFT JOIN tblChiTietHDMuaHang ON tblSach.sMaSach = tblChiTietHDMuaHang.sMaSach
GROUP BY tblSach.sTenSach;

go
--1. proc thêm 1 bản ghi nhà xuất bản
CREATE PROCEDURE insertNXB
@maMXB varchar(15),
@tenNXB nvarchar(50),
@SDT varchar(12),
@Diachi nvarchar(50)
AS
BEGIN
    INSERT INTO tblNhaXuatBan
    VALUES (@maMXB,@tenNXB,@SDT,@Diachi);
    SELECT * FROM tblNhaXuatBan;
END;

-- thực thi proc insertNXB
exec insertNXB 'NXB11', N'Nhà Xuất Bản Hà Nội' , '038927382', N'Hà Nội';

--xóa 1 cuốn sách khỏi bảng tblsach với tên cuốn sách được nhập
go
CREATE PROCEDURE deleteSach
@tensach nvarchar(50)
AS
BEGIN
    DELETE FROM tblSach
    WHERE sTenSach = @tensach;
END;


--thực thi proc deleteSach
exec deleteSach N'Ông Già Và Biển Cả'
select * from tblSach;

--proc cho biết thể loại sách và NXB cuốn sách với tên cuốn sách được nhập
go
 create proc Sach_TheLoai_NXB
 @tensach nvarchar(50)
 as
 begin
select @tensach as [Tên Sách],
 sTenNXB as [Nhà Xuất Bản] ,
sTenTheLoai as [Thể Loại]
from tblNhaXuatBan inner join (tblSach inner join tblTheLoaiSach
on tblSach.sMaLoaiSach = tblTheLoaiSach.sMaLoaiSach)
on tblSach.sMaNXB = tblNhaXuatBan.sMaNXB
where @tensach = sTenSach
 end;
 -- thực thi proc Sach_TheLoai_NXB
 exec Sach_TheLoai_NXB N'Charlie và nhà máy chocolate';

 --4. proc tăng lương cho các nhân viên làm việc được 1 năm
 go
 create proc TangLuong
 as
 begin
 update tblNhanVien
 set fLuongCoBan = fLuongCoBan * 1.5
 where DATEDIFF(day, dNgayVaoLam, GETDATE())/365 >=1
 end;
 -- thực thi proc TangLuong
 exec TangLuong
 select * from tblNhanVien;
 --proc cho biết tuổi cao nhất của nhân viên
 go
create proc LayTuoiMax
@TuoiMax int output as
set @TuoiMax = 0
select @TuoiMax = MAX (datediff(day, dNgaysinh, getdate() )/365 )
from tblNhanVien;
 -- thực thi proc LayTuoiMax
declare @maxtuoi int
exec LayTuoiMax @TuoiMax = @maxtuoi output
select @maxtuoi as [Tuổi Lớn Nhất];
-- proc đếm số nhân viên nam, nhân viên nữ và tổng số nhân viên
go
create proc DemNhanVien
@nam int output,
@nu int output as
set @nam = 0
set @nu = 0
select @nam = COUNT(*) FROM tblNhanVien
where sGioiTinh = N'Nam';
select @nu = COUNT(*) FROM tblNhanVien
where sGioiTinh = N'Nữ';
return @nam + @nu;
-- thực thi proc DemNhanVien
declare @sonam int, @sonu int , @tong int
 exec @tong = DemNhanVien
@nam = @sonam output, @nu = @sonu output
select @sonam as [ Số Nhân Viên Nam ] ,
@sonu as [ Số Nhân Viên Nữ ] ,
@tong as [Tổng Số Nhân Viên];

 --Proc in ra tổng tiền thanh toán của HD nhập hàng với mã HD là tham số truyền vào
 go
create proc TongTienTT
@SoHDNH int as
begin
select iSoHDNH as [Số Hóa Đơn] , sum([fSoLuongNhap]*[fGiaNhap])
as [Tổng Tiền Thanh Toán]
from tblChiTietHDNhapHang
where iSoHDNH = @SoHDNH
group by iSoHDNH
end;
-- thực thi proc TongTienTT
exec TongTienTT 3;


--Proc xóa chi tiết HD nhập hàng với mã sách và iSoHDNH được truyền vào
go
create proc XoaChiTietHDNH
@isohdnh int,
@smasach varchar(15) as
begin
delete from tblChiTietHDNhapHang
where iSoHDNH = @isohdnh and sMaSach = @smasach
select * from tblChiTietHDNhapHang
end;
-- thực thi proc XoaChiTietHD
select * from tblChiTietHDNhapHang
exec XoaChiTietHDNH 2 ,'Sach02';

--v10. Proc sửa đổi số lượng và giá nhập của bảng tblChiTietHDNhapHang với tham số truyền vào là iSoHDNH ,sMaSach, số lượng mới và giá nhập mới
go
create proc SuaDoi_SL_GB_ChiTietHDNH
@isohdnh int,
@smasach varchar(15),
@fsoluongnhap float,
@fgianhap float as
begin
if((@fsoluongnhap > 0 and @fgianhap > 0) )
begin
update tblChiTietHDNhapHang
set fSoLuongNhap = @fsoluongnhap , fGiaNhap = @fgianhap
where iSoHDNH = @isohdnh and sMaSach = @smasach
select * from tblChiTietHDNhapHang
end
else begin print(N'Vui lòng nhập lại số lượng và giá bán phải > 0') end
end;

-- thực thi proc SuaDoi_SL_GB_ChiTietHDNH
select * from tblChiTietHDNhapHang;

--12. Proc thêm 1 bản ghi chi tiết hóa đơn mua hàng
go
CREATE OR ALTER PROCEDURE insertChiTietHDMH
    @iSoHDMH INT,
    @sMaSach VARCHAR(15),
    @fDonGia FLOAT,
    @fSoLuong FLOAT,
    @fGiamGia FLOAT,
    @sMaNhanVien VARCHAR(15),
    @sMaKhachHang VARCHAR(15),
    @dNgayMuaHang DATE
AS
BEGIN
    IF NOT EXISTS (
        SELECT * FROM tblChiTietHDMuaHang
        WHERE sMaSach = @sMaSach AND iSoHDMH = @iSoHDMH
    )
    BEGIN
        IF @fSoLuong > 0 AND @fDonGia > 0
        BEGIN
            INSERT INTO tblChiTietHDMuaHang
            VALUES (@iSoHDMH, @sMaSach, @fDonGia, @fSoLuong, @fGiamGia, @sMaNhanVien, @sMaKhachHang, @dNgayMuaHang);

            SELECT * FROM tblChiTietHDMuaHang;
        END
        ELSE
        BEGIN
            PRINT N'Số lượng phải > 0 và đơn giá phải > 0';
        END
    END
    ELSE
    BEGIN
        PRINT N'Mã sách này đã tồn tại trong chi tiết hd mua hàng';
    END
END;

-- thực thi proc insertChiTietHDMH
exec insertChiTietHDMH 1,Sach02,12000,2,0,'NV01','KH05','01/01/2024';

--13. Proc cho biết nhân viên nào bán được nhiều (sách) nhất trong năm được nhập từ bàn phím
go
CREATE OR ALTER PROCEDURE NhanVienBanNhieuSach_theo_nam
    @nam DATE
AS
BEGIN
    SELECT TOP 1
        nv.sMaNhanVien AS [Mã nhân viên],
        nv.sTenNhanVien AS [Tên nhân viên],
        SUM(ct.fSoLuong) AS [Số lượng sách đã bán]
    FROM
        tblNhanVien nv
    INNER JOIN
        tblChiTietHDMuaHang ct ON nv.sMaNhanVien = ct.sMaNhanVien
    WHERE
        YEAR(ct.dNgayMuaHang) = YEAR(@nam)
    GROUP BY
        nv.sMaNhanVien, nv.sTenNhanVien
    ORDER BY
        SUM(ct.fSoLuong) DESC;
END;

-- thực thi proc NhanVienBanNhieuSach_theo_nam
exec NhanVienBanNhieuSach_theo_nam '2023';

--14. Proc thống kê số lượng nhân viên sinh năm nhập từ bàn phím
go
create proc ThongKeSoLuongNhanVien_SN
@nam date
as
begin
select tblNhanVien.sMaNhanVien as [Mã nhân viên],
tblNhanVien.sTenNhanVien as [Tên nhân viên] ,
tblNhanVien.dNgaySinh as[Ngày sinh] from tblNhanVien
where year(tblNhanVien.dNgaySinh) = year(@nam)
end;
-- thực thi proc ThongKeSoLuongNhanVien_SN
exec ThongKeSoLuongNhanVien_SN '2002';

--15. Tạo proc thủ tục có tham số truyền vào là năm cho biết năm đó những nhân viên nào vào làm
go
create proc Nam_NV
@nam int as
begin
select*from tblnhanvien where year(dNgayVaoLam)=@nam
end;
exec Nam_NV 2023;

--16. tạo thủ tục cho biết sách của tác giả nào, với tham số truyền vào là mã tác giả
go
create proc sach_tacgia
@matg varchar(15) as
begin
select smatacgia,stensach from tblSach where sMaTacGia=@matg
end;
exec sach_tacgia 'TG01';

--17. Tạo thủ tục in ra danh sách sách có mã thể loại là tham số truyền vào
go
create proc sach_theloai
@matl varchar(15) as
begin
select smasach,stensach from tblSach where sMaLoaiSach=@matl
end;
exec sach_theloai 'TL01';
--18. Tạo thủ tục thêm nhân viên bao gồm(mã, tên,ngày sinh,địa chỉ) nếu trùng thì không cho thêm vào
go
create proc them_NV
@manv varchar(30),
@tennv nvarchar(30),
@ngaysinh date,
@diachi nvarchar(50)
As
if exists(select * from tblNhanvien where sMaNhanVien = @manv)
Begin
Print N'Mã nhân viên đã có' return
end
else
Insert into tblNhanvien(sMaNhanVien, sTenNhanVien,dNgaySinh,sDiaChi)
Values (@manv, @tennv, @ngaysinh,@diachi);
exec them_NV 'NV01',N'Hoa','2/2/2001',N'Hoàng Mai';
--19. Proc sửa đổi số lượng và giá bán của bảng tblChiTietHDMuaHang với tham số truyền vào là iSoHDMH ,sMaSach, số lượng mới và giá bán mới
go
create proc SuaDoi_SL_GB_ChiTietHDMH
@isohdmh int,
@smasach varchar(15),
@fdongia float,
@fsoluong float,
@fgiamgia float as
begin
if((@fsoluong > 0 and @fdongia > 0 and @fgiamgia > 0) )
begin
update tblChiTietHDMuaHang
set fSoLuong = @fsoluong , @fdongia = @fdongia,fgiamgia=@fgiamgia
where isohdmh = @isohdmh and sMaSach = @smasach
select * from tblChiTietHDMuaHang
end
else begin print(N'Vui lòng nhập lại số lượng và giá bán, giảm giá phải > 0') end
end;
-- thực thi proc SuaDoi_SL_GB_ChiTietHDMH
select * from tblChiTietHDMuaHang;

--21. Tạo thủ tục cập nhật thông tin khách hàng với tham số truyền vào là mã khách hàng
go
create PROCEDURE CapNhatThongTinKhachHang
 @MaKhachHang varchar(30),
 @TenMoi NVARCHAR(50),
 @DiaChiMoi NVARCHAR(50),
 @SDTMoi VARCHAR(50) as
 BEGIN
 IF EXISTS (SELECT *FROM tblKhachHang
WHERE sMaKhachHang = @MaKhachHang)
 begin
 -- Cập nhật thông tin khách hàng
 UPDATE tblKhachHang
 SET
 sTenKhachHang = @TenMoi,
 sDiaChi =@DiaChiMoi,
 sSDT = @SDTMoi
 WHERE sMaKhachHang = @MaKhachHang;
 print N'Thông tin khách hàng đã được cập nhật thành công!'
 end
 else
 print N'Mã khách hàng không tồn tại'
END;
exec CapNhatThongTinKhachHang @Makhachhang='KH01',
@TenMoi=N'Hải',@DiaChiMoi=N'Hà Nội',@SDTMoi='0982928123'
select*from tblKhachHang;
--VII. Tạo Trigger Cho CSDL
--1. Viết trigger để số lượng sách bán ra không vượt quá số lượng sách hiện có
go
CREATE OR ALTER TRIGGER Trigger_SoLuongSachBanRaKhongVuotQuaSoLuongSachHienCo
ON tblChiTietHDMuaHang
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @sMaSach NVARCHAR(15), @fSoLuong FLOAT
    SELECT @sMaSach = sMaSach, @fSoLuong = fSoLuong FROM inserted
    
    IF ((SELECT COUNT(sMaSach) FROM tblSach WHERE sMaSach = @sMaSach) > (SELECT SUM(fSoLuong) FROM tblChiTietHDMuaHang WHERE sMaSach = @sMaSach GROUP BY sMaSach))
    BEGIN
        PRINT 'Số lượng sách không đủ để bán'
        ROLLBACK TRANSACTION
    END
END;


alter table tblChiTietHDMuaHang disable trigger
Trigger_SoLuongSachBanRaKhongVuotQuaSoLuongSachHienCo
alter table tblChiTietHDMuaHang enable trigger
Trigger_SoLuongSachBanRaKhongVuotQuaSoLuongSachHienCo
insert into tblChiTietHDMuaHang
values (1,'Sach08',12000,3,1200,'NV01','KH01','2019-02-22');

go
--2. Thêm fTongTienHang vào bảng tblKhachHang viết trigger khi khách hàng đến mua hàng thì tổng tiền hàng tự động tăng
ALTER TABLE tblKhachHang
ADD fTongTienHang FLOAT;
go
CREATE OR ALTER TRIGGER Trigger_CapNhatTongTienHang
ON tblChiTietHDMuaHang
FOR INSERT
AS
BEGIN
    DECLARE @sMaKhachHang VARCHAR(15)
    DECLARE @fSoLuong FLOAT
    DECLARE @fDonGia FLOAT
    DECLARE @fGiamGia FLOAT

    -- Lấy thông tin từ bảng inserted
    SELECT @sMaKhachHang = i.sMaKhachHang, @fSoLuong = i.fSoLuong, @fDonGia = i.fDonGia, @fGiamGia = i.fGiamGia
    FROM inserted i

    -- Cập nhật tổng tiền hàng cho khách hàng tương ứng
    UPDATE tblKhachHang
    SET fTongTienHang = ISNULL(fTongTienHang, 0) + (@fSoLuong * @fDonGia - @fGiamGia)
    WHERE sMaKhachHang = @sMaKhachHang
END;



insert into tblChiTietHDMuaHang
values (1,'Sach07',12000,3,1200,'NV01','KH01','2019-02-22');
alter table tblChiTietHDMuaHang disable trigger
Trigger_KhachHangDenMuaHangThiTongTienHangTuDongTang
alter table tblChiTietHDMuaHang enable trigger
Trigger_KhachHangDenMuaHangThiTongTienHangTuDongTang
go
--3. Viết trigger đảm bảo mỗi hóa đơn chỉ được mua tối đa 3 sách khác nhau
create or alter trigger Trigger_MoiHoaDonChiDuocMuaToiDa3SachKhacNhau
on tblChiTietHDMuaHang
for insert , update
as
declare @iSoHDMH int , @sMaSach nvarchar(15)
select @iSoHDMH=iSoHDMH,@sMaSach=sMaSach from inserted
if ((select count(sMaSach) from tblChiTietHDMuaHang where iSoHDMH=@iSoHDMH
group by iSoHDMH)>3)
begin
print 'Moi hoa don chi duoc mua toi da ba sach khac nhau'
rollback tran
end
insert into tblChiTietHDMuaHang
values (1,'Sach08',12000,3,1200);
insert into tblChiTietHDMuaHang
values (1,'Sach07',12000,3,1200);
insert into tblChiTietHDMuaHang
values (1,'Sach06',12000,3,1200);
alter table tblChiTietHDMuaHang disable trigger
Trigger_MoiHoaDonChiDuocMuaToiDa3SachKhacNhau
alter table tblChiTietHDMuaHang enable trigger
Trigger_MoiHoaDonChiDuocMuaToiDa3SachKhacNhau
go
--4. Viết trigger mỗi nhân viên chỉ được lập 3 hóa đơn mua hàng 1 ngày
create or alter trigger Trigger_MoiNhanVienChiDuocLap3HoaDonMuaHangMotNgay
on tblHoaDonMuaHang
for insert, update
as declare @sMaNhanVien nvarchar(15), @dNgayMuaHang date
select @sMaNhanVien=sMaNhanVien, @dNgayMuaHang=dNgayMuaHang from
inserted
if ((select count(sMaNhanVien) from tblHoaDonMuaHang where
sMaNhanVien=@sMaNhanVien and dNgayMuaHang=@dNgayMuaHang group by
sMaNhanVien,dNgayMuaHang)>3)
begin
print 'Moi nhan vien chi duoc lap 3 hoa don mua hang trong 1 ngay'
rollback tran
end
insert into tblHoaDonMuaHang
values (11,'NV01','KH10','2023-10-22')
insert into tblHoaDonMuaHang
values (12,'NV01','KH10','2023-10-22')
insert into tblHoaDonMuaHang
values (13,'NV01','KH10','2023-10-22')
insert into tblHoaDonMuaHang
values (14,'NV01','KH10','2023-10-22')
alter table tblHoaDonMuaHang disable trigger
Trigger_MoiNhanVienChiDuocLap3HoaDonMuaHangMotNgay
alter table tblHoaDonMuaHang enable trigger
Trigger_MoiNhanVienChiDuocLap3HoaDonMuaHangMotNgay
go
--5. Thêm iSoDonHangBanDuoc cho tblNhanVien viết trigger khi nhân viên bán được 1 đon hàng cột số đơn hàng tự động tăng
alter table tblNhanVien
add iSoDonHangBanDuoc int
update tblNhanVien
set iSoDonHangBanDuoc=0;
go
create or alter trigger Trigger_NhanVienBanDuocHangCotSoDonHangTuDongTang
on tblHoaDonMuaHang
for insert, update
as declare @sMaNhanVien nvarchar(15)
select @sMaNhanVien=sMaNhanVien from inserted
update tblNhanVien
set iSoDonHangBanDuoc=iSoDonHangBanDuoc+1
where sMaNhanVien=@sMaNhanVien
insert into tblHoaDonMuaHang
values (11,'NV01','KH01','2023-01-01')
alter table tblHoaDonMuaHang disable trigger
Trigger_MoiNhanVienChiDuocLap3HoaDonMuaHangMotNgay
alter table tblHoaDonMuaHang enable trigger
Trigger_MoiNhanVienChiDuocLap3HoaDonMuaHangMotNgay;
--6. Tạo trigger chỉ được nhập dưới 100 sách 1 lần
create trigger trigger_Nhapduoi100
on tblChiTietHDNhapHang
instead of insert as
begin
declare @soluong float
select @soluong=inserted.fSoluongnhap from inserted
if(@soluong>100) print N'Không được nhập quá 100'
rollback
end
insert into tblChiTietHDNhapHang values('11',N'Sach01',101,12000)
--7. Tạo trigger Ngày vào làm phải sau ngày sinh
create trigger Check_ngayVaoLam
on tblNhanVien
for update , insert as
if update(dngayvaolam)
begin
declare @ngsinh date , @ngayVL date
select @ngayVL=dngayvaolam from inserted
select @ngsinh=dngaysinh from inserted
if(@ngsinh>@ngayVL)
begin
print N'Ngày vào làm phải sau ngày sinh'
rollback tran
end
end
insert into tblNhanVien values('NV11',N'Nam',N'Hà Nội','0928382712','2/2/2000','2/2/1999',1200000,10000)
--8. Trigger không cho phép thay đổi giá bán của sách
create trigger update_Giaban
on tblSach
for update
as begin
if update(fGiaban)
begin
print N'Không được thay đổi giá bán'
rollback tran
end
end
update tblSach set fGiaBan=100000 where sMaSach='Sach01'
--9. Trigger chỉ cho phép nhập giới tính là Nam hoặc Nữ
create trigger check_gioitinh
on tblNhanvien
for insert, update
as begin
declare @gioitinh nvarchar(4)
select @gioitinh=sGioitinh from inserted
if(@gioitinh=N'Nam' or @gioitinh=N'Nữ')
print 'Nhập thành công'
else begin
print N'Nhập sai giới tinh'
rollback tran
end
end
select*from tblNhanVien
update tblNhanVien set sGioitinh=N'Khác' where sMaNhanVien='NV01'
--10. Trigger kiểm soát nhân viên vào làm phải >18 tuổi
create trigger check_tuoiNV
on tblNhanVien
instead of insert as begin
declare @ngaysinh date
select @ngaysinh=dngaysinh from inserted
if(year(getdate())-year(@ngaysinh)<18)
begin
print N'Nhân viên chưa đủ độ tuổi quy định'
rollback tran
end
end
insert into tblNhanVien(sMaNhanVien,sTenNhanVien,dNgaySinh) values('NV11',N'Kiều','2/12/2020')
--Phân quyền
--1. Tạo tài khoản
create login nguyenthimybinh
with password = '123456',
default_database = QuanLyCuaHangSach;
create user nguyenthimybinh
for login nguyenthimybinh;

create login nguyenthietdo
with password = '123456',
default_database = QuanLyCuaHangSach;
create user nguyenthietdo
for login nguyenthietdo;
create login tranvankhoi
with password = '123456',
default_database = QuanLyCuaHangSach;
create user tranvankhoi
for login tranvankhoi;
create login tranvanhailam
with password = '123456',
default_database = QuanLyCuaHangSach;
create user tranvanhailam
for login tranvanhailam;
create login doducquy
with password = '123456',
default_database = QuanLyCuaHangSach;
create user doducquy
for login doducquy;
--2. Phân quyền
--cấp quyền cho người dùng nguyenthimybinh quyền select,insert,update trên bảng tblKhachHang
grant select, insert,update
on tblKhachhang
to nguyenthimybinh
--cấp quyền cho người dùng nguyenthietdo quyền xem, tạo bảng, thủ tục,khung nhìn trên bảng tblNhanVien
grant select,create table,create proc,create view
on tblNhanVien
to nguyenthietdo
--cấp quyền cho người dùng tranvankhoi quyền delete, execute trên bảng tblTacGia
grant delete ,execute
on tblTacGia
to tranvankhoi
--cấp quyên cho người dùng tranvanhailam quyền thực thi tất cả trên bảng tblSach
grant all privileges
on tblsach
to tranvanhailam
--cấp quyền cho người dùng doducquy quyền select,update trên cột mã,tên,SĐT,Địa chỉ của bảng tblNhanVien và chuyển tiếp cho người dùng khác
grant select, update
on tblNhanVien(sMaNhanVien,sTenNhanVien,sDiaChi,sSDT)
to doducquy
with grant option
--Thu hồi quyền select của người dùng nguyenthimybinh
revoke select
on tblnhanvien
to nguyenthimybinh
--thu hồi quyền xem của người dùng nguyenthietdo
revoke select
on tblNhanvien
to nguyenthietdo
--thu hồi quyền delete của người dùng tranvankhoi
revoke delete
on tblTacGia
to tranvankhoi
--thu hồi quyền insert, update của người dùng tranvanhailam
revoke insert,update
on tblsach
to tranvanhailam
--thu hồi quyền xem cột mã nhân viên của người dùng doducquy
revoke select
on tblNhanvien(sMaNhanVien)
to doducquy
cascade
