SELECT UNIQUE S.sid
FROM Students S, Enrollments E1, Enrollments E2, Enrollments E3, Courses C1, Courses C2, Courses C3
WHERE S.sid = E1.sid AND S.sid = E2.sid AND S.sid = E3.sid
AND E1.cid = C1.cid AND E2.cid = C2.cid AND E3.cid = C3.cid
AND (C1.C_Name = 'EECS442' AND C2.C_Name = 'EECS445' AND C3.C_Name = 'EECS492')
UNION
SELECT UNIQUE S.sid
FROM Students S, Enrollments E1, Enrollments E2, Courses C1, Courses C2
WHERE S.sid = E1.sid AND S.sid = E2.sid
AND E1.cid = C1.cid AND E2.cid = C2.cid
AND (C1.C_Name = 'EECS482' AND C2.C_Name = 'EECS486')
UNION
SELECT UNIQUE S.sid
FROM Students S, Enrollments E, Courses C
WHERE S.sid = E.sid
AND E.cid = C.cid
AND C.C_Name = 'EECS281'
ORDER BY sid;