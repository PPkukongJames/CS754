delTrainee{
    DELETE FROM DB_NAME.TRAINEE
    WHERE EmpID = %s
}
    
delSalEmp{
    DELETE FROM DB_NAME.SALARY_EMPLOYEE
    WHERE EmpID = %s
}

delEmp{
    DELETE FROM DB_NAME.EMPLOYEE
    WHERE EmpID = %s;
}
delPurDetail{
    DELETE FROM jpk_coffee.PURCHASE_ORDER_DETAIL
    WHERE PurchaseOrderID = %s
}

delGen{
    DELETE FROM jpk_coffee.GENERATE
    WHERE PurchaseOrderID = 10
}

delPurOr{
    DELETE FROM jpk_coffee.PURCHASE_ORDER
    WHERE PurchaseOrderID = 10
}
