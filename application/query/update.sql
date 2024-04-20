minusLeaveDate{
    UPDATE DB_NAME.EMPLOYEE
    SET LeaveDay = %s
    WHERE EmpID = %s
}

changeSalary{
    UPDATE DB_NAME.EMPLOYEE
    SET Salary = %s
    WHERE EmpID = %s
}

changeNameEmp{
    UPDATE DB_NAME.EMPLOYEE
    SET EmpName = %s
    WHERE EmpID = %s
}
changePhoneCus{
    UPDATE DB_NAME.CUSTOMER
    SET PhoneNum = %s
    WHERE CusID = %s
}

