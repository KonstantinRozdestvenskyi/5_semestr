USE AdventureWorks
CREATE TABLE HumanResources.JobCandidateHistory(
	JobCandidateID int NOT NULL,
	Resume xml,
	Rating int NOT NULL CHECK (Rating > 1 AND Rating < 11) DEFAULT(5),
	RejectedDate datetime,
	ContactID int,
	CONSTRAINT JobCandidateID PRIMARY KEY (JobCandidateID),
	CONSTRAINT ContactID FOREIGN KEY (ContactID) 
	REFERENCES Person.Contact(ContactID)
);


		
	 

		