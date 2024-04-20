addEmployee{
    INSERT INTO DB_NAME.EMPLOYEE (EmpID,EmpName,ImageEmp,IdCard,Gender,BirthDate,StartDate,Salary,LeaveDay)
    VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)
}

addSalaryEmp{
    INSERT INTO DB_NAME.SALARY_EMPLOYEE (EmpID) VALUES(%s)
}

addIncentiveEmp{
    INSERT INTO DB_NAME.INCENTIVE_EMPLOYEE (EmpID) VALUES(%s)
}

addTrainee{
    INSERT INTO DB_NAME.TRAINEE (EmpID,ForPosition,ProbationDuration) 
    VALUES(%s,%s,%s)
}

addSecurityGuard{
    INSERT INTO DB_NAME.SECURITY_GUARD (EmpID,Shift) 
    VALUES(%s,%s)
}

addAdmin{
    INSERT INTO DB_NAME.ADMIN (EmpID) 
    VALUES(%s)
}

addManager{
    INSERT INTO DB_NAME.MANAGER (EmpID) 
    VALUES(%s)
}

addWarehouseWorker{
    INSERT INTO DB_NAME.WAREHOUSE_WORKER (EmpID) 
    VALUES(%s)
}

addSaleman{
    INSERT INTO DB_NAME.SALEMAN (EmpID,DrivingLicenseNo,DrivingLicenseExpiredDate,Supervision) 
    VALUES(%s)
}

addVan{
    INSERT INTO DB_NAME.VAN (PlateNo,StartDate,Inchargeof,SalemanID) 
    VALUES(%s,%s,%s,%s)
}

addCus{
    INSERT INTO DB_NAME.MAINTAINANCE_DATE (CusID,CusName,PhoneNum,Latitude,Longtitude,VisitDay,SalemanID) 
    VALUES(%s,%s,%s,%s,%s,%s,%s)
}

addProduct{
    INSERT INTO DB_NAME.PRODUCT (ProductID,ImageProduct,CostPerUnit,Pname,IncentiveRate,SellPrice) 
    VALUES(%s,%s,%s,%s,%s,%s)
}