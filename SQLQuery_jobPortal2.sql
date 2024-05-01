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

