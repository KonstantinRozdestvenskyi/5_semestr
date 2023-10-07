USE Library
SELECT CONCAT(mem.firstname, ' ', mem.middleinitial, ' ', mem.lastname) AS 'name',mem.member_no, res.isbn, CONVERT(char, res.log_date)
	FROM  reservation AS res RIGHT OUTER JOIN member AS mem ON mem.member_no = res.member_no
	WHERE res.member_no = 250 OR res.member_no = 341 OR res.member_no = 1651
	ORDER BY mem.member_no