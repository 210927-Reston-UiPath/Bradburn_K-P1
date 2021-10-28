create table associates
(
    associateName varchar(100) not null,
    associateLocale varchar(2) not null,
    revaPoints int not null,
    id serial primary key
);

create table trainers
(
    id serial primary key,
    trainerName varchar(100) not null,
    campus varchar(3) not null,
    caffeineLevel int not null
);

create table batch
(
    id serial primary KEY,
    associateID int REFERENCES associates(id),
    trainerID int REFERENCES trainers(id)
);


insert into associates (associateName, associateLocale, revaPoints) values 
('Ai', 'CA', -20), ('Osiris', 'CA', -20), ('Jacob', 'FL', 50),  ('Janel', 'AZ', 50), ('Colton', 'OK', -180), ('Niles', 'AL', 200), ('Timothy', 'CT', -20), ('Aaron', 'RI', 200);
insert into trainers (trainerName, campus, caffeineLevel) values
('Marielle', 'USF', 60), ('Pushpinder', 'UTA', 50), ('Nick', 'UTA', 75), ('Mark', 'WVU', 16), ('Fred', 'UTA', 25), ('Juniper', 'USF', 197);
insert into batch (associateID, trainerID) values
(1,5), (2,3), (5,5), (6,1),(7, 4), (8,1);

select * from associates;
select * from trainers;

create table income
(
    id serial primary key,
    NameID varchar(100) not null,
    Ammount FLOAT not null
);

create table expense
(
    id serial primary key,
    NameID varchar(100) not null,
    Ammount FLOAT
);













create table totals
(
    id serial primary key,
    Ammount int
);


drop table totals



Create procedure Sumates(IN val1 int,IN val2 int)
Language plpgsql
as $$
declare
    sum int;
begin
    sum := val1 + val2;
    INSERT INTO totals (Ammount) VALUES (sum);
end;$$


Call Sumates(9,5);


select * from totals

Drop table totals
Drop table expense
Drop table income
Drop table batch
Drop table trainers
Drop table associates




create table client
(
    clientID serial primary key,
    clientName varchar(100) not null,
    clientEmail varchar(100) not null
);

create table shoplist
(
    itemID serial primary key,
    sClientID int REFERENCES client(clientID),
    productName varchar(100) not null,
    quantity real not null
);

create table orders
(
    orderID serial primary key,
    oClientID int REFERENCES client(clientID),
    total real
);

create table expenses
(
    lineItemID serial primary key,
    expItemID int REFERENCES shoplist(itemID),
    expOrderID int REFERENCES orders(orderID),
    price real,
    subtotal real 
);

drop table client
drop table shoplist
drop table orders
drop table expenses

select * from client,orders,shoplist,expenses

select * from client
select * from shoplist
select * from orders
select * from expenses



insert into client (clientName, clientEmail) values ('Emma','Emma_email');
insert into client (clientName, clientEmail) values ('Tammy', 'Tammy_email');
insert into shoplist (sClientID, productName, quantity) values (1,'Taco',3);
insert into shoplist (sClientID, productName, quantity) values (1,'Store',2);
insert into shoplist (sClientID, productName, quantity) values (2,'Tuba',8);

insert into orders (oClientID,total) values (1,0);
insert into orders (oClientID,total) values (2,0);
insert into expenses (expItemID,expOrderID,price,subtotal) values (1,1,0,0);
update shoplist set productName='Store' where productName='Taco';


update expenses set price=0.00 from shoplist
where expenses.expItemID = shoplist.itemID;
delete from orders
delete from expenses
update orders set total=7 from client where client.clientID = orders.oClientID;
select clientID from client where client.clientName='Tammy';

select client.clientID, client.clientName, client.clientEmail, orders.total from
client LEFT JOIN orders on client.clientID = orders.oClientID 
group by client.clientID, orders.total order by client.clientID ASC;