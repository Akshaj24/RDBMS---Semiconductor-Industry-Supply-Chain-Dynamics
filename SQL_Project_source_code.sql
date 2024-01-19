DROP DATABASE IF EXISTS SemiConductor_SupplyChain;
CREATE DATABASE SemiConductor_SupplyChain;
USE SemiConductor_SupplyChain;

CREATE TABLE Foundry (
    Foundry_ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255)
);

INSERT INTO Foundry (Foundry_ID, Name) VALUES ('FND001', 'Alpha Semiconductor');
INSERT INTO Foundry (Foundry_ID, Name) VALUES ('FND002', 'Beta Fabrications');
INSERT INTO Foundry (Foundry_ID, Name) VALUES ('FND003', 'Gamma Foundry');
INSERT INTO Foundry (Foundry_ID, Name) VALUES ('FND004', 'Delta Chips');
INSERT INTO Foundry (Foundry_ID, Name) VALUES ('FND005', 'Epsilon Electronics');

CREATE TABLE Foundry_Tech (
    Foundry_ID VARCHAR(255),
    Technology VARCHAR(255),
    PRIMARY KEY (Foundry_ID, Technology),
    FOREIGN KEY (Foundry_ID) REFERENCES Foundry(Foundry_ID)
);
INSERT INTO Foundry_Tech (Foundry_ID, Technology) VALUES ('FND001', '5nm, 10nm, 3nm');
INSERT INTO Foundry_Tech (Foundry_ID, Technology) VALUES ('FND002', '7nm, 8nm, 5nm');
INSERT INTO Foundry_Tech (Foundry_ID, Technology) VALUES ('FND003', '3nm, 10nm, 7nm');
INSERT INTO Foundry_Tech (Foundry_ID, Technology) VALUES ('FND004', '5nm, 3nm, 8nm');
INSERT INTO Foundry_Tech (Foundry_ID, Technology) VALUES ('FND005', '7nm, 10nm, 8nm');

CREATE TABLE Foundry_Loc (
    Foundry_ID VARCHAR(255),
    Location VARCHAR(255),
    PRIMARY KEY (Foundry_ID, Location),
    FOREIGN KEY (Foundry_ID) REFERENCES Foundry(Foundry_ID)
);

INSERT INTO Foundry_Loc (Foundry_ID, Location) VALUES ('FND001', 'Taiwan, Japan, USA');
INSERT INTO Foundry_Loc (Foundry_ID, Location) VALUES ('FND002', 'Taiwan, China, Germany');
INSERT INTO Foundry_Loc (Foundry_ID, Location) VALUES ('FND003', 'Japan, China, USA');
INSERT INTO Foundry_Loc (Foundry_ID, Location) VALUES ('FND004', 'China, Germany, Taiwan, USA');
INSERT INTO Foundry_Loc (Foundry_ID, Location) VALUES ('FND005', 'Germany, Japan, Taiwan, USA');

CREATE TABLE Testing (
    Testing_ID VARCHAR(255) PRIMARY KEY,
    Wafer_Testing VARCHAR(255),
    Functional_Testing VARCHAR(255),
    Visual_Inspection VARCHAR(255),
    ATE VARCHAR(255), 
    Foundry_ID VARCHAR(255),
    FOREIGN KEY (Foundry_ID) REFERENCES Foundry(Foundry_ID)
);

INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST001', 'Passed', 'Passed', 'Passed', 'Advanced', 'FND002');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST002', 'Passed', 'Failed', 'Passed', 'Basic', 'FND004');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST003', 'Failed', 'N/A', 'Failed', 'None', 'FND001');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST004', 'Passed', 'Passed', 'Passed', 'Intermediate', 'FND005');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST005', 'Passed', 'Failed', 'Passed', 'Advanced', 'FND003');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST006', 'Passed', 'Passed', 'Failed', 'Basic', 'FND001');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST007', 'Failed', 'N/A', 'Failed', 'None', 'FND005');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST008', 'Passed', 'Passed', 'Passed', 'Advanced', 'FND003');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST009', 'Passed', 'Failed', 'Passed', 'Intermediate', 'FND002');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST010', 'Passed', 'Passed', 'Failed', 'Basic', 'FND004');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST011', 'Failed', 'N/A', 'Failed', 'None', 'FND001');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST012', 'Passed', 'Passed', 'Passed', 'Advanced', 'FND002');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST013', 'Passed', 'Failed', 'Passed', 'Intermediate', 'FND004');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST014', 'Passed', 'Passed', 'Failed', 'Basic', 'FND005');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST015', 'Failed', 'N/A', 'Failed', 'None', 'FND003');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST016', 'Passed', 'Passed', 'Failed', 'Basic', 'FND005');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST017', 'Passed', 'Failed', 'Passed', 'Intermediate', 'FND002');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST018', 'Failed', 'Failed', 'Failed', 'None', 'FND004');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST019', 'Passed', 'Passed', 'Passed', 'Advanced', 'FND003');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST020', 'Passed', 'Failed', 'Failed', 'Basic', 'FND001');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST021', 'Failed', 'N/A', 'Passed', 'None', 'FND002');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST022', 'Passed', 'Passed', 'Passed', 'Intermediate', 'FND001');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST023', 'Passed', 'Failed', 'Passed', 'Advanced', 'FND003');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST024', 'Passed', 'Passed', 'Failed', 'Basic', 'FND005');
INSERT INTO Testing (Testing_ID, Wafer_Testing, Functional_Testing, Visual_Inspection, ATE, Foundry_ID) VALUES ('TEST025', 'Failed', 'N/A', 'Failed', 'None', 'FND004');

CREATE TABLE WaferBatch (
    Batch_ID VARCHAR(255) PRIMARY KEY,
    Start_Date DATE,
    End_Date DATE,
    Quantity INT
);

INSERT INTO WaferBatch (Batch_ID, Start_Date, End_Date, Quantity) VALUES ('WB001', '2023-01-12', '2023-01-17', '5');
INSERT INTO WaferBatch (Batch_ID, Start_Date, End_Date, Quantity) VALUES ('WB002', '2023-01-17', '2023-01-25', '7');
INSERT INTO WaferBatch (Batch_ID, Start_Date, End_Date, Quantity) VALUES ('WB003', '2023-01-26', '2023-01-28', '6');
INSERT INTO WaferBatch (Batch_ID, Start_Date, End_Date, Quantity) VALUES ('WB004', '2023-02-07', '2023-02-08', '4');
INSERT INTO WaferBatch (Batch_ID, Start_Date, End_Date, Quantity) VALUES ('WB005', '2023-02-13', '2023-02-18', '3');

CREATE TABLE Clock_Speed (
    CS_ID VARCHAR(255) PRIMARY KEY,
    Clock_Speed VARCHAR(50),
    Cost DECIMAL(10, 2)
);

INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS001', '2.0 GHz', '125');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS002', '2.4 GHz', '135');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS003', '3.0 GHz', '150');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS004', '3.4 GHz', '160');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS005', '4.0 GHz', '175');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS006', '4.2 GHz', '180');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS007', '4.8 GHz', '195');
INSERT INTO Clock_Speed (CS_ID, Clock_Speed, Cost) VALUES ('CS008', '5.0 GHz', '200');

CREATE TABLE Technology (
    Tech_ID VARCHAR(255) PRIMARY KEY,
    Technology_Used VARCHAR(255),
    Cost DECIMAL(10, 2)
);

INSERT INTO Technology (Tech_ID, Technology_Used, Cost) VALUES ('TECH001', '7nm FinFET', '2000');
INSERT INTO Technology (Tech_ID, Technology_Used, Cost) VALUES ('TECH002', '5nm EUV Lithography', '3000');
INSERT INTO Technology (Tech_ID, Technology_Used, Cost) VALUES ('TECH003', '10nm SuperFin', '1800');
INSERT INTO Technology (Tech_ID, Technology_Used, Cost) VALUES ('TECH004', '3nm Advanced FinFET', '4000');
INSERT INTO Technology (Tech_ID, Technology_Used, Cost) VALUES ('TECH005', '8nm Low Power Plus', '1900');

CREATE TABLE Num_Core (
    Core_ID VARCHAR(255) PRIMARY KEY,
    Number_of_Cores INT,
    Cost DECIMAL(10, 2)
);

INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE001', '8', '150');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE002', '12', '220');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE003', '16', '290');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE004', '20', '360');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE005', '24', '430');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE006', '32', '500');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE007', '36', '570');
INSERT INTO Num_Core (Core_ID, Number_of_Cores, Cost) VALUES ('CORE008', '40', '640');

CREATE TABLE Cache_Memory (
    Cache_ID VARCHAR(255) PRIMARY KEY,
    Cache_Memory VARCHAR(100),
    Cost DECIMAL(10, 2)
);

INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE001', '8 MB', '20');
INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE002', '16 MB', '35');
INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE003', '32 MB', '50');
INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE004', '64 MB', '80');
INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE005', '128 MB', '120');
INSERT INTO Cache_Memory (Cache_ID, Cache_Memory, Cost) VALUES ('CACHE006', '256 MB', '200');

CREATE TABLE Power (
    Power_ID VARCHAR(255) PRIMARY KEY,
    Power VARCHAR(100),
    Cost DECIMAL(10, 2)
);

INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR001', '5 W', '10');
INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR002', '10 W', '20');
INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR003', '15 W', '30');
INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR004', '20 W', '40');
INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR005', '25 W', '50');
INSERT INTO Power (Power_ID, Power, Cost) VALUES ('PWR006', '30 W', '60');

CREATE TABLE Design (
    Design_ID VARCHAR(255) PRIMARY KEY,
    CS_ID VARCHAR(255),
    Tech_ID VARCHAR(255),
    Core_ID VARCHAR(255),
    Cache_ID VARCHAR(255),
    Power_ID VARCHAR(255),
    FOREIGN KEY (CS_ID) REFERENCES Clock_Speed(CS_ID),
    FOREIGN KEY (Tech_ID) REFERENCES Technology(Tech_ID),
    FOREIGN KEY (Core_ID) REFERENCES Num_Core(Core_ID),
    FOREIGN KEY (Cache_ID) REFERENCES Cache_Memory(Cache_ID),
    FOREIGN KEY (Power_ID) REFERENCES Power(Power_ID)
);

INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN001', 'CS001', 'TECH001', 'CORE001', 'CACHE001', 'PWR001');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN002', 'CS002', 'TECH002', 'CORE002', 'CACHE002', 'PWR002');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN003', 'CS003', 'TECH003', 'CORE003', 'CACHE003', 'PWR003');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN004', 'CS004', 'TECH004', 'CORE004', 'CACHE004', 'PWR004');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN005', 'CS005', 'TECH005', 'CORE005', 'CACHE005', 'PWR005');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN006', 'CS006', 'TECH001', 'CORE006', 'CACHE006', 'PWR006');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN007', 'CS007', 'TECH002', 'CORE007', 'CACHE001', 'PWR001');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN008', 'CS008', 'TECH003', 'CORE008', 'CACHE002', 'PWR002');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN009', 'CS001', 'TECH004', 'CORE001', 'CACHE003', 'PWR003');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN010', 'CS002', 'TECH005', 'CORE002', 'CACHE004', 'PWR004');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN011', 'CS003', 'TECH001', 'CORE003', 'CACHE005', 'PWR005');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN012', 'CS004', 'TECH002', 'CORE004', 'CACHE006', 'PWR006');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN013', 'CS005', 'TECH003', 'CORE005', 'CACHE001', 'PWR001');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN014', 'CS006', 'TECH004', 'CORE006', 'CACHE002', 'PWR002');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN015', 'CS007', 'TECH005', 'CORE007', 'CACHE003', 'PWR003');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN016', 'CS008', 'TECH001', 'CORE008', 'CACHE004', 'PWR004');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN017', 'CS001', 'TECH002', 'CORE001', 'CACHE005', 'PWR005');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN018', 'CS002', 'TECH003', 'CORE002', 'CACHE006', 'PWR006');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN019', 'CS003', 'TECH004', 'CORE003', 'CACHE001', 'PWR001');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN020', 'CS004', 'TECH005', 'CORE004', 'CACHE002', 'PWR002');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN021', 'CS005', 'TECH001', 'CORE005', 'CACHE003', 'PWR003');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN022', 'CS006', 'TECH002', 'CORE006', 'CACHE004', 'PWR004');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN023', 'CS007', 'TECH003', 'CORE007', 'CACHE005', 'PWR005');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN024', 'CS008', 'TECH004', 'CORE008', 'CACHE006', 'PWR006');
INSERT INTO Design (Design_ID, CS_ID, Tech_ID, Core_ID, Cache_ID, Power_ID) VALUES ('DSN025', 'CS001', 'TECH005', 'CORE001', 'CACHE001', 'PWR001');

CREATE TABLE Customer (
    Customer_ID VARCHAR(255) PRIMARY KEY,
    Name VARCHAR(255)
);

INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST001', 'Intel Corporation');
INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST002', 'Samsung Electronics');
INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST003', 'Texas Instruments');
INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST004', 'NVIDIA Corporation');
INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST005', 'Qualcomm Inc');
INSERT INTO Customer (Customer_ID, Name) VALUES ('CUST006', 'Micron Technology');
 
CREATE TABLE Cust_Loc (
    Customer_ID VARCHAR(255),
    Location VARCHAR(255),
    PRIMARY KEY (Customer_ID, Location),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST001', 'USA, Germany');
INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST002', 'South Korea, China');
INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST003', 'Taiwan, USA');
INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST004', 'USA, Japan');
INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST005', 'USA, India');
INSERT INTO Cust_Loc (Customer_ID, Location) VALUES ('CUST006', 'USA, Singapore');

CREATE TABLE Purchase_Order (
    Order_ID VARCHAR(255) PRIMARY KEY,
    Line_item VARCHAR(255),
    Date DATE,
    Priority_Status VARCHAR(50),
    Customer_ID VARCHAR(255),
    Foundry_ID VARCHAR(255),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Foundry_ID) REFERENCES Foundry(Foundry_ID)
);

INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD001', 'Semiconductor Chips - Model A', '2022-11-10', 'High', 'CUST001', 'FND002');
INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD002', 'Microcontrollers - Type B', '2022-11-15', 'Medium', 'CUST002', 'FND004');
INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD003', 'Wafer Fabrication Equipment', '2022-11-20', 'High', 'CUST003', 'FND001');
INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD004', 'Integrated Circuits - Series C', '2022-12-05', 'Medium', 'CUST004', 'FND005');
INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD005', 'Memory Modules - DDR4', '2022-12-12', 'Medium', 'CUST005', 'FND003');
INSERT INTO Purchase_Order (Order_Id, Line_item, Date, Priority_Status, Customer_Id, Foundry_ID) VALUES ('ORD006', 'Power Management ICs', '2022-12-20', 'Low', 'CUST006', 'FND001');

CREATE TABLE Chip (
    Chip_ID VARCHAR(255) PRIMARY KEY,
    Batch_ID VARCHAR(255),
    Order_ID VARCHAR(255),
    Design_ID VARCHAR(255),
    FOREIGN KEY (Batch_ID) REFERENCES WaferBatch(Batch_ID),
    FOREIGN KEY (Order_ID) REFERENCES Purchase_Order(Order_Id),
    FOREIGN KEY (Design_ID) REFERENCES Design(Design_ID)
);

INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP001', 'ORD001', 'WB001', 'DSN001');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP002', 'ORD002', 'WB002', 'DSN002');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP003', 'ORD002', 'WB003', 'DSN003');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP004', 'ORD003', 'WB004', 'DSN004');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP005', 'ORD005', 'WB005', 'DSN005');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP006', 'ORD005', 'WB001', 'DSN006');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP007', 'ORD003',  'WB002', 'DSN007');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP008', 'ORD002', 'WB003', 'DSN008');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP009', 'ORD006', 'WB005', 'DSN009');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP010', 'ORD001', 'WB004', 'DSN010');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP011', 'ORD002', 'WB003', 'DSN011');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP012', 'ORD004', 'WB002', 'DSN012');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP013', 'ORD004', 'WB003', 'DSN013');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP014', 'ORD004', 'WB001', 'DSN014');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP015', 'ORD005', 'WB002', 'DSN015');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP016', 'ORD004', 'WB003', 'DSN016');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP017', 'ORD003', 'WB005', 'DSN017');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP018', 'ORD006', 'WB004', 'DSN018');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP019', 'ORD003', 'WB002', 'DSN019');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP020', 'ORD006', 'WB004', 'DSN020');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP021', 'ORD002', 'WB001', 'DSN021');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP022', 'ORD001', 'WB002', 'DSN022');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP023', 'ORD003', 'WB001', 'DSN023');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP024', 'ORD003', 'WB002', 'DSN024');
INSERT INTO Chip (Chip_ID, Order_ID, Batch_ID, Design_ID) VALUES ('CHIP025', 'ORD002', 'WB003', 'DSN025');


CREATE TABLE Packaging (
    Package_ID VARCHAR(255) PRIMARY KEY,
    Date DATE,
    Type VARCHAR(255),
    Chip_ID VARCHAR(255),
    FOREIGN KEY (Chip_ID) REFERENCES Chip(Chip_ID)
);

INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG001', '2023-02-20', 'Standard Box', 'CHIP001');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG002', '2023-02-28', 'Antistatic Bag', 'CHIP002');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG003', '2023-03-01', 'Vacuum Seal', 'CHIP003');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG004', '2023-03-10', 'Reinforced Box', 'CHIP004');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG005', '2023-03-19', 'Antistatic Bag', 'CHIP005');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG006', '2023-03-28', 'Standard Box', 'CHIP006');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG007', '2023-04-01', 'Climate Controlled', 'CHIP007');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG008', '2023-04-03', 'Vacuum Seal', 'CHIP008');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG009', '2023-04-06', 'Antistatic Bag', 'CHIP009');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG010', '2023-04-08', 'Standard Box', 'CHIP010');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG011', '2023-04-17', 'Reinforced Box', 'CHIP011');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG012', '2023-04-18', 'Climate Controlled', 'CHIP012');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG013', '2023-04-24', 'Vacuum Seal', 'CHIP013');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG014', '2023-05-13', 'Antistatic Bag', 'CHIP014');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG015', '2023-05-19', 'Standard Box', 'CHIP015');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG016', '2023-05-23', 'Vacuum Seal', 'CHIP016');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG017', '2023-05-25', 'Antistatic Bag', 'CHIP017');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG018', '2023-06-05', 'Standard Box', 'CHIP018');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG019', '2023-06-09', 'Climate Controlled', 'CHIP019');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG020', '2023-06-10', 'Reinforced Box', 'CHIP020');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG021', '2023-06-23', 'Antistatic Bag', 'CHIP021');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG022', '2023-06-27', 'Vacuum Seal', 'CHIP022');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG023', '2023-07-03', 'Standard Box', 'CHIP023');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG024', '2023-07-05', 'Climate Controlled', 'CHIP024');
INSERT INTO Packaging (Package_Id, Date, Type, Chip_ID) VALUES ('PKG025', '2023-07-05', 'Reinforced Box', 'CHIP025');

CREATE TABLE Testing_ON (
    Testing_ID VARCHAR(255),
    Chip_ID VARCHAR(255),
    PRIMARY KEY (Testing_ID, Chip_ID),
    FOREIGN KEY (Testing_ID) REFERENCES Testing(Testing_ID),
    FOREIGN KEY (Chip_ID) REFERENCES Chip(Chip_ID)
);

INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST001', 'CHIP001');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST002', 'CHIP002');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST003', 'CHIP003');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST004', 'CHIP004');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST005', 'CHIP005');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST006', 'CHIP006');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST007', 'CHIP007');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST008', 'CHIP008');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST009', 'CHIP009');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST010', 'CHIP010');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST011', 'CHIP011');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST012', 'CHIP012');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST013', 'CHIP013');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST014', 'CHIP014');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST015', 'CHIP015');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST016', 'CHIP016');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST017', 'CHIP017');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST018', 'CHIP018');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST019', 'CHIP019');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST020', 'CHIP020');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST021', 'CHIP021');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST022', 'CHIP022');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST023', 'CHIP023');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST024', 'CHIP024');
INSERT INTO Testing_ON (Testing_ID, Chip_ID) VALUES ('TEST025', 'CHIP025');

CREATE TABLE Decides (
    Customer_ID VARCHAR(255),
    Design_ID VARCHAR(255),
    PRIMARY KEY (Customer_ID, Design_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Design_ID) REFERENCES Design(Design_ID)
);

INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST001', 'DSN001');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST001', 'DSN002');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST003', 'DSN003');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST006', 'DSN004');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST004', 'DSN005');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST004', 'DSN006');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST006', 'DSN007');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST004', 'DSN008');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST002', 'DSN009');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST001', 'DSN010');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST005', 'DSN011');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST001', 'DSN012');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST002', 'DSN013');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST003', 'DSN014');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST004', 'DSN015');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST005', 'DSN016');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST005', 'DSN017');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST003', 'DSN018');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST006', 'DSN019');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST006', 'DSN020');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST005', 'DSN021');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST001', 'DSN022');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST004', 'DSN023');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST003', 'DSN024');
INSERT INTO Decides (Customer_ID, Design_ID) VALUES ('CUST002', 'DSN025');

ALTER TABLE Customer ADD COLUMN Package_ID VARCHAR(255);
ALTER TABLE Customer ADD FOREIGN KEY (Package_ID) REFERENCES Packaging(Package_ID);

UPDATE Customer SET Package_ID = 'PKG001' WHERE Customer_ID = 'CUST001';
UPDATE Customer SET Package_ID = 'PKG002' WHERE Customer_ID = 'CUST002';
UPDATE Customer SET Package_ID = 'PKG003' WHERE Customer_ID = 'CUST003';
UPDATE Customer SET Package_ID = 'PKG004' WHERE Customer_ID = 'CUST004';
UPDATE Customer SET Package_ID = 'PKG005' WHERE Customer_ID = 'CUST005';
UPDATE Customer SET Package_ID = 'PKG006' WHERE Customer_ID = 'CUST006';
UPDATE Customer SET Package_ID = 'PKG007' WHERE Customer_ID = 'CUST007';
UPDATE Customer SET Package_ID = 'PKG008' WHERE Customer_ID = 'CUST008';
UPDATE Customer SET Package_ID = 'PKG009' WHERE Customer_ID = 'CUST009';
UPDATE Customer SET Package_ID = 'PKG010' WHERE Customer_ID = 'CUST010';
UPDATE Customer SET Package_ID = 'PKG011' WHERE Customer_ID = 'CUST011';
UPDATE Customer SET Package_ID = 'PKG012' WHERE Customer_ID = 'CUST012';
UPDATE Customer SET Package_ID = 'PKG013' WHERE Customer_ID = 'CUST013';
UPDATE Customer SET Package_ID = 'PKG014' WHERE Customer_ID = 'CUST014';
UPDATE Customer SET Package_ID = 'PKG015' WHERE Customer_ID = 'CUST015';
UPDATE Customer SET Package_ID = 'PKG016' WHERE Customer_ID = 'CUST016';
UPDATE Customer SET Package_ID = 'PKG017' WHERE Customer_ID = 'CUST017';
UPDATE Customer SET Package_ID = 'PKG018' WHERE Customer_ID = 'CUST018';
UPDATE Customer SET Package_ID = 'PKG019' WHERE Customer_ID = 'CUST019';
UPDATE Customer SET Package_ID = 'PKG020' WHERE Customer_ID = 'CUST020';
UPDATE Customer SET Package_ID = 'PKG021' WHERE Customer_ID = 'CUST021';
UPDATE Customer SET Package_ID = 'PKG022' WHERE Customer_ID = 'CUST022';
UPDATE Customer SET Package_ID = 'PKG023' WHERE Customer_ID = 'CUST023';
UPDATE Customer SET Package_ID = 'PKG024' WHERE Customer_ID = 'CUST024';
UPDATE Customer SET Package_ID = 'PKG025' WHERE Customer_ID = 'CUST025';