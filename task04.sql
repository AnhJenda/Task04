-- Kiểm tra xem có CSDL Task04 chưa
if exists (select * from sys.databases where name ='Task04')
	drop database Task04
go
-- tạo lại CSDL Task04
create database Task04
go
-- Sử dụng CSDL Task04
use Task04
go
-- Tạo bảng lưu trữ thông tin khách hàng
create table Customer(
	CustomerID int primary key,
	CustomerName nvarchar(50),
	CustomerAddress nvarchar(200),
	Tel bigint
)
go
-- Tạo bảng lưu trữ sản phẩm trong kho
create table Product(
	ProductID varchar(40) primary key,
	ProductName nvarchar(200),
	Unit int,
	Price money,
	Quantity int
)
go
-- Tạo bảng lưu trữ Đơn Hàng
create table Ordered(
	OrderID varchar(40) primary key,
	CustomerID int foreign key references Customer(CustomerID),
	OrderDate date
)
go
-- Tạo bảng lưu trữ thông tin chi tiết Đơn hàng
create table OrderDetails(
	OrderID varchar(40) foreign key references Ordered(OrderID),
	ProductID varchar(40) foreign key references Product(ProductID),
	Price money,
	Quantity int
)
