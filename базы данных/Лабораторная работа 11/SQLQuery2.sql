IF OBJECT_ID('HumanResources.dJobCandidate', 'TR') IS NOT NULL
	DROP TRIGGER HumanResources.JobCandidate

USE AdventureWorks
GO
CREATE TRIGGER HumanResources.dJobCandidate
	ON HumanResources.JobCandidate
	AFTER DELETE
	AS
	IF EXISTS (SELECT JobCandidateID FROM deleted)
	BEGIN
		INSERT HumanResources.JobCandidateHistory(
				JobCandidateID, Resume, Rating, RejectedDate, ContactID)
				VALUES ((SELECT JobCandidateID FROM deleted),
						(SELECT Resume FROM deleted), DEFAULT, GETDATE(), NULL)
	END					
