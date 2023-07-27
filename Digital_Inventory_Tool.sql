create database Digital_Inventory_Tool

CREATE TABLE CUSTOMERS
(

CustomerId INT IDENTITY(100,150) PRIMARY KEY,
Name varchar(50) NOT NULL,
Email varchar(50)  NULL,
Address varchar(200) NULL,
PhoneNumber varchar(50) NULL,
employee_Id int NOT NULL FOREIGN KEY REFERENCES Employees (employee_Id),

)
drop table customers


INSERT INTO CUSTOMERS VALUES ('Fahim ', 'fhani26@gmail.com', 'Dhaka','01912584949',200)
INSERT INTO CUSTOMERS VALUES ('Shafa ', 'fhani26@gmail.com', 'Dhaka','01681584624')
select * from CUSTOMERS where phoneNumber='01912584949'
 
 

 CREATE TABLE Employees
(

employee_Id INT IDENTITY(200,150) PRIMARY KEY,
Name varchar(50) NOT NULL,
Email varchar(50)  NOT NULL,
PhoneNumber varchar(50) NOT  NULL,
Address varchar(200) NOT NULL,
Joining_date varchar(50) NOT NULL,
Leaving_date varchar(50)  NULL,
Employee_Status varchar(255) not null
)
alter table Employees drop column Employee_Status ;
alter table Employees add Employee_Status varchar(255) not null;
select * from Employees
drop table Employees;


INSERT INTO Employees VALUES ('Ani', 'fhani26@gmail.com','01681584624', 'Dhaka','15/09/2021','15/09/2022','Admin')
INSERT INTO Employees VALUES ('Shafa', '180204125@aust.edu','01254697233', 'Dhaka','15/09/2021','15/09/2022','Security Officer')
INSERT INTO Employees VALUES ('GGGG', '180204125@aust.edu','01254697233', 'Dhaka','15/09/2021','15/09/2022','Admin')

insert into employees 
(Name,Email,PhoneNumber,Address,Joining_date)
values
('Ani', 'fhani26@gmail.com','01681584624', 'Dhaka','15/09/2021');

UPDATE Employees SET Leaving_date='15/09/2022' WHERE employee_Id=650

create table Products(
	Product_id int identity(100,150) primary key,
	Product_name varchar(50) not null,
	Product_description varchar(500) not null,
	Product_type varchar(20) not null,
	Price float not null,
	Quantity int not null,
	Number_of_orders float null


)
select * from Products where Product_id=100
Select * from products where product_id=100
insert into Products(Product_name,Product_description,Product_type,Price,Quantity,Number_of_orders) values ('Cadbury','large','Chocolates',55,50,5)

create table Orders(
order_id int identity(100,150) primary key,
CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerId),
Date_of_order varchar(50) not null,
Product_id int NOT NULL FOREIGN KEY REFERENCES Products (Product_id),
payment_method varchar(50) not null

)
alter table orders add quantity int  null;
alter table orders drop column quantity int  null;
drop table Orders
select *from customers
select * from Orders
 
insert into Orders values (250,'15/09/2021',400,'bkash',250)
alter table Orders add Paid_amount float ;


create table Admins(
Admin_id  int identity(100,150) primary key,
username varchar(100) not null,
password varchar(100) not null,
employee_Id INT not null foreign KEY references employees(employee_id),
)
select * from Admins
select *from employees
insert into Admins values('Shafa','125',350)
drop table Admins;


SELECT Admins.Admin_id,Admins.username,Admins.password,Admins.employee_Id, Employees.Employee_Status
FROM Employees 
INNER JOIN Admins ON Admins.employee_id = employees.employee_id where Admins.employee_id=200;


select Admins.username,Admins.password, Admins.employee_id,Employees.Employee_status from Employees inner join Admins on Admins.employee_id=employees.employee_id where Admins.username='Ani';
select Admins.employee_id,Employees.Employee_status from Employees inner join Admins on Admins.employee_id=employees.employee_id where Admins.employee_id=500;
select *from Products
select * from orders
select *from customers

select Products.Product_name,Products.Price from Products inner join Orders on products.Product_id=Orders.product_id inner join  customers on customers.customerid=orders.customerid where Customers.customerid=152200  ;

SELECT product_name ,Orders.quantity,orders.Paid_amount,orders.payment_method
FROM    products
JOIN        orders ON orders.Product_id = products.Product_id inner join customers on customers.customerId=163150 where orders.Date_of_order= '2021/10/06 21:29'
		--GROUP BY   Product_name 

update Products set Product_name='Kitkat_new'where Product_id=100
insert into Orders values(158500,'2021/10/06 18.36','Cash',150,3);
insert into Orders values (158500,'15/09/2021',250,'bkash',150,3)

DELETE FROM customers WHERE Name='Omio';

select * from customers
select *from employees
select * from products


select name,customerid from customers union all select name,employee_id from employees

select Name,Email,Address , PhoneNumber from customers 

SELECT COUNT(customerId) as number FROM customers

Select Name,Email from (SELECT *FROM customers e  JOIN orders b ON e.customerId = b.customerid)
select *from orders

SELECT *FROM customers e  JOIN orders b ON e.customerId = b.customerid --group by b.customerId  order by num

SELECT top 5 Name,Email,Address,PhoneNumber,Paid_amount  FROM customers e  JOIN orders b ON e.customerId = b.customerid order by b.paid_amount desc

select * from orders order by product_Id desc

update products set Price=10, Number_of_orders=Number_of_orders+1 where product_id=150400