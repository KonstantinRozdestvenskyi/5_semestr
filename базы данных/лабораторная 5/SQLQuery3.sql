USE Library

SELECT mem.member_no, mem.lastname FROM member AS mem
	WHERE (SELECT SUM(lh.fine_assessed) FROM loanhist AS lh
				WHERE lh.member_no = mem.member_no) > 5;