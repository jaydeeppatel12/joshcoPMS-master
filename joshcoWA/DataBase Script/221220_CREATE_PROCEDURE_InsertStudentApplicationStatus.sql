USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[InsertApplicationStatus]    Script Date: 2022/12/19 19:33:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[InsertStudentApplicationStatus]

@Comment nvarchar(4000),
@ApplicationStatusID int,
@StudentApplicationID int


as


IF(Select Count(*) From [dbo].[Student_ApplicationStatusUpdate] Where [ApplicationStatusID] = @ApplicationStatusID and [StudentApplicationID] = @StudentApplicationID)=0
BEGIN
Insert into [dbo].[Student_ApplicationStatusUpdate]
([Comment]
      ,[ApplicationStatusID]
      ,[StatusDate]
      ,[StudentApplicationID]

)
values
(@Comment
      ,@ApplicationStatusID
      ,GetDate()
      ,@StudentApplicationID
)
END


