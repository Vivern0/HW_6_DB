-- Знайти список студентів у певній групі.

-- SELECT s.full_name
-- FROM students AS s
-- RIGHT JOIN groups AS g ON g.id = s.group_fk 
-- WHERE g.id = 1;

SELECT * FROM students AS s WHERE s.group_fk = '?'; -- id певної групи
