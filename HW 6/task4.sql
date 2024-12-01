-- 1
SELECT cust_name
FROM restBill
WHERE bill_total > 450.00 AND waiter_no = (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles'
);

-- 2
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Green' AND room_date = 160111
);

-- 3
SELECT cust_name
FROM restBill
WHERE bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT first_name, surname
FROM restStaff
WHERE staff_no NOT IN (
    SELECT DISTINCT waiter_no
    FROM restBill
);

-- 5
SELECT b.cust_name, s.first_name AS headwaiter_first_name, s.surname AS headwaiter_surname, r.room_name
FROM restBill b
JOIN restRoom_management r ON b.table_no = r.room_name
JOIN restStaff s ON r.headwaiter = s.staff_no
WHERE b.bill_total = (SELECT MAX(b.bill_total) FROM restBill);
