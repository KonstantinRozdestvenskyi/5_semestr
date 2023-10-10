USE Library;

SELECT juw.adult_member_no, juw.No_of_Children, expr_date  FROM (SELECT adult_member_no, COUNT(member_no) as No_of_Children FROM juvenile
	GROUP BY adult_member_no
	HAVING COUNT(member_no) > 3) AS juw JOIN adult AS ad ON juw.adult_member_no = ad.member_no

WITH new_table AS (
	SELECT juvenile.adult_member_no AS adult_member, COUNT(juvenile.member_no) AS No_of_Children
	FROM adult JOIN juvenile ON juvenile.adult_member_no = adult.member_no
	GROUP BY juvenile.adult_member_no
	HAVING COUNT(juvenile.member_no)>3
	)
SELECT new_table.adult_member, new_table.No_of_Children, adult.expr_date
	FROM adult JOIN new_table ON new_table.adult_member = adult.member_no