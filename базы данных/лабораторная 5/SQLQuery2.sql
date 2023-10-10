USE Library;

SELECT MAX(fine_paid) AS max_fine FROM loanhist;

SELECT mem.firstname, mem.lastname, lh.isbn, lh.fine_paid
	FROM loanhist AS lh JOIN member AS mem ON lh.member_no = mem.member_no
	WHERE lh.fine_paid = (SELECT MAX(fine_paid) AS max_fine FROM loanhist);

SELECT DISTINCT mem.firstname, mem.lastname, lh.isbn, lh.fine_paid
	FROM loanhist AS lh JOIN member AS mem ON lh.member_no = mem.member_no
	WHERE lh.fine_paid = (SELECT MAX(fine_paid) AS max_fine FROM loanhist);

SELECT isbn FROM reservation
		GROUP BY isbn
		HAVING COUNT(isbn) > 50 OR COUNT(isbn) < 5;

SELECT tl.title_no, tl.title, ln.isbn,
	(SELECT COUNT(isbn)
		FROM reservation
		WHERE isbn = ln.isbn
		GROUP BY isbn
		HAVING COUNT(isbn) > 50 OR COUNT(isbn) < 5) AS 'Total Resered'
	FROM reservation AS res JOIN loan AS ln ON res.isbn = ln.isbn 
			JOIN title AS tl ON ln.title_no = tl.title_no
	WHERE ln.isbn IN (SELECT isbn FROM reservation
						GROUP BY isbn
						HAVING COUNT(isbn) > 50 OR COUNT(isbn) < 5)
	GROUP BY ln.isbn, tl.title_no, tl.title;












