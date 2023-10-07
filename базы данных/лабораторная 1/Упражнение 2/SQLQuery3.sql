SELECT member_no, isbn, fine_assessed FROM loanhist
	WHERE NOT fine_assessed IS NULL