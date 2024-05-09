salemanTotalBillOfMonth{
    SELECT RESULT_SALE.SalemanID,EMP.EmpName,EMP.ImageEmp,RESULT_SALE.TotalBill
    FROM (
        SELECT SalemanID,SUM(CusBill) AS TotalBill
        FROM (
            SELECT PUR.SalemanID,PUR.PurchaseOrderId,PUR.OrderDate,GEN.CusBill
            FROM jpk_coffee.PURCHASE_ORDER PUR
            INNER JOIN jpk_coffee.GENERATE GEN
            ON GEN.PurchaseOrderId=PUR.PurchaseOrderId
        ) AS TOTAL_SELL
        WHERE MONTH(TOTAL_SELL.OrderDate) = %s AND YEAR(TOTAL_SELL.OrderDate) = %s 
        GROUP BY TOTAL_SELL.SalemanID
        ORDER BY TotalBill DESC 
    ) AS RESULT_SALE
    INNER JOIN jpk_coffee.EMPLOYEE EMP
    ON RESULT_SALE.SalemanID=EMP.EmpID
}