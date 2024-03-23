create database db_group;

use db_group;

create table JOB_POSITION(
	JOB_ID int primary key AUTO_INCREMENT,
    NAME varchar(90) NOT NULL,
    DESCRIPTION varchar(90)
)
COMMENT = 'เก็บข้อมูลตำแหน่ง';

create table SALES_LINE(
    SALES_LINE_ID int primary key AUTO_INCREMENT,
    DESCRIPTION varchar(90)
)
COMMENT = 'สายขาย';

create table EMPLOYEE(
	EMP_ID int primary key AUTO_INCREMENT,
    NAME varchar(90) NOT NULL,
    SURNAME varchar(90) NOT NULL,
    SEX char(1) NOT NULL,
    ID_CARD_NO varchar(20) NOT NULL,
    BIRTH_DATE date NOT NULL,
    WORK_START_DATE date NOT NULL,
    ADDRESS varchar(255) NOT NULL,
    JOB_ID int NOT NULL,
    SALES_LINE_ID int NOT NULL,
    SALARY float NOT NULL,
	FOREIGN KEY (JOB_ID) REFERENCES JOB_POSITION(JOB_ID),
    FOREIGN KEY (SALES_LINE_ID) REFERENCES SALES_LINE(SALES_LINE_ID)
)
COMMENT = 'รายละเอียดพนักงาน';

create table SUPERVISOR(
	EMP_ID int NOT NULL ,
    SUPERVISOR_ID int NOT NULL ,
    PRIMARY KEY (EMP_ID, SUPERVISOR_ID) ,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (SUPERVISOR_ID) REFERENCES EMPLOYEE(EMP_ID)
)
COMMENT = 'ผู้ดูแลพนักงาน';

create table  STORE_TYPE(
	STORE_TYPE_ID int primary key AUTO_INCREMENT,
    NAME varchar(90) NOT NULL,
    DESCRIPTION varchar(90)
)
COMMENT = 'ประเภทของร้านค้า';

create table CUSTOMER(
	CUS_ID int primary key AUTO_INCREMENT,
    OWNER_NAME varchar(90) NOT NULL,
    ADDRESS varchar(255) NOT NULL,
    VISIT_DATE varchar(20) NOT NULL,
    LAST_VISIT date,
    STORE_TYPE_ID int NOT NULL,
    SALES_LINE_ID int NOT NULL,
    FOREIGN KEY (STORE_TYPE_ID) REFERENCES STORE_TYPE(STORE_TYPE_ID),
    FOREIGN KEY (SALES_LINE_ID) REFERENCES SALES_LINE(SALES_LINE_ID)
)
COMMENT = 'ข้อมูลลูกค้า';

create table STOCK_CATEGORIES(
    STOCK_CATEGORIES_ID int primary key AUTO_INCREMENT,
    NAME_CATEGORY varchar(90) NOT NULL,
    DESCRIPTION varchar(90)
)
COMMENT = 'ประเภทสินค้า';

create table STOCK(
    STOCK_ID int primary key AUTO_INCREMENT,
    STOCK_NAME varchar(90) NOT NULL,
    PRICE_BUY float NOT NULL,
    PRICE_SELL float NOT NULL,
    LAST_MODIFY date NOT NULL,
    AMOUNT float NOT NULL,
    DESCRIPTION varchar(90),
    STOCK_CATEGORIES_ID int NOT NULL,
    FOREIGN KEY (STOCK_CATEGORIES_ID) REFERENCES STOCK_CATEGORIES(STOCK_CATEGORIES_ID)
)
COMMENT = 'ลักษณะสินค้า';

create table STOCK_IN(
    STOCK_IN_ID int primary key AUTO_INCREMENT,
    STOCK_ID int NOT NULL,
    SELL_IN_DATE date NOT NULL,
    AMOUNT float NOT NULL,
    FOREIGN KEY (STOCK_ID) REFERENCES STOCK(STOCK_ID)
)
COMMENT = 'ข้อมูลการนำเข้าสินค้า';

create table STOCK_OUT(
    STOCK_OUT_ID int primary key AUTO_INCREMENT,
    STOCK_ID int NOT NULL,
    EMP_ID int NOT NULL,
    AMOUNT float NOT NULL,
    FOREIGN KEY (STOCK_ID) REFERENCES STOCK(STOCK_ID),
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID)
)
COMMENT = 'จำนวนสินค้าที่เบิก';

create table ORDERS(
    ORDER_ID int primary key AUTO_INCREMENT,
    ORDER_DATE date,
    TOTAL_PRICE float,
    EMP_ID int NOT NULL,
    CUS_ID int NOT NULL,
    FOREIGN KEY (EMP_ID) REFERENCES EMPLOYEE(EMP_ID),
    FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID)
)
COMMENT = 'รายละเอียดระหว่างการซื้อ-ขายระหว่างลูกค้าและผู้ขาย';

create table ORDER_DETAIL(
    ORDER_DETAIL_ID int primary key AUTO_INCREMENT,
    STOCK_ID int NOT NULL,
    PRICE float NOT NULL,
    AMOUNT float NOT NULL,
    ORDER_ID int NOT NULL,
    FOREIGN KEY (STOCK_ID) REFERENCES STOCK_OUT(STOCK_ID),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
)
COMMENT = 'รายละเอียดของ order';
