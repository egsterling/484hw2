SELECT E.ISBN
FROM Authors A, Books B, Editions E
WHERE A.First_Name = 'Agatha' AND A.Last_Name = 'Christie'
AND A.Author_ID = B.Author_ID AND B.Book_ID = E.Book_ID
ORDER BY E.ISBN DESC;