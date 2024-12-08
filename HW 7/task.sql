-- 1
CREATE VIEW samsBills AS
SELECT 
    s.first_name, s.surname, b.bill_date, b.cust_name, b.bill_total
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';

-- 2
SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3
CREATE VIEW roomTotals AS
SELECT 
    r.room_name, SUM(b.bill_total) AS total_sum
FROM restRoom_management r
JOIN restRest_table t ON r.room_name = t.room_name
JOIN restBill b ON t.table_no = b.table_no
GROUP BY r.room_name;

-- 4
CREATE VIEW teamTotals AS
SELECT 
    CONCAT(h.first_name, ' ', h.surname) AS headwaiter_name, 
    SUM(b.bill_total) AS total_sum
FROM restStaff h
JOIN restStaff w ON h.staff_no = w.headwaiter
JOIN restBill b ON w.staff_no = b.waiter_no
GROUP BY h.staff_no;
