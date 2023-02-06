SELECT C.cid
FROM Courses C
MINUS
(SELECT E.cid
FROM Enrollments E, Students S
WHERE E.sid = S.sid AND (S.Major != 'CS' OR S.Major IS NULL)
GROUP BY E.cid
HAVING COUNT(*) >= 10)
ORDER BY cid DESC;