CREATE VIEW StudentPairs AS
SELECT UNIQUE S1.sid SID1, S2.sid SID2
FROM Students S1, Students S2, Enrollments E1, Enrollments E2
WHERE S1.sid < S2.sid
AND S1.sid = E1.sid AND S2.sid = E2.sid AND E1.cid = E2.cid
INTERSECT
(SELECT UNIQUE S1.sid SID1, S2.sid SID2 
 FROM Students S1, Students S2 
 WHERE S1.sid < S2.sid
 MINUS
 SELECT UNIQUE S1.sid SID1, S2.sid SID2
 FROM Students S1, Students S2, Members M1, Members M2
 WHERE S1.sid < S2.sid AND S1.sid = M1.sid AND S2.sid = M2.sid AND M1.pid = M2.pid);


-- SELECT S1.sid SID1, S2.sid SID2
-- FROM Students S1
-- JOIN Students S2 ON S1.sid < S2.sid
-- JOIN Enrollments E1 ON S1.sid = E1.sid
-- JOIN Enrollments E2 ON S2.sid = E2.sid AND E1.cid = E2.cid
-- LEFT JOIN (Members M1 JOIN Members M2 ON M1.pid = M2.pid)
-- ON S1.sid = M1.sid AND S2.sid = M2.sid
-- WHERE M1.sid IS NULL OR M2.sid IS NULL;