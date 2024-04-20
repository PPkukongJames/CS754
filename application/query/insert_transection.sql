addMaintainanceDate{
    INSERT INTO DB_NAME.MAINTAINANCE_DATE (PlateNo,MaintainanceDate) 
    VALUES(%s,%s)
}

addPurchaseOrder{
    INSERT INTO DB_NAME.PURCHASE_ORDER (PurchaseOrderID,OrderDate,CusID,SalemanID) 
    VALUES(%s,%s,%s,%s)
}

addPurchaseOrderDetail{
    INSERT INTO DB_NAME.PURCHASE_ORDER_DETAIL (PurchaseOrderID,ProductID,AmountOrder)
    VALUES(%s,%s,%s)
}

addStockWarehouse{
    INSERT INTO DB_NAME.STOCK_WAREHOUSE (ProductID,DateIn,AmountWH,ManagerID,SalemanID)
    VALUES(%s,%s,%s,%s,%s)
}

addStockOut{
    INSERT INTO DB_NAME.STOCK_WAREHOUSE (ProductID,DateOut,Quantity,WarehouseWorkerID)
    VALUES(%s,%s,%s,%s)
}

addGenerate{
    INSERT INTO DB_NAME.GENERATE (AdminId,PurchaseOrderId,CusBill)
    VALUES(%s,%s,%s)
}