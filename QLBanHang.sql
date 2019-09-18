create database Quanlybanhang;
use Quanlybanhang;
go
create table tblChatlieu(
	Machatlieu varchar(10) not null primary key,
	Tenchatlieu nvarchar(50)
);
go
create table tblKhach(
	Makhach varchar(10) not null primary key,
	Tenkhach nvarchar(50),
	Diachi nvarchar(50),
	Dienthoai varchar(20)
);
go
create table tblHang(
	Mahang varchar(10) not null primary key,
	Tenhang nvarchar(50),
	Machatlieu varchar(10) foreign key(Machatlieu) references tblChatlieu(Machatlieu),
	Soluong float,
	Dongianhap float,
	Dongiaban float,
	Anh nvarchar(200),
	Ghichu nvarchar(200)
);
go
create table tblNhanvien(
	Manhanvien varchar(10) not null primary key,
	Tennhanvien nvarchar(50),
	Gioitinh nvarchar(10),
	Diachi nvarchar(50),
	Dienthoai varchar(20),
	Ngaysinh datetime
);
go
create table tblHDBan(
	MaHDBan varchar(10) not null primary key,
	Manhanvien varchar(10) foreign key references tblNhanvien(Manhanvien),
	Ngayban datetime,
	Makhach varchar(10) not null foreign key references tblKhach(Makhach),
	Tongtien float
);
go
create table tblChitietHDBan(
	MaHDBan varchar(10) not null,
	Mahang varchar(10) not null,
	Soluong float,
	Dongia float,
	Giamgia float,
	Thanhtien float,
	primary key (MaHDBan, Mahang),
	foreign key (MaHDBan) references tblHDBan(MaHDBan),
	foreign key (Mahang) references tblHang(Mahang)
);
go