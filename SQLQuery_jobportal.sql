use JobPortal
INSERT INTO Country (CountryName) VALUES ('Indonesia');
INSERT INTO Country (CountryName) VAlUES ('China');
INSERT INTO Country (CountryName) VAlUES ('Viet Nam');

select * from Country
select * from [User]
select * from Contact
select * from AppliedJobs aj 
JOIN [User] u ON  aj.UserId = u.UserId
select * from jobs

CREATE TABLE Contact (
    ContactId INT PRIMARY KEY identity(1,1),
    Name VARCHAR(50) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Message Varchar(50) NOT NULL
);
-- Create the Country table
CREATE TABLE Country (
    CountryId INT PRIMARY KEY identity(1,1),
    CountryName VARCHAR(50) NOT NULL
);

-- Create the User table
CREATE TABLE [User] (
    UserId INT PRIMARY KEY identity(1,1),
    UserName VARCHAR(100), 
    Password VARCHAR(50),
    Name VARCHAR(50),
    Email VARCHAR(50),
	Mobile int,
    GraduationGrade VARCHAR(50),
    Phd VARCHAR(50), 
    WordsOn VARCHAR(50), 
    Experience VARCHAR(50),
    Resume VARCHAR(50),
    Address VARCHAR(max),
	Country Varchar(50),
);

CREATE TABLE Jobs (
    JobId int PRIMARY KEY IDENTITY(1,1),
    Title varchar(50),
    NoOfPost int,
    Description varchar(max),
    Qualification varchar(50),
    Experience varchar(50),
    Specialization varchar(max),
    LastDate date,
    Salary varchar(50),
    JobType varchar(50),
    CompanyName varchar(50),
    CompanyImage varchar(500),
    Website varchar(100),
    Email varchar(50),
    Address varchar(max),
    Country varchar(50),
);


use JobPortal
--1
CREATE PROCEDURE InsertContact
    @Name NVARCHAR(100),
    @Email NVARCHAR(100),
    @Subject NVARCHAR(100),
    @Message NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Contact (Name, Email, Subject, Message)
    VALUES (@Name, @Email, @Subject, @Message)
END

--2
CREATE PROCEDURE GetUserProfile
    @UserName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT UserId, UserName, Name, Email, Mobile, Country, Address, Resume
    FROM [User]
    WHERE UserName = @UserName;
END

--3 view resume 
CREATE PROCEDURE GetAppliedJobs
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS [Sr.No],
        aj.AppliedJobsId,
        j.CompanyName,
        aj.JobId,
        j.Title,
        u.Mobile,
        u.Name,
        u.Email,
        u.Resume,
        j.LastDate
    FROM 
        AppliedJobs aj
    INNER JOIN 
        [User] u ON aj.UserId = u.UserId 
    INNER JOIN 
        Jobs j ON aj.JobId = j.JobId;
END

