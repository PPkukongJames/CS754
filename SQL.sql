create database JPK_COFFEE;

use JPK_COFFEE;

create table EMPLOYEE(
	EmpID int PRIMARY KEY AUTO_INCREMENT,
    EmpName varchar(90) NOT NULL,
    ImageEmp BLOB ,
    IdCard varchar(20) NOT NULL,
    Gender char(1) NOT NULL,
    BirthDate date NOT NULL,
    StartDate date NOT NULL,
    Salary DECIMAL(9,2) NOT NULL,
    LeaveDay smallint NOT NULL
)
COMMENT = 'รายละเอียดพนักงาน';

create table SALARY_EMPLOYEE(
	EmpID int PRIMARY KEY,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table INCENTIVE_EMPLOYEE(
	EmpID int PRIMARY KEY,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table TRAINEE(
	EmpID int PRIMARY KEY,
    ForPosition varchar(90) NOT NULL,
    ProbationDuration int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table SECURITY_GUARD(
    EmpID int PRIMARY KEY,
    SHIFT DECIMAL(9,2) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table ADMIN(
    EmpID int PRIMARY KEY,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table WAREHOUSE_WORKER(
	EmpID int PRIMARY KEY,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table MANAGER(
	EmpID int PRIMARY KEY,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table SALEMAN(
	EmpID int PRIMARY KEY,
    DrivingLicenseNo varchar(90) NOT NULL,
    DrivingLicenseExpiredDate date NOT NULL,
    Supervision int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table VAN(
    PlateNo varchar(90) PRIMARY KEY,
    StartDate date NOT NULL,
    Inchargeof date NOT NULL, 
	SalemanID int NOT NULL,
    FOREIGN KEY (SalemanID) REFERENCES SALEMAN(EmpID)
)
COMMENT = '';

create table MAINTAINANCE_DATE(
    PlateNo varchar(90) NOT NULL ,
    MaintainanceDate date NOT NULL,
    PRIMARY KEY (PlateNo, MaintainanceDate),
    FOREIGN KEY (PlateNo) REFERENCES VAN(PlateNo)
)
COMMENT = '';

create table CUSTOMER(
    CusID int PRIMARY KEY AUTO_INCREMENT,
    CusName varchar(90) NOT NULL,
    PhoneNum varchar(90) NOT NULL,
    Latitude float,
    Longtitude float,
    VisitDay varchar(90) NOT NULL,
    SalemanID int NOT NULL,
    FOREIGN KEY (SalemanID) REFERENCES SALEMAN(EmpID)
)
COMMENT = '';

create table PRODUCT(
    ProductID int PRIMARY KEY AUTO_INCREMENT,
    ImageProduct BLOB ,
    CostPerUnit DECIMAL(9,2) NOT NULL,
    Pname varchar(90) NOT NULL,
    IncentiveRate DECIMAL(9,2) NOT NULL,
    SellPrice  DECIMAL(9,2) NOT NULL
)COMMENT = '';

create table PURCHASE_ORDER(
    PurchaseOrderID int PRIMARY KEY AUTO_INCREMENT,
    OrderDate date NOT NULL,
    CusID int NOT NULL,
    SalemanID int NOT NULL,
    FOREIGN KEY (CusID) REFERENCES CUSTOMER(CusID),
    FOREIGN KEY (SalemanID) REFERENCES SALEMAN(EmpID)
)COMMENT = '';

create table PURCHASE_ORDER_DETAIL(
    PurchaseOrderID int NOT NULL,
    ProductID int NOT NULL,
    AmountOrder float NOT NULL,
    PRIMARY KEY (ProductID, PurchaseOrderID),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES PURCHASE_ORDER(PurchaseOrderID)
)COMMENT = '';

create table STOCK_WAREHOUSE(
    ProductID int NOT NULL,
    DateIn date NOT NULL,
    AmountWH float NOT NULL,
    ManagerID int NOT NULL,
    PRIMARY KEY (ProductID, DateIn),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (ManagerID) REFERENCES MANAGER(EmpID)
)COMMENT = '';

create table STOCK_OUT(
    ProductID int NOT NULL,
    DateOut date NOT NULL,
    Quantity float NOT NULL,
    WarehouseWorkerID int NOT NULL,
    SalemanID int NOT NULL,
    PRIMARY KEY (ProductID, DateOut),
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID),
    FOREIGN KEY (WarehouseWorkerID) REFERENCES WAREHOUSE_WORKER(EmpID),
    FOREIGN KEY (SalemanID) REFERENCES SALEMAN(EmpID)
)COMMENT = '';

create table GENERATE(
    AdminId int NOT NULL,
    PurchaseOrderId int NOT NULL,
    CusBill int NOT NULL,
    PRIMARY KEY (AdminId, PurchaseOrderId),
    FOREIGN KEY (PurchaseOrderId) REFERENCES PURCHASE_ORDER(PurchaseOrderId),
    FOREIGN KEY (AdminId) REFERENCES ADMIN(EmpID)
)COMMENT = '';

ALTER TABLE jpk_coffee.EMPLOYEE MODIFY ImageEmp MEDIUMBLOB;

ALTER TABLE jpk_coffee.PRODUCT MODIFY ImageProduct MEDIUMBLOB;
