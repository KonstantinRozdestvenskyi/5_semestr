USE AdventureWorks
GO
/*DELETE FROM HumanResources.JobCandidate
	WHERE JobCandidateID = (SELECT MIN(JobCandidateID) FROM HumanResources.JobCandidate)*/

--SELECT * FROM HumanResources.JobCandidateHistory;

TRUNCATE TABLE HumanResources.JobCandidateHistory