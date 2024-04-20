minusLeaveDate{
    UPDATE DB_NAME.EMPLOYEE
    SET LeaveDay = ?
    WHERE EmpID = ?;
}

changeSalary{
    UPDATE DB_NAME.EMPLOYEE
    SET Salary = ?
    WHERE EmpID = ?;
}

changeNameEmp{
    UPDATE DB_NAME.EMPLOYEE
    SET EmpName = ?
    WHERE EmpID = ?;
}

