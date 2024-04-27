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