SELECT LOWER(CONCAT(firstname, ' ', middleinitial, ' ', SUBSTRING(lastname, 1, 2))) AS email_name 
	FROM member