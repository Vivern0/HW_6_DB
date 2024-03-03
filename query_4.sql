-- Знайти середній бал на потоці (по всій таблиці оцінок).

SELECT AVG(m.mark) AS avg_mark
from marks AS m;
