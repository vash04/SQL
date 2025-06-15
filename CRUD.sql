create table ClientMaster(
ClientNo varchar(6),
Name varchar(20),
Adress1 varchar(30),
Adress2 varchar(30),
City varchar(20),
Pincode varchar(8),
State varchar(15),
Baldue numeric(10, 2)
);

create table ProductMaster(
ProductNo varchar(6),
Discription varchar(20),
ProfitPercent numeric(6, 2),
UnitMeasure varchar(10),
QtyOnHand numeric(10),
ReOrderLevel numeric(8),
SellPrice numeric(8,2),
CostPrice numeric(10,2)
);

create table SalesmanMaster(
SalesmanNo varchar(6),
SalesmanName varchar(20),
Adress1 varchar(30),
Adress2 varchar(30),
City varchar(20),
Pincode varchar(10),
State varchar(20),
Salamt numeric(8, 2),
TgtToGet numeric(6, 2),
YtdSales numeric(6, 2),
Remark varchar(6)
);

insert into ClientMaster(ClientNo, Name, Adress1, Adress2, City, Pincode, State, Baldue)
values 
('C0002', 'Rajesh', 'XYZ', 'XYZ', 'Jaipur', 'ABC', 'Rajasthan', 15000),
('C0003', 'Sheetal', 'XYZ', 'XYZ', 'london', 'ABC', 'UK', 25000),
('C0004', 'Aarti', 'XYZ', 'XYZ', 'london', 'ABC', 'UK', 35000),
('C0005', 'Yash', 'XYZ', 'XYZ', 'Hamukhedi', 'ABC', 'MP', 55000),
('C0006', 'Pratibha', 'XYZ', 'XYZ', 'Ooty', 'ABC', 'Uttarkhand', 54000),
('C0007', 'Somu', 'XYZ', 'XYZ', 'Pune', 'ABC', 'Maharashtra', 35000),
('C0008', 'Lassan', 'XYZ', 'XYZ', 'Jaipur', 'ABC', 'Rajasthan', 115000);

insert into ProductMaster(ProductNo, Discription, ProfitPercent, UnitMeasure, QtyOnHand, ReOrderLevel, SellPrice, CostPrice)
values
('P00002', 'Tshirt', 6, 'Piece', 250, 100, 300, 250),
('P00003', 'Jeans', 7, 'Piece', 50, 200, 600, 250),
('P00004', 'Kurta', 3, 'Piece', 255, 300, 370, 20),
('P00005', 'Tshirt', 0, 'Piece', 237, 130, 308, 25),
('P00006', 'OnePiece', 8, 'Piece', 290, 150, 670, 750),
('P00007', 'shirt', 19, 'Piece', 290, 120, 600, 250),
('P00008', 'Tshirt', 43, 'Piece', 950, 100, 300, 200);

insert into SalesmanMaster(SalesmanNo, SalesmanName, Adress1, Adress2, City, Pincode, State, Salamt, TgtToGet, YtdSales, Remark)
values
('S00002', 'Sheetal', 'A/15', 'Pune', 'Pune', '456011', 'Maharashtra', 5000, 400, 70, 'Good'),
('S00003', 'Yashashri', 'G/14', 'Delhi', 'Delhi', '456012', 'Delhi', 6000, 600, 89, 'Bad'),
('S00004', 'Amit', 'A/19', 'Kolkata', 'Kolkata', '456013', 'West Bengal', 4500, 700, 56, 'Bad'),
('S00005', 'Aarti', 'P/14', 'Indore', 'Indore', '456014', 'Madhya Pradesh', 7000, 340, 80, 'Good'),
('S00006', 'Pratibha', 'A/12', 'Mumbai', 'Mumbai', '456015', 'Maharashtra', 9800, 870, 50, 'Good')

questions:

select Name from ClientMaster;

select * from ClientMaster;

select Name, City, State from ClientMaster;

select Discription from ProductMaster;

select * from ClientMaster
where City = 'Jaipur';

select * from SalesmanMaster
where Salamt>6000;

update ClientMaster 
set city = 'Kota'
where ClientNo = 'C0001';

select * from ClientMaster;

update ClientMaster 
set Baldue = 1000
where ClientNo = 'C0002';

select * from ClientMaster;

update ProductMaster
set CostPrice = 950
where Discription='OnePiece';

select * from ProductMaster;

update SalesmanMaster
set City = 'Mumbai';

select * from SalesmanMaster;

delete from SalesmanMaster
where Salamt = 4500;

select * from SalesmanMaster;

delete from ProductMaster
where QtyOnHand<240;

select * from ProductMaster;

Delete from ClientMaster
where State = 'UK';

select * from ClientMaster;

alter table Clientmaster
add Telephone Numeric (10);

select * from ClientMaster;

alter table ProductMaster
alter column SellPrice numeric(10,2);

select * from ProductMaster;

drop table ClientMaster;

exec sp_rename SalesmanMaster, SaleMas;