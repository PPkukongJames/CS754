create database JPK_COFFEE;

use JPK_COFFEE;

create table EMPLOYEE(
	EmpID int primary key AUTO_INCREMENT,
    EmpName varchar(90) NOT NULL,
    Gender char(1) NOT NULL,
    IdCard varchar(20) NOT NULL,
    BirthDate date NOT NULL,
    Start_Date date NOT NULL,
    Salary DECIMAL(9,2) NOT NULL,
    LeaveDay char(1)
)
COMMENT = 'รายละเอียดพนักงาน';

create table SALARY_EMPLOYEE(
	EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table INCENTIVE_EMPLOYEE(
	EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table TRAINEE(
	EmpID int NOT NULL,
    ForPosition int NOT NULL,
    ProbationDuration varchar(90) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table SECURITY_GUARD(
    EmpID int NOT NULL,
    SHIFT varchar(90) NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table ADMIN(
    EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table WAREHOUSE_WORKER(
	EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table MANAGER(
	EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID)
)
COMMENT = '';

create table SALEMAN(
	EmpID int NOT NULL,
    Supeevision int NOT NULL,
    DrivingLicenseNo varchar(90) NOT NULL,
    DrivingLicenseExpiredDate date NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES EMPLOYEE(EmpID),
    FOREIGN KEY (Supeevision) REFERENCES SALEMAN(EmpID)
)
COMMENT = '';

create table VAN(
    PlateNo int PRIMARY KEY,
    StartDate date NOT NULL,
	EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES SALEMAN(EmpID)
)
COMMENT = '';

create table LATEST_MAINTAINANCE(
    LatestMaintainanceDate  date NOT NULL,
    PlateNo int NOT NULL,
    PRIMARY KEY (PlateNo, LatestMaintainanceDate),
    FOREIGN KEY (PlateNo) REFERENCES VAN(PlateNo)
);

create table CUSTOMER(
    CusId int PRIMARY KEY AUTO_INCREMENT,
    CusName varchar(90) NOT NULL,
    PhoneNum varchar(90),
    Address varchar(90),
    EmpID int NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES SALEMAN(EmpID)
) ;

