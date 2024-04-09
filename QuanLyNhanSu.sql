create database QuanLyNhanSu
go 
use QuanLyNhanSu


go
create table BoPhan
(
Mabp char(5) constraint PK_BP_MABP primary key,
TenBP nvarchar(50) not null, 
DiaChiBP nvarchar(100) not null,
SDT nvarchar(12) not null,
isdelete int
)

go
create table PhongBan
(
MaPB char(5) constraint PK_PB_MAPB primary key,
TenPB nvarchar(50) not null, 
DiaChiPB nvarchar(100) not null,
SDT nvarchar(12) not null,
MaBP char(5) not null foreign key(MaBP) references BoPhan(MaBP)

)

go
create table ChucVu
(
MaCV char(5) constraint PK_CV_MACV primary key,
TenCV nvarchar(50) not null,
isdelete int
)
go
create table TrinhDo
(
MaTD char(5) constraint PK_TD primary key,
TenTD nvarchar(50) not null
)

go
create table Luong
(

MaLuong char(5) constraint PK_L_ML primary key,
LuongCoBan float not null,
PhuCap float not null, 
LuongBoSung float not null,
MaCV char(5) not null foreign key(MaCV) references ChucVu(MaCV),
isdelete int
)
go
create table NhanVien
(
MaNV char(5) constraint  PK_NV_MANV PRIMARY KEY,
HoNV NVARCHAR(50) NOT NULL,
TenNV NVARCHAR(50) NOT NULL,
GioiTinh NVARCHAR(20) CONSTRAINT CK_NV_GT CHECK(GioiTinh IN(N'Nam',N'Nữ',N'Khác')),
NgaySinh datetime2(7) not null,
NoiSinh NVARCHAR(100) NOT NULL ,
DiaChi NVARCHAR(100) NOT NULL CONSTRAINT DF_NV_DCNV DEFAULT N'Chưa có thông tin',
SDT nvarchar(12) NOT NULL,
CCCD char(12) not null,
MaBP char(5) foreign key(MaBP) references BoPhan(MaBP),
MaPB char(5) foreign key(MaPB) references PhongBan(MaPB),
MaCV char(5) foreign key(MaCV) references ChucVu(MaCV),
MaTD char(5) foreign key(MaTD) references TrinhDo(MaTD),
MaLuong char(5) foreign key(MaLuong) references Luong(MaLuong),
ChuyenNganh nvarchar(5) ,
NgayNhanLuong int,
isdelete int
)
alter table NhanVien
add  NgayNhanLuong int 
go
create table KTKL
(
MaKTKL char(5) constraint PK_KTKL_MAKTKL primary key,
TenKTKL nvarchar(50) not null,
NoiDung ntext not null,
NgayNhan datetime2(7)  not null,
MaNV char(5) not null foreign key(MaNV) references NhanVien(MaNV),
Loai nvarchar(50) not  null
)
go
create table BaoHiem
(
MaBH char(5) constraint PK_BH_MABH primary key,
SoBH nvarchar(10) not null,
NgayCap datetime2(7) not null,
NoiCap nvarchar(50) not null,
NoiKhamBenh nvarchar(50) not null,
MaNV char(5) not null foreign key(MaNV) references NhanVien(MaNV),
)
go
create table HopDong
(
MaHD char(5) constraint PK_HDLD_MAHD primary key,
NgayBatDau datetime2(7) not null,
NgayKetThuc datetime2(7) not null,
NgayKy datetime2(7) not null,
NoiDung ntext not null,
LanKy int not null,
ThoiHan nvarchar(50) not null,
MaNV char(5) not null foreign key(MaNV) references NhanVien(MaNV)
)

go
create table BangCong
(
MaBC char(5) constraint PK_BC_MABC primary key,
SoNgayLam float not null,
SoNgayNghi float not null,
SoGioLamThem float not null,
MaNV char(5) not null foreign key(MaNV) references NhanVien(MaNV),
MaPB char(5) not null foreign key(MaPB) references PhongBan(MaPB),
Ghichu text 
)
create table NguoiDung
(
Tendangnhap varchar(20) primary key,
Matkhau char(20)
)
