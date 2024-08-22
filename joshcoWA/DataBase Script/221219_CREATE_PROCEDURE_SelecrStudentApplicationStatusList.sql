USE [joshco_pms]
GO

/****** Object:  StoredProcedure [dbo].[SelectApplicationStatusList]    Script Date: 2022/12/19 15:02:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER Proc [dbo].[SelectStudentApplicationStatusList]
@StudentApplicationID int

as

SELECT  [ApplicationStatusID]
      ,[ApplicationStatus]
  FROM  [dbo].[ApplicationStatus]
  Where [ApplicationStatusID] not in (Select [ApplicationStatusID] From [dbo].[Student_ApplicationStatusUpdate] Where StudentApplicationID = @StudentApplicationID)
  Order by [ApplicationStatus] Asc

GO


