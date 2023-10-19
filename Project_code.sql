CREATE DATABASE HOTEL1;
USE HOTEL1;

/* Create a Hotel table */	
CREATE TABLE hotel_T
(hotel_id int(11) AUTO_INCREMENT NOT NULL,
hotel_name varchar(30) NOT NULL,
h_street varchar(30),
h_city varchar(30),
h_state varchar(30),
h_zipcode int(10),
phonenum varchar(20),
rating int(5),
website varchar(30),
CONSTRAINT hotel_pk PRIMARY KEY (hotel_id));

/* Create a Department table */	
CREATE TABLE department_T
(dept_id int(11) AUTO_INCREMENT NOT NULL,
d_name varchar(30),
CONSTRAINT department_pk PRIMARY KEY (dept_id));

/* Create a Employee table */			
CREATE TABLE employee_T			
(emp_id int(11) AUTO_INCREMENT NOT NULL,			
e_firstname varchar(11),			
e_lastname varchar(11),			
designation varchar(30),			
salary int(10),			
e_phonenum varchar(20),			
e_street varchar(30),			
e_city varchar(30),			
e_state varchar(10),			
e_zip int(10),	
hotel_id int(11),
dept_id int(11),		
CONSTRAINT employee_pk PRIMARY KEY (emp_id),
CONSTRAINT employee_fk1 FOREIGN KEY (hotel_id) REFERENCES hotel_T (hotel_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT employee_fk2 FOREIGN KEY (dept_id) REFERENCES department_T (dept_id) ON UPDATE CASCADE ON DELETE CASCADE);			

/* Create Service table */
CREATE TABLE service_T(
service_id int(11) NOT NULL AUTO_INCREMENT,
service_type varchar(30),
service_charge int(10),
CONSTRAINT service_pk PRIMARY KEY(service_id));

/* Create a Guest table */	
CREATE TABLE guest_T	
(guest_id int(11) AUTO_INCREMENT NOT NULL,	
id_type varchar(30),	
guestName varchar(30),	
g_street varchar(30),	
g_city varchar(30),
g_state varchar(30),	
g_zip int(10),	
g_phonenumber varchar(20),		
CONSTRAINT guest_pk PRIMARY KEY (guest_id));

/* Create Room table */
create table room_T(
room_id int(11) not null auto_increment,
price int(10),
roomtype varchar(30),
capacity varchar(10),
hotel_id int(11),
CONSTRAINT rm_pk PRIMARY KEY (room_id),
CONSTRAINT rm_fk FOREIGN KEY(hotel_id) references hotel_T(hotel_id)
on update cascade on delete cascade);

/* Create Booking_info table */			
CREATE TABLE Bookinfo_T			
(booking_id int(11) AUTO_INCREMENT NOT NULL,			
checkIn_date date,			
checkOut_date date,			
checkIn_time time,			
checkOut_time time,			
Paymentmode varchar(11),
guest_id int(11),
room_id int(11),			
CONSTRAINT booking_pk PRIMARY KEY (booking_id),
CONSTRAINT bookinfo_fk1 FOREIGN KEY (guest_id) REFERENCES guest_T (guest_id) ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT bookinfo_fk2 FOREIGN KEY (room_id) REFERENCES room_T (room_id) ON UPDATE CASCADE ON DELETE CASCADE);

/* Create a Dependent table */	
CREATE TABLE Dependent_T	
(guest_id int(11),		
dependentName varchar(30),	
relationship varchar(30),			
constraint dependent_pk primary key (guest_id, dependentName),
constraint dependent_fk1 foreign key (guest_id) references guest_T (guest_id) ON UPDATE CASCADE ON DELETE CASCADE);	

/* Create Room Service table */
CREATE TABLE roomservice_T(
service_id int(11),
room_id int(11),
CONSTRAINT rmsv_fk1 foreign key(service_id) references service_T(service_id) ON UPDATE CASCADE ON DELETE CASCADE,
constraint rmsv_fk2 foreign key(room_id) references room_t(room_id) ON UPDATE CASCADE ON DELETE CASCADE);	

/* Inserting values in Hotel table */
INSERT INTO hotel_T (hotel_id, hotel_name, h_street, h_city, h_state, h_zipcode, phonenum, rating, website) VALUES
(1001, 'Regal', '200 Walnut', 'Metropolis', 'Illinois', 62960, '7736005562', 4, 'www.regalhotels.com'),
(1002, 'Royal', '860 Fulton', 'Oak Run', 'California', 96069, '6192491422', 3, 'www.royalhotels.com'),
(1003, 'Luxor', '321 Highland', 'Wolf Creek', 'Montana', 59648, '4062303543', 5, 'www.luxorhotel.com'),
(1004, 'Mandalay', '262 Blackburn', 'Fort Myers', 'Florida', 33901, '8139656478', 3, 'www.mandalayhotel.com'),
(1005, 'Flamingo', '735 University Circle', 'Hanover', 'Pennsylvania', 17332, '5706708910', 4, 'www.flamingohotel.com'),
(1006, 'Plazzo', '9930 South Sutor', 'Bedford', 'Massachusetts', 01730, '5085609358', 4, 'www.plazzohotel.com'),
(1007, 'Harrah', '31B Foster Ave', 'Orlando', 'Florida', 32810, '3052012355', 5, 'www.harrahhotel.com'),
(1008, 'Palms', '7071 West', 'Locust Grove', 'Virginia', 24072, '7576854368', 3, 'www.palmshotel.com'),
(1009, 'Tropicana', '4996 Coal Street', 'Mahaffey', 'Pennsylvania', 15757, '2673140079', 3, 'www.tropicanahotel.com'),
(1010, 'Westgate', '3429 Oak Way', 'Omaha', 'Nebraska', 02026, '4352289765', 5, 'www.westgatehotel.com'),
(1011, 'Encore', '283 Augusta Park', 'Charleston', 'Virginia', 25301, '3045500902', 4, 'www.encorehotel.com'),
(1012, 'Orleans', '4629 Hog Camp Road', 'Summit', 'Illinois', 60501, '8472697340', 5, 'www.orleanshotel.com'),
(1013, 'Circa', '746 Buck Drive', 'South Burlington', 'Vermont', 05403, '8027371063', 3, 'www.circahotel.com'),
(1014, 'Delano', '4076 Oak Drive', 'Santa Pier', 'Alabama', 36602, '2514985435', 3, 'www.delanohotel.com'),
(1015, 'Skyloft', '1543 Hedge Street', 'Weehawken', 'New Jersey', 07087, '8622361120', 4, 'www.skylofthotel.com'),
(1016, 'Ellis', '1029 Roane Avenue', 'Baltimore', 'Maryland', 21202, '4434180572', 5, 'www.ellishotel.com'),
(1017, 'Nobu', '4841 Zimmerman Lane', 'Santa Ana', 'California', 92705, '7144839964', 4, 'www.nobuhotel.com'),
(1018, 'Victorian', '3255 Wiseman Street', 'Loudon', 'Tennessee', 37774, '8658983232', 4, 'www.victorianhotel.com'),
(1019, 'Fremont', '3755 Burke Street', 'Cambridge', 'Massachusetts', 02141, '7812239111', 5, 'www.fremonthotel.com'),
(1020, 'Tahiti', '2745 Drummond Street', 'Bloomfield', 'New Jersey', 07003, '8622029057', 4, 'www.tahitihotel.com');

/* Inserting values in Department table */
INSERT INTO department_T (dept_id, d_name) VALUES
(100, 'Housekeeping'),
(101, 'Sales'),
(102, 'Operations'),
(103, 'Marketing'),
(104, 'Staffing & Career'),
(105, 'Technology'),
(106, 'Maintenance'),
(107, 'Human Resource'),
(108, 'Front Office'),
(109, 'Food and Beverage'),
(110, 'Reservations'),
(111, 'Revenue Management'),
(112, 'Software'),
(113, 'Distribution'),
(114, 'Cashier office'),
(115, 'Business center');

/* Inserting values in Employee table */
INSERT INTO employee_T (emp_id, e_firstname,e_lastname, designation,salary,e_phonenum,e_street, e_city, e_state, e_zip, hotel_id, dept_id) VALUES																					
(900,'James','Smith','Room attendant',2000,'4949502738','3977 Chicago Ave.','Riverside','CA',92507, 1002, 100),																					
(905,'Thomas','Miller','Hotel manager',4000,'9840281637','4489 W Sunset Ave','Washington','AR',72764, 1003, 103),																					
(950,'Williams','Clark','Receptionist',2500,'4639482947','14500 W Colfax Ave' ,'Lakewood','CO',80401, 1005, 108),																					
(945,'Anton','Lopez','Parking attendant',1900,'3549202819','250 North' ,'SLC','UT',84108, 1003, 102),																					
(934,'Mark','Martin','Chef',2800,'8682738231','200 Main','Tucson','AZ',45102, 1007, 109),																					
(990,'Mike','Lee','Room attendant',2000,'6972917363','100 College','SF','CA',17118, 1009, 100),																					
(923,'Daniel','White','Assistant hotel manager',3500,'4229473829','River Rd','Junction City','WI',54443, 1018, 111),																					
(960,'Paul','Harris','Chef',2800,'2847361028','130 University','SLC','UT',84102, 1004, 109),																					
(963,'Margaret','Taylor','Room attendant',2000,'4848253748','E Washington St','Greenville','SC',29601, 1010, 100),																					
(955,'Stepahnie','Trumph','Room attendant',2000,'3582392837','Bellevue Square','Bellevue','WA',98004, 1020, 100),																					
(980,'David','Johns','Chef',2800,'6934362960','1300 Hollywood','LA','CA',12117, 1012, 109),																					
(975,'Richard','Brown','Assistant hotel manager',3500,'4978201637','W Colonial Drive','Ococee','FL',34761, 1017, 111),																					
(991,'Charles','Smith','Chef',2800,'9809482628','SW Barbur Boulevard','Portland','OR',97232, 1016, 109),																					
(920,'Robert','Lee','Receptionist',2500,'4087320496','W Lincoln Hwy','Exton','PA',19341, 1015, 108),																					
(921,'George','White','Hotel manager',4000,'2378105735','130 Descanso Dr','San Jose','CA',95134, 1020, 103),																					
(933,'Jane','Jackson','Room attendant',2000,'7643582716','1030 Northpark Center','Dallas','TX',75225, 1011, 100),																					
(976,'Jeff','Moore','Assistant hotel manager',3500,'4076301937','3201 Lawrence Rd','Dallas','TX',75229, 1015, 111),																					
(999,'Jason','Jonas','Chef',2800,'2009394728','20 Descanso Dr','San Jose','CA',95134, 1018, 109),																					
(940,'Kevin','Anderson','Parking attendant',1900,'9879402938','Mirada St','San Jose','CA',95134, 1013, 102),																					
(988,'Michael','Wilson','Room attendant',2000,'6039201849','Popular Avenue','Memphis','TN',38119, 1014, 100);

/* Inserting values in Service table */
INSERT INTO service_T (service_id, service_type, service_charge) VALUES
(61000,'Breakfast',75),
(61002,'Laundry',150),
(61003,'Gym',30),
(61004,'Spa',50);

/* Inserting values in Guest table */
INSERT INTO guest_T(guest_id, id_type, guestName, g_street, g_city, g_state, g_zip, g_phonenumber) VALUES						
(2001,'Driving License','Bob Donald','Columbus St','Dublin','CA',94568, '9982738231'),						
(2002,'Passport','Lilly Sue','Union St','Oakland','CA',94607,'2872917363'),						
(2003,'Student ID','Mary Comb','Highway St','North Bend','OR' ,97459, '4829473829'),						
(2004,'Military Identification Card','Xing Hang','Shoshoni St','Thermopolis','WY' ,82443, '2847361028'),						
(2005,'Social Security Card','Peter Buck','Rio Bravo Blvd SW','Albuquerque','NM',87105, '4836253748'),						
(2006,'Insurance Card','John Walker','Monarch Highway','San Antanio','TX',78204, '3627392837'),						
(2007,'Voter Registration Card','Melissa Harry','River Rd','Junction City','WI',54443,'2748362960'),						
(2008,'State ID card','Kim Gusto','Main St','Clay','WV',25043, '3859201637'),						
(2009,'Passport','Cristine Fischer','E Washington St','Greenville','SC',29601, '3749502738'),						
(2010,'Social Security Card','Moore Scott','North Kierland Blvd','Scottsdale','AZ',85254,'5840281637'),						
(2011,'Driving License','Baker Hall','Avocado Ave','Newport Beach','CA' ,92660, '2839482947'),						
(2012,'Voter Registration Card','Jose Solomon','Buena Vista Drive','Lake Buena Vista','FL' ,32830, '22849202819'),						
(2013,'Social Security Card','Micheal Chenn','Mauna Lani Dr.','Kohala Coast','HI',96743, '3950482628'),						
(2014,'State ID card','Rahul Dutt','Beachwalk','Honolulu','HI',96815, '5849320496'),						
(2015,'Insurance Card','Evelyn Voron','Bellevue Square','Bellevue','WA',98004,'3829105735'),						
(2016,'Military Identification Card','Racheal Brundson','Eastchase Parkway','Montgomery','AL',36117, '6940382716'),						
(2017,'Social Security Card','Perez Lee','Broadway','New York','NY' ,10010, '3758301937'),						
(2018,'Voter Registration Card','Smith Miller','Reservoir Ave','Cranston','RI',29101, '2910394728'),						
(2019,'Insurance Card','Clark Lewis','Popular Avenue','Memphis','TN',38119, '1839402938'),						
(2020,'Passport','Davis Lopez','University Pkwy','Orem','UT',84097,'2719201849');	

/* Inserting values in Room table */					
INSERT INTO room_t (room_id, price, roomtype, capacity, hotel_id) VALUES
(8001,200,'Regular',2,1001),
(8002,500,'Premium',3,1005),
(8003,200,'Regular',2,1004),
(8004,500,'Premium',3,1003),
(8005,350,'Premium',2,1006),
(8006,300,'Regular',3,1009),
(8007,200,'Regular',2,1001),
(9001,200,'Regular',2,1005),
(9002,500,'Premium',3,1012),
(9003,200,'Regular',2,1011),
(9004,500,'Premium',3,1004),
(9005,350,'Premium',2,1005),
(9006,300,'Regular',3,1002),
(9007,200,'Regular',2,1003),
(7001,200,'Regular',2,1008),
(7002,500,'Premium',3,1001),
(7003,200,'Regular',2,1007),
(7004,500,'Premium',3,1014),
(7005,350,'Premium',2,1006),
(7006,300,'Regular',3,1001),
(7007,200,'Regular',2,1009),
(7008,200,'Regular',2,1016),
(7009,200,'Regular',2,1002),
(9008,500,'Premium',3,1017),
(9009,500,'Premium',3,1002),
(6001,500,'Premium',3,1012),
(6002,200,'Regular',2,1007),
(6003,200,'Regular',2,1018),
(6004,200,'Regular',2,1010),
(6005,300,'Regular',3,1002),
(6006,200,'Regular',2,1015),
(6007,200,'Regular',2,1008),
(6008,200,'Regular',2,1018),
(6009,350,'Premium',2,1006),
(5001,350,'Premium',2,1013),
(5002,200,'Regular',2,1010),
(5003,350,'Premium',2,1019),
(5004,300,'Regular',3,1009),
(5005,500,'Premium',3,1011),
(5006,350,'Premium',2,1019),
(5007,500,'Premium',3,1014),
(5008,500,'Premium',3,1020),
(5009,200,'Regular',2,1015),
(8008,350,'Premium',2,1013),
(8009,200,'Regular',2,1020);

/* Inserting values in Booking Info table */
INSERT INTO Bookinfo_T(booking_id,checkIn_date,checkOut_date,checkIn_time,checkOut_time,Paymentmode, guest_id, room_id) VALUES								
(58802,'2019-11-11','2019-11-13','9:00:00','11:00:00','Card',2002, 8001),								
(58004,'2021-12-21','2021-12-25','12:30:00','22:30:00','Cash', 2004, 7001),								
(58001,'2018-11-03','2018-11-13','12:05:00','23:05:00','Cash', 2005, 7005),								
(58009,'020-01-11','2020-01-12','10:00:00','11:00:00','Cash', 2002, 8004),								
(58003,'2021-11-05','2021-11-10','8:15:00','10:15:00','Cash', 2007, 9005),								
(58005,'2019-06-07','2019-06-09','10:30:00','11:30:00','Cash', 2018, 5009),								
(58007,'2019-09-12','2019-09-14','12:05:00','13:00:00','Cash', 2015, 5003),								
(58008,'2021-11-30','2021-12-01','16:00:00','18:00:00','Cash', 2013, 6004),								
(58010,'2022-05-19','2022-05-29','19:00:00','18:00:00','Cash', 2010, 7002),								
(58006,'2022-04-30','2022-05-05','20:30:00','12:05:00','Cash', 2009, 7001),								
(58011,'2020-03-21','2020-03-24','6:00:00','11:00:00','Card', 2002, 8004),								
(58012,'2019-06-18','2019-06-29','11:00:00','12:07:00','Card', 2005, 5005),								
(58015,'2019-09-08','2019-09-10','15:15:00','13:00:00','Card', 2004, 6008),								
(58013,'2022-06-24','2022-06-28','14:30:00','13:00:00','Card', 2009, 9003),								
(58014,'2020-09-02','2020-09-10','12:15:00','14:30:00','Card', 2010, 6004),								
(58016,'2019-05-06','2019-05-07','16:04:00','16:00:00','Cash', 2012, 5001),								
(58018,'2020-02-27','2020-02-29','13:00:00','12:05:00','Card', 2014, 5006),								
(58020,'2021-11-02','2021-11-05','9:00:00','10:30:00','Card', 2013, 7002),								
(58019,'2019-07-29','2019-07-30','12:07:00','10:00:00','Card', 2018, 7005),								
(58021,'2019-11-11','2019-11-15','5:00:00','9:00:00','Card', 2020, 7001);	

/* Inserting values in Dependent table */							
INSERT INTO Dependent_T(guest_id, dependentName, relationship) VALUES			
(2001,'Oliver','Father'),			
(2002,'Noah','Mother'),			
(2003,'Emma','Sister'),			
(2004,'Liam','Friend'),			
(2005,'Mia','Spouse'),			
(2006,'William','Friend'),			
(2007,'Henry','Son'),			
(2008,'Darwin','Spouse'),			
(2009,'Theodore','Friend'),			
(2010,'Isabella','Daughter'),			
(2011,'Benjamin','Son'),			
(2012,'Lucas','Friend'),			
(2013,'Harper','Friend'),			
(2014,'Amelia','Sister'),			
(2015,'Elijah','Friend'),			
(2016,'Ava','Mother'),			
(2017,'Evelyn','Mother'),			
(2018,'James','Brother'),			
(2019,'Charlotte','Spouse'),			
(2020,'Sophia','Sister');

/* Inserting values in Room Service table */
INSERT INTO roomservice_T (service_id, room_id) VALUES
(61000, 8001),
(61002, 7005),
(61004, 5006),
(61000, 9005),
(61003, 8007),
(61004, 9003),
(61002,7004),
(61000, 6005),
(61000, 9004),
(61002, 7001),
(61003, 6002),
(61002, 8006),
(61000, 9002),
(61004, 8004),
(61002, 5001),
(61003, 7003),
(61004, 9006),
(61000, 7002),
(61000, 8003),
(61000, 9007);			
			

/* SQL QUERIES */
/* JOINS */
	
/*cross join*/								
select * from hotel_T cross join department_T cross join employee_T cross join  service_T cross join guest_T								
cross join room_T cross join  Bookinfo_T cross join  Dependent_T cross join roomservice_T;								

/*inner join*/								
/*Employee names and department name of employees who live in CA */								
select distinct employee_T.e_firstname,employee_T.e_lastname,employee_T.e_state,department_T.d_name								
from employee_T inner join department_T								
on employee_T.dept_id=department_T.dept_id								
where e_state='CA';								
								
/*left join*/								
/*guests and their dependents name and relationship*/								
select distinct guest_T.guest_id,guest_T.guestName,Dependent_T.dependentName,Dependent_T.relationship								
from guest_T left join Dependent_T								
on guest_T.guest_id=Dependent_T.guest_id;

/*Rooms which took any kind of service using both natural and inner join*/	
/* Natural Join */							
select distinct roomservice_T.room_id								
from roomservice_T natural join room_T;	

/* Inner Join */							
select distinct roomservice_T.room_id								
from roomservice_T inner join room_T								
on roomservice_T.room_id=room_T.room_id;								
								
/*Average price of premium rooms)*/								
select avg(room_T.price) as 'Avg Price'							
from room_T								
where roomtype = 'Premium';		

/*Employee details for employee whose name starts with M*/
SELECT * from employee_T where 	e_firstname LIKE 'M%';	

/*Guest information for guest who checked-in on 2020-03-21*/
select * from guest_T 
INNER JOIN Bookinfo_T 
ON guest_T.guest_id = Bookinfo_T.guest_id
WHERE Bookinfo_T.checkIn_date = '2020-03-21';
								
/* Creating Views */
/* 1st View */
CREATE VIEW v_hotel AS								
SELECT room_t.room_id, price, roomtype, capacity, hotel_id, booking_id, checkIn_date, checkOut_date, checkIn_time, checkOut_time,								
Paymentmode, guest_id								
FROM room_t Inner join bookinfo_t on room_t.room_id=bookinfo_t.room_id;								

select * from v_hotel;

update v_hotel set roomtype ='pre' where roomtype ='Premium';								
select * from v_hotel;
select * from room_t;

/*update cell value in view. update to view will update cell value in original table too*/								
UPDATE v_hotel1 SET Paymentmode = 'CC' WHERE Paymentmode = 'Card';								
select * from bookinfo_t;	

/* 2nd View */
CREATE VIEW v_hotel2 AS								
SELECT hotel_t.hotel_id, hotel_name, h_state, rating, emp_id, e_firstname, e_lastname,								
designation, department_t.dept_id, d_name								
FROM hotel_t inner join employee_t on hotel_t.hotel_id=employee_t.hotel_id inner join								
department_t on employee_t.dept_id=department_t.dept_id;								
								
select * from v_hotel2;								
							
/*update cell value in view. update to view will update cell value in original table too*/								
UPDATE v_hotel2 SET d_name = 'Reception' WHERE d_name = 'Front Office';	
select * from department_t;	

/* stored procedure */
/* 1st stored procedure */
/* Selecting employees from a particular state */
DELIMITER //
CREATE PROCEDURE sp_emp_by_city(IN instate VARCHAR(10))
BEGIN
	SELECT * FROM employee_T WHERE e_city = instate;
END//
DELIMITER ;

CALL sp_emp_by_city('Dallas');

/* 2nd stored procedure */
/* Find all guest information */
DELIMITER //
CREATE PROCEDURE sp_guest()
BEGIN
	SELECT * FROM guest_T;
END//
DELIMITER ;

CALL sp_guest;

Select guestName
from guest_t
where g_state = 'CA' or g_state = 'OR' or g_state = 'NM' or g_state = 'TX' or g_state = 'WI';		

Select guestName, g_state
from guest_t
where g_state in ('CA','OR','NM','TX','WI')
order by  g_state, guestName desc;					
								
Select room_id,roomtype, sum(price) as pc
from room_t where roomtype ='Regular'
group by roomtype, room_id
having pc>200;

select roomtype, avg(capacity) as cap
from room_t
group by roomtype
having cap>2.5;
				
SELECT Product_Description, Standard_Price
FROM PRODUCT_t
WHERE Product_Description = ‘%Desk’;

SELECT CUSTOMER_STATE, COUNT(CUSTOMER_STATE)
FROM CUSTOMER_T
where COUNT(CUSTOMER_STATE) > 1
GROUP BY CUSTOMER_STATE;

SELECT COUNT(capacity)
FROM room_t
having COUNT(capacity) > 2 ; 
								
								
								
								

	