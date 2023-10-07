USE Library
SELECT ad.member_no, COUNT(juv.member_no) AS numkids
	FROM adult AS ad JOIN juvenile AS juv 
		ON ad.member_no = juv.adult_member_no
	WHERE ad.state = 'CA'
	GROUP BY ad.member_no
	HAVING COUNT(juv.member_no) > 2