/*
Students(SID, Name, Major)
Projects(PID, P_Name)
Courses(CID, C_Name)
Members(PID, SID)
Enrollments(CID, SID)
Write a query that finds the SIDs and Names of all students with at least one projectpartner
who is enrolled in (EECS 482 or EECS 483) and (EECS 484 or EECS 485) and (EECS 280).
Students who are Members of the same Project are considered project partners (a studentis
not a project partner of themselves). Note that each course’s name is stored in the C_Name
field with no space between the department abbreviation and the course number (e.g. EECS
484 is stored as ‘EECS484’.) The results should be sorted in descending order by the
students’ names.
*/
-- SELECT S.SID, S.Name
-- FROM Students S
-- INNER JOIN Members M ON S.SID = M.SID
-- INNER JOIN Projects P ON P.PID = M.PID
-- INNER JOIN Enrollments E1 ON S.SID = E1.SID 
-- INNER JOIN Enrollments E2 ON S.SID = E2.SID 
-- INNER JOIN Enrollments E3 ON S.SID = E3.SID 
-- INNER JOIN Courses C1 ON E1.CID = C1.CID 
-- INNER JOIN Courses C2 ON E2.CID = C2.CID 
-- INNER JOIN Courses C3 ON E3.CID = C3.CID 
-- WHERE M.SID <> S.SID
-- AND (C1.C_Name = 'EECS482' OR C1.C_Name = 'EECS483') 
-- AND (C2.C_Name = 'EECS484' OR C2.C_Name = 'EECS485')
-- AND (C3.C_Name = 'EECS280')
-- GROUP BY S.SID, S.Name
-- ORDER BY S.Name IN DESC;

SELECT UNIQUE S1.SID, S1.Name
FROM Students S1, Students S2, Members M1, Members M2, Enrollments E1, Enrollments E2, Enrollments E3,
     Courses C1, Courses C2, Courses C3
WHERE S1.sid = M1.sid
AND S2.sid = M2.sid
AND S1.sid <> S2.sid
AND M1.pid = M2.pid
AND S2.sid = E1.sid AND E1.cid = C1.cid AND (C1.C_name = 'EECS482' OR C1.C_name = 'EECS483')
AND S2.sid = E2.sid AND E2.cid = C2.cid AND (C2.C_name = 'EECS484' OR C2.C_name = 'EECS485')
AND S2.sid = E3.sid AND E3.cid = C3.cid AND (C3.C_name = 'EECS280')
ORDER BY S1.Name DESC;