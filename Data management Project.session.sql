--1.Creating And Inserting data in Store table
CREATE TABLE Store (
    Store_ID INTEGER PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Operating_Hours VARCHAR(50) NOT NULL,
    Manager_ID INTEGER NOT NULL,
    Locations VARCHAR(50),
	phone_number VARCHAR(15) NOT NULL UNIQUE,
    head_office BOOLEAN DEFAULT FALSE
)

INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number, Head_Office) VALUES (1, 'Portsmouth Branch', '9AM-8PM', 1, 'Portsmouth', '+44151 496 0277', TRUE);
INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number) VALUES (2, 'Waterlooville Branch', '9AM-8PM', 7, 'Waterlooville', '+44131 496 0167');
INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number) VALUES (3, 'Fareham Branch', '9AM-8PM', 12, 'Fareham', '(0161) 4960969');
INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number) VALUES (4, 'Gosport Branch', '9AM-8PM', 18, 'Gosport', '+441164960177');
INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number) VALUES (5, 'Havant Branch', '9AM-8PM', 24, 'Havant', '01134960840');
INSERT INTO Store  (Store_ID, Name, Operating_Hours, Manager_ID, Locations, Phone_Number) VALUES (6, 'Chichester Branch', '9AM-8PM', 30, 'Chichester', '0141 496 0551');

--2.Creating And Inserting data in Staff table
CREATE TABLE Staff (
    Staff_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Role VARCHAR(255) NOT NULL,
    Shift_Pattern VARCHAR(255) NOT NULL,
    Commission Decimal(10,2) NOT NULL,
    Store_ID INT NOT NULL,
    Is_Manager BOOLEAN,
    Address VARCHAR(255),
    Phone_No VARCHAR(20) UNIQUE,
    FOREIGN KEY (Store_ID) REFERENCES STORE(Store_ID)
);

INSERT INTO Staff ( Name, Role, Shift_Pattern, Commission, Store_ID, is_manager, Address, Phone_no)
VALUES 
('Jeremy Taylor', 'Manager', '9 AM - 5 PM',0.06, 1, TRUE, '77 Sara parks, New Declan, DN05 1RJ', '+44(0)20 74960626')
,('Ben Abbott', 'Assistant Manager', '9 AM - 6 PM', 0.09, 1, FALSE, '36 Terence fords, Port Elizabethton, W1 1XJ', '01314960327')
,('Julia Freeman', 'Operations Associate', '8 AM - 8 PM', 0.09, 1, FALSE, '084 Raymond road, Morganside, W9K 4EA', '(0808) 1570132')
,('Natalie Edwards', 'Floor Supervisor', '10 AM - 4 PM', 0.02, 1, FALSE, 'Flat 9, Mathew station, Taylorborough, TW8B 4PF', '+44(0)161 4960130')
,('Miss Joanne Taylor', 'Operations Associate', '7 AM - 6 PM', 0.01, 1, FALSE, '624 Charlton crossroad, East Benjamin, W42 1JJ', '0113 496 0384')
,('Louise Powell', 'Operations Associate', '9 AM - 5 PM', 0.04, 1, FALSE, 'Studio 8, Tracey islands, Sandramouth, BH7M 9UG', '(020) 74960196')
,('Abigail Jones', 'Manager', '9 AM - 5 PM',0.06, 2, TRUE, '3 Harris ville, West Ian, LS33 4HJ', '+441414960007')
,('Jasmine Leonard', 'Customer Service Representative', '9 AM - 8 PM', 0.07, 2, FALSE, 'Flat 97q, Marilyn walks, Judithborough, DN0P 3FS', '+44(0)1184960428')
,('Douglas Fletcher', 'Visual Merchandiser', '7 AM - 3 PM', 0.1, 2, FALSE, '956 Angela well, West Jake, EX3X 1NF', '+44141 496 0720')
,( 'Louis Thomas', 'Inventory Control Specialist', '9 AM - 5 PM', 0.04, 2, FALSE, 'Flat 79t, Lesley walk, Barnesville, B8J 2JF', '0909 8790251')
,( 'Mr Billy Williams', 'Floor Supervisor', '9 AM - 7 PM', 0.06, 2, FALSE, 'Studio 34s, Johnson stream, East Ruth, NR25 9JR', '+44(0)161 496 0183')
,( 'Nicole Mitchell', 'Manager', '9 AM - 5 PM',0.06, 3, TRUE, 'Studio 40, Elliott forest, Francisport, L45 3UG', '(0808)1570322')
,( 'Amanda Farrell', 'Customer Service Representative', '8 AM - 5 PM', 0.06, 3, FALSE, 'Studio 0, Mohammed square, South Peterport, L0G 0BX', '(0114)4960150')
,( 'Jennifer Morrison', 'Assistant Manager', '7 AM - 4 PM', 0.07, 3, FALSE, '12 King way, North Diane, WC39 8JY', '0114 4960641')
,( 'Gary Shepherd-Murphy', 'Cashier', '6 AM - 7 PM', 0.05, 3, FALSE, 'Studio 6, Diana vista, Judithfurt, B0J 6BW', '+44161 496 0293')
,( 'Mrs Francesca Gill', 'Sales Associate', '8 AM - 3 PM', 0.03, 3, FALSE, '65 Thompson burg, Bryanshire, WC7A 2WX', '01632 960536')
,( 'Michael Oliver-Blackburn', 'Customer Service Representative', '9 AM - 6 PM', 0.09, 3, FALSE, '0 Callum square, Youngberg, CV1A 0GH', '(020)74960984')
,( 'Dr Alex Lowe', 'Manager', '9 AM - 5 PM',0.1, 4, TRUE, 'Flat 63, Holmes road, Brendaville, DH1P 8WR', '+44(0)114 4960945')
,( 'Donna Burton-ODonnell', 'Stock Associate', '7 AM - 4 PM', 0.05, 4, FALSE, 'Flat 28, Adams shoal, Connorburgh, RM9H 7TN', '+44(0)114 496 0465')
,( 'Alex Fowler', 'Fitting Room Attendant', '8 AM - 5 PM', 0.01, 4, FALSE, '0 Thorpe ferry, Terrytown, N4 4WL', '+441164960119')
,( 'Ruth Hargreaves', 'Sales Associate', '6 AM - 4 PM', 0.01, 4, FALSE, '73 Victor fields, Abdulland, S4 9GB', '01632960493')
,( 'Heather Harris', 'Visual Merchandiser', '9 AM - 8 PM', 0.04, 4, FALSE, '4 Taylor fall, North Francisland, S8J 3TS', '+44808 157 0981')
,( 'Ben Baxter-Hall', 'Visual Merchandiser', '6 AM - 4 PM', 0.03, 4, FALSE, 'Flat 73, Hale groves, Lake Gavinmouth, W3F 7ZQ', '(0116)4960902')
,( 'Dr Brandon Lord', 'Manager', '9 AM - 5 PM',0.15, 5, TRUE, 'Flat 64p, Brian radial, Robertschester, WS0 1YJ', '+441174960332')
,( 'Ms Sara Hughes', 'Stock Associate', '9 AM - 5 PM', 0.04, 5, FALSE, 'Studio 4, Ward glens, Lake Karlton, M2B 1UP', '+44909 8790789')
,( 'Mary Archer-Faulkner', 'Sales Associate', '8 AM - 5 PM', 0.09, 5, FALSE, 'Studio 51, Terence centers, Lake Megan, N9 8AH', '+44141 496 0456')
,( 'Mr Andrew Palmer', 'Cashier', '8 AM - 6 PM', 0.03, 5, FALSE, 'Studio 75, Angela plains, New Alan, E32 0AS', '+44(0)1184960144')
,( 'Dr Gareth Harvey', 'Fitting Room Attendant', '6 AM - 8 PM', 0.04, 5, FALSE, 'Studio 88o, Griffiths hill, Philipmouth, SA10 9GD', '(0808) 157 0842')
,( 'Gail Green', 'Fitting Room Attendant', '7 AM - 8 PM', 0.09, 5, FALSE, 'Studio 04E, Marshall common, Thompsonland, WN8 1WE', '+44(0)161 4960827')
,( 'Simon Cooper-Marsden', 'Manager', '9 AM - 5 PM',0.1, 6, TRUE, '549 Noble brook, New Katy, SE0 8ZT', '020 7946 0985')
,( 'Sandra Craig', 'Customer Service Representative', '6 AM - 7 PM', 0.06, 6, FALSE, 'Studio 52o, Lydia avenue, North Gemmaport, G4 4HL', '+44131 496 0338')
,( 'Robin Ashton', 'Floor Supervisor', '6 AM - 5 PM', 0.08, 6, FALSE, '310 Reynolds inlet, Simpsonburgh, E3W 2XB', '(0116) 4960894')
,( 'Craig Clarke', 'Cashier', '8 AM - 4 PM', 0.07, 6, FALSE, 'Studio 04, Fox stream, Melaniefort, CW8 0SX', '01164960267')
,( 'Raymond Glover', 'Assistant Manager', '7 AM - 3 PM', 0.01, 6, FALSE, '929 Anthony mountains, East Gavinton, WS4 2UY', '(0117) 496 0358')
,( 'Dr Donna Hunt', 'Customer Service Representative', '8 AM - 4 PM', 0.03, 6, FALSE, 'Flat 02, Turner burg, Ashleybury, N88 9YD', '(0121)4960641')

--3.Creating And Inserting data in Supplier table
CREATE TABLE Supplier (
    Supplier_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Contact_Info NVARCHAR(20) NOT NULL UNIQUE,
    Address VARCHAR(255) NOT NULL
);

INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Urban Threads Inc.', '+441154960919', '2 Denise lake, North Cameronmouth, M4 4QE');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Elegant Stitchers Ltd.', '+44(0)191 4960833', '39 Sheila rue, North Lewis, PR4 1SN');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Fashion Forward Co.', '0151 4960665', 'Flat 02, Morris crossing, Port Lucyberg, G78 7DX');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Pure Comfort Apparel', '01632 960851', 'Studio 6, Zoe harbors, South Garethville, W2 1TQ');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Vintage Vibe Wholesalers', '+44151 4960946', '146 Colin manor, Sianport, IM84 1BX');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Dynamic Denim Suppliers', '+44(0)2074960784', '71 Shannon run, Joshland, OL3 3XU');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('The Fabric Boutique', '01632 960936', '5 Gardner corners, Dobsonport, IM28 9DF');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('EcoWear Distributors', '0191 498 0449', 'Studio 1, Bibi loop, Woodsside, E13 8ZL');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Global Garment Group', '0151 496 0572', 'Studio 02, Newton walk, Simpsonborough, L83 7RH');
INSERT INTO Supplier (Name, Contact_info, Address) VALUES ('Style Essentials Ltd.', '+44(0)141 496 0782', '0 Murray point, Dickinsonview, S09 3ZT');

--4.Creating And Inserting data in Purchase_order table

--RUN THIS 1
CREATE TABLE Purchase_order (
    PO_ID SERIAL PRIMARY KEY,
    Price_Per_Unit Decimal(10,2) NOT NULL,
	Product_ID INT ,
    Item_Description VARCHAR(255) NOT NULL,
    Purchase_Order_Date DATE NOT NULL,
    Expected_Receiving_Date DATE NOT NULL,
    Supplier_ID INT,
    Store_ID INT,
    Size VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID)
);

--RUN THIS 3
WITH ProductIDs AS (
    SELECT 
        PO_ID,
        Item_Description,
        Size,
        MIN(PO_ID) OVER (PARTITION BY Item_Description, Size) AS FirstOccurrenceID
    FROM 
        Purchase_order
),
AssignedIDs AS (
    SELECT 
        PO_ID,
        Item_Description,
        Size,
        DENSE_RANK() OVER (ORDER BY FirstOccurrenceID) AS NewProductID
    FROM 
        ProductIDs
)

UPDATE Purchase_order
SET Product_ID = AssignedIDs.NewProductID
from AssignedIDs
    where Purchase_order.PO_ID = AssignedIDs.PO_ID;


--RUN THIS 4
update Purchase_order 
set Price_Per_Unit = 7.66
where Product_ID in (3,7,8,5);


--RUN THIS 2
INSERT INTO Purchase_order ( Price_Per_Unit, Product_ID, Item_Description, Purchase_order_Date, Expected_Receiving_Date, Supplier_id, Store_id, Size, Quantity) 
VALUES (1.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-04-04', '2024-11-03', 1, 1, 'M', 48),
(8.3, 39, 'Button-down cardigan with a cozy knit design and front pockets for convenience.', '2024-08-09', '2024-11-03', 1, 1, 'L', 42),
(7.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-07-26', '2024-08-02', 1, 1, 'M', 14),
(6.31, 58, 'Soft-knit, high-performance tank top with sweat-wicking technology.', '2024-07-11', '2024-07-22', 1, 1, 'XL', 33),
(1.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-05-29', '2024-06-12', 1, 1, 'XXL', 46),
(7.98, 27, 'Soft-knit cardigan with button closure and side pockets, ideal for layering.', '2024-03-25', '2024-09-16', 1, 2, 'XXL', 19),
(0.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-03-30', '2024-09-28', 1, 2, 'XL', 31),
(3.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-10-13', '2024-10-19', 1, 2, 'XL', 40),
(5.56, 53, 'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.', '2024-11-04', '2024-11-04', 1, 2, 'XL', 44),
(44.47, 55, 'Classic zip-up hoodie with a front pocket, ideal for layering over gym attire.', '2024-04-29', '2024-06-23', 1, 2, 'XL', 34),
(13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-03-05', '2024-08-22', 1, 3, 'M', 30),
(19.31, 70, 'Comfortable quilted cushion, ideal for extra seating comfort and style.', '2024-02-09', '2024-07-14', 1, 3, 'M', 38),
(23.75, 37, 'Lightweight hoodie with a drawstring hood and kangaroo pocket.', '2024-10-31', '2024-11-06', 1, 3, 'L', 41),
(17.65, 59, 'Comfortable, lightweight hoodie with a kangaroo pocket and ribbed cuffs.', '2024-10-25', '2024-11-04', 1, 3, 'S', 45),
(57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-02-02', '2024-06-17', 1, 3, 'XXL', 37),
(31.07, 43, 'Lightweight crewneck sweatshirt with a relaxed fit, ideal for everyday wear.', '2024-09-21', '2024-09-27', 1, 4, 'M', 40),
(24.98, 11, 'Casual zip-up hoodie with ribbed cuffs and a drawstring hood.', '2024-06-26', '2024-08-27', 1, 4, 'XS', 16),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-08-10', '2024-09-08', 1, 4, 'XXL', 19),
(30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-03-03', '2024-06-26', 1, 4, 'M', 45),
(59.57, 69, 'Elegant table runner with a textured fabric, perfect for adding a refined touch.', '2024-08-23', '2024-09-20', 1, 4, 'XS', 15),
(16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-05-31', '2024-11-02', 1, 5, 'L', 12),
(57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-10-20', '2024-11-04', 1, 5, 'XS', 37),
(37.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-09-20', '2024-09-20', 1, 5, 'S', 44),
(20.47, 25, 'Casual V-neck sweater with a soft knit texture and relaxed fit.', '2024-04-14', '2024-08-22', 1, 5, 'M', 30),
(22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-05-03', '2024-08-17', 1, 5, 'M', 15),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-03-18', '2024-08-23', 1, 6, 'M', 46),
(45.61, 50, 'V-neck sweater with a soft knit and ribbed cuffs, designed for everyday comfort.', '2024-01-18', '2024-07-20', 1, 6, 'XL', 26),
(10.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-10-20', '2024-10-21', 1, 6, 'XS', 22),
(37.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-01-20', '2024-08-04', 1, 6, 'L', 45),
(59.57, 69, 'Elegant table runner with a textured fabric, perfect for adding a refined touch.', '2024-01-13', '2024-03-09', 1, 6, 'L', 27),
(16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-10-12', '2024-10-17', 2, 1, 'XXL', 28),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-10-28', '2024-10-30', 2, 1, 'L', 29),
(52.94, 18, 'Classic pullover sweater with a crew neck and ribbed detailing.', '2024-03-26', '2024-10-25', 2, 1, 'S', 33),
(33.56, 45, 'Heavyweight knit pullover with a ribbed neckline and cuffs, perfect for colder days.', '2024-05-05', '2024-09-27', 2, 1, 'XS', 10),
(58.21, 40, 'Heavyweight pullover sweater with ribbed cuffs and hem, perfect for chilly weather.', '2024-09-28', '2024-10-01', 2, 1, 'XS', 21),
(23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-04-05', '2024-07-24', 2, 2, 'XS', 12),
(52.94, 18, 'Classic pullover sweater with a crew neck and ribbed detailing.', '2024-01-25', '2024-07-31', 2, 2, 'XL', 22),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-09-19', '2024-09-26', 2, 2, 'XXL', 48),
(59.57, 69, 'Elegant table runner with a textured fabric, perfect for adding a refined touch.', '2024-03-14', '2024-05-19', 2, 2, 'M', 11),
(16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-05-24', '2024-08-26', 2, 2, 'S', 26),
(56.35, 23, 'Lightweight hoodie with a drawstring hood and ribbed cuffs, ideal for layering.', '2024-10-08', '2024-10-16', 2, 3, 'L', 20),
(33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-05-19', '2024-10-11', 2, 3, 'M', 16),
(7.48, 33, 'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.', '2024-03-23', '2024-04-14', 2, 3, 'XS', 10),
(52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-05-05', '2024-07-15', 2, 3, 'S', 22),
(40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-07-18', '2024-11-04', 2, 3, 'L', 31),
(31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-02-10', '2024-04-13', 2, 4, 'S', 32),
(57.58, 19, 'Lightweight cardigan with an open front and dropped shoulders.', '2024-09-14', '2024-10-29', 2, 4, 'L', 18),
(37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-03-18', '2024-03-27', 2, 4, 'S', 22),
(31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-06-20', '2024-07-29', 2, 4, 'XS', 15),
(37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-06-26', '2024-08-01', 2, 4, 'S', 36),
(11.53, 61, 'Soft, absorbent bath towel with a plush texture, ideal for daily use.', '2024-03-13', '2024-06-09', 2, 5, 'S', 40),
(23.75, 37, 'Lightweight hoodie with a drawstring hood and kangaroo pocket.', '2024-01-03', '2024-06-29', 2, 5, 'XXL', 31),
(51.74, 3, 'Classic turtleneck sweater with ribbed cuffs and hem, designed for comfort.', '2024-03-23', '2024-07-20', 2, 5, 'L', 20),
(10.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-09-07', '2024-10-09', 2, 5, 'L', 35),
(16.31, 58, 'Soft-knit, high-performance tank top with sweat-wicking technology.', '2024-04-18', '2024-09-08', 2, 5, 'XXL', 10),
(19.1, 7, 'Button-up cardigan with a classic fit, featuring patch pockets for added style.', '2024-05-30', '2024-06-28', 2, 6, 'XS', 20),
(37.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-05-02', '2024-07-10', 2, 6, 'XXL', 42),
(35.48, 13, 'Soft knit cardigan with an open front and patch pockets.', '2024-05-08', '2024-07-19', 2, 6, 'XS', 40),
(56.86, 9, 'Knit sweater with a cable-knit pattern and ribbed collar, ideal for cooler days.', '2024-09-01', '2024-10-28', 2, 6, 'S', 40),
(37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-02-24', '2024-05-04', 2, 6, 'XL', 23),
(8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-07-22', '2024-08-11', 3, 1, 'XS', 45),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-07-19', '2024-10-14', 3, 1, 'XS', 50),
(58.21, 40, 'Heavyweight pullover sweater with ribbed cuffs and hem, perfect for chilly weather.', '2024-05-20', '2024-06-13', 3, 1, 'XXL', 13),
(32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-03-04', '2024-04-27', 3, 1, 'XS', 35),
(15.79, 26, 'Classic pullover sweatshirt with ribbed cuffs, perfect for everyday comfort.', '2024-02-16', '2024-06-07', 3, 1, 'S', 15),
(17.96, 38, 'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.', '2024-03-15', '2024-04-05', 3, 2, 'XS', 45),
(55.24, 63, 'Decorative throw pillow cover with a soft, textured fabric, perfect for couches.', '2024-07-11', '2024-10-03', 3, 2, 'L', 36),
(16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-02-07', '2024-08-14', 3, 2, 'XL', 36),
(20.34, 48, 'Open-front cardigan with a soft knit finish and front pockets for convenience.', '2024-04-03', '2024-05-02', 3, 2, 'L', 10),
(22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-02-22', '2024-04-15', 3, 2, 'S', 41),
(53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-06-07', '2024-11-02', 3, 3, 'XS', 30),
(27.28, 67, 'Classic, woven kitchen rug with durable fibers and an easy-clean surface.', '2024-05-11', '2024-05-30', 3, 3, 'S', 13),
(33.46, 44, 'Classic hoodie with drawstring and front pocket, crafted for casual comfort.', '2024-02-10', '2024-10-30', 3, 3, 'XS', 10),
(10.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-02-27', '2024-10-02', 3, 3, 'XL', 50),
(13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-09-24', '2024-10-09', 3, 3, 'M', 30),
(16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-10-21', '2024-11-02', 3, 4, 'L', 13),
(35.41, 66, 'Stylish tablecloth with a soft texture and elegant design, suitable for dining.', '2024-05-03', '2024-05-03', 3, 4, 'S', 22),
(13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-06-02', '2024-07-24', 3, 4, 'L', 14),
(13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-01-28', '2024-09-14', 3, 4, 'M', 20),
(13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-09-08', '2024-11-03', 3, 4, 'M', 31),
(53.3, 46, 'Classic long-sleeve sweater with a crewneck design, made for warmth and style.', '2024-06-06', '2024-08-12', 3, 5, 'XL', 11),
(7.48, 33, 'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.', '2024-07-27', '2024-09-06', 3, 5, 'XS', 26),
(16.31, 58, 'Soft-knit, high-performance tank top with sweat-wicking technology.', '2024-07-15', '2024-10-04', 3, 5, 'M', 33),
(59.53, 62, 'Luxurious bedspread with a fine weave, adding elegance to any bedroom.', '2024-05-08', '2024-05-10', 3, 5, 'M', 47),
(17.96, 38, 'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.', '2024-06-14', '2024-09-22', 3, 5, 'XL', 30),
(58.01, 6, 'Soft, fine-knit pullover with ribbed trim and a relaxed fit for casual days.', '2024-09-15', '2024-10-30', 3, 6, 'S', 13),
(13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-02-05', '2024-03-13', 3, 6, 'XS', 19),
(20.47, 25, 'Casual V-neck sweater with a soft knit texture and relaxed fit.', '2024-03-31', '2024-06-03', 3, 6, 'XL', 20),
(24.69, 16, 'Soft, oversized cardigan with button closure and front pockets.', '2024-03-10', '2024-10-19', 3, 6, 'XL', 40),
(16.31, 58, 'Soft-knit, high-performance tank top with sweat-wicking technology.', '2024-09-01', '2024-10-26', 3, 6, 'M', 37),
(15.79, 26, 'Classic pullover sweatshirt with ribbed cuffs, perfect for everyday comfort.', '2024-03-30', '2024-08-31', 4, 1, 'M', 33),
(24.07, 21, 'Classic long-sleeve shirt with a button-down front and comfortable fit.', '2024-04-20', '2024-05-05', 4, 1, 'L', 42),
(28.3, 39, 'Button-down cardigan with a cozy knit design and front pockets for convenience.', '2024-10-23', '2024-10-31', 4, 1, 'XS', 24),
(48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-08-29', '2024-09-16', 4, 1, 'XXL', 12),
(55.24, 63, 'Decorative throw pillow cover with a soft, textured fabric, perfect for couches.', '2024-01-09', '2024-11-02', 4, 1, 'XL', 31),
(28.3, 39, 'Button-down cardigan with a cozy knit design and front pockets for convenience.', '2024-08-20', '2024-11-05', 4, 2, 'S', 30),
(38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-03-08', '2024-08-26', 4, 2, 'L', 13),
(38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-03-28', '2024-05-30', 4, 2, 'XS', 31),
(21.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-01-22', '2024-05-07', 4, 2, 'XS', 22),
( 31.07, 43, 'Lightweight crewneck sweatshirt with a relaxed fit, ideal for everyday wear.', '2024-04-10', '2024-07-20', 4, 2, 'S', 47),
( 34.71, 28, 'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.', '2024-06-19', '2024-08-03', 4, 3, 'XXL', 22),
( 24.69, 16, 'Soft, oversized cardigan with button closure and front pockets.', '2024-09-06', '2024-10-07', 4, 3, 'XXL', 12),
( 33.56, 45, 'Heavyweight knit pullover with a ribbed neckline and cuffs, perfect for colder days.', '2024-10-30', '2024-11-01', 4, 3, 'XXL', 16),
( 17.96, 38, 'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.', '2024-01-09', '2024-06-12', 4, 3, 'L', 17),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-10-30', '2024-11-05', 4, 3, 'XL', 20),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-02-12', '2024-07-13', 4, 4, 'XS', 48),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-05-26', '2024-06-17', 4, 4, 'XXL', 15),
( 33.46, 44, 'Classic hoodie with drawstring and front pocket, crafted for casual comfort.', '2024-04-15', '2024-09-22', 4, 4, 'XL', 23),
( 29.06, 22, 'Soft pullover with ribbed trim and a relaxed fit, perfect for casual wear.', '2024-02-22', '2024-07-11', 4, 4, 'L', 43),
( 23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-05-07', '2024-10-21', 4, 4, 'S', 20),
( 47.08, 65, 'Lightweight duvet cover, crafted for comfort and easy maintenance.', '2024-10-04', '2024-11-01', 4, 5, 'XS', 34),
( 41.24, 5, 'Long-sleeve cardigan with an open front, ideal for layering over light tops.', '2024-06-26', '2024-08-02', 4, 5, 'S', 28),
( 56.86, 9, 'Knit sweater with a cable-knit pattern and ribbed collar, ideal for cooler days.', '2024-02-24', '2024-08-14', 4, 5, 'S', 10),
( 52.94, 18, 'Classic pullover sweater with a crew neck and ribbed detailing.', '2024-07-17', '2024-10-12', 4, 5, 'M', 22),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-10-14', '2024-10-24', 4, 5, 'S', 46),
( 7.19, 64, 'Soft, durable kitchen towel set, designed for everyday cleaning.', '2024-08-25', '2024-09-04', 4, 6, 'XL', 39),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-02-13', '2024-11-06', 4, 6, 'XL', 12),
( 22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-05-07', '2024-11-02', 4, 6, 'XXL', 42),
( 48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-08-07', '2024-08-17', 4, 6, 'XL', 21),
( 7.48, 33, 'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.', '2024-04-29', '2024-08-11', 4, 6, 'XS', 22),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-10-07', '2024-11-01', 5, 1, 'XL', 29),
( 53.3, 46, 'Classic long-sleeve sweater with a crewneck design, made for warmth and style.', '2024-07-17', '2024-10-20', 5, 1, 'S', 46),
( 24.69, 16, 'Soft, oversized cardigan with button closure and front pockets.', '2024-04-14', '2024-08-05', 5, 1, 'XL', 48),
( 57.58, 19, 'Lightweight cardigan with an open front and dropped shoulders.', '2024-03-20', '2024-05-29', 5, 1, 'L', 32),
( 31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-05-23', '2024-08-11', 5, 1, 'XXL', 12),
( 59.53, 62, 'Luxurious bedspread with a fine weave, adding elegance to any bedroom.', '2024-01-14', '2024-01-16', 5, 2, 'XXL', 17),
( 10.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-03-31', '2024-06-23', 5, 2, 'S', 16),
( 22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-10-30', '2024-11-03', 5, 2, 'XS', 13),
( 7.48, 33, 'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.', '2024-01-29', '2024-09-07', 5, 2, 'L', 40),
( 30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-07-03', '2024-10-27', 5, 2, 'XS', 20),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-09-03', '2024-09-05', 5, 3, 'XS', 13),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-07-01', '2024-10-15', 5, 3, 'XXL', 22),
( 55.24, 63, 'Decorative throw pillow cover with a soft, textured fabric, perfect for couches.', '2024-07-27', '2024-09-30', 5, 3, 'L', 25),
( 20.47, 25, 'Casual V-neck sweater with a soft knit texture and relaxed fit.', '2024-06-10', '2024-09-21', 5, 3, 'XL', 19),
( 17.96, 38, 'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.', '2024-03-09', '2024-06-02', 5, 3, 'XXL', 10),
( 37.18, 32, 'Long-sleeve button-down shirt with a relaxed fit, perfect for casual wear.', '2024-01-29', '2024-08-18', 5, 4, 'M', 25),
( 13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-02-14', '2024-03-08', 5, 4, 'XXL', 46),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-06-02', '2024-08-01', 5, 4, 'XS', 43),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-01-07', '2024-07-27', 5, 4, 'XL', 26),
( 37.18, 32, 'Long-sleeve button-down shirt with a relaxed fit, perfect for casual wear.', '2024-07-05', '2024-11-01', 5, 4, 'XXL', 17),
( 9.98, 60, 'Quick-dry athletic shorts with a mesh lining, designed for intense workouts.', '2024-03-30', '2024-06-07', 5, 5, 'XL', 45),
( 24.07, 21, 'Classic long-sleeve shirt with a button-down front and comfortable fit.', '2024-03-02', '2024-07-21', 5, 5, 'S', 43),
( 7.19, 64, 'Soft, durable kitchen towel set, designed for everyday cleaning.', '2024-06-11', '2024-07-02', 5, 5, 'XXL', 27),
( 31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-09-22', '2024-09-23', 5, 5, 'XS', 13),
( 19.1, 7, 'Button-up cardigan with a classic fit, featuring patch pockets for added style.', '2024-10-06', '2024-11-01', 5, 5, 'XL', 16),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-10-12', '2024-11-04', 5, 6, 'S', 27),
( 31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-06-07', '2024-09-19', 5, 6, 'S', 37),
( 7.19, 64, 'Soft, durable kitchen towel set, designed for everyday cleaning.', '2024-03-23', '2024-09-30', 5, 6, 'XS', 16),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-10-05', '2024-10-10', 5, 6, 'XS', 47),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-10-15', '2024-10-25', 5, 6, 'M', 27),
( 52.19, 31, 'Classic crewneck sweater with ribbed hem and cuffs for everyday comfort.', '2024-08-28', '2024-10-26', 6, 1, 'XL', 41),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-10-07', '2024-11-04', 6, 1, 'L', 39),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-04-06', '2024-10-10', 6, 1, 'L', 14),
( 19.31, 70, 'Comfortable quilted cushion, ideal for extra seating comfort and style.', '2024-03-05', '2024-09-20', 6, 1, 'M', 38),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-03-03', '2024-03-12', 6, 1, 'S', 34),
( 33.27, 47, 'Relaxed fit pullover with a soft knit texture and ribbed details, perfect for layering.', '2024-09-15', '2024-09-22', 6, 2, 'XS', 38),
( 31.07, 43, 'Lightweight crewneck sweatshirt with a relaxed fit, ideal for everyday wear.', '2024-01-07', '2024-01-17', 6, 2, 'XL', 10),
( 18.72, 4, 'Crewneck sweatshirt with a relaxed fit, made for everyday wear and comfort.', '2024-01-19', '2024-08-01', 6, 2, 'XXL', 16),
( 16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-11-02', '2024-11-06', 6, 2, 'M', 12),
( 17.65, 59, 'Comfortable, lightweight hoodie with a kangaroo pocket and ribbed cuffs.', '2024-10-19', '2024-10-29', 6, 2, 'XXL', 35),
( 57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-05-28', '2024-10-01', 6, 3, 'XXL', 27),
( 30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-05-01', '2024-05-08', 6, 3, 'XS', 18),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-03-08', '2024-07-08', 6, 3, 'XXL', 42),
( 37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-02-03', '2024-02-26', 6, 3, 'L', 43),
( 34.71, 28, 'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.', '2024-02-26', '2024-10-07', 6, 3, 'XL', 21),
( 9.98, 60, 'Quick-dry athletic shorts with a mesh lining, designed for intense workouts.', '2024-03-11', '2024-03-24', 6, 4, 'L', 38),
( 34.71, 28, 'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.', '2024-02-21', '2024-05-02', 6, 4, 'XXL', 45),
( 23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-01-24', '2024-02-11', 6, 4, 'L', 16),
( 22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-07-05', '2024-10-14', 6, 4, 'XS', 32),
( 17.65, 59, 'Comfortable, lightweight hoodie with a kangaroo pocket and ribbed cuffs.', '2024-02-27', '2024-03-06', 6, 4, 'M', 49),
( 18.72, 4, 'Crewneck sweatshirt with a relaxed fit, made for everyday wear and comfort.', '2024-09-13', '2024-09-29', 6, 5, 'XL', 38),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-04-26', '2024-09-23', 6, 5, 'XL', 42),
( 52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-04-25', '2024-06-25', 6, 5, 'XXL', 47),
( 29.06, 22, 'Soft pullover with ribbed trim and a relaxed fit, perfect for casual wear.', '2024-08-05', '2024-10-07', 6, 5, 'XL', 26),
( 57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-01-25', '2024-06-25', 6, 5, 'XL', 31),
( 15.56, 53, 'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.', '2024-07-26', '2024-10-19', 6, 6, 'XXL', 26),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-10-17', '2024-11-04', 6, 6, 'XL', 11),
( 47.08, 65, 'Lightweight duvet cover, crafted for comfort and easy maintenance.', '2024-08-21', '2024-08-28', 6, 6, 'XL', 13),
( 9.98, 60, 'Quick-dry athletic shorts with a mesh lining, designed for intense workouts.', '2024-02-27', '2024-03-02', 6, 6, 'XS', 30),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-09-24', '2024-11-05', 6, 6, 'L', 11),
( 51.74, 3, 'Classic turtleneck sweater with ribbed cuffs and hem, designed for comfort.', '2024-07-18', '2024-10-05', 7, 1, 'XXL', 35),
( 10.86, 49, 'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.', '2024-07-21', '2024-10-20', 7, 1, 'M', 46),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-02-25', '2024-09-01', 7, 1, 'S', 49),
( 33.56, 45, 'Heavyweight knit pullover with a ribbed neckline and cuffs, perfect for colder days.', '2024-01-07', '2024-06-26', 7, 1, 'XS', 28),
( 35.48, 13, 'Soft knit cardigan with an open front and patch pockets.', '2024-03-29', '2024-06-13', 7, 1, 'S', 43),
( 57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-10-31', '2024-11-02', 7, 2, 'XS', 34),
( 41.24, 5, 'Long-sleeve cardigan with an open front, ideal for layering over light tops.', '2024-06-17', '2024-06-22', 7, 2, 'M', 29),
( 37.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-10-22', '2024-10-25', 7, 2, 'M', 41),
( 30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-01-08', '2024-02-23', 7, 2, 'XXL', 19),
( 59.57, 69, 'Elegant table runner with a textured fabric, perfect for adding a refined touch.', '2024-05-21', '2024-05-25', 7, 2, 'XL', 13),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-10-18', '2024-10-22', 7, 3, 'XL', 15),
( 11.53, 61, 'Soft, absorbent bath towel with a plush texture, ideal for daily use.', '2024-09-14', '2024-10-09', 7, 3, 'M', 44),
( 58.21, 40, 'Heavyweight pullover sweater with ribbed cuffs and hem, perfect for chilly weather.', '2024-10-29', '2024-10-31', 7, 3, 'S', 10),
( 52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-04-02', '2024-11-06', 7, 3, 'M', 50),
( 41.24, 5, 'Long-sleeve cardigan with an open front, ideal for layering over light tops.', '2024-04-17', '2024-07-26', 7, 3, 'XXL', 28),
( 51.74, 3, 'Classic turtleneck sweater with ribbed cuffs and hem, designed for comfort.', '2024-02-22', '2024-06-23', 7, 4, 'M', 14),
( 52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-06-30', '2024-08-17', 7, 4, 'XL', 19),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-05-19', '2024-05-31', 7, 4, 'XXL', 15),
( 47.08, 65, 'Lightweight duvet cover, crafted for comfort and easy maintenance.', '2024-09-29', '2024-10-20', 7, 4, 'XL', 44),
( 37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-09-30', '2024-09-30', 7, 4, 'S', 20),
( 16.31, 58, 'Soft-knit, high-performance tank top with sweat-wicking technology.', '2024-04-18', '2024-08-21', 7, 5, 'XXL', 23),
( 58.21, 40, 'Heavyweight pullover sweater with ribbed cuffs and hem, perfect for chilly weather.', '2024-02-29', '2024-06-14', 7, 5, 'XL', 15),
( 57.58, 19, 'Lightweight cardigan with an open front and dropped shoulders.', '2024-02-22', '2024-10-24', 7, 5, 'M', 31),
( 52.19, 31, 'Classic crewneck sweater with ribbed hem and cuffs for everyday comfort.', '2024-09-21', '2024-10-27', 7, 5, 'L', 12),
( 44.47, 55, 'Classic zip-up hoodie with a front pocket, ideal for layering over gym attire.', '2024-04-07', '2024-05-12', 7, 5, 'XL', 23),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-03-10', '2024-10-24', 7, 6, 'XL', 25),
( 7.48, 33, 'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.', '2024-05-01', '2024-10-02', 7, 6, 'XS', 46),
( 34.71, 28, 'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.', '2024-03-08', '2024-09-19', 7, 6, 'XL', 19),
( 30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-10-16', '2024-11-05', 7, 6, 'L', 12),
( 20.47, 25, 'Casual V-neck sweater with a soft knit texture and relaxed fit.', '2024-06-09', '2024-09-01', 7, 6, 'XL', 20),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-05-04', '2024-08-18', 8, 1, 'S', 20),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-10-22', '2024-10-30', 8, 1, 'S', 41),
( 16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-08-20', '2024-10-19', 8, 1, 'XXL', 38),
( 34.71, 28, 'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.', '2024-02-09', '2024-05-07', 8, 1, 'M', 38),
( 45.61, 50, 'V-neck sweater with a soft knit and ribbed cuffs, designed for everyday comfort.', '2024-09-07', '2024-09-27', 8, 1, 'XXL', 21),
( 23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-04-06', '2024-07-20', 8, 2, 'XS', 14),
( 21.61, 36, 'Open-front cardigan with patch pockets and a relaxed fit, perfect for layering.', '2024-08-31', '2024-09-24', 8, 2, 'XL', 28),
( 57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-02-02', '2024-04-15', 8, 2, 'S', 31),
( 21.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-01-05', '2024-05-01', 8, 2, 'XS', 27),
( 35.48, 13, 'Soft knit cardigan with an open front and patch pockets.', '2024-02-10', '2024-05-18', 8, 2, 'S', 28),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-02-07', '2024-07-29', 8, 3, 'S', 14),
( 13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-01-21', '2024-06-05', 8, 3, 'L', 37),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-04-12', '2024-04-16', 8, 3, 'XL', 48),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-08-25', '2024-09-06', 8, 3, 'XS', 48),
( 33.56, 45, 'Heavyweight knit pullover with a ribbed neckline and cuffs, perfect for colder days.', '2024-10-17', '2024-10-22', 8, 3, 'XXL', 49),
( 41.24, 5, 'Long-sleeve cardigan with an open front, ideal for layering over light tops.', '2024-05-10', '2024-06-19', 8, 4, 'XS', 39),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-06-20', '2024-09-30', 8, 4, 'M', 23),
( 28.3, 39, 'Button-down cardigan with a cozy knit design and front pockets for convenience.', '2024-08-13', '2024-10-06', 8, 4, 'M', 38),
( 35.48, 13, 'Soft knit cardigan with an open front and patch pockets.', '2024-08-02', '2024-09-18', 8, 4, 'M', 31),
( 23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-04-22', '2024-10-07', 8, 4, 'XL', 10),
( 47.08, 65, 'Lightweight duvet cover, crafted for comfort and easy maintenance.', '2024-01-25', '2024-04-15', 8, 5, 'L', 36),
( 37.18, 32, 'Long-sleeve button-down shirt with a relaxed fit, perfect for casual wear.', '2024-07-02', '2024-10-14', 8, 5, 'M', 48),
( 21.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-05-12', '2024-05-31', 8, 5, 'L', 34),
( 53.3, 46, 'Classic long-sleeve sweater with a crewneck design, made for warmth and style.', '2024-05-16', '2024-06-24', 8, 5, 'XXL', 26),
( 52.94, 18, 'Classic pullover sweater with a crew neck and ribbed detailing.', '2024-10-08', '2024-10-28', 8, 5, 'L', 23),
( 48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-06-27', '2024-08-08', 8, 6, 'XS', 40),
( 33.2, 52, 'Breathable running shorts with an elastic waistband and quick-dry fabric.', '2024-07-06', '2024-10-29', 8, 6, 'XXL', 44),
( 23.02, 10, 'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.', '2024-02-12', '2024-03-25', 8, 6, 'XL', 24),
( 29.06, 22, 'Soft pullover with ribbed trim and a relaxed fit, perfect for casual wear.', '2024-03-06', '2024-06-11', 8, 6, 'XXL', 37),
( 7.19, 64, 'Soft, durable kitchen towel set, designed for everyday cleaning.', '2024-03-31', '2024-05-21', 8, 6, 'XL', 25),
( 33.27, 47, 'Relaxed fit pullover with a soft knit texture and ribbed details, perfect for layering.', '2024-01-23', '2024-04-26', 9, 1, 'S', 11),
( 15.56, 53, 'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.', '2024-01-17', '2024-11-04', 9, 1, 'XS', 29),
( 24.98, 11, 'Casual zip-up hoodie with ribbed cuffs and a drawstring hood.', '2024-07-19', '2024-08-02', 9, 1, 'M', 49),
( 59.53, 62, 'Luxurious bedspread with a fine weave, adding elegance to any bedroom.', '2024-03-13', '2024-09-25', 9, 1, 'XL', 45),
( 27.28, 67, 'Classic, woven kitchen rug with durable fibers and an easy-clean surface.', '2024-02-16', '2024-09-03', 9, 1, 'XS', 40),
( 17.32, 2, 'Lightweight V-neck pullover with a cozy texture, ideal for layering.', '2024-05-11', '2024-09-26', 9, 2, 'S', 47),
( 47.08, 65, 'Lightweight duvet cover, crafted for comfort and easy maintenance.', '2024-08-21', '2024-08-29', 9, 2, 'S', 26),
( 24.98, 11, 'Casual zip-up hoodie with ribbed cuffs and a drawstring hood.', '2024-02-25', '2024-10-13', 9, 2, 'M', 44),
( 32.15, 35, 'Classic V-neck sweater with ribbed trim, made for everyday comfort.', '2024-10-25', '2024-11-01', 9, 2, 'M', 23),
( 11.53, 61, 'Soft, absorbent bath towel with a plush texture, ideal for daily use.', '2024-07-17', '2024-08-21', 9, 2, 'M', 39),
( 23.75, 37, 'Lightweight hoodie with a drawstring hood and kangaroo pocket.', '2024-04-15', '2024-06-17', 9, 3, 'XS', 31),
( 37.18, 32, 'Long-sleeve button-down shirt with a relaxed fit, perfect for casual wear.', '2024-06-09', '2024-06-11', 9, 3, 'XL', 50),
( 20.47, 25, 'Casual V-neck sweater with a soft knit texture and relaxed fit.', '2024-04-24', '2024-08-12', 9, 3, 'XL', 46),
( 30.09, 56, 'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.', '2024-09-13', '2024-11-05', 9, 3, 'XXL', 14),
( 19.31, 70, 'Comfortable quilted cushion, ideal for extra seating comfort and style.', '2024-03-24', '2024-03-24', 9, 3, 'XXL', 15),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-10-14', '2024-10-27', 9, 4, 'S', 20),
( 16.18, 51, 'Lightweight athletic tank top with a racerback design, perfect for workouts.', '2024-01-09', '2024-08-24', 9, 4, 'M', 41),
( 52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-02-17', '2024-04-26', 9, 4, 'M', 46),
( 17.96, 38, 'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.', '2024-09-15', '2024-09-30', 9, 4, 'S', 38),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-02-05', '2024-04-30', 9, 4, 'S', 22),
( 31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-04-10', '2024-04-12', 9, 5, 'XXL', 42),
( 28.3, 39, 'Button-down cardigan with a cozy knit design and front pockets for convenience.', '2024-05-21', '2024-09-02', 9, 5, 'XL', 33),
( 21.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-04-23', '2024-09-28', 9, 5, 'XXL', 23),
( 58.74, 14, 'Lightweight pullover with ribbed hem and cuffs, ideal for layering.', '2024-08-08', '2024-10-20', 9, 5, 'XXL', 18),
( 27.28, 67, 'Classic, woven kitchen rug with durable fibers and an easy-clean surface.', '2024-04-09', '2024-04-11', 9, 5, 'XL', 48),
( 20.34, 48, 'Open-front cardigan with a soft knit finish and front pockets for convenience.', '2024-06-26', '2024-10-19', 9, 6, 'M', 49),
( 52.19, 31, 'Classic crewneck sweater with ribbed hem and cuffs for everyday comfort.', '2024-06-07', '2024-06-24', 9, 6, 'XS', 20),
( 19.31, 70, 'Comfortable quilted cushion, ideal for extra seating comfort and style.', '2024-03-22', '2024-08-21', 9, 6, 'L', 14),
( 58.01, 6, 'Soft, fine-knit pullover with ribbed trim and a relaxed fit for casual days.', '2024-09-07', '2024-09-15', 9, 6, 'XXL', 22),
( 24.07, 21, 'Classic long-sleeve shirt with a button-down front and comfortable fit.', '2024-06-07', '2024-08-31', 9, 6, 'M', 25),
( 48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-10-20', '2024-10-20', 10, 1, 'L', 15),
( 48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-09-03', '2024-09-08', 10, 1, 'M', 28),
( 21.77, 57, 'Breathable sports tee with a relaxed fit, made from quick-dry material.', '2024-06-27', '2024-07-28', 10, 1, 'XS', 49),
( 22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-02-25', '2024-11-06', 10, 1, 'L', 17),
( 37.66, 17, 'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.', '2024-07-03', '2024-09-26', 10, 1, 'XL', 22),
( 40.45, 30, 'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.', '2024-04-25', '2024-08-13', 10, 2, 'XL', 10),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-02-29', '2024-03-02', 10, 2, 'M', 29),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-03-26', '2024-09-06', 10, 2, 'L', 19),
( 57.35, 8, 'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.', '2024-08-05', '2024-09-24', 10, 2, 'XL', 32),
( 15.56, 53, 'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.', '2024-01-30', '2024-05-21', 10, 2, 'M', 10),
( 57.58, 19, 'Lightweight cardigan with an open front and dropped shoulders.', '2024-02-20', '2024-04-25', 10, 3, 'L', 35),
( 31.69, 42, 'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.', '2024-08-26', '2024-10-20', 10, 3, 'M', 45),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-09-25', '2024-10-19', 10, 3, 'XS', 45),
( 22.97, 1, 'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.', '2024-03-28', '2024-07-30', 10, 3, 'M', 38),
( 8.22, 20, 'High-neck sweater with a ribbed collar and hem, perfect for layering.', '2024-03-11', '2024-05-10', 10, 3, 'XL', 33),
( 35.38, 15, 'Relaxed-fit sweater with a V-neck design, perfect for cool days.', '2024-01-30', '2024-02-12', 10, 4, 'XXL', 49),
( 52.45, 29, 'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.', '2024-08-01', '2024-10-28', 10, 4, 'L', 29),
( 44.47, 55, 'Classic zip-up hoodie with a front pocket, ideal for layering over gym attire.', '2024-07-18', '2024-07-21', 10, 4, 'XXL', 13),
( 13.63, 54, 'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.', '2024-05-31', '2024-06-22', 10, 4, 'M', 40),
( 37.19, 68, 'Set of decorative napkins with a smooth finish, ideal for special occasions.', '2024-04-24', '2024-08-13', 10, 4, 'M', 36),
( 11.53, 61, 'Soft, absorbent bath towel with a plush texture, ideal for daily use.', '2024-10-07', '2024-11-06', 10, 5, 'XL', 42),
( 44.47, 55, 'Classic zip-up hoodie with a front pocket, ideal for layering over gym attire.', '2024-02-08', '2024-07-09', 10, 5, 'L', 42),
( 7.19, 64, 'Soft, durable kitchen towel set, designed for everyday cleaning.', '2024-02-25', '2024-05-27', 10, 5, 'M', 41),
( 48.46, 41, 'Classic pullover sweater with a high neck, perfect for a cozy winter look.', '2024-05-05', '2024-10-19', 10, 5, 'XL', 22),
( 35.38, 15, 'Relaxed-fit sweater with a V-neck design, perfect for cool days.', '2024-07-03', '2024-07-27', 10, 5, 'S', 43),
( 15.56, 53, 'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.', '2024-02-22', '2024-10-03', 10, 6, 'XS', 38),
( 38.0, 34, 'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.', '2024-09-29', '2024-10-17', 10, 6, 'XXL', 16),
( 13.3, 24, 'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.', '2024-02-06', '2024-06-17', 10, 6, 'XXL', 39),
( 41.24, 5, 'Long-sleeve cardigan with an open front, ideal for layering over light tops.', '2024-05-28', '2024-07-30', 10, 6, 'XL', 21),
( 53.21, 12, 'Classic crewneck pullover with a relaxed fit and soft finish.', '2024-02-15', '2024-09-29', 10, 6, 'XL', 22)


--5.Creating And Inserting data in Category table
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(50) NOT NULL
);

INSERT INTO Category (Category_ID, Name, Gender) VALUES (1, 'Women', 'Female');
INSERT INTO Category (Category_ID, Name, Gender) VALUES (2, 'Men', 'Male');
INSERT INTO Category (Category_ID, Name, Gender) VALUES (3, 'Baby', 'Unisex');
INSERT INTO Category (Category_ID, Name, Gender) VALUES (4, 'Home Product', 'Unisex');

--6.Creating And Inserting data in Product table
--RUN THIS 1
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Category_ID INT ,
    Description VARCHAR(100) NOT NULL,
    Size VARCHAR(10) NOT NULL,
    Composition VARCHAR(100),
    Price Decimal(10,2) NOT NULL,
	Product_NO BIGINT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);

--RUN THIS 2
INSERT INTO Product(Product_ID, Description, Size, Price)
SELECT DISTINCT Product_ID, Item_Description, Size, MAX(Price_Per_Unit * 1.4)
FROM Purchase_order
GROUP BY Product_ID, Item_Description, Size;


--RUN THIS 3
update Product
SET Category_ID = 1
where Description in ('Classic crewneck sweater with ribbed hem and cuffs for everyday comfort.'
,'Classic long-sleeve shirt with a button-down front and comfortable fit.'
,'Classic pullover sweater with a crew neck and ribbed detailing.'
,'Classic V-neck sweater with ribbed trim, made for everyday comfort.'
,'Crewneck sweater with a textured knit design and soft feel, ideal for casual wear.'
,'High-neck sweater with a ribbed collar and hem, perfect for layering.'
,'Knit sweater with a cable-knit pattern and ribbed collar, ideal for cooler days.'
,'Soft cotton blend sweater with a crewneck and relaxed fit, perfect for casual wear.'
,'Classic turtleneck sweater with ribbed cuffs and hem, designed for comfort.');

update Product
SET Category_ID = 2
where Description in ('Button-down cardigan with a cozy knit design and front pockets for convenience.'
,'Button-up cardigan with a classic fit, featuring patch pockets for added style.'
,'Button-up cardigan with a relaxed fit and ribbed hem, perfect for cool days.'
,'Cable-knit pullover sweater with a crew neckline, crafted for a cozy winter look.'
,'Casual V-neck sweater with a soft knit texture and relaxed fit.'
,'Classic pullover sweater with a high neck, perfect for a cozy winter look.'
,'Lightweight athletic tank top with a racerback design, perfect for workouts.'
,'Lightweight cardigan with an open front and dropped shoulders.'
,'Lightweight V-neck pullover with a cozy texture, ideal for layering.'
,'Long-sleeve button-down cardigan with ribbed detailing and relaxed fit.'
,'Long-sleeve cardigan with an open front, ideal for layering over light tops.'
,'Open-front cardigan with a soft knit finish and front pockets for convenience.'
,'Open-front cardigan with patch pockets and a relaxed fit, perfect for layering.'
,'Open-front cardigan with patch pockets and ribbed detailing for extra comfort.'
,'Relaxed-fit pullover with a soft knit texture and ribbed details, perfect for layering.'
,'Relaxed-fit sweater with a V-neck design, perfect for cool days.'
,'Soft knit cardigan with an open front and patch pockets.'
,'Soft V-neck cardigan with button closures and ribbed detailing for a comfortable fit.'
,'Soft, cozy pullover with a classic fit, ideal for layering in cooler weather.'
,'Soft, fine-knit pullover with ribbed trim and a relaxed fit for casual days.'
,'Soft-knit cardigan with button closure and side pockets, ideal for layering.'
,'Soft-knit, high-performance tank top with sweat-wicking technology.'
,'Stretchable leggings with a high-rise waistband, designed for flexibility and comfort.'
,'V-neck sweater with a soft knit and ribbed cuffs, designed for everyday comfort.'
,'Soft, oversized cardigan with button closure and front pockets.'
,'Relaxed fit pullover with a soft knit texture and ribbed details, perfect for layering.'
);

update Product
SET Category_ID = 3
where Description in ('Comfortable, lightweight hoodie with a kangaroo pocket and ribbed cuffs.'
,'Crewneck sweatshirt with a relaxed fit, made for everyday wear and comfort.'
,'Heavyweight knit pullover with a ribbed neckline and cuffs, perfect for colder days.'
,'Heavyweight pullover sweater with ribbed cuffs and hem, perfect for chilly weather.'
,'Lightweight crewneck sweatshirt with a relaxed fit, ideal for everyday wear.'
,'Lightweight hoodie with a drawstring hood and kangaroo pocket.'
,'Lightweight hoodie with a drawstring hood and ribbed cuffs, ideal for layering.'
,'Lightweight joggers with an adjustable drawstring and breathable fabric for sports.'
,'Lightweight pullover with ribbed hem and cuffs, ideal for layering.'
,'Long-sleeve athletic pullover with moisture-wicking technology, great for cool weather.'
,'Long-sleeve hoodie with ribbed cuffs and hem, made for casual comfort.'
,'Quick-dry athletic shorts with a mesh lining, designed for intense workouts.'
,'Soft pullover with ribbed trim and a relaxed fit, perfect for casual wear.'
,'Turtleneck sweater with ribbed cuffs and hem, designed for comfort.'
,'Basic crewneck sweatshirt with ribbed cuffs, designed for a relaxed fit.'
,'Breathable running shorts with an elastic waistband and quick-dry fabric.'
,'Breathable sports tee with a relaxed fit, made from quick-dry material.'
,'Casual crewneck pullover with ribbed trim, ideal for layering on cooler days.'
,'Casual hoodie with drawstring and kangaroo pocket, perfect for everyday wear.'
,'Casual zip-up hoodie with ribbed cuffs and a drawstring hood.'
,'Classic crewneck pullover with a relaxed fit and soft finish.'
,'Classic hoodie with drawstring and front pocket, crafted for casual comfort.'
,'Classic long-sleeve sweater with a crewneck design, made for warmth and style.'
,'Classic pullover sweatshirt with ribbed cuffs, perfect for everyday comfort.'
,'Classic zip-up hoodie with a front pocket, ideal for layering over gym attire.'
,'High-neck pullover with ribbed trim and a cozy fit, perfect for layering.'
,'Long-sleeve button-down shirt with a relaxed fit, perfect for casual wear.');




update Product
SET Category_ID = 4
where Description in
('Classic woven kitchen rug with durable fibers and an easy-clean surface.'
,'Comfortable quilted cushion, ideal for extra seating comfort and style.'
,'Decorative throw pillow cover with a soft, textured fabric, perfect for couches.'
,'Elegant table runner with a textured fabric, perfect for adding a refined touch.'
,'Lightweight duvet cover, crafted for comfort and easy maintenance.'
,'Luxurious bedspread with a fine weave, adding elegance to any bedroom.'
,'Set of decorative napkins with a smooth finish, ideal for special occasions.'
,'Soft, absorbent bath towel with a plush texture, ideal for daily use.'
,'Soft, durable kitchen towel set, designed for everyday cleaning.'
,'Stylish tablecloth with a soft texture and elegant design, suitable for dining.'
,'Classic, woven kitchen rug with durable fibers and an easy-clean surface.');

--RUN THIS 4
UPDATE Product
SET Product_NO = FLOOR(RANDOM() * 1000000000 * Product_ID);


--RUN THIS 5
update Product 
set composition = 'Acrylic 30%, Polyester 28%, Wool 42%'
where Category_ID = 2

update Product 
set composition = 'Acrylic 43%, Polyester 27%, Wool 30%'
where Category_ID = 1

update Product 
set composition = 'Acrylic 13%, Polyester 27%, Wool 30%, Cotton 30%'
where Category_ID = 3

update Product 
set composition = 'Acrylic 23%, Polyester 17%, Wool 20%, Cotton 40%'
where Category_ID = 4

--7.Creating And Inserting data in Inventory table
CREATE TABLE Inventory (
    Inventory_ID SERIAL PRIMARY KEY ,
    Store_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID),
    FOREIGN KEY (Product_ID) REFERENCES PRODUCT(Product_ID)
);

INSERT INTO Inventory (Store_ID, Product_ID, Quantity)
SELECT Store_ID, Product_ID, sum(Quantity) from Purchase_order group by Store_ID, Product_ID;

--8.Creating And Inserting data in CUSTOMER table
CREATE TABLE Customer (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Password VARCHAR(255),
    Address VARCHAR(255) ,
    Phone_Number VARCHAR(20),
    Account_Creation_Date DATE  
);

INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Jacob Barker', 'JacobBarker@yahoo.com', '$a0PnfY%Z^', '466 Hussain ways, Nicolaport, G2T 9LY', '+44(0)28 9018 0749', '2024-10-26');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Kathleen Bull', 'KathleenBull@yahoo.com', '!UNQl@Jg$2', 'Flat 25, Anderson cliffs, Francesbury, WV6M 4TF', '+44909 879 0930', '2024-09-10');
INSERT INTO CUSTOMER ( Name,				  Address, Phone_Number, Account_Creation_Date) VALUES ('Kimberley Lewis', 'Studio 56, Richards village, Lake Sheilatown, NE1 5EZ', '0306 999 0495', '2021-12-03');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Vincent Haynes', 'VincentHaynes@yahoo.com', 'j(*(2AvjRg', '473 Luke glen, North Abdulport, SG7X 4PY', '+44(0)28 9018832', '2022-02-19');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Gavin Warner', 'GavinWarner@gmail.com', 'Po7k)EDw%8', '01 Martin skyway, Evansmouth, AL3 1EJ', '0191 498 0111', '2024-04-05');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Dorothy Pearson-Ahmed', 'DorothyPearson-Ahmed@yahoo.com', 'OD+5TRLd&d', '0 Lewis valley, Grahamside, DD8X 0RS', '+44(0)115 496 0611', '2022-03-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Mrs Zoe Robinson', 'MrsZoeRobinson@gmail.com', '&KKf^z@L25', 'Flat 6, Anthony rapids, South Aimeeland, LA8 3WQ', '+44(0)8081570893', '2021-11-26');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Clive Owen', 'CliveOwen@gmail.com', ')D9(Upgl$D', 'Flat 00s, Clarke greens, East Aaron, HD0 7TB', '+44(0)1614960670', '2023-01-01');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ('Dr Marc Bowen', 'DrMarcBowen@gmail.com', 'JI(4hAvsB(', '24 Allen spur, Connollyfort, HR72 5PJ', '01914960856', '2023-04-25');
INSERT INTO CUSTOMER ( Name,                  Address, Phone_Number, Account_Creation_Date) VALUES ( 'Julia Wade', 'Flat 6, Evans junctions, Damianborough, L54 9GZ', '0115 4960171', '2023-10-14');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Thomas Scott', 'ThomasScott@gmail.com', '+9DCeN5L&a', 'Studio 85y, Rita lock, New Ellieside, NN1P 5YN', '+4428 9018954', '2023-03-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Joel Smith-Cole', 'JoelSmith-Cole@yahoo.com', '+D7zdrBhAN', '75 Williams land, New Shirleyberg, E3 3AP', '(029)2018835', '2022-09-17');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Emma Carter', 'EmmaCarter@gmail.com', 'pX26WuN^%T', 'Flat 4, Wade bypass, Mannington, HG52 4UX', '+441632 960 257', '2024-10-07');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Charlene Carpenter', 'CharleneCarpenter@gmail.com', '_)@ClWdu#2', '32 Marion centers, Joanland, TW3 6ZQ', '0118 4960736', '2024-09-12');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Sara Harding', 'SaraHarding@gmail.com', 'u&#6fYlt00', 'Flat 52N, Dominic corner, Kimberleyton, PO14 4FW', '+441144960774', '2024-09-24');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Timothy Ward', 'TimothyWard@gmail.com', '%4kKsufZV8', '12 Marcus ferry, Lake Dean, SN0B 2ZA', '(029)2018413', '2022-01-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Frances Gibbons', 'FrancesGibbons@yahoo.com', 'lS8hFC+c#j', '9 Richards station, Carolview, WA8 8GN', '+441914960309', '2022-06-18');
INSERT INTO CUSTOMER ( Name				    , Address, Phone_Number, Account_Creation_Date) VALUES ( 'James Murphy-Morris', '783 Martin center, East Max, LN68 0XX', '0909 879 0224', '2023-09-11');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Barbara Lee', 'BarbaraLee@gmail.com', '+90Kaw5tlP', 'Flat 6, Smith streets, North Glennville, G8S 8QW', '01414960472', '2023-09-08');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Max Barker-Baker', 'MaxBarker-Baker@gmail.com', '+V3B3Wjwv$', '65 Katherine summit, North Rebecca, LD70 0ZD', '+448081570341', '2022-06-29');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Owen Andrews', 'OwenAndrews@gmail.com', 'j!KCTp2f+9', '9 Ann stravenue, Janiceside, N6W 2XX', '(0306) 9990720', '2023-07-12');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Eric Wilson', 'EricWilson@gmail.com', '%6zDnHLmN%', '541 Robertson garden, Ruthton, SG28 1EH', '(0161) 496 0718', '2022-11-07');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Olivia Pearson', 'OliviaPearson@gmail.com', 'f0*2Ec2kn_', 'Flat 66H, Harvey lake, Suzannebury, SN9 1HW', '028 9018252', '2024-04-29');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mr Nathan Turner', 'MrNathanTurner@yahoo.com', 'CKC^8hAjK^', '607 Gareth ridges, East Nicoleport, E4 7TD', '0131 4960986', '2022-10-07');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Wendy Turner', 'WendyTurner@gmail.com', 'Jc@31RWltk', 'Flat 50, Dixon terrace, Lake Gemmaport, FY2P 1AW', '+44(0)909 879 0088', '2022-06-27');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Henry Campbell', 'HenryCampbell@yahoo.com', 'iP6Iik!e@H', 'Flat 76A, Rosemary harbor, Alicemouth, BA17 4YQ', '+44(0)131 496 0947', '2023-12-18');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Shane Clark', 'DrShaneClark@gmail.com', 'k&YA8OwsnH', '6 Nicola freeway, Kimberleymouth, S45 6WJ', '+44(0)114 496 0382', '2021-11-21');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Kenneth Pearce-Potter', 'KennethPearce-Potter@yahoo.com', 'yc6QN^c_%I', 'Flat 0, Ian courts, Deanborough, E2 3HW', '+44(0)116 496 0320', '2022-02-21');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Hannah Burrows-Greenwood', 'HannahBurrows-Greenwood@yahoo.com', '7PX$Lc%8%1', 'Flat 65f, Kim route, Lake Paulchester, B1 0AJ', '+44(0)191 4960380', '2022-03-30');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Benjamin Jones-Reynolds', 'BenjaminJones-Reynolds@gmail.com', ')lmLWmpAL2', '390 Watkins expressway, Robinsonfurt, PO5 3XL', '+4428 9018 0202', '2022-09-22');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Ian Smith', 'DrIanSmith@yahoo.com', '^2f5IPtk+d', 'Flat 6, Clark harbor, North Declan, RG21 6UZ', '(0808) 1570481', '2022-12-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Elliot Watson', 'ElliotWatson@gmail.com', 'X3uWw&@l+!', 'Studio 7, Rhys valleys, Ashleighfort, BB48 2RP', '+44289018865', '2024-03-14');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Megan Norman', 'MeganNorman@yahoo.com', 'M%y3rWnzP&', '3 Dennis row, Mathewhaven, PH1 6ZJ', '+44117 496 0216', '2023-04-30');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Connor Jackson-George', 'ConnorJackson-George@gmail.com', 'qg5sD+8kk*', '1 Eileen cliff, Jamesbury, S3 9LF', '+44(0)2074960123', '2023-06-19');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Michael Reynolds', 'MichaelReynolds@yahoo.com', 'UKWKmbo$(7', '917 Jodie valley, Lake Norman, AB6 0GX', '0116 496 0109', '2022-08-29');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Ms Hannah Webster', 'MsHannahWebster@gmail.com', '19Mmhq(L!1', 'Flat 02P, Skinner mills, Naomiside, S2 7FU', '+44(0)114 4960681', '2022-10-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Martin Walker', 'DrMartinWalker@gmail.com', 'U%2oU$xwUt', 'Studio 39, Vanessa mission, North Annetteberg, LN1 0QB', '+44(0)1134960514', '2022-08-12');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Glen Evans', 'GlenEvans@gmail.com', ')6LqNfiv*D', 'Studio 56, Johnston glen, Morganmouth, SN7 5YY', '0117 496 0431', '2023-05-23');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Charlie Miller', 'CharlieMiller@yahoo.com', 'Gogd12Sf0$', 'Studio 94, Maureen branch, South Leahside, IV8 8AQ', '+44(0)29 2018 0890', '2022-06-07');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Stephen Carter', 'StephenCarter@yahoo.com', 'ps76Dnfm$^', 'Flat 75Q, Hall ranch, Fosterton, ML5P 6QJ', '+44118 4960659', '2024-09-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Diane Wong', 'DianeWong@gmail.com', '#6pBiFzl)Y', 'Studio 37, Joanne well, Gouldborough, E66 7WG', '+44(0)161 4960511', '2023-11-27');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Miss Laura Jones', 'MissLauraJones@yahoo.com', 'm#26JZegAL', 'Flat 6, Blake point, Shahmouth, W0 1JH', '0116 4960337', '2023-10-21');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mrs Geraldine Weston', 'MrsGeraldineWeston@yahoo.com', 'I$4VSpHjH2', '8 Keith ridges, West Harry, S5 9XT', '0808 1570468', '2022-10-17');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Holly Jones', 'HollyJones@gmail.com', '(FXb+tr0)4', '551 Matthews drive, Foxside, N0J 6HB', '(020)74960453', '2021-11-26');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Nicola Wilson', 'NicolaWilson@yahoo.com', 'Z747Pc9N+S', 'Studio 56O, Francesca harbors, East Liam, EC94 0GJ', '(0118) 4960975', '2023-01-11');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Linda Gill', 'LindaGill@gmail.com', 'Su2ymItC%v', '593 Ashley motorway, South Karenville, CB03 4YE', '+44(0)151 4960267', '2024-04-13');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Annette Jones', 'AnnetteJones@yahoo.com', 'k)x6XzhaNO', '8 Paige estates, North Gordon, B5 2WE', '(0151) 496 0348', '2023-12-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Judith Saunders', 'JudithSaunders@gmail.com', 'm^r@8Nrl!h', '9 Thomas hollow, Charlottefort, BA71 4PS', '(0113) 496 0838', '2022-11-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Kevin Storey-Scott', 'KevinStorey-Scott@yahoo.com', 'q7_d$4Xf50', '3 Nelson cliffs, South Jennifertown, G83 9SH', '+44(0)113 4960567', '2024-02-25');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mr Timothy Knight', 'MrTimothyKnight@gmail.com', '*4t&tYwP8q', '143 Ruth mission, Martynton, M2 4TR', '029 2018 0446', '2023-10-14');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr James Porter', 'DrJamesPorter@gmail.com', '+IuYEMvs6Q', '4 Ellie flats, Perrystad, PO83 8UN', '+449098790930', '2023-08-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mr Joseph Middleton', 'MrJosephMiddleton@yahoo.com', 'R_qj6*oo@I', 'Studio 8, Kimberley spur, Hoopershire, E79 8HH', '+441514960288', '2023-05-04');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Joan Smith', 'JoanSmith@yahoo.com', 'V6H&QQ%p#J', 'Flat 7, Lee locks, South Olivia, L4J 4GS', '+44(0)289018829', '2022-03-23');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Lauren Freeman', 'LaurenFreeman@yahoo.com', 'rg7TGYwC*N', 'Studio 4, Maureen club, Cameronborough, BD7Y 4TX', '(0306) 999 0391', '2022-06-01');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Owen Davis', 'OwenDavis@yahoo.com', 'o6U2Hko&_d', '18 Marcus track, Dennisberg, BH2W 6DA', '(0191) 4960976', '2023-04-02');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Aaron Roberts', 'AaronRoberts@gmail.com', '$0rV5Mqb&&', 'Flat 99b, Gary ridges, Heatherton, N57 9WT', '(0114) 4960023', '2023-07-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Kenneth Lee', 'KennethLee@gmail.com', '_tjHmryp0G', '552 Reeves ville, Juneland, ME05 5UU', '+44(0)292018052', '2024-09-08');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Roy Mason-Fleming', 'RoyMason-Fleming@gmail.com', '&74!Jcrs!+', 'Flat 21S, Trevor manor, Gordonberg, FK91 4XF', '(020) 74960731', '2022-11-06');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Ross Marshall', 'DrRossMarshall@yahoo.com', 'Fv#H9Fxk9k', 'Studio 56r, Karl unions, North Shane, DG88 2PB', '(01632) 960427', '2023-09-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Martin Gibson-Stephens', 'MartinGibson-Stephens@yahoo.com', '$z8TVn^)H7', 'Flat 94E, Martin spring, Callumton, M3F 7YL', '+44(0)1154960858', '2023-10-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Miss Lauren Thornton', 'MissLaurenThornton@yahoo.com', 'C(5YZQLr(F', 'Flat 92, Kate drives, Amandaport, N8 0XZ', '020 74960969', '2022-11-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Danny Bradley', 'DannyBradley@yahoo.com', '@+XF2wB&!4', '4 Hall harbors, Charleneburgh, M3G 9HN', '(0116)4960853', '2022-09-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Jill Jackson', 'JillJackson@gmail.com', 'jqyS2WxE@a', '2 Holland harbor, Clarestad, CV7 5UB', '(0306)9990806', '2024-01-30');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Maria Lloyd', 'MariaLloyd@yahoo.com', '*^v6aDtbl#', '902 Jones course, North Patrick, KA75 9BR', '0115 4960297', '2022-04-30');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Suzanne Burgess', 'SuzanneBurgess@gmail.com', 'iH4Oh(bRI+', 'Studio 2, Woods skyway, Joycetown, BR2P 3SF', '+44117 4960260', '2023-11-03');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Joyce Finch-Foster', 'JoyceFinch-Foster@gmail.com', 'Ei*0IXlo6#', 'Flat 0, Cooke haven, Port Connor, L9A 5EU', '(0808) 1570973', '2022-04-02');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Joan Green', 'DrJoanGreen@yahoo.com', '+1g%EmpB^*', '15 Maurice ridges, Port Donna, BL6W 7ZD', '0115 4960915', '2023-08-19');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Holly Pearson-Pratt', 'HollyPearson-Pratt@gmail.com', 'gKeGZSXv&4', '7 Margaret mountains, South Lesleyton, KA0X 4LS', '+44116 496 0262', '2023-11-20');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Miss Sian Summers', 'MissSianSummers@yahoo.com', '&rhQ^myj58', '05 Read lodge, East Wayneburgh, BN5V 6PB', '(0808)1570981', '2021-11-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Wendy Smith-Palmer', 'WendySmith-Palmer@gmail.com', 'N#9quTpkxp', 'Flat 4, Andrea club, Port Kate, L1 4ZS', '(0151) 4960524', '2023-05-31');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Sheila Nicholls-Richardson', 'SheilaNicholls-Richardson@gmail.com', 'XOG^0MIalD', 'Flat 69, Barbara walk, Deborahport, NE82 8HY', '+44(0)1414960017', '2021-12-29');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Kim Kaur', 'KimKaur@yahoo.com', '$26v5O6nSk', 'Flat 5, Caroline club, South Georgiafort, E5 3SL', '+44(0)141 4960599', '2023-04-16');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Debra Taylor', 'DebraTaylor@yahoo.com', '%0EQh70rWJ', 'Flat 38R, Jeffrey neck, North Staceyhaven, KA35 4PU', '0306 999 0167', '2022-03-31');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Timothy Robinson', 'TimothyRobinson@gmail.com', 'm*9doJIgXn', 'Studio 0, Ball forks, Port Ianview, PA48 8RH', '02074960660', '2024-02-09');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Jayne Jennings', 'JayneJennings@gmail.com', 'p2RZsOfm)t', 'Flat 74, Jones cape, Port Ambermouth, BS1 7BF', '+44(0)2074960870', '2024-06-08');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Louise Davies-Shaw', 'LouiseDavies-Shaw@yahoo.com', '9s1EFtHk*d', '4 Martin path, Andrewmouth, N4 0ZH', '+44(0)151 4960476', '2022-05-12');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mr Graeme Green', 'MrGraemeGreen@gmail.com', '+6E4Vmkl9%', 'Studio 89I, Raymond squares, Maryberg, DA1 4LA', '01514960865', '2023-11-20');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mrs Carol Cook', 'MrsCarolCook@gmail.com', 'q^nb6BZoKR', '9 Shannon rue, South Hilarymouth, B4G 8TZ', '0161 496 0655', '2022-07-06');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Brian Barton', 'BrianBarton@yahoo.com', '41WN0Rxo_V', 'Flat 37, Baker walk, Melanieton, S33 1AJ', '+44118 4960841', '2023-04-05');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Frederick Goddard', 'FrederickGoddard@yahoo.com', '@GE9Nk^o@$', '43 Nicole station, Leonardville, E26 8FY', '(0808)1570600', '2023-03-24');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Dr Kieran Todd', 'DrKieranTodd@yahoo.com', '2bRHbo*C$z', 'Studio 05w, Taylor highway, North Ben, M5S 0QW', '+44141 4960909', '2023-04-04');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Brenda Brown', 'BrendaBrown@yahoo.com', '*jGFjzg&a7', 'Flat 3, Connor brook, Brendaton, E9H 3WR', '+44(0)118 496 0205', '2022-10-15');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Toby Kelly', 'TobyKelly@gmail.com', '(%T0V^*i^_', 'Flat 3, Jenkins parkway, Michaelborough, B81 0JJ', '01614960321', '2024-01-09');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Sam Reid', 'SamReid@yahoo.com', 'z0+Z2ZxV%o', '778 Suzanne prairie, Lake Denise, G8 7YP', '+44116 496 0586', '2023-08-25');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Miss Debra Pickering', 'MissDebraPickering@yahoo.com', '+n2(Hzng5B', 'Studio 72d, Marian land, Oliverland, ST8B 3ZX', '0141 4960746', '2022-07-28');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'David Godfrey', 'DavidGodfrey@yahoo.com', ')3G4)jH$CI', '17 Davey trace, Connorside, M71 0GQ', '+44191 496 0121', '2021-12-09');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Mrs Sandra Davies', 'MrsSandraDavies@gmail.com', '+M*5H#xq3d', '1 Lloyd drive, Tylerfurt, L2H 1NH', '(0191)4960046', '2024-01-02');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Martyn Marshall-Harrison', 'MartynMarshall-Harrison@yahoo.com', 'mx9&eoKc^8', 'Flat 40, Donna lights, Josephchester, W2 4PN', '(0115) 496 0574', '2024-05-23');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Heather Walsh-Williams', 'HeatherWalsh-Williams@gmail.com', '_4)9qIdBH!', 'Flat 17, George hills, Alisonburgh, L8 8HB', '+44141 4960442', '2022-09-13');
INSERT INTO CUSTOMER ( Name, Email, Password, Address, Phone_Number, Account_Creation_Date) VALUES ( 'Miss Claire Phillips', 'MissClairePhillips@gmail.com', 'd&F0E)B3^s', '45 Leigh via, Richardsland, WS8Y 6LJ', '+44(0)909 879 0347', '2023-11-26');


--9.Creating And Inserting data in Orders table

CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity>0),
    Customer_ID INT NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (59, 4, 86);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (23, 2, 55);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (17, 2, 2);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (32, 1, 48);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (68, 2, 34);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (27, 2, 17);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (40, 1, 21);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (66, 1, 10);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES (12, 1, 55);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 35, 2, 70);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 48, 2, 18);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 45, 2, 62);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 19, 1, 56);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 51, 2, 51);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 52, 2, 57);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 19, 1, 15);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 58, 1, 86);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 68, 2, 5);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 53, 2, 40);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 50, 1, 20);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 47, 2, 59);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 10, 1, 77);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 31, 1, 63);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 2, 2, 59);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 16, 1, 8);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 54, 2, 37);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 39, 1, 16);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 24, 4, 40);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 27, 1, 65);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 35, 3, 59);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 7, 2, 32);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 68, 3, 48);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 4, 2, 11);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 70, 1, 42);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 45, 2, 12);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 37, 1, 10);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 35, 1, 38);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 13, 4, 21);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 26, 4, 12);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 1, 2, 90);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 62, 2, 22);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 60, 1, 48);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 9, 3, 59);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 16, 3, 49);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 54, 4, 73);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 10, 1, 88);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 13, 1, 90);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 14, 3, 90);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 42, 1, 67);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 7, 4, 40);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 26, 1, 23);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 42, 2, 51);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 51, 1, 55);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 11, 1, 6);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 62, 1, 78);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 1, 3, 6);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 64, 3, 6);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 9, 3, 27);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 24, 2, 53);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 48, 1, 41);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 27, 1, 50);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 9, 2, 57);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 2, 1, 17);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 56, 3, 5);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 37, 3, 24);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 59, 1, 55);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 54, 3, 69);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 30, 3, 40);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 3, 3, 79);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 38, 3, 62);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 30, 1, 67);
INSERT INTO Orders ( Product_ID, Quantity, Customer_ID) VALUES ( 56, 3, 9);


--10.Creating And Inserting data in Inventory table
CREATE TABLE Instore 
(
Receipt_ID SERIAL PRIMARY KEY,
Order_ID INT, 
Staff_ID INT, 
Store_ID INT, 
Transaction_Date DATE,
FOREIGN KEY (Order_ID) REFERENCES Orders(ORDER_ID),
FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
FOREIGN KEY (Store_ID) REFERENCES Store(Store_ID)
);



select * from Instore order by Order_ID

INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (69, 2, 1, '2024-08-22');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (58, 20, 4, '2024-08-22');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (25, 34, 6, '2024-10-13');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (49, 34, 6, '2024-08-13');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (14, 7, 2, '2024-10-20');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (3, 7, 2, '2024-09-05');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (39, 2, 1, '2024-09-23');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (48, 1, 1, '2024-09-18');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES (65, 3, 1, '2024-09-15');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 71, 16, 3, '2024-10-15');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 7, 12, 2, '2024-08-26');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 35, 10, 2, '2024-10-29');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 55, 31, 6, '2024-10-02');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 51, 28, 5, '2024-09-25');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 64, 29, 5, '2024-09-26');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 5, 12, 2, '2024-09-03');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 1, 14, 3, '2024-08-22');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 46, 12, 2, '2024-10-09');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 30, 33, 6, '2024-09-02');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 63, 16, 3, '2024-09-26');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 72, 23, 4, '2024-09-12');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 9, 1, 1, '2024-08-27');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 26, 6, 1, '2024-08-09');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 38, 1, 1, '2024-08-02');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 68, 17, 3, '2024-10-31');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 2, 35, 6, '2024-08-05');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 56, 20, 4, '2024-08-13');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 31, 25, 5, '2024-10-04');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 32, 11, 2, '2024-08-15');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 50, 29, 5, '2024-08-31');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 19, 9, 2, '2024-08-27');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 42, 5, 1, '2024-10-02');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 8, 14, 3, '2024-08-25');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 34, 8, 2, '2024-09-10');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 33, 8, 2, '2024-10-01');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 11, 35, 6, '2024-10-28');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 37, 16, 3, '2024-09-12');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 28, 3, 1, '2024-08-26');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 43, 31, 6, '2024-11-05');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 10, 11, 2, '2024-10-20');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 53, 35, 6, '2024-08-22');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 23, 24, 4, '2024-09-13');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 45, 27, 5, '2024-11-01');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 61, 19, 4, '2024-09-25');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 27, 27, 5, '2024-09-20');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 24, 26, 5, '2024-11-05');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 12, 30, 5, '2024-10-24');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 57, 28, 5, '2024-09-03');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 52, 26, 5, '2024-09-10');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 15, 3, 1, '2024-10-11');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 41, 32, 6, '2024-08-05');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 44, 28, 5, '2024-08-02');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 17, 35, 6, '2024-08-17');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 60, 32, 6, '2024-09-07');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 36, 7, 2, '2024-10-27');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 6, 8, 2, '2024-08-28');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 70, 26, 5, '2024-10-04');
INSERT INTO Instore ( Order_ID, Staff_ID, Store_ID, Transaction_Date) VALUES ( 16, 33, 6, '2024-10-12');


--11.Creating And Inserting data in Online table
CREATE TABLE Online 
(
Online_transaction_id  SERIAL PRIMARY KEY ,
Order_ID INT, 
Shipping_Method VARCHAR(50), 
Transaction_Date DATE, 
Shipping_Date DATE, 
Estimated_Delivery_Date DATE, 
Address VARCHAR(255), 
Tracking_Number VARCHAR(50),
FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID)
);


INSERT INTO Online ( Order_ID, Shipping_Method, Transaction_Date, Shipping_Date, Estimated_Delivery_Date, Address, Tracking_Number)
VALUES (66, 'Amazon Prime', '2024-09-12', '2024-10-06', '2024-10-17', 'Flat 9, Rita well, East Charlotte, G3J 8AR', 'TRK347RX19UEN'),
(62, 'UPS', '2024-09-23', '2024-10-20', '2024-11-05', 'Studio 0, Davies island, Lake Charlene, SL7 8YT', 'TRK84WRNBP833'),
(54, 'Royal Mail', '2024-10-22', '2024-11-02', '2024-11-04', 'Flat 86U, Clark loop, Foxshire, NP1 8AG', 'TRKWUWJQUB5OJ'),
(40, 'FedEX', '2024-10-15', '2024-10-26', '2024-10-28', 'Studio 62, Ali landing, New Timothyview, DL82 0GE', 'TRKIYZPADBJKJ'),
(47, 'Amazon Prime', '2024-10-27', '2024-11-02', '2024-11-04', 'Flat 9, Cox ranch, Lake Jacquelinestad, WD8 9BD', 'TRK8117PA6JF6'),
(29, 'DHL', '2024-09-03', '2024-09-10', '2024-09-21', 'Flat 2, Adam club, North Owenburgh, N3 1AL', 'TRKOZ7EX0956C'),
(20, 'UPS', '2024-10-11', '2024-10-30', '2024-11-05', '9 Davies harbors, West Glenview, DT2 4EB', 'TRK9SE0AH9NN1'),
(18, 'Amazon Prime', '2024-08-04', '2024-08-16', '2024-09-26', 'Studio 4, Frances freeway, Smithfort, NR0R 8QN', 'TRKQJ6A81HVX9'),
(21, 'Amazon Prime', '2024-11-02', '2024-11-03', '2024-11-04', '82 Lisa inlet, Lake Cherylton, PE8 3RG', 'TRKTD9QGRDXZO'),
( 4, 'DHL', '2024-08-11', '2024-09-18', '2024-11-01', 'Studio 56d, Hunt place, Boothside, B2S 4YE', 'TRKLD88I50BI9');

--12.Creating And Inserting data in Return_order table
CREATE TABLE Return_order 
(
Return_ID SERIAL PRIMARY KEY , 
Order_ID INT, 
Return_Date DATE, 
Return_Reason VARCHAR(50),
FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID)
);


INSERT INTO Return_order (Order_ID, Return_Date, Return_Reason) VALUES (67, '2024-10-17', 'Defective product');
INSERT INTO Return_order (Order_ID, Return_Date, Return_Reason) VALUES (22, '2024-09-06', 'Incorrect item received');

--13.Creating And Inserting data in Payment table
CREATE TABLE Payment
(
Payment_ID SERIAL PRIMARY KEY , 
Order_ID INT, 
Payment_Date DATE, 
Total_Amount DECIMAL(10,2), 
Staff_ID int ,
FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES (54, '2024-10-22', 41.64);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (43, '2024-11-05', 284.31, 31);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (2, '2024-08-05', 187.84, 35);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES (67, '2024-10-17', 68.13);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (35, '2024-10-29', 111.86, 10);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (56, '2024-08-13', 114.87, 20);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (71, '2024-10-15', 67.41, 16);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (55, '2024-10-02', 99.21, 31);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES (58, '2024-08-22', 284.31, 20);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 36, '2024-10-27', 39.59, 7);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 44, '2024-08-02', 123.45, 28);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 60, '2024-09-07', 33.9, 32);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 32, '2024-08-15', 185.94, 11);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 40, '2024-10-15', 76.58);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 12, '2024-10-24', 111.86, 30);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 53, '2024-08-22', 26.96, 35);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 13, '2024-09-11', 95.97, 36);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 1, '2024-08-22', 117.64, 14);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 16, '2024-10-12', 95.97, 33);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 4, '2024-08-11', 61.96);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 34, '2024-09-10', 32.18, 8);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 27, '2024-09-20', 47.16, 27);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 66, '2024-09-12', 29.41);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 23, '2024-09-13', 86.98, 24);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 30, '2024-09-02', 160.74, 33);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 39, '2024-09-23', 105.24, 2);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 37, '2024-09-12', 53.58, 16);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 11, '2024-10-28', 67.8, 35);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 29, '2024-09-03', 46.63);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 47, '2024-10-27', 59.14);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 15, '2024-10-11', 110.68, 3);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 24, '2024-11-05', 57.74, 26);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 10, '2024-10-20', 107.16, 11);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 22, '2024-09-06', 38.36);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 18, '2024-08-04', 123.96);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 72, '2024-09-12', 150.45, 23);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 14, '2024-10-20', 53.92, 7);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 19, '2024-08-27', 51.88, 9);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 3, '2024-09-05', 125.52, 7);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 50, '2024-08-31', 127.36, 29);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 25, '2024-10-13', 41.15, 34);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 20, '2024-10-11', 76.02);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 8, '2024-08-25', 59.01, 14);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 65, '2024-09-15', 118.77, 3);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 31, '2024-10-04', 63.68, 25);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 7, '2024-08-26', 97.02, 12);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 69, '2024-08-22', 258.69, 2);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 41, '2024-08-05', 198.42, 32);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 64, '2024-09-26', 150.45, 29);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 68, '2024-10-31', 202.23, 17);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 70, '2024-10-04', 89.79, 26);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 61, '2024-09-25', 46.63, 19);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 62, '2024-09-23', 189.54);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 51, '2024-09-25', 26.31, 28);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 6, '2024-08-28', 93.26, 8);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 46, '2024-10-09', 38.36, 12);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 5, '2024-09-03', 123.96, 12);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 48, '2024-09-18', 293.7, 1);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 45, '2024-11-01', 90.84, 27);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 63, '2024-09-26', 28.87, 16);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 26, '2024-08-09', 45.42, 6);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 33, '2024-10-01', 62.4, 8);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 38, '2024-08-02', 236.56, 1);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount) VALUES ( 21, '2024-11-02', 110.9);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 57, '2024-09-03', 35.97, 28);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 59, '2024-10-17', 44.34, 36);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 42, '2024-10-02', 16.63, 5);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 9, '2024-08-27', 88.68, 1);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 52, '2024-09-10', 105.64, 26);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 28, '2024-08-26', 88.68, 3);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 17, '2024-08-17', 27.19, 35);
INSERT INTO Payment ( Order_ID, Payment_Date, Total_Amount, Staff_ID) VALUES ( 49, '2024-08-13', 52.82, 34);

--14.Creating And Inserting data in Digital table
CREATE TABLE Digital 
(Transaction_ID SERIAL PRIMARY KEY , 
Payment_ID INT, 
Wallet VARCHAR(50),  
Phone_NO VARCHAR(20),
FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);

INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (14, 'Apple Pay', '(0116) 4960291');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (23, 'Apple Pay', '+44289018761');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (30, 'Apple Pay', '(0808) 1570760');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (42, 'Google Pay', '+44117 4960278');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (53, 'Google Pay', '(0808)1570535');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (3, 'Google Pay', '+44(0)131 496 0114');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (32, 'Apple Pay', '01164960648');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (38, 'Google Pay', '(0121)4960817');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES (41, 'Google Pay', '01614960712');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 44, 'Google Pay', '01314960553');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 51, 'Apple Pay', '09098790139');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 63, 'Google Pay', '020 74960122');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 68, 'Google Pay', '+44(0)1914960777');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 70, 'Apple Pay', '(0131)4960722');
INSERT INTO Digital ( Payment_ID, Wallet, Phone_NO) VALUES ( 71, 'Google Pay', '+44(0)808 157 0172');

--15.Creating And Inserting data in Card table
CREATE TABLE Card 
(Transaction_ID int PRIMARY KEY, 
Payment_ID INT, 
Card_NO BIGINT, 
Card_Type VARCHAR(50),
FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID)
);

INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (1, 64, 4873221744390, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (2, 1, 4454238997501, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (3, 35, 345009548576359, 'VISA');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (4, 20, 3542114236066369, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (5, 29, 3597648132313981, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (6, 65, 347895347462587, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (7, 61, 346111700100108, 'VISA');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (8, 22, 2279365308494720, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (9, 19, 4655378149887846, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (10, 15, 3505143279440673, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (11, 13, 213161738645103, 'VISA');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (12, 39, 4877592683467, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (13, 47, 370230496600532, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (14, 67, 4052322525179568187, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (15, 56, 213145948553736, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (16, 10, 4235699605092525, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (17, 69, 38044366538837, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (18, 40, 4279288866068320, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (19, 5, 377151851120507, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (20, 54, 4415536980691053, 'AmercianExpress');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (21, 72, 4351017764157864, 'VISA');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (22, 59, 4773196090029, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (23, 37, 5130278622119919, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (24, 27, 4021615502921, 'MasterCard');
INSERT INTO Card (Transaction_ID, Payment_ID, Card_NO, Card_Type) VALUES (25, 58, 6568378722881878, 'MasterCard');

--16.Creating And Inserting data in Cash table
CREATE TABLE Cash 
(Transaction_ID INT PRIMARY KEY, 
Payment_ID INT, 
Cash_Received Decimal(10,2), 
Changes Decimal(10,2)
);

INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (1, 7, 70, 2.59);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (2, 50, 250, 47.77);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (3, 17, 100, 4.03);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (4, 33, 150, 42.84);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (5, 52, 50, 3.37);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (6, 48, 200, 1.58);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (7, 11, 150, 26.55);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (8, 2, 300, 15.69);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (9, 46, 100, 2.98);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (10, 36, 200, 49.55);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (11, 8, 100, 0.79);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (12, 43, 60, 0.99);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (13, 12, 40, 6.1);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (14, 9, 300, 15.69);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (15, 6, 150, 35.13);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (16, 55, 100, 6.74);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (17, 26, 150, 44.76);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (18, 66, 50, 5.66);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (19, 49, 200, 49.55);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (20, 18, 150, 32.36);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (21, 60, 30, 1.13);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (22, 24, 90, 3.02);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (23, 21, 40, 7.82);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (24, 57, 150, 26.04);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (25, 16, 30, 3.04);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (26, 28, 70, 2.2);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (27, 62, 70, 7.6);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (28, 25, 200, 39.26);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (29, 31, 150, 39.32);
INSERT INTO Cash (Transaction_ID, Payment_ID, Cash_Received, Changes) VALUES (30, 45, 70, 6.32);



---------------
--ADDED A COLUMN FOR THE REPORT PURPOSE
Alter table Online 
ADD Store_ID int 


update Online 
Set Store_ID = 1
where (Online_transaction_id % 3 = 0)

update Online 
Set Store_ID = 2
where (Online_transaction_id % 4 = 0)


update Online 
Set Store_ID = 3
where (Online_transaction_id % 5 = 0)

update Online 
Set Store_ID = 4
where (Online_transaction_id %7  = 0)

update Online 
Set Store_ID = 5
where Order_ID in (66, 62)
				


