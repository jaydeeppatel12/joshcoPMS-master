DBCC CHECKIDENT ('[UserGroup]', RESEED, 5);
GO

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
           ,'kgang@quickpropsys.com'
           ,'0644160204'
           ,6
           ,'kgang@quickpropsys.com'
           ,'c2FzYXNh'
           ,1
           ,null
           ,null)
GO



CREATE or ALTER Proc [dbo].[SelectHomeCRMDashboard]

as

SELECT 'Property' as Category, Count([PropertyID]) as Total  FROM [dbo].[Property]
union all
SELECT 'PropertyUnit' as Category, Count([PropertyUnitID]) as Total  FROM [dbo].[Lease] Where LeaseStatus = 'Active'
union all
SELECT 'VacantUnit' as Category, Count(P.[PropertyUnitID]) as Total  FROM [dbo].[PropertyUnit]P Where P.[PropertyUnitID] not in  (Select [PropertyUnitID] From [dbo].[Lease] Where LeaseStatus = 'Active')
union all
SELECT 'Tenant' as Category, Count([TenantID]) as Total  FROM [dbo].[Tenant] 
union all
SELECT 'Application' as Category, Count([ApplicationID]) as Total  FROM [dbo].[Application] 
union all
SELECT 'PendingReview' as Category, Count(A.[ApplicationID]) as Total  FROM [dbo].[Application]A Where A.ApplicationID not in (Select AU.ApplicationID From [dbo].[ApplicationStatusUpdate]AU Where AU.ApplicationStatusID <> 1)
union all
SELECT 'PaidDeposit' as Category, Count([ApplicationID]) as Total From [dbo].[ApplicationDeposit] Where isnull([DepositAmount],0) <> 0
union all
SELECT 'LeaseExpiring' as Category, Count([PropertyUnitID]) as Total  FROM [dbo].[Lease] Where LeaseStatus = 'Active' and Year(Termination) = Year(GetDate())
union all
SELECT 'Lease' as Category, Count([PropertyUnitID]) as Total  FROM [dbo].[Lease] 
union all
SELECT 'Query' as Category, Count([QueryID]) as Total  FROM [dbo].[FM_Query]
union all
SELECT 'Query' as Category, Count([QueryID]) as Total  FROM [dbo].[FM_Query] where Status = 'New'
union all
SELECT 'Query' as Category, Count([QueryID]) as Total  FROM [dbo].[FM_Query] where Status = 'In Progress'
union all
SELECT 'Query' as Category, Count([QueryID]) as Total  FROM [dbo].[FM_Query] where Status = 'Work Order Assigned'
union all
SELECT 'Query' as Category, Count([QueryID]) as Total  FROM [dbo].[FM_Query] where Status = 'Completed'
union all
SELECT 'Complaint' as Category, Count([ComplaintID]) as Total  FROM [dbo].[Complaint]
union all
SELECT 'Complaint' as Category, Count([ComplaintID]) as Total  FROM [dbo].[Complaint] where Status = 'New'
union all
SELECT 'Complaint' as Category, Count([ComplaintID]) as Total  FROM [dbo].[Complaint] where Status = 'In Progress'
union all
SELECT 'Complaint' as Category, Count([ComplaintID]) as Total  FROM [dbo].[Complaint] where Status = 'Work Order Assigned'
union all
SELECT 'Complaint' as Category, Count([ComplaintID]) as Total  FROM [dbo].[Complaint] where Status = 'Completed'


GO