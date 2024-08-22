
DBCC CHECKIDENT ('[UserGroup]', RESEED, 6);
GO

INSERT INTO [dbo].[UserGroup]
([UserGroup])
VALUES
('Housing Supervisor')

INSERT INTO [dbo].[UserGroup]
([UserGroup])
VALUES
('Department Manager')

INSERT INTO [dbo].[UserGroup]
([UserGroup])
VALUES
('Executive Manager')

INSERT INTO [dbo].[UserGroup]
([UserGroup])
VALUES
('Chief Executive Officer')


INSERT INTO [dbo].[UserGroup]
([UserGroup])
VALUES
('Customer Relationship Manager')

INSERT INTO [dbo].[User]
           ([UserFirstName]
           ,[UserSurname]
           ,[UserEmailAddress]
           ,[UserContactNo]
           ,[UserGroupID]
           ,[UserUserName]
           ,[UserPassword]
           ,[UserActive]
           ,[LeaseID]
           ,[SupplierID])
     VALUES
           ('kgang'
           ,'moloke'
           ,'kgang.moloke@mampudi.com'
           ,'0644160204'
           ,7
           ,'kgang.moloke@mampudi.com'
           ,'c2FzYXNh'
           ,1
           ,null
           ,null)


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER   Proc [dbo].[SelectNotificationsDashboard]

as


SELECT '1Query' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Query'
union all
SELECT '2QuerySucessfullySent' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Query' and SentSuccessful = 1
union all
SELECT '3QueryUnSucessfullySent' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Query' and SentSuccessful = 0
union
SELECT '4Complaint' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Complaint'
union all
SELECT '5ComplaintSucessfullySent' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Complaint' and SentSuccessful = 1
union all
SELECT '6ComplaintUnSucessfullySent' as Category, Count(NotificationLogID) as Total FROM [dbo].[NotificationLog] where NotificationType = 'Complaint' and SentSuccessful = 0

