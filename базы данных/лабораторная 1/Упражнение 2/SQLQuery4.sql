SELECT member_no, isbn, fine_assessed, fine_assessed * 2 AS 'double fine' 
	FROM loanhist
	WHERE NOT fine_assessed IS NULL