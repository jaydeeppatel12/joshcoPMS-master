
ALTER   Proc[dbo].[PopulateQueriesAndComplaintsDashboard]

@UserID INT

as

SELECT 'QueriesInProgress' as Category, Count([QueryID]) as Total  FROM[dbo].[FM_Query] where UserID = @UserID AND Status = 'In Progress'
union all
SELECT 'QueriesCompleted' as Category, Count([QueryID]) as Total  FROM[dbo].[FM_Query]  where UserID = @UserID AND  Status = 'Completed'
union all
SELECT 'ComplaintsInProgress' as Category, Count([ComplaintID]) as Total  FROM[dbo].[Complaint]  where UserID = @UserID AND  Status = 'In Progress'
union all
SELECT 'ComplaintsCompleted' as Category, Count([ComplaintID]) as Total  FROM[dbo].[Complaint]  where UserID = @UserID AND  Status = 'Completed'

