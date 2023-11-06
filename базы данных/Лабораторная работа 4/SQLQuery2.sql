USE Library
--EXEC sp_help title;
/*INSERT INTO title(title, author, synopsis)
	VALUES('The Art of Lawn Tennis', 'William T.Tilden', default);*/

--SELECT title_no FROM title;

/*SELECT title_no,title, author, synopsis 
	FROM title
	WHERE title_no = 51;*/

INSERT INTO title(title, author, synopsis)
	VALUES('Riders of the Purple Sage', 'Zane Grey', default);

SELECT title_no,title, author, synopsis 
	FROM title
	WHERE title_no = 52;

