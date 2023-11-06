USE Library
/*INSERT INTO item(isbn, title_no, cover, loanable, translation)
	VALUES (10001, 8, 'HARDBACK', 'Y', 'ENGLISH'),
			(10101, 8, 'SOFTBACK', 'Y', 'ENGLISH');*/
/*SELECT isbn, title_no, cover, loanable, translation FROM item
	WHERE title_no = 8;*/

INSERT INTO copy(isbn, copy_no, title_no, on_loan)
	VALUES (10001, 1, 8, 'N');

SELECT isbn, copy_no, title_no, on_loan FROM copy
	WHERE title_no = 8;

SELECT translation FROM item
	WHERE isbn = 10101;
