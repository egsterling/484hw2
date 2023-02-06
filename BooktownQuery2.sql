SELECT UNIQUE Subject
FROM Subjects
MINUS
SELECT UNIQUE Subject
FROM Subjects S, Books B
WHERE S.Subject_ID = B.Subject_ID
ORDER BY Subject;