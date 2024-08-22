USE [joshco_pms]
GO

/****** Object:  StoredProcedure [dbo].[SelectPropertyUnit]    Script Date: 2022/03/10 16:43:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE OR ALTER Proc [dbo].[SelectPropertyUnit]

@PropertyID int
,@PropertyUnitID int



as

Select A.*, A.EstRatePerSQM * a.UnitArea AS RentalAmount 
, (Select L.LeaseID From [dbo].[Lease]L Where L.PropertyUnitID = A.PropertyUnitID and LeaseStatus = 'Active') as LeaseStatus
from  [dbo].[PropertyUnit]A
Where (A.PropertyUnitID = @PropertyUnitID or @PropertyUnitID = 0)
and (A.PropertyID = @PropertyID or @PropertyID = 0)
 



GO


