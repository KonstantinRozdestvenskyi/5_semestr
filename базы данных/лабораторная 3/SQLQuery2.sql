USE Library
SELECT cp.isbn, cp.copy_no, cp.title_no, tl.title, im.translation, im.cover
	FROM title AS tl INNER JOIN copy AS cp ON cp.title_no = tl.title_no,
		 item AS im INNER JOIN copy AS cy ON im.isbn = cy.isbn
	WHERE cp.isbn = 1500 OR cp.isbn = 1000
	ORDER BY cp.isbn