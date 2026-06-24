create schema project;
use project;
-- ----------- COURIER TRACKING SYSTEM  ----------------------------------------------------------- 
   
-- 15 tables+ customer table and employees table 100 records +remaining table 50 records + query

-- Customers table
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
CustomerName VARCHAR(50),
Phone VARCHAR(15),
Email VARCHAR(50),
Address VARCHAR(100)
);
-- Packages table
CREATE TABLE Packages(
PackageID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
Weight DECIMAL(5,2),
PackageType VARCHAR(30),
BookingDate DATE,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);
-- Branches table
CREATE TABLE Branches(
BranchID INT PRIMARY KEY AUTO_INCREMENT,
BranchName VARCHAR(50),
City VARCHAR(50)
);
-- Employees table
CREATE TABLE Employees(
EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
EmployeeName VARCHAR(50),
Designation VARCHAR(30),
BranchID INT,
FOREIGN KEY(BranchID) REFERENCES Branches(BranchID)
);
-- DeliveryAgents
CREATE TABLE DeliveryAgents(
AgentID INT PRIMARY KEY AUTO_INCREMENT,
EmployeeID INT,
VehicleNo VARCHAR(20),
FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
);
-- Shipments table
CREATE TABLE Shipments(
ShipmentID INT PRIMARY KEY AUTO_INCREMENT,
PackageID INT,
SourceBranch INT,
DestinationBranch INT,
DispatchDate DATE,
FOREIGN KEY(PackageID) REFERENCES Packages(PackageID)
);
-- TrackingStatus table
CREATE TABLE TrackingStatus(
StatusID INT PRIMARY KEY AUTO_INCREMENT,
ShipmentID INT,
StatusText VARCHAR(50),
StatusDate DATETIME,
FOREIGN KEY(ShipmentID) REFERENCES Shipments(ShipmentID)
);
-- Payments table
CREATE TABLE Payments(
PaymentID INT PRIMARY KEY AUTO_INCREMENT,
PackageID INT,
Amount DECIMAL(10,2),
PaymentDate DATE,
FOREIGN KEY(PackageID) REFERENCES Packages(PackageID)
);
-- Delivery table
CREATE TABLE Delivery(
DeliveryID INT PRIMARY KEY AUTO_INCREMENT,
ShipmentID INT,
AgentID INT,
DeliveryDate DATE,
Status VARCHAR(30),
FOREIGN KEY(ShipmentID) REFERENCES Shipments(ShipmentID),
FOREIGN KEY(AgentID) REFERENCES DeliveryAgents(AgentID)
);
-- Vehicle table
CREATE TABLE Vehicle(
VehicleID INT PRIMARY KEY AUTO_INCREMENT,
VehicleNo VARCHAR(20),
VehicleType VARCHAR(20)
);
-- Route table
CREATE TABLE Route(
RouteID INT PRIMARY KEY AUTO_INCREMENT,
SourceCity VARCHAR(50),
DestinationCity VARCHAR(50)
);
-- Feedback table
CREATE TABLE Feedback(
FeedbackID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
Rating INT,
Comments VARCHAR(100),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);
-- Insurance table
CREATE TABLE Insurance(
InsuranceID INT PRIMARY KEY AUTO_INCREMENT,
PackageID INT,
Provider VARCHAR(50),
Amount DECIMAL(10,2),
FOREIGN KEY(PackageID) REFERENCES Packages(PackageID)
);
-- Warehouse table
CREATE TABLE Warehouse(
WarehouseID INT PRIMARY KEY AUTO_INCREMENT,
BranchID INT,
Capacity INT,
FOREIGN KEY(BranchID) REFERENCES Branches(BranchID)
);
-- Compliant table
CREATE TABLE Complaint(
ComplaintID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
ComplaintText VARCHAR(100),
Status VARCHAR(30),
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers(CustomerID,CustomerName,Phone,Email,Address) VALUES
(1,'Sridevi','9000000001','sridevi@gmail.com','Chennai'),
(2,'Arun','9000000002','arun@gmail.com','Coimbatore'),
(3,'Priya','9000000003','priya@gmail.com','Madurai'),
(4,'Kavin','9000000004','kavin@gmail.com','Trichy'),
(5,'Divya','9000000005','divya@gmail.com','Salem'),
(6,'Ravi','9000000006','ravi@gmail.com','Erode'),
(7,'Anu','9000000007','anu@gmail.com','Vellore'),
(8,'Kumar','9000000008','kumar@gmail.com','Karur'),
(9,'Vijay','9000000009','vijay@gmail.com','Tirunelveli'),
(10,'Meena','9000000010','meena@gmail.com','Thanjavur'),
(11,'Ajay','9000000011','ajay@gmail.com','Dindigul'),
(12,'Deepa','9000000012','deepa@gmail.com','Tiruppur'),
(13,'Hari','9000000013','hari@gmail.com','Nagercoil'),
(14,'Nila','9000000014','nila@gmail.com','Kanchipuram'),
(15,'John','9000000015','john@gmail.com','Cuddalore'),
(16,'Suresh','9000000016','suresh@gmail.com','Hosur'),
(17,'Kavitha','9000000017','kavitha@gmail.com','Ooty'),
(18,'Mani','9000000018','mani@gmail.com','Kumbakonam'),
(19,'Lakshmi','9000000019','lakshmi@gmail.com','Rajapalayam'),
(20,'Bala','9000000020','bala@gmail.com','Sivakasi'),
(21,'Senthil','9000000021','senthil@gmail.com','Chennai'),
(22,'Geetha','9000000022','geetha@gmail.com','Coimbatore'),
(23,'Ramesh','9000000023','ramesh@gmail.com','Madurai'),
(24,'Anitha','9000000024','anitha@gmail.com','Trichy'),
(25,'Prakash','9000000025','prakash@gmail.com','Salem'),
(26,'Saranya','9000000026','saranya@gmail.com','Erode'),
(27,'Dinesh','9000000027','dinesh@gmail.com','Vellore'),
(28,'Vasantha','9000000028','vasantha@gmail.com','Karur'),
(29,'Karthik','9000000029','karthik@gmail.com','Tirunelveli'),
(30,'Padma','9000000030','padma@gmail.com','Thanjavur'),
(31,'Murugan','9000000031','murugan@gmail.com','Dindigul'),
(32,'Selvi','9000000032','selvi@gmail.com','Tiruppur'),
(33,'Ganesh','9000000033','ganesh@gmail.com','Nagercoil'),
(34,'Rekha','9000000034','rekha@gmail.com','Kanchipuram'),
(35,'Vignesh','9000000035','vignesh@gmail.com','Cuddalore'),
(36,'Sumathi','9000000036','sumathi@gmail.com','Hosur'),
(37,'Rajesh','9000000037','rajesh@gmail.com','Ooty'),
(38,'Pooja','9000000038','pooja@gmail.com','Kumbakonam'),
(39,'Siva','9000000039','siva@gmail.com','Rajapalayam'),
(40,'Kavya','9000000040','kavya@gmail.com','Sivakasi'),
(41,'Ashwin','9000000041','ashwin@gmail.com','Chennai'),
(42,'Malathi','9000000042','malathi@gmail.com','Coimbatore'),
(43,'Naveen','9000000043','naveen@gmail.com','Madurai'),
(44,'Revathi','9000000044','revathi@gmail.com','Trichy'),
(45,'Harish','9000000045','harish@gmail.com','Salem'),
(46,'Suganya','9000000046','suganya@gmail.com','Erode'),
(47,'Balaji','9000000047','balaji@gmail.com','Vellore'),
(48,'Nirmala','9000000048','nirmala@gmail.com','Karur'),
(49,'Saravanan','9000000049','saravanan@gmail.com','Tirunelveli'),
(50,'Kamala','9000000050','kamala@gmail.com','Thanjavur'),
(51,'Praveen','9000000051','praveen@gmail.com','Dindigul'),
(52,'Janaki','9000000052','janaki@gmail.com','Tiruppur'),
(53,'Surya','9000000053','surya@gmail.com','Nagercoil'),
(54,'Yamuna','9000000054','yamuna@gmail.com','Kanchipuram'),
(55,'Arjun','9000000055','arjun@gmail.com','Cuddalore'),
(56,'Nalini','9000000056','nalini@gmail.com','Hosur'),
(57,'Vinoth','9000000057','vinoth@gmail.com','Ooty'),
(58,'Shanthi','9000000058','shanthi@gmail.com','Kumbakonam'),
(59,'Manoj','9000000059','manoj@gmail.com','Rajapalayam'),
(60,'Vani','9000000060','vani@gmail.com','Sivakasi'),
(61,'Sugumar','9000000061','sugumar@gmail.com','Chennai'),
(62,'Gowri','9000000062','gowri@gmail.com','Coimbatore'),
(63,'Thirumal','9000000063','thirumal@gmail.com','Madurai'),
(64,'Hema','9000000064','hema@gmail.com','Trichy'),
(65,'Prasath','9000000065','prasath@gmail.com','Salem'),
(66,'Radha','9000000066','radha@gmail.com','Erode'),
(67,'Nishanth','9000000067','nishanth@gmail.com','Vellore'),
(68,'Usha','9000000068','usha@gmail.com','Karur'),
(69,'Arunkumar','9000000069','arunkumar@gmail.com','Tirunelveli'),
(70,'Vijaya','9000000070','vijaya@gmail.com','Thanjavur'),
(71,'Magesh','9000000071','magesh@gmail.com','Dindigul'),
(72,'Chitra','9000000072','chitra@gmail.com','Tiruppur'),
(73,'Selvam','9000000073','selvam@gmail.com','Nagercoil'),
(74,'Mythili','9000000074','mythili@gmail.com','Kanchipuram'),
(75,'Nandha','9000000075','nandha@gmail.com','Cuddalore'),
(76,'Bharathi','9000000076','bharathi@gmail.com','Hosur'),
(77,'Sathish','9000000077','sathish@gmail.com','Ooty'),
(78,'Sundari','9000000078','sundari@gmail.com','Kumbakonam'),
(79,'Durai','9000000079','durai@gmail.com','Rajapalayam'),
(80,'Kokila','9000000080','kokila@gmail.com','Sivakasi'),
(81,'Elango','9000000081','elango@gmail.com','Chennai'),
(82,'Thenmozhi','9000000082','thenmozhi@gmail.com','Coimbatore'),
(83,'Jagan','9000000083','jagan@gmail.com','Madurai'),
(84,'Rajalakshmi','9000000084','rajalakshmi@gmail.com','Trichy'),
(85,'Krishnan','9000000085','krishnan@gmail.com','Salem'),
(86,'Ponni','9000000086','ponni@gmail.com','Erode'),
(87,'Venkat','9000000087','venkat@gmail.com','Vellore'),
(88,'Ambika','9000000088','ambika@gmail.com','Karur'),
(89,'Tamilarasan','9000000089','tamilarasan@gmail.com','Tirunelveli'),
(90,'Jeya','9000000090','jeya@gmail.com','Thanjavur'),
(91,'Sridevi2','9000000091','sridevi2@gmail.com','Dindigul'),
(92,'Arun2','9000000092','arun2@gmail.com','Tiruppur'),
(93,'Priya2','9000000093','priya2@gmail.com','Nagercoil'),
(94,'Kavin2','9000000094','kavin2@gmail.com','Kanchipuram'),
(95,'Divya2','9000000095','divya2@gmail.com','Cuddalore'),
(96,'Ravi2','9000000096','ravi2@gmail.com','Hosur'),
(97,'Anu2','9000000097','anu2@gmail.com','Ooty'),
(98,'Kumar2','9000000098','kumar2@gmail.com','Kumbakonam'),
(99,'Vijay2','9000000099','vijay2@gmail.com','Rajapalayam'),
(100,'Meena2','9000000100','meena2@gmail.com','Sivakasi'),
(101,'Ajay2','9000000101','ajay2@gmail.com','Chennai'),
(102,'Deepa2','9000000102','deepa2@gmail.com','Coimbatore'),
(103,'Hari2','9000000103','hari2@gmail.com','Madurai'),
(104,'Nila2','9000000104','nila2@gmail.com','Trichy'),
(105,'John2','9000000105','john2@gmail.com','Salem'),
(106,'Suresh2','9000000106','suresh2@gmail.com','Erode'),
(107,'Kavitha2','9000000107','kavitha2@gmail.com','Vellore'),
(108,'Mani2','9000000108','mani2@gmail.com','Karur'),
(109,'Lakshmi2','9000000109','lakshmi2@gmail.com','Tirunelveli'),
(110,'Bala2','9000000110','bala2@gmail.com','Thanjavur'),
(111,'Senthil2','9000000111','senthil2@gmail.com','Dindigul'),
(112,'Geetha2','9000000112','geetha2@gmail.com','Tiruppur'),
(113,'Ramesh2','9000000113','ramesh2@gmail.com','Nagercoil'),
(114,'Anitha2','9000000114','anitha2@gmail.com','Kanchipuram'),
(115,'Prakash2','9000000115','prakash2@gmail.com','Cuddalore'),
(116,'Saranya2','9000000116','saranya2@gmail.com','Hosur'),
(117,'Dinesh2','9000000117','dinesh2@gmail.com','Ooty'),
(118,'Vasantha2','9000000118','vasantha2@gmail.com','Kumbakonam'),
(119,'Karthik2','9000000119','karthik2@gmail.com','Rajapalayam'),
(120,'Padma2','9000000120','padma2@gmail.com','Sivakasi'),
(121,'Murugan2','9000000121','murugan2@gmail.com','Chennai'),
(122,'Selvi2','9000000122','selvi2@gmail.com','Coimbatore'),
(123,'Ganesh2','9000000123','ganesh2@gmail.com','Madurai'),
(124,'Rekha2','9000000124','rekha2@gmail.com','Trichy'),
(125,'Vignesh2','9000000125','vignesh2@gmail.com','Salem'),
(126,'Sumathi2','9000000126','sumathi2@gmail.com','Erode'),
(127,'Rajesh2','9000000127','rajesh2@gmail.com','Vellore'),
(128,'Pooja2','9000000128','pooja2@gmail.com','Karur'),
(129,'Siva2','9000000129','siva2@gmail.com','Tirunelveli'),
(130,'Kavya2','9000000130','kavya2@gmail.com','Thanjavur'),
(131,'Ashwin2','9000000131','ashwin2@gmail.com','Dindigul'),
(132,'Malathi2','9000000132','malathi2@gmail.com','Tiruppur'),
(133,'Naveen2','9000000133','naveen2@gmail.com','Nagercoil'),
(134,'Revathi2','9000000134','revathi2@gmail.com','Kanchipuram'),
(135,'Harish2','9000000135','harish2@gmail.com','Cuddalore'),
(136,'Suganya2','9000000136','suganya2@gmail.com','Hosur'),
(137,'Balaji2','9000000137','balaji2@gmail.com','Ooty'),
(138,'Nirmala2','9000000138','nirmala2@gmail.com','Kumbakonam'),
(139,'Saravanan2','9000000139','saravanan2@gmail.com','Rajapalayam'),
(140,'Kamala2','9000000140','kamala2@gmail.com','Sivakasi'),
(141,'Praveen2','9000000141','praveen2@gmail.com','Chennai'),
(142,'Janaki2','9000000142','janaki2@gmail.com','Coimbatore'),
(143,'Surya2','9000000143','surya2@gmail.com','Madurai'),
(144,'Yamuna2','9000000144','yamuna2@gmail.com','Trichy'),
(145,'Arjun2','9000000145','arjun2@gmail.com','Salem'),
(146,'Nalini2','9000000146','nalini2@gmail.com','Erode'),
(147,'Vinoth2','9000000147','vinoth2@gmail.com','Vellore'),
(148,'Shanthi2','9000000148','shanthi2@gmail.com','Karur'),
(149,'Manoj2','9000000149','manoj2@gmail.com','Tirunelveli'),
(150,'Vani2','9000000150','vani2@gmail.com','Thanjavur'),
(151,'Sugumar2','9000000151','sugumar2@gmail.com','Dindigul'),
(152,'Gowri2','9000000152','gowri2@gmail.com','Tiruppur'),
(153,'Thirumal2','9000000153','thirumal2@gmail.com','Nagercoil'),
(154,'Hema2','9000000154','hema2@gmail.com','Kanchipuram'),
(155,'Prasath2','9000000155','prasath2@gmail.com','Cuddalore'),
(156,'Radha2','9000000156','radha2@gmail.com','Hosur'),
(157,'Nishanth2','9000000157','nishanth2@gmail.com','Ooty'),
(158,'Usha2','9000000158','usha2@gmail.com','Kumbakonam'),
(159,'Arunkumar2','9000000159','arunkumar2@gmail.com','Rajapalayam'),
(160,'Vijaya2','9000000160','vijaya2@gmail.com','Sivakasi'),
(161,'Magesh2','9000000161','magesh2@gmail.com','Chennai'),
(162,'Chitra2','9000000162','chitra2@gmail.com','Coimbatore'),
(163,'Selvam2','9000000163','selvam2@gmail.com','Madurai'),
(164,'Mythili2','9000000164','mythili2@gmail.com','Trichy'),
(165,'Nandha2','9000000165','nandha2@gmail.com','Salem'),
(166,'Bharathi2','9000000166','bharathi2@gmail.com','Erode'),
(167,'Sathish2','9000000167','sathish2@gmail.com','Vellore'),
(168,'Sundari2','9000000168','sundari2@gmail.com','Karur'),
(169,'Durai2','9000000169','durai2@gmail.com','Tirunelveli'),
(170,'Kokila2','9000000170','kokila2@gmail.com','Thanjavur'),
(171,'Elango2','9000000171','elango2@gmail.com','Dindigul'),
(172,'Thenmozhi2','9000000172','thenmozhi2@gmail.com','Tiruppur'),
(173,'Jagan2','9000000173','jagan2@gmail.com','Nagercoil'),
(174,'Rajalakshmi2','9000000174','rajalakshmi2@gmail.com','Kanchipuram'),
(175,'Krishnan2','9000000175','krishnan2@gmail.com','Cuddalore'),
(176,'Ponni2','9000000176','ponni2@gmail.com','Hosur'),
(177,'Venkat2','9000000177','venkat2@gmail.com','Ooty'),
(178,'Ambika2','9000000178','ambika2@gmail.com','Kumbakonam'),
(179,'Tamilarasan2','9000000179','tamilarasan2@gmail.com','Rajapalayam'),
(180,'Jeya2','9000000180','jeya2@gmail.com','Sivakasi'),
(181,'Sridevi3','9000000181','sridevi3@gmail.com','Chennai'),
(182,'Arun3','9000000182','arun3@gmail.com','Coimbatore'),
(183,'Priya3','9000000183','priya3@gmail.com','Madurai'),
(184,'Kavin3','9000000184','kavin3@gmail.com','Trichy'),
(185,'Divya3','9000000185','divya3@gmail.com','Salem'),
(186,'Ravi3','9000000186','ravi3@gmail.com','Erode'),
(187,'Anu3','9000000187','anu3@gmail.com','Vellore'),
(188,'Kumar3','9000000188','kumar3@gmail.com','Karur'),
(189,'Vijay3','9000000189','vijay3@gmail.com','Tirunelveli'),
(190,'Meena3','9000000190','meena3@gmail.com','Thanjavur'),
(191,'Ajay3','9000000191','ajay3@gmail.com','Dindigul'),
(192,'Deepa3','9000000192','deepa3@gmail.com','Tiruppur'),
(193,'Hari3','9000000193','hari3@gmail.com','Nagercoil'),
(194,'Nila3','9000000194','nila3@gmail.com','Kanchipuram'),
(195,'John3','9000000195','john3@gmail.com','Cuddalore'),
(196,'Suresh3','9000000196','suresh3@gmail.com','Hosur'),
(197,'Kavitha3','9000000197','kavitha3@gmail.com','Ooty'),
(198,'Mani3','9000000198','mani3@gmail.com','Kumbakonam'),
(199,'Lakshmi3','9000000199','lakshmi3@gmail.com','Rajapalayam'),
(200,'Bala3','9000000200','bala3@gmail.com','Sivakasi');


INSERT INTO Packages(PackageID,CustomerID,Weight,PackageType,BookingDate) VALUES
(1,1,2.5,'Document','2026-01-01'),
(2,2,3.0,'Parcel','2026-01-02'),
(3,3,4.2,'Box','2026-01-03'),
(4,4,1.8,'Document','2026-01-04'),
(5,5,5.5,'Parcel','2026-01-05'),
(6,6,2.2,'Box','2026-01-06'),
(7,7,3.8,'Document','2026-01-07'),
(8,8,6.1,'Parcel','2026-01-08'),
(9,9,2.9,'Box','2026-01-09'),
(10,10,4.5,'Document','2026-01-10'),
(11,11,3.3,'Parcel','2026-01-11'),
(12,12,5.0,'Box','2026-01-12'),
(13,13,2.1,'Document','2026-01-13'),
(14,14,6.7,'Parcel','2026-01-14'),
(15,15,4.0,'Box','2026-01-15'),
(16,16,2.6,'Document','2026-01-16'),
(17,17,3.9,'Parcel','2026-01-17'),
(18,18,5.8,'Box','2026-01-18'),
(19,19,1.7,'Document','2026-01-19'),
(20,20,4.3,'Parcel','2026-01-20'),
(21,21,2.8,'Box','2026-01-21'),
(22,22,3.5,'Document','2026-01-22'),
(23,23,6.0,'Parcel','2026-01-23'),
(24,24,4.7,'Box','2026-01-24'),
(25,25,2.3,'Document','2026-01-25'),
(26,26,5.2,'Parcel','2026-01-26'),
(27,27,3.6,'Box','2026-01-27'),
(28,28,2.0,'Document','2026-01-28'),
(29,29,6.4,'Parcel','2026-01-29'),
(30,30,4.1,'Box','2026-01-30'),
(31,31,2.7,'Document','2026-01-31'),
(32,32,5.6,'Parcel','2026-02-01'),
(33,33,3.4,'Box','2026-02-02'),
(34,34,1.9,'Document','2026-02-03'),
(35,35,6.3,'Parcel','2026-02-04'),
(36,36,4.8,'Box','2026-02-05'),
(37,37,2.4,'Document','2026-02-06'),
(38,38,5.1,'Parcel','2026-02-07'),
(39,39,3.7,'Box','2026-02-08'),
(40,40,2.2,'Document','2026-02-09'),
(41,41,6.5,'Parcel','2026-02-10'),
(42,42,4.6,'Box','2026-02-11'),
(43,43,2.1,'Document','2026-02-12'),
(44,44,5.9,'Parcel','2026-02-13'),
(45,45,3.2,'Box','2026-02-14'),
(46,46,2.8,'Document','2026-02-15'),
(47,47,6.2,'Parcel','2026-02-16'),
(48,48,4.4,'Box','2026-02-17'),
(49,49,3.1,'Document','2026-02-18'),
(50,50,5.7,'Parcel','2026-02-19');

INSERT INTO Branches(BranchID,BranchName,City) VALUES
(1,'Chennai Hub','Chennai'),
(2,'Coimbatore Hub','Coimbatore'),
(3,'Madurai Hub','Madurai'),
(4,'Trichy Hub','Trichy'),
(5,'Salem Hub','Salem'),
(6,'Erode Hub','Erode'),
(7,'Vellore Hub','Vellore'),
(8,'Karur Hub','Karur'),
(9,'Tirunelveli Hub','Tirunelveli'),
(10,'Thoothukudi Hub','Thoothukudi'),
(11,'Namakkal Hub','Namakkal'),
(12,'Dindigul Hub','Dindigul'),
(13,'Kanchipuram Hub','Kanchipuram'),
(14,'Cuddalore Hub','Cuddalore'),
(15,'Thanjavur Hub','Thanjavur'),
(16,'Chengalpattu Hub','Chengalpattu'),
(17,'Ranipet Hub','Ranipet'),
(18,'Dharmapuri Hub','Dharmapuri'),
(19,'Krishnagiri Hub','Krishnagiri'),
(20,'Sivagangai Hub','Sivagangai'),
(21,'Virudhunagar Hub','Virudhunagar'),
(22,'Nagapattinam Hub','Nagapattinam'),
(23,'Mayiladuthurai Hub','Mayiladuthurai'),
(24,'Pudukkottai Hub','Pudukkottai'),
(25,'Ariyalur Hub','Ariyalur'),
(26,'Perambalur Hub','Perambalur'),
(27,'Tenkasi Hub','Tenkasi'),
(28,'Ramanathapuram Hub','Ramanathapuram'),
(29,'Nilgiris Hub','Ooty'),
(30,'Kanyakumari Hub','Nagercoil'),
(31,'Villupuram Hub','Villupuram'),
(32,'Tiruppur Hub','Tiruppur'),
(33,'Pollachi Hub','Pollachi'),
(34,'Avadi Hub','Avadi'),
(35,'Tambaram Hub','Tambaram'),
(36,'Pallavaram Hub','Pallavaram'),
(37,'Guduvanchery Hub','Guduvanchery'),
(38,'Ambattur Hub','Ambattur'),
(39,'Sriperumbudur Hub','Sriperumbudur'),
(40,'Hosur Hub','Hosur'),
(41,'Mettur Hub','Mettur'),
(42,'Gobichettipalayam Hub','Gobichettipalayam'),
(43,'Kovilpatti Hub','Kovilpatti'),
(44,'Rajapalayam Hub','Rajapalayam'),
(45,'Mannargudi Hub','Mannargudi'),
(46,'Kumbakonam Hub','Kumbakonam'),
(47,'Chidambaram Hub','Chidambaram'),
(48,'Tiruvannamalai Hub','Tiruvannamalai'),
(49,'Arakkonam Hub','Arakkonam'),
(50,'Poonamallee Hub','Poonamallee');

INSERT INTO Employees(EmployeeID,EmployeeName,Designation,BranchID) VALUES
(1,'Raj','Manager',1),
(2,'Kumar','Staff',2),
(3,'Ravi','Staff',3),
(4,'Divya','Manager',4),
(5,'Anu','Staff',5),
(6,'Prakash','Staff',6),
(7,'Vimal','Manager',7),
(8,'Suresh','Staff',8),
(9,'Mohan','Staff',9),
(10,'Arthi','Manager',10),
(11,'Keerthi','Staff',11),
(12,'Ganesh','Staff',12),
(13,'Bala','Manager',13),
(14,'Saranya','Staff',14),
(15,'Lokesh','Staff',15),
(16,'Ajay','Manager',16),
(17,'Naveen','Staff',17),
(18,'Karthik','Staff',18),
(19,'Priya','Manager',19),
(20,'Deepa','Staff',20),
(21,'Hari','Staff',21),
(22,'Nila','Manager',22),
(23,'John','Staff',23),
(24,'Vijay','Staff',24),
(25,'Meena','Manager',25),
(26,'Ramesh','Staff',26),
(27,'Sudha','Staff',27),
(28,'Senthil','Manager',28),
(29,'Arun','Staff',29),
(30,'Kavin','Staff',30),
(31,'Rekha','Manager',31),
(32,'Shalini','Staff',32),
(33,'Sathish','Staff',33),
(34,'Vinoth','Manager',34),
(35,'Ranjani','Staff',35),
(36,'Kishore','Staff',36),
(37,'Monika','Manager',37),
(38,'Yogesh','Staff',38),
(39,'Dinesh','Staff',39),
(40,'Aarthi','Manager',40),
(41,'Harish','Staff',41),
(42,'Pavithra','Staff',42),
(43,'Sanjay','Manager',43),
(44,'Nandhini','Staff',44),
(45,'Pradeep','Staff',45),
(46,'Lavanya','Manager',46),
(47,'Akash','Staff',47),
(48,'Bhavani','Staff',48),
(49,'Sakthi','Manager',49),
(50,'Magesh','Staff',50),
(51,'Selvi','Staff',1),
(52,'Murugan','Manager',2),
(53,'Geetha','Staff',3),
(54,'Balaji','Staff',4),
(55,'Kavitha','Manager',5),
(56,'Mani','Staff',6),
(57,'Lakshmi','Staff',7),
(58,'Surya','Manager',8),
(59,'Arjun','Staff',9),
(60,'Nalini','Staff',10),
(61,'Manoj','Manager',11),
(62,'Vani','Staff',12),
(63,'Hema','Staff',13),
(64,'Prasath','Manager',14),
(65,'Radha','Staff',15),
(66,'Nishanth','Staff',16),
(67,'Usha','Manager',17),
(68,'Vijaya','Staff',18),
(69,'Chitra','Staff',19),
(70,'Selvam','Manager',20),
(71,'Nandha','Staff',21),
(72,'Bharathi','Staff',22),
(73,'Durai','Manager',23),
(74,'Kokila','Staff',24),
(75,'Elango','Staff',25),
(76,'Thenmozhi','Manager',26),
(77,'Jagan','Staff',27),
(78,'Krishnan','Staff',28),
(79,'Venkat','Manager',29),
(80,'Ambika','Staff',30),
(81,'Tamilarasan','Staff',31),
(82,'Jeya','Manager',32),
(83,'Sugumar','Staff',33),
(84,'Gowri','Staff',34),
(85,'Thirumal','Manager',35),
(86,'Praveen','Staff',36),
(87,'Janaki','Staff',37),
(88,'Yamuna','Manager',38),
(89,'Pooja','Staff',39),
(90,'Siva','Staff',40),
(91,'Kavya','Manager',41),
(92,'Ashwin','Staff',42),
(93,'Malathi','Staff',43),
(94,'Revathi','Manager',44),
(95,'Suganya','Staff',45),
(96,'Nirmala','Staff',46),
(97,'Kamala','Manager',47),
(98,'Shanthi','Staff',48),
(99,'Padma','Staff',49),
(100,'Vasantha','Manager',50),
(101,'Raj2','Staff',1),
(102,'Kumar2','Staff',2),
(103,'Ravi2','Manager',3),
(104,'Divya2','Staff',4),
(105,'Anu2','Staff',5),
(106,'Prakash2','Manager',6),
(107,'Vimal2','Staff',7),
(108,'Suresh2','Staff',8),
(109,'Mohan2','Manager',9),
(110,'Arthi2','Staff',10),
(111,'Keerthi2','Staff',11),
(112,'Ganesh2','Manager',12),
(113,'Bala2','Staff',13),
(114,'Saranya2','Staff',14),
(115,'Lokesh2','Manager',15),
(116,'Ajay2','Staff',16),
(117,'Naveen2','Staff',17),
(118,'Karthik2','Manager',18),
(119,'Priya2','Staff',19),
(120,'Deepa2','Staff',20),
(121,'Hari2','Manager',21),
(122,'Nila2','Staff',22),
(123,'John2','Staff',23),
(124,'Vijay2','Manager',24),
(125,'Meena2','Staff',25),
(126,'Ramesh2','Staff',26),
(127,'Sudha2','Manager',27),
(128,'Senthil2','Staff',28),
(129,'Arun2','Staff',29),
(130,'Kavin2','Manager',30),
(131,'Rekha2','Staff',31),
(132,'Shalini2','Staff',32),
(133,'Sathish2','Manager',33),
(134,'Vinoth2','Staff',34),
(135,'Ranjani2','Staff',35),
(136,'Kishore2','Manager',36),
(137,'Monika2','Staff',37),
(138,'Yogesh2','Staff',38),
(139,'Dinesh2','Manager',39),
(140,'Aarthi2','Staff',40),
(141,'Harish2','Staff',41),
(142,'Pavithra2','Manager',42),
(143,'Sanjay2','Staff',43),
(144,'Nandhini2','Staff',44),
(145,'Pradeep2','Manager',45),
(146,'Lavanya2','Staff',46),
(147,'Akash2','Staff',47),
(148,'Bhavani2','Manager',48),
(149,'Sakthi2','Staff',49),
(150,'Magesh2','Staff',50),
(151,'Selvi2','Manager',1),
(152,'Murugan2','Staff',2),
(153,'Geetha2','Staff',3),
(154,'Balaji2','Manager',4),
(155,'Kavitha2','Staff',5),
(156,'Mani2','Staff',6),
(157,'Lakshmi2','Manager',7),
(158,'Surya2','Staff',8),
(159,'Arjun2','Staff',9),
(160,'Nalini2','Manager',10),
(161,'Manoj2','Staff',11),
(162,'Vani2','Staff',12),
(163,'Hema2','Manager',13),
(164,'Prasath2','Staff',14),
(165,'Radha2','Staff',15),
(166,'Nishanth2','Manager',16),
(167,'Usha2','Staff',17),
(168,'Vijaya2','Staff',18),
(169,'Chitra2','Manager',19),
(170,'Selvam2','Staff',20),
(171,'Nandha2','Staff',21),
(172,'Bharathi2','Manager',22),
(173,'Durai2','Staff',23),
(174,'Kokila2','Staff',24),
(175,'Elango2','Manager',25),
(176,'Thenmozhi2','Staff',26),
(177,'Jagan2','Staff',27),
(178,'Krishnan2','Manager',28),
(179,'Venkat2','Staff',29),
(180,'Ambika2','Staff',30),
(181,'Tamilarasan2','Manager',31),
(182,'Jeya2','Staff',32),
(183,'Sugumar2','Staff',33),
(184,'Gowri2','Manager',34),
(185,'Thirumal2','Staff',35),
(186,'Praveen2','Staff',36),
(187,'Janaki2','Manager',37),
(188,'Yamuna2','Staff',38),
(189,'Pooja2','Staff',39),
(190,'Siva2','Manager',40),
(191,'Kavya2','Staff',41),
(192,'Ashwin2','Staff',42),
(193,'Malathi2','Manager',43),
(194,'Revathi2','Staff',44),
(195,'Suganya2','Staff',45),
(196,'Nirmala2','Manager',46),
(197,'Kamala2','Staff',47),
(198,'Shanthi2','Staff',48),
(199,'Padma2','Manager',49),
(200,'Vasantha2','Staff',50);

INSERT INTO DeliveryAgents(AgentID,EmployeeID,VehicleNo) VALUES
(1,9,'TN02B1001'),
(2,10,'TN03C1002'),
(3,16,'TN04D1003'),
(4,18,'TN05E1004'),
(5,31,'TN06F1005'),
(6,35,'TN07G1006'),
(7,37,'TN08H1007'),
(8,46,'TN09J1008'),
(9,48,'TN10K1009'),
(10,51,'TN11A1010'),
(11,53,'TN12B1011'),
(12,54,'TN13C1012'),
(13,55,'TN14D1013'),
(14,60,'TN15E1014'),
(15,62,'TN16F1015'),
(16,67,'TN17G1016'),
(17,71,'TN18H1017'),
(18,75,'TN19J1018'),
(19,79,'TN20K1019'),
(20,82,'TN01A1020'),
(21,83,'TN02B1021'),
(22,86,'TN03C1022'),
(23,87,'TN04D1023'),
(24,90,'TN05E1024'),
(25,93,'TN06F1025'),
(26,96,'TN07G1026'),
(27,98,'TN08H1027'),
(28,99,'TN09J1028'),
(29,104,'TN10K1029'),
(30,109,'TN11A1030'),
(31,119,'TN12B1031'),
(32,120,'TN13C1032'),
(33,123,'TN14D1033'),
(34,124,'TN15E1034'),
(35,127,'TN16F1035'),
(36,134,'TN17G1036'),
(37,135,'TN18H1037'),
(38,141,'TN19J1038'),
(39,144,'TN20K1039'),
(40,148,'TN01A1040'),
(41,163,'TN02B1041'),
(42,175,'TN03C1042'),
(43,176,'TN04D1043'),
(44,184,'TN05E1044'),
(45,188,'TN06F1045'),
(46,189,'TN07G1046'),
(47,193,'TN08H1047'),
(48,194,'TN09J1048'),
(49,196,'TN10K1049'),
(50,199,'TN11A1050');

INSERT INTO Shipments(ShipmentID,PackageID,SourceBranch,DestinationBranch,DispatchDate) VALUES
(1,1,1,6,'2026-01-01'),
(2,2,2,7,'2026-01-02'),
(3,3,3,8,'2026-01-03'),
(4,4,4,9,'2026-01-04'),
(5,5,5,10,'2026-01-05'),
(6,6,6,11,'2026-01-06'),
(7,7,7,12,'2026-01-07'),
(8,8,8,13,'2026-01-08'),
(9,9,9,14,'2026-01-09'),
(10,10,10,15,'2026-01-10'),
(11,11,11,16,'2026-01-11'),
(12,12,12,17,'2026-01-12'),
(13,13,13,18,'2026-01-13'),
(14,14,14,19,'2026-01-14'),
(15,15,15,20,'2026-01-15'),
(16,16,16,21,'2026-01-16'),
(17,17,17,22,'2026-01-17'),
(18,18,18,23,'2026-01-18'),
(19,19,19,24,'2026-01-19'),
(20,20,20,25,'2026-01-20'),
(21,21,21,26,'2026-01-21'),
(22,22,22,27,'2026-01-22'),
(23,23,23,28,'2026-01-23'),
(24,24,24,29,'2026-01-24'),
(25,25,25,30,'2026-01-25'),
(26,26,26,31,'2026-01-26'),
(27,27,27,32,'2026-01-27'),
(28,28,28,33,'2026-01-28'),
(29,29,29,34,'2026-01-29'),
(30,30,30,35,'2026-01-30'),
(31,31,31,36,'2026-01-31'),
(32,32,32,37,'2026-02-01'),
(33,33,33,38,'2026-02-02'),
(34,34,34,39,'2026-02-03'),
(35,35,35,40,'2026-02-04'),
(36,36,36,41,'2026-02-05'),
(37,37,37,42,'2026-02-06'),
(38,38,38,43,'2026-02-07'),
(39,39,39,44,'2026-02-08'),
(40,40,40,45,'2026-02-09'),
(41,41,41,46,'2026-02-10'),
(42,42,42,47,'2026-02-11'),
(43,43,43,48,'2026-02-12'),
(44,44,44,49,'2026-02-13'),
(45,45,45,50,'2026-02-14'),
(46,46,46,1,'2026-02-15'),
(47,47,47,2,'2026-02-16'),
(48,48,48,3,'2026-02-17'),
(49,49,49,4,'2026-02-18'),
(50,50,50,5,'2026-02-19');

INSERT INTO TrackingStatus(StatusID,ShipmentID,StatusText,StatusDate) VALUES
(1,1,'Picked Up','2026-01-01 11:00:00'),
(2,2,'In Transit','2026-01-02 13:00:00'),
(3,3,'Reached Destination Branch','2026-01-03 15:00:00'),
(4,4,'Out for Delivery','2026-01-04 17:00:00'),
(5,5,'Delivered','2026-01-05 09:00:00'),
(6,6,'Picked Up','2026-01-06 11:00:00'),
(7,7,'In Transit','2026-01-07 13:00:00'),
(8,8,'Reached Destination Branch','2026-01-08 15:00:00'),
(9,9,'Out for Delivery','2026-01-09 17:00:00'),
(10,10,'Delivered','2026-01-10 09:00:00'),
(11,11,'Picked Up','2026-01-11 11:00:00'),
(12,12,'In Transit','2026-01-12 13:00:00'),
(13,13,'Reached Destination Branch','2026-01-13 15:00:00'),
(14,14,'Out for Delivery','2026-01-14 17:00:00'),
(15,15,'Delivered','2026-01-15 09:00:00'),
(16,16,'Picked Up','2026-01-16 11:00:00'),
(17,17,'In Transit','2026-01-17 13:00:00'),
(18,18,'Reached Destination Branch','2026-01-18 15:00:00'),
(19,19,'Out for Delivery','2026-01-19 17:00:00'),
(20,20,'Delivered','2026-01-20 09:00:00'),
(21,21,'Picked Up','2026-01-21 11:00:00'),
(22,22,'In Transit','2026-01-22 13:00:00'),
(23,23,'Reached Destination Branch','2026-01-23 15:00:00'),
(24,24,'Out for Delivery','2026-01-24 17:00:00'),
(25,25,'Delivered','2026-01-25 09:00:00'),
(26,26,'Picked Up','2026-01-26 11:00:00'),
(27,27,'In Transit','2026-01-27 13:00:00'),
(28,28,'Reached Destination Branch','2026-01-28 15:00:00'),
(29,29,'Out for Delivery','2026-01-29 17:00:00'),
(30,30,'Delivered','2026-01-30 09:00:00'),
(31,31,'Picked Up','2026-01-31 11:00:00'),
(32,32,'In Transit','2026-02-01 13:00:00'),
(33,33,'Reached Destination Branch','2026-02-02 15:00:00'),
(34,34,'Out for Delivery','2026-02-03 17:00:00'),
(35,35,'Delivered','2026-02-04 09:00:00'),
(36,36,'Picked Up','2026-02-05 11:00:00'),
(37,37,'In Transit','2026-02-06 13:00:00'),
(38,38,'Reached Destination Branch','2026-02-07 15:00:00'),
(39,39,'Out for Delivery','2026-02-08 17:00:00'),
(40,40,'Delivered','2026-02-09 09:00:00'),
(41,41,'Picked Up','2026-02-10 11:00:00'),
(42,42,'In Transit','2026-02-11 13:00:00'),
(43,43,'Reached Destination Branch','2026-02-12 15:00:00'),
(44,44,'Out for Delivery','2026-02-13 17:00:00'),
(45,45,'Delivered','2026-02-14 09:00:00'),
(46,46,'Picked Up','2026-02-15 11:00:00'),
(47,47,'In Transit','2026-02-16 13:00:00'),
(48,48,'Reached Destination Branch','2026-02-17 15:00:00'),
(49,49,'Out for Delivery','2026-02-18 17:00:00'),
(50,50,'Delivered','2026-02-19 09:00:00');

INSERT INTO Payments(PaymentID,PackageID,Amount,PaymentDate) VALUES
(1,1,75.00,'2026-01-01'),
(2,2,200.00,'2026-01-02'),
(3,3,300.00,'2026-01-03'),
(4,4,125.00,'2026-01-04'),
(5,5,275.00,'2026-01-05'),
(6,6,220.00,'2026-01-06'),
(7,7,90.00,'2026-01-07'),
(8,8,225.00,'2026-01-08'),
(9,9,340.00,'2026-01-09'),
(10,10,150.00,'2026-01-10'),
(11,11,175.00,'2026-01-11'),
(12,12,260.00,'2026-01-12'),
(13,13,110.00,'2026-01-13'),
(14,14,250.00,'2026-01-14'),
(15,15,380.00,'2026-01-15'),
(16,16,75.00,'2026-01-16'),
(17,17,200.00,'2026-01-17'),
(18,18,300.00,'2026-01-18'),
(19,19,125.00,'2026-01-19'),
(20,20,275.00,'2026-01-20'),
(21,21,220.00,'2026-01-21'),
(22,22,90.00,'2026-01-22'),
(23,23,225.00,'2026-01-23'),
(24,24,340.00,'2026-01-24'),
(25,25,150.00,'2026-01-25'),
(26,26,175.00,'2026-01-26'),
(27,27,260.00,'2026-01-27'),
(28,28,110.00,'2026-01-28'),
(29,29,250.00,'2026-01-29'),
(30,30,380.00,'2026-01-30'),
(31,31,75.00,'2026-01-31'),
(32,32,200.00,'2026-02-01'),
(33,33,300.00,'2026-02-02'),
(34,34,125.00,'2026-02-03'),
(35,35,275.00,'2026-02-04'),
(36,36,220.00,'2026-02-05'),
(37,37,90.00,'2026-02-06'),
(38,38,225.00,'2026-02-07'),
(39,39,340.00,'2026-02-08'),
(40,40,150.00,'2026-02-09'),
(41,41,175.00,'2026-02-10'),
(42,42,260.00,'2026-02-11'),
(43,43,110.00,'2026-02-12'),
(44,44,250.00,'2026-02-13'),
(45,45,380.00,'2026-02-14'),
(46,46,75.00,'2026-02-15'),
(47,47,200.00,'2026-02-16'),
(48,48,300.00,'2026-02-17'),
(49,49,125.00,'2026-02-18'),
(50,50,275.00,'2026-02-19');

INSERT INTO Delivery(DeliveryID,ShipmentID,AgentID,DeliveryDate,Status) VALUES
(1,1,1,'2026-01-02','Delivered'),
(2,2,2,'2026-01-03','Delivered'),
(3,3,3,'2026-01-04','Delivered'),
(4,4,4,'2026-01-05','Pending'),
(5,5,5,'2026-01-06','In Transit'),
(6,6,6,'2026-01-07','Delivered'),
(7,7,7,'2026-01-08','Delivered'),
(8,8,8,'2026-01-09','Delivered'),
(9,9,9,'2026-01-10','Pending'),
(10,10,10,'2026-01-11','In Transit'),
(11,11,11,'2026-01-12','Delivered'),
(12,12,12,'2026-01-13','Delivered'),
(13,13,13,'2026-01-14','Delivered'),
(14,14,14,'2026-01-15','Pending'),
(15,15,15,'2026-01-16','In Transit'),
(16,16,16,'2026-01-17','Delivered'),
(17,17,17,'2026-01-18','Delivered'),
(18,18,18,'2026-01-19','Delivered'),
(19,19,19,'2026-01-20','Pending'),
(20,20,20,'2026-01-21','In Transit'),
(21,21,21,'2026-01-22','Delivered'),
(22,22,22,'2026-01-23','Delivered'),
(23,23,23,'2026-01-24','Delivered'),
(24,24,24,'2026-01-25','Pending'),
(25,25,25,'2026-01-26','In Transit'),
(26,26,26,'2026-01-27','Delivered'),
(27,27,27,'2026-01-28','Delivered'),
(28,28,28,'2026-01-29','Delivered'),
(29,29,29,'2026-01-30','Pending'),
(30,30,30,'2026-01-31','In Transit'),
(31,31,31,'2026-02-01','Delivered'),
(32,32,32,'2026-02-02','Delivered'),
(33,33,33,'2026-02-03','Delivered'),
(34,34,34,'2026-02-04','Pending'),
(35,35,35,'2026-02-05','In Transit'),
(36,36,36,'2026-02-06','Delivered'),
(37,37,37,'2026-02-07','Delivered'),
(38,38,38,'2026-02-08','Delivered'),
(39,39,39,'2026-02-09','Pending'),
(40,40,40,'2026-02-10','In Transit'),
(41,41,41,'2026-02-11','Delivered'),
(42,42,42,'2026-02-12','Delivered'),
(43,43,43,'2026-02-13','Delivered'),
(44,44,44,'2026-02-14','Pending'),
(45,45,45,'2026-02-15','In Transit'),
(46,46,46,'2026-02-16','Delivered'),
(47,47,47,'2026-02-17','Delivered'),
(48,48,48,'2026-02-18','Delivered'),
(49,49,49,'2026-02-19','Pending'),
(50,50,50,'2026-02-20','In Transit');

INSERT INTO Vehicle(VehicleID,VehicleNo,VehicleType) VALUES
(1,'TN01A1001','Bike'),
(2,'TN02B1002','Van'),
(3,'TN03C1003','Truck'),
(4,'TN04D1004','Mini Truck'),
(5,'TN05E1005','Auto'),
(6,'TN06F1006','Bike'),
(7,'TN07G1007','Van'),
(8,'TN08H1008','Truck'),
(9,'TN09J1009','Mini Truck'),
(10,'TN10K1010','Auto'),
(11,'TN11A1011','Bike'),
(12,'TN12B1012','Van'),
(13,'TN13C1013','Truck'),
(14,'TN14D1014','Mini Truck'),
(15,'TN15E1015','Auto'),
(16,'TN16F1016','Bike'),
(17,'TN17G1017','Van'),
(18,'TN18H1018','Truck'),
(19,'TN19J1019','Mini Truck'),
(20,'TN20K1020','Auto'),
(21,'TN21A1021','Bike'),
(22,'TN22B1022','Van'),
(23,'TN23C1023','Truck'),
(24,'TN24D1024','Mini Truck'),
(25,'TN25E1025','Auto'),
(26,'TN26F1026','Bike'),
(27,'TN27G1027','Van'),
(28,'TN28H1028','Truck'),
(29,'TN29J1029','Mini Truck'),
(30,'TN30K1030','Auto'),
(31,'TN31A1031','Bike'),
(32,'TN32B1032','Van'),
(33,'TN33C1033','Truck'),
(34,'TN34D1034','Mini Truck'),
(35,'TN35E1035','Auto'),
(36,'TN36F1036','Bike'),
(37,'TN37G1037','Van'),
(38,'TN38H1038','Truck'),
(39,'TN39J1039','Mini Truck'),
(40,'TN40K1040','Auto'),
(41,'TN41A1041','Bike'),
(42,'TN42B1042','Van'),
(43,'TN43C1043','Truck'),
(44,'TN44D1044','Mini Truck'),
(45,'TN45E1045','Auto'),
(46,'TN46F1046','Bike'),
(47,'TN47G1047','Van'),
(48,'TN48H1048','Truck'),
(49,'TN49J1049','Mini Truck'),
(50,'TN50K1050','Auto');

INSERT INTO Route(RouteID,SourceCity,DestinationCity) VALUES
(1,'Chennai','Erode'),
(2,'Coimbatore','Vellore'),
(3,'Madurai','Karur'),
(4,'Trichy','Tirunelveli'),
(5,'Salem','Thanjavur'),
(6,'Erode','Dindigul'),
(7,'Vellore','Tiruppur'),
(8,'Karur','Nagercoil'),
(9,'Tirunelveli','Kanchipuram'),
(10,'Thanjavur','Cuddalore'),
(11,'Dindigul','Hosur'),
(12,'Tiruppur','Ooty'),
(13,'Nagercoil','Kumbakonam'),
(14,'Kanchipuram','Rajapalayam'),
(15,'Cuddalore','Sivakasi'),
(16,'Hosur','Thoothukudi'),
(17,'Ooty','Namakkal'),
(18,'Kumbakonam','Chengalpattu'),
(19,'Rajapalayam','Ranipet'),
(20,'Sivakasi','Dharmapuri'),
(21,'Thoothukudi','Krishnagiri'),
(22,'Namakkal','Sivagangai'),
(23,'Chengalpattu','Nagapattinam'),
(24,'Ranipet','Pudukkottai'),
(25,'Dharmapuri','Ariyalur'),
(26,'Krishnagiri','Perambalur'),
(27,'Sivagangai','Tenkasi'),
(28,'Nagapattinam','Ramanathapuram'),
(29,'Pudukkottai','Villupuram'),
(30,'Ariyalur','Pollachi'),
(31,'Perambalur','Avadi'),
(32,'Tenkasi','Tambaram'),
(33,'Ramanathapuram','Ambattur'),
(34,'Villupuram','Sriperumbudur'),
(35,'Pollachi','Mettur'),
(36,'Avadi','Gobichettipalayam'),
(37,'Tambaram','Kovilpatti'),
(38,'Ambattur','Mannargudi'),
(39,'Sriperumbudur','Chidambaram'),
(40,'Mettur','Tiruvannamalai'),
(41,'Gobichettipalayam','Arakkonam'),
(42,'Kovilpatti','Poonamallee'),
(43,'Mannargudi','Pallavaram'),
(44,'Chidambaram','Guduvanchery'),
(45,'Tiruvannamalai','Mayiladuthurai'),
(46,'Arakkonam','Chennai'),
(47,'Poonamallee','Coimbatore'),
(48,'Pallavaram','Madurai'),
(49,'Guduvanchery','Trichy'),
(50,'Mayiladuthurai','Salem');

INSERT INTO Feedback(FeedbackID,CustomerID,Rating,Comments) VALUES
(1,1,5,'Excellent service! Very fast delivery.'),
(2,2,5,'Outstanding experience, will use again.'),
(3,3,4,'Good service, delivery was on time.'),
(4,4,4,'Satisfied with the overall experience.'),
(5,5,4,'Good packaging and timely delivery.'),
(6,6,5,'Package delivered on time, great service.'),
(7,7,3,'Average service, delivery was slightly late.'),
(8,8,4,'Nice service, minor delay but acceptable.'),
(9,9,5,'Very happy with the delivery speed.'),
(10,10,4,'Overall good, will use again.'),
(11,11,2,'Poor service, package arrived late.'),
(12,12,4,'Delivery was good, staff was polite.'),
(13,13,5,'Perfect service, no complaints at all.'),
(14,14,3,'Okay experience, could be improved.'),
(15,15,4,'Happy with the service provided.'),
(16,16,5,'Superb handling and quick delivery.'),
(17,17,4,'Good experience, package arrived safely.'),
(18,18,5,'Best courier service I have used.'),
(19,19,3,'Service was average, needs improvement.'),
(20,20,4,'Reliable service, good communication.'),
(21,21,5,'Highly satisfied with the service.'),
(22,22,4,'Good courier service, recommended.'),
(23,23,3,'Delivery took longer than expected.'),
(24,24,5,'Delivery was prompt and package safe.'),
(25,25,4,'Good service, delivery was on time.'),
(26,26,1,'Very poor service, package was damaged.'),
(27,27,4,'Satisfied with the overall experience.'),
(28,28,5,'Amazing service, highly recommended.'),
(29,29,4,'Good packaging and timely delivery.'),
(30,30,3,'Moderate experience, staff needs training.'),
(31,31,5,'Excellent service! Very fast delivery.'),
(32,32,2,'Not satisfied, delivery was delayed.'),
(33,33,4,'Nice service, minor delay but acceptable.'),
(34,34,5,'Outstanding experience, will use again.'),
(35,35,4,'Overall good, will use again.'),
(36,36,3,'Average, package had minor damage.'),
(37,37,5,'Package delivered on time, great service.'),
(38,38,4,'Delivery was good, staff was polite.'),
(39,39,2,'Package was delayed significantly.'),
(40,40,4,'Happy with the service provided.'),
(41,41,5,'Very happy with the delivery speed.'),
(42,42,4,'Good experience, package arrived safely.'),
(43,43,3,'Acceptable service but room for improvement.'),
(44,44,5,'Perfect service, no complaints at all.'),
(45,45,1,'Terrible experience, very late delivery.'),
(46,46,4,'Reliable service, good communication.'),
(47,47,5,'Superb handling and quick delivery.'),
(48,48,4,'Good courier service, recommended.'),
(49,49,3,'Delivery was okay, not very fast.'),
(50,50,5,'Best courier service I have used.');
ALTER TABLE Feedback 
MODIFY COLUMN Comments TEXT;
DESC Feedback;

INSERT INTO Insurance(InsuranceID,PackageID,Provider,Amount) VALUES
(1,1,'LIC of India',50.00),
(2,2,'New India Assurance',110.00),
(3,3,'United India Insurance',160.00),
(4,4,'Oriental Insurance',60.00),
(5,5,'National Insurance',130.00),
(6,6,'LIC of India',200.00),
(7,7,'New India Assurance',70.00),
(8,8,'United India Insurance',150.00),
(9,9,'Oriental Insurance',230.00),
(10,10,'National Insurance',80.00),
(11,11,'LIC of India',170.00),
(12,12,'New India Assurance',260.00),
(13,13,'United India Insurance',100.00),
(14,14,'Oriental Insurance',200.00),
(15,15,'National Insurance',300.00),
(16,16,'LIC of India',50.00),
(17,17,'New India Assurance',110.00),
(18,18,'United India Insurance',160.00),
(19,19,'Oriental Insurance',60.00),
(20,20,'National Insurance',130.00),
(21,21,'LIC of India',200.00),
(22,22,'New India Assurance',70.00),
(23,23,'United India Insurance',150.00),
(24,24,'Oriental Insurance',230.00),
(25,25,'National Insurance',80.00),
(26,26,'LIC of India',170.00),
(27,27,'New India Assurance',260.00),
(28,28,'United India Insurance',100.00),
(29,29,'Oriental Insurance',200.00),
(30,30,'National Insurance',300.00),
(31,31,'LIC of India',50.00),
(32,32,'New India Assurance',110.00),
(33,33,'United India Insurance',160.00),
(34,34,'Oriental Insurance',60.00),
(35,35,'National Insurance',130.00),
(36,36,'LIC of India',200.00),
(37,37,'New India Assurance',70.00),
(38,38,'United India Insurance',150.00),
(39,39,'Oriental Insurance',230.00),
(40,40,'National Insurance',80.00),
(41,41,'LIC of India',170.00),
(42,42,'New India Assurance',260.00),
(43,43,'United India Insurance',100.00),
(44,44,'Oriental Insurance',200.00),
(45,45,'National Insurance',300.00),
(46,46,'LIC of India',50.00),
(47,47,'New India Assurance',110.00),
(48,48,'United India Insurance',160.00),
(49,49,'Oriental Insurance',60.00),
(50,50,'National Insurance',130.00);

INSERT INTO Warehouse(WarehouseID,BranchID,Capacity) VALUES
(1,1,500),
(2,2,300),
(3,3,450),
(4,4,400),
(5,5,350),
(6,6,320),
(7,7,280),
(8,8,410),
(9,9,370),
(10,10,460),
(11,11,290),
(12,12,330),
(13,13,480),
(14,14,310),
(15,15,420),
(16,16,360),
(17,17,270),
(18,18,440),
(19,19,390),
(20,20,500),
(21,21,315),
(22,22,425),
(23,23,345),
(24,24,465),
(25,25,295),
(26,26,385),
(27,27,505),
(28,28,275),
(29,29,435),
(30,30,355),
(31,31,475),
(32,32,325),
(33,33,285),
(34,34,445),
(35,35,395),
(36,36,515),
(37,37,305),
(38,38,365),
(39,39,455),
(40,40,415),
(41,41,335),
(42,42,485),
(43,43,375),
(44,44,265),
(45,45,495),
(46,46,345),
(47,47,405),
(48,48,315),
(49,49,525),
(50,50,285);

INSERT INTO Complaint(ComplaintID,CustomerID,ComplaintText,Status) VALUES
(1,1,'Package was delivered late by 2 days.','Resolved'),
(2,2,'Delivery agent was rude and unprofessional.','Resolved'),
(3,3,'Package has not arrived even after 5 days.','Pending'),
(4,4,'Fragile item was not handled with care.','In Progress'),
(5,5,'Package arrived with minor damage on the corner.','Resolved'),
(6,6,'Delivery agent is not responding to calls.','Pending'),
(7,7,'Wrong package was delivered to my address.','Resolved'),
(8,8,'Package delivered to wrong location.','In Progress'),
(9,9,'No updates were provided during transit.','Resolved'),
(10,10,'Package is stuck at warehouse with no updates.','Pending'),
(11,11,'Partial items missing from the package.','In Progress'),
(12,12,'Package was left outside without signature.','Resolved'),
(13,13,'Requested reschedule but no confirmation received.','Pending'),
(14,14,'Delivery address was incorrectly updated.','Resolved'),
(15,15,'Delivery attempted without prior notification.','In Progress'),
(16,16,'Received an empty box instead of ordered items.','Resolved'),
(17,17,'Package shows out for delivery but not delivered.','Pending'),
(18,18,'Package was marked delivered but not received.','Resolved'),
(19,19,'Package held at customs without reason.','In Progress'),
(20,20,'Tracking number was not working for 2 days.','Resolved'),
(21,21,'No response from customer support team.','Pending'),
(22,22,'Package was delivered late by 2 days.','Resolved'),
(23,23,'Delivery agent was rude and unprofessional.','Resolved'),
(24,24,'Incorrect weight charged for my package.','In Progress'),
(25,25,'Package damaged during transit, claim not processed.','Pending'),
(26,26,'Package arrived with minor damage on the corner.','Resolved'),
(27,27,'Agent did not follow delivery instructions.','In Progress'),
(28,28,'Wrong package was delivered to my address.','Resolved'),
(29,29,'Double charged for single delivery.','Pending'),
(30,30,'No updates were provided during transit.','Resolved'),
(31,31,'Package returned without delivery attempt.','In Progress'),
(32,32,'Package was left outside without signature.','Resolved'),
(33,33,'Agent collected package but status not updated.','Pending'),
(34,34,'Delivery address was incorrectly updated.','Resolved'),
(35,35,'Received an empty box instead of ordered items.','Resolved'),
(36,36,'Insurance claim not initiated for damaged package.','In Progress'),
(37,37,'Package missing since last tracking update.','Pending'),
(38,38,'Package was marked delivered but not received.','Resolved'),
(39,39,'Tracking number was not working for 2 days.','Resolved'),
(40,40,'Repeated delay in delivery without explanation.','In Progress'),
(41,41,'Package was delivered late by 2 days.','Resolved'),
(42,42,'Package has not arrived even after 5 days.','Pending'),
(43,43,'Delivery agent was rude and unprofessional.','Resolved'),
(44,44,'Fragile item was not handled with care.','In Progress'),
(45,45,'Package arrived with minor damage on the corner.','Resolved'),
(46,46,'Delivery agent is not responding to calls.','Pending'),
(47,47,'Wrong package was delivered to my address.','Resolved'),
(48,48,'No updates were provided during transit.','Resolved'),
(49,49,'Package delivered to wrong location.','In Progress'),
(50,50,'Package was left outside without signature.','Resolved');
ALTER TABLE Complaint 
MODIFY COLUMN ComplaintText TEXT;
desc Complaint;

-- Customer table
select * from Customers;

-- Packages table
select * from Packages;

-- Branch table
select * from Branches;

-- Employees
select * from Employees;

-- Deliveryagents table
select * from DeliveryAgents;

-- Shipments table
select * from Shipments;

-- TrackingStatus table
select * from TrackingStatus;

-- Payments table 
select * from Payments;

-- Delivery table
select * from Delivery;

-- Vehicle table
select * from Vehicle;

-- Route table
select * from Route;

-- Feedback table
select * from Feedback;

-- Insurance table
select * from Insurance;

-- Warehouse table
select * from Warehouse;

-- Compliant table
select * from Complaint;

-- 1.  Retrieve all customer names and their email addresses.
SELECT Customername,address from Customers;

-- 2.  Display all packages with their PackageType and Weight.
select packagetype,weight from Packages;

-- 3.  List all employees whose Designation is 'Manager'.
select * from Employees where designation ='Manager';

-- 4.  Show all branches located in Chennai.
select * from Branches where city ='Chennai';

-- 5.  Retrieve all feedbacks where Rating is 5.
select * from feedback where Rating='5';

-- 6.  Display all complaints where Status is 'Pending'.
select * from Complaint where Status='Pending';

-- 7.  List all delivery agents along with their VehicleNo.
select AgentId,VehicleNo from deliveryagents;

-- 8.  Show all payments where Amount is greater than 200.
select * from Payments where Amount >200;

-- 9.  Retrieve all shipments dispatched in January 2026.
select * from Shipments where dispatchdate between '2026-01-01' and '2026-12-31';

-- 10. Display all customers whose Address is 'Madurai'.
select * from Customers where address = 'Madurai';

-- 11. List all packages with PackageType as 'Document'.
select * from Packages where PackageType = 'Document';

-- 12. Show the total number of employees in the Employees table.
select count(*) as TotalEmployees from Employees;

-- 13. Retrieve all vehicles with VehicleType as 'Truck'.
select * from Vehicle where VehicleType = 'Truck';

-- 14. Display all warehouse details along with their Capacity.
select warehouseId,Capacity from Warehouse;

-- 15. List all routes where SourceCity is 'Chennai'.
select * from Route where SourceCity = 'Chennai';

-- 16. Show all tracking statuses where StatusText is 'Delivered'.
select * from TrackingStatus where StatusText = 'Delivered';

-- 17. Retrieve all insurance records provided by 'LIC of India'.
select * from Insurance where Provider = 'LIC of India';

-- 18. Display all packages ordered by Weight in descending order.
select * from Packages order by weight DESC;

-- 19. List all employees working in BranchID 1.
select * from Employees where BranchID = 1;

-- 20. Show the total number of complaints that are 'Resolved'.
select count(*) as TotalComplaints from Complaint where Status = 'Resolved';

-- 21. List all customers along with their package details(CustomerName, PackageType, Weight, BookingDate) using JOIN.
select c.CustomerName,
       p.PackageType,p.weight,
       p.bookingdate 
from Customers c 
join Packages P 
on c.customerID=p.CustomerId;

-- 22.Display each shipment with its source branch name and destination branch name using JOIN on Branches.
select s.ShipmentID,
       b1.BranchName AS SourceBranch,
       b2.BranchName AS DestinationBranch
from Shipments s
join Branches b1
on s.SourceBranch = b1.BranchID
join Branches b2
on s.DestinationBranch = b2.BranchID;

-- 23. Find the total payment amount received for each PackageType using GROUP BY.
select p.PackageType,
      SUM(py.Amount) as TotalAmount
from Packages p
join Payments py 
on p.PackageID = py.PackageID
group by p.PackageType;

-- 24. List all delivery agents with employee name and branch name.
 select d.agentID,
        e.EmployeeName,
        d.VehicleNo,
        b.BranchName
from deliveryAgents d
join Employees e
on e.EmployeeID = d.EmployeeID
join Branches b
on e.BranchID = b.BranchID;

-- 25. Show customers who gave rating below 3 with complaint status.
select c.CustomerName,
       f.Rating,
       cm.Status as ComplaintStatus
from Customers c
join Feedback f on c.CustomerID = f.CustomerID
join Complaint cm on c.CustomerID = cm.CustomerID
where f.Rating < 3;

-- 26. Find number of packages handled by each branch as SourceBranch.
 
select s.SourceBranch,
       b.BranchName,
       count(s.ShipmentID) as TotalShipments
from Shipments s
join Branches b on s.SourceBranch = b.BranchID
group by s.SourceBranch, b.BranchName;
 
 -- 27. Display shipments with tracking status and status date.
 
select s.ShipmentID,
       s.DispatchDate,
       t.StatusText,
       t.StatusDate
from Shipments s
join TrackingStatus t on s.ShipmentID = t.ShipmentID;

-- 28. List top 5 customers who paid the highest amount.
 
select c.CustomerName,
       p.PackageType,
       py.Amount
from Customers c
join Packages p on c.CustomerID = p.CustomerID
join Payments py on p.PackageID = py.PackageID
order by py.Amount desc
limit 5;

-- 29. Find employees who are also delivery agents using Subquery.
 
select EmployeeID, EmployeeName, Designation
from Employees
where EmployeeID in (
    select EmployeeID from DeliveryAgents
);

-- 30. Show total insurance amount grouped by Provider.
 
select 
    Provider,
    sum(Amount) as TotalInsuranceAmount,
    count(*) as TotalPolicies
from Insurance
group by Provider;

-- 31. Display packages that have both payment and insurance records.
 
select 
    p.PackageID,
    p.PackageType,
    p.Weight,
    py.Amount as PaymentAmount,
    i.Amount as InsuranceAmount,
    i.Provider
from Packages p
join Payments py on p.PackageID = py.PackageID
join Insurance i on p.PackageID = i.PackageID;

-- 32. Find average rating given by customers for each city.
 
select 
    c.Address as City,
    avg(f.Rating) as AverageRating,
    count(f.FeedbackID) as TotalFeedbacks
from Customers c
join Feedback f on c.CustomerID = f.CustomerID
group by c.Address;

-- 33. List all complaints with customer name and package details.
 
select 
    c.CustomerName,
    p.PackageType,
    p.Weight,
    cm.ComplaintText,
    cm.Status
from Complaint cm
join Customers c on cm.CustomerID = c.CustomerID
join Packages p on c.CustomerID = p.CustomerID;

-- 34. Show branches where number of employees is greater than 3.
 
select 
    b.BranchID,
    b.BranchName,
    count(e.EmployeeID) as TotalEmployees
from Branches b
join Employees e on b.BranchID = e.BranchID
group by b.BranchID, b.BranchName
having count(e.EmployeeID) > 3;

-- 35. [VIEW] Create DeliveryAgentSummary view.
 
CREATE VIEW DeliveryAgentSummary AS
select 
    da.AgentID,
    e.EmployeeName,
    da.VehicleNo,
    b.BranchName,
    count(d.DeliveryID) as TotalDeliveries
from DeliveryAgents da
join Employees e on da.EmployeeID = e.EmployeeID
join Branches b on e.BranchID = b.BranchID
join Delivery d on da.AgentID = d.AgentID
group by da.AgentID, e.EmployeeName, da.VehicleNo, b.BranchName;

-- To use the view:
SELECT * FROM DeliveryAgentSummary;

-- 36. [TRIGGER] Create AfterComplaintInsert trigger.
 
-- First create the log table:
CREATE TABLE ComplaintLog(
    LogID INT PRIMARY KEY AUTO_INCREMENT,
    ComplaintID INT,
    CustomerID INT,
    LogDate DATETIME
);
 
-- Now create the trigger:
DELIMITER //
CREATE TRIGGER AfterComplaintInsert
AFTER INSERT ON Complaint
FOR EACH ROW
BEGIN
    INSERT INTO ComplaintLog(ComplaintID, CustomerID, LogDate)
    VALUES (NEW.ComplaintID, NEW.CustomerID, NOW());
END //
DELIMITER ;

-- 37. [STORED PROCEDURE] Create GetCustomerHistory procedure.
 
DELIMITER //
CREATE PROCEDURE GetCustomerHistory(IN p_CustomerID INT)
BEGIN
    SELECT 
        c.CustomerName,
        p.PackageID,
        p.PackageType,
        p.Weight,
        p.BookingDate,
        py.Amount AS PaymentAmount,
        t.StatusText AS ShipmentStatus,
        f.Rating AS FeedbackRating
    FROM Customers c
    JOIN Packages p ON c.CustomerID = p.CustomerID
    JOIN Payments py ON p.PackageID = py.PackageID
    JOIN Shipments s ON p.PackageID = s.PackageID
    JOIN TrackingStatus t ON s.ShipmentID = t.ShipmentID
    JOIN Feedback f ON c.CustomerID = f.CustomerID
    WHERE c.CustomerID = p_CustomerID;
END //
DELIMITER ;

-- To call the procedure:
CALL GetCustomerHistory(1);

-- 38. [TRANSACTION] Insert Package and Payment together.
 
START TRANSACTION;
 
INSERT INTO Packages(PackageID, CustomerID, Weight, PackageType, BookingDate)
VALUES (51, 1, 3.5, 'Parcel', '2026-03-01');
 
INSERT INTO Payments(PaymentID, PackageID, Amount, PaymentDate)
VALUES (51, 51, 250.00, '2026-03-01');
 
-- If both inserts are successful:
COMMIT;
 
-- If any insert fails, run this to undo everything:
-- ROLLBACK;




 



























