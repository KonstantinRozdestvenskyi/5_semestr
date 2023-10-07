USE Library
SELECT DISTINCT TOP 500 CONCAT(firstname, ' ', middleinitial, ' ', lastname) AS name, street, city, state, zip
	FROM member CROSS JOIN adult