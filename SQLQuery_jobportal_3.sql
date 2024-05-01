-- Tạo database JobPortal
CREATE DATABASE JobPortal;
USE JobPortal;

-- Tạo bảng Contact
CREATE TABLE Contact (
    ContactId INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50) NOT NULL,
	Email VARCHAR(100) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    Message VARCHAR(50) NOT NULL
);


-- Tạo bảng Country
CREATE TABLE Country (
    CountryId INT PRIMARY KEY IDENTITY(1,1),
    CountryName VARCHAR(50) NOT NULL
);

-- Tạo bảng User
CREATE TABLE [User] (
    UserId INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100), 
    Password VARCHAR(50),
    Name VARCHAR(50),
    Email VARCHAR(50),
    Mobile INT,
    GraduationGrade VARCHAR(50),
    Phd VARCHAR(50), 
    WordsOn VARCHAR(50), 
    Experience VARCHAR(50),
    Resume VARCHAR(50),
    Address VARCHAR(MAX),
	Country VARCHAR(50),
    ContactId INT, 
    FOREIGN KEY (ContactId) REFERENCES Contact(ContactId), 
);
select * from [User];
-- Tạo bảng Jobs
CREATE TABLE Jobs (
    JobId INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(50),
    NoOfPost INT,
    Description VARCHAR(MAX),
    Qualification VARCHAR(50),
    Experience VARCHAR(50),
    Specialization VARCHAR(MAX),
    LastDate DATE,
    Salary VARCHAR(50),
    JobType VARCHAR(50),
    CompanyName VARCHAR(50),
    CompanyImage VARCHAR(500),                                                                                                                                                                                                                                                                                                                                             
    Website VARCHAR(100),
    Email VARCHAR(50),
    Address VARCHAR(MAX),
);

-- Tạo bảng AppliedJobs
CREATE TABLE AppliedJobs ( 
    AppliedJobsId INT PRIMARY KEY IDENTITY(1,1),
    JobId INT,
    UserId INT,
    FOREIGN KEY (JobId) REFERENCES Jobs(JobId),
    FOREIGN KEY (UserId) REFERENCES [User](UserId)
);
select * from AppliedJobs a
JOIN [User] u on a.UserId = a.UserId

-- Thêm dữ liệu vào bảng Country
INSERT INTO Country (CountryName) VALUES ('Indonesia');
INSERT INTO Country (CountryName) VALUES ('China');
INSERT INTO Country (CountryName) VALUES ('Viet Nam');

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

