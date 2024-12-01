-- 1
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh';

-- 2
SELECT room_date
FROM restRoom_management
WHERE headwaiter = (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles'
) AND room_name = 'Green' AND room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT waiter_no
    FROM restBill
    WHERE bill_no IN (14, 17)
);

-- 6
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no IN (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);
