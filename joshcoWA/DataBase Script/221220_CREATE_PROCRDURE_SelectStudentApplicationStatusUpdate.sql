USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[SelectApplicationStatusUpdate]    Script Date: 2022/12/20 14:47:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SelectStudentApplicationStatusUpdate]
@StudentApplicationID int
as

SELECT su.[StudentApplicationStatusUpdateID]
      ,su.[Comment]
      ,su.[ApplicationStatusID]
      ,su.[StatusDate]
      ,su.[StudentApplicationID]
	  ,Aps.ApplicationStatus
  FROM  [dbo].[Student_ApplicationStatusUpdate]su
  join [dbo].[ApplicationStatus]Aps on su.[ApplicationStatusID] = Aps.[ApplicationStatusID]
  Where su.StudentApplicationID = @StudentApplicationID
  Order by su.[StatusDate] Desc
