create database Ecommerce_grocery_shop;

create table grocery_shop(
	gId int auto_increment not null primary key,
    name varchar(50) not null
    );
create table employees(
	eId int  auto_increment not null primary key,
    name varchar(50) not null,
    responsiblity varchar(50) not null,
    contact int not null,
    location varchar(50) not null,
	gId int not null,
	foreign key (gId) references grocery_shop(gId)
    );
    
create table vendors(
	vId int auto_increment not null primary key,
    name varchar(60) not null,
    contact int not null,
    address varchar(60) not null,
	products varchar(60) not null,
	gId int not null,
	foreign key (gId) references grocery_shop(gId)
    );
     
create table categories( 
	catId int  auto_increment not null primary key,
    name varchar(60) not null,
    cat_type varchar(60) not null
    );
    
create table products(
	pId int not null primary key ,
    name varchar(60) not null,
    price decimal not null,
    description varchar(60) not null,
    image binary null,
	recipe varchar(60) null,
	post_status varchar (60) not null,
    catId int not null,
	gId int not null,
    vId int not null,
    foreign key (catId) references categories(catId),
    foreign key (gId) references grocery_shop(gId),
    foreign key (vId) references vendors(vId)
    );
    
create table customers(
	cId int auto_increment not null primary key,
    name varchar(60) not null,
    contact int not null,
    email varchar(60) not null,
    password varchar(60) not null
    );
    
create table orders(
	oId int auto_increment not null primary key,
    pname varchar(60) not null,
    cId int not null,
    foreign key (cId) references customers(cId),
	eId int not null,
    foreign key (eId) references employees(eId)
    );
     
create table payments(
	id int auto_increment not null primary key,
    name varchar(60),
    is_paid boolean,
    is_not_paid boolean,
    oId int not null,
    foreign key (oId) references orders(oId),
	eId int not null,
	cId int  not null,
	pId int not null,
	foreign key (pId) references products(pId),
	foreign key (eId) references employees(eId),
	foreign key (cId) references customers(cId)
    );
    
create table deliveries(
	dId int auto_increment not null primary key,
    name varchar(60) not null,
    is_delivered boolean not null,
    is_not_delivered boolean not null,
    eId int not null,
    cId int not null,
    oId int not null,
    foreign key (oId) references orders(oId),
    foreign key (eId) references employees(eId),
    foreign key (cId) references customers(cId)
    );
    
create table wishlist(
	wId int auto_increment not null primary key,
    like_status boolean not null,
    view_status boolean not null ,
	cId int not null,
	pId int not null,
	catId int not null,
	foreign key (cId) references customers(cId),
	foreign key (pId) references products(pId),
	foreign key (catId) references categories(catId)
    );
    
create table users(
	uId int auto_increment not null primary key,
    cId int not null,
    eId int not null,
    vId int not null,	
    gId int not null,
	foreign key (eId) references employees(eId),
    foreign key (cId) references customers(cId),
	foreign key (vId) references vendors(vId),
	foreign key (gId) references grocery_shop(gId) 
   );

insert into grocery_shop(gId,name)
values('1', 'Delight grocery shop');

insert into  employees(eId, name, responsiblity, contact, location ,gId)
values('1','Andrew', 'manager', '0701423123','Mutungo', '1'),
('2','Maria','admin', '0786753421', 'Lugazi', '1'),
('3', 'Duncan', 'delivery man','0789956452', 'Mulago', '1');

insert into vendors(vId, name, contact, address,products,gId)
values('1','Duncan', '0781232435', 'Mulago', 'meat', '1'),
('2','Ambrose', '0789564312','Mityana','fruits', '1'),
('3','Henry','0742233123', 'Mengo', 'cakes', '1');

insert into categories(catId, name, cat_type)
values('1', 'beef','meat'),
('2', 'fruits', 'apples'),
('3', 'birthday cake', 'cakes'),
('4', 'cornflakes', 'snacks');

insert into  products(pId, name, price, description, post_status, catId,gId,vId)
values('1', 'beef','25000.0','meat','vendors' ,'1','1','1'),
('2', 'cornflakes', '5000.0', 'snacks','admin','4', '1','3'),
('3', 'apples', '4000.0', 'fruits','vendors', '2', '1','2'),
('4', 'wedding cake','1000000.0','cakes','admin', '3', '1','2');


insert into customers(cId, name, contact, email, password)
values('1', 'Agatha', '0789144564', 'agatha4@gmail.com', 'ag1atha'),
('2', 'Linda', '0745565789', 'linda3@gmail.com','lin3da'),
('3', 'Akram','0799456738', 'akram2@gmail.com', 'akr2am');

insert into orders(oId, pname, cId, eId)
values('1', 'cakes','2','2'),
('2', 'meat', '3','2'),
('3', 'fruits','2','3'),
('4', 'snacks', '1', '1');

insert into  payments(id, name, is_paid, is_not_paid, oId, eId, cId, pId)
values('1', 'meat', '1', '0', '2','2','3','1'),
('2', 'snacks', '0', '1', '4','1','1','2');

insert into deliveries(dId, name, is_delivered, is_not_delivered, eId, cId,oId)
values('1','door-to-door', '1', '0', '3', '2', '1');

insert into wishlist(wId,like_status, view_status, cId, catId, pId)
values('1', '1', '1', '1', '1', '1'),
('2', '0', '1', '2', '2', '2');

insert into users(uId, cId, eId, vId, gId)
values('1', '1', '1','1', '1'),
('2', '2', '2', '2', '1'),
('3', '3', '3', '3','1');

select * from orders;

select * from products where post_status = 'admin';

select * from products where post_status = 'vendors';

select * from users;

select vId from users;

select eId, cId from users;
