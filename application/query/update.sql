changeSalary{
    UPDATE DB_NAME.EMPLOYEE EMP
    SET EMP.Salary = %s
    WHERE EMP.EmpID = %s
}

changePhoneCus{
    UPDATE DB_NAME.CUSTOMER CUS
    SET CUS.PhoneNum = %s
    WHERE CusID = %s;
}

changeVisitDay{
    UPDATE DB_NAME.CUSTOMER CUS
    SET CUS.VisitDay = %s
    WHERE CusID IN (%s);
}

changeExpireDiv{
    UPDATE DB_NAME.SALEMAN SAL
    SET SAL.DrivingLicenseExpiredDate = %s
    WHERE SAL.EmpID = %s;
}