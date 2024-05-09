salemanTotalBillOfMonth{
    SELECT RESULT_SALE.SalemanID,EMP.EmpName,EMP.ImageEmp,RESULT_SALE.TotalBill
    FROM (
        SELECT SalemanID,SUM(CusBill) AS TotalBill
        FROM (
            SELECT PUR.SalemanID,PUR.PurchaseOrderId,PUR.OrderDate,GEN.CusBill
            FROM DB_NAME.PURCHASE_ORDER PUR
            INNER JOIN DB_NAME.GENERATE GEN
            ON GEN.PurchaseOrderId=PUR.PurchaseOrderId
        ) AS TOTAL_SELL
        WHERE MONTH(TOTAL_SELL.OrderDate) = %s AND YEAR(TOTAL_SELL.OrderDate) = %s 
        GROUP BY TOTAL_SELL.SalemanID
        ORDER BY TotalBill DESC 
    ) AS RESULT_SALE
    INNER JOIN DB_NAME.EMPLOYEE EMP
    ON RESULT_SALE.SalemanID=EMP.EmpID
}

productOfMonth{
    SELECT PRO.ProductID,PRO.Pname,PRO.ImageProduct,TOTAL_G.Amount
    FROM(
        SELECT NUM_TOTAL.ProductID,SUM(NUM_TOTAL.AmountOrder) AS Amount
        FROM(
            SELECT PUR_DE.ProductID,PUR.OrderDate,PUR_DE.AmountOrder
            FROM DB_NAME.PURCHASE_ORDER_DETAIL PUR_DE
            INNER JOIN DB_NAME.PURCHASE_ORDER PUR
            ON PUR_DE.PurchaseOrderID=PUR.PurchaseOrderID
        ) AS NUM_TOTAL
        WHERE MONTH(NUM_TOTAL.OrderDate) = %s AND YEAR(NUM_TOTAL.OrderDate) = %s
        GROUP BY NUM_TOTAL.ProductID
        ORDER BY Amount DESC
    ) AS TOTAL_G
    INNER JOIN DB_NAME.PRODUCT PRO
    ON PRO.ProductID=TOTAL_G.ProductID
}

productProfitOfMonth{
    SELECT PRO.ProductID,PRO.Pname,PRO.ImageProduct,TOTAL_G.Amount,PRO.CostPerUnit,PRO.SellPrice,
        (SellPrice * Amount) AS TotalRevenue,
        (CostPerUnit * Amount) AS TotalCost,
        ((SellPrice * Amount) - (CostPerUnit * Amount)) AS Profit
    FROM(
        SELECT NUM_TOTAL.ProductID,SUM(NUM_TOTAL.AmountOrder) AS Amount
        FROM(
            SELECT PUR_DE.ProductID,PUR.OrderDate,PUR_DE.AmountOrder
            FROM DB_NAME.PURCHASE_ORDER_DETAIL PUR_DE
            INNER JOIN DB_NAME.PURCHASE_ORDER PUR
            ON PUR_DE.PurchaseOrderID=PUR.PurchaseOrderID
        ) AS NUM_TOTAL
        WHERE MONTH(NUM_TOTAL.OrderDate) = %s AND YEAR(NUM_TOTAL.OrderDate) = %s
        GROUP BY NUM_TOTAL.ProductID
    ) AS TOTAL_G
    INNER JOIN DB_NAME.PRODUCT PRO
    ON PRO.ProductID=TOTAL_G.ProductID
    ORDER BY Profit DESC
}

workMoreNYear{
    SELECT EMP.EmpID,EMP.EmpName,EMP.ImageEmp,EMP.StartDate
    FROM DB_NAME.EMPLOYEE EMP
    Where CURDATE() > DATE_ADD(EMP.StartDate, INTERVAL %s YEAR)
}