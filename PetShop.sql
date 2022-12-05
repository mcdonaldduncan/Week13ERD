CREATE VIEW vw_EmployeeManagers AS
SELECT a.ID, a.name as 'Employee_Name', b.name as 'Manager_Name'
FROM Employee a
JOIN Employee b
ON a.manager_id = b.ID 


CREATE VIEW vw_EmployeePIN AS
SELECT a.ID, a.name, b.PIN
FROM Employee a
JOIN Employee_PIN b
ON a.pin_id = b.ID


CREATE VIEW vw_ProductsBySupplier
SELECT b.name, STRING_AGG(c.name, ', ') as Products 
FROM Shipments a
JOIN Supplier b
ON a.supplier_id = b.ID
JOIN Product c
ON a.product_id = c.ID
GROUP BY b.supplier_id


CREATE VIEW vw_SuppliersByProduct
SELECT b.name, STRING_AGG(c.name, ', ') as Products 
FROM Shipments a
JOIN Product b
ON a.product_id = b.ID
JOIN Supplier c
ON a.supplier_id = c.ID
GROUP BY b.product_id 