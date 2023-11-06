Use Library
/*BEGIN TRANSACTION
SET IDENTITY_INSERT member ON
INSERT member(member_no, lastname, firstname, middleinitial)
	VALUES (16101, 'Walters', 'B.', 'L')
SET IDENTITY_INSERT member OFF
INSERT juvenile
	VALUES (16101, 1, DATEADD(YY, -18, DATEADD(DD, -1, GETDATE())))
COMMIT TRANSACTION*/

/*SELECT juvenile.member_no, adult.street,
		adult.city, adult.state, 
		adult.zip, adult.phone_no,
		DATEADD(YY, 1, GETDATE())
	FROM juvenile JOIN adult ON juvenile.adult_member_no = adult.member_no
	WHERE GETDATE() - juvenile.birth_date > 18;*/
/*INSERT INTO adult
	SELECT juvenile.member_no, adult.street,
		adult.city, adult.state, 
		adult.zip, adult.phone_no,
		DATEADD(YY, 1, GETDATE())
	FROM juvenile JOIN adult ON juvenile.adult_member_no = adult.member_no
	WHERE GETDATE() - juvenile.birth_date > 18;*/

/*SELECT * FROM adult
	WHERE member_no = 16101;*/

/*SELECT *
	FROM adult JOIN juvenile ON adult.member_no = juvenile.member_no;*/

/*DELETE FROM juvenile
	WHERE GETDATE() - juvenile.birth_date > 18;*/

SELECT * FROM juvenile
	WHERE member_no = 16101;
