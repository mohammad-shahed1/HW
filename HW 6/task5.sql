-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(b.bill_no) AS bill_count
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(b.bill_no) >= 2;

-- 2
SELECT r.room_name, COUNT(t.table_no) AS table_count
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.no_of_seats > 6
GROUP BY r.room_name;

-- 3
SELECT r.room_name, SUM(b.bill_total) AS total_bills
FROM restRoom_management r
JOIN restBill b ON r.room_name = b.table_no
GROUP BY r.room_name;

-- 4
SELECT s.first_name, s.surname, SUM(b.bill_total) AS total_bills
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY s.staff_no
ORDER BY total_bills DESC;

-- 5
SELECT b.cust_name, AVG(b.bill_total) AS average_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT s.first_name, s.surname, COUNT(b.bill_no) AS bill_count
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
GROUP BY s.staff_no
HAVING COUNT(b.bill_no) >= 3;
