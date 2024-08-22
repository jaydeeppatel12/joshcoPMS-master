USE [joshco_pms]
GO

/****** Object:  StoredProcedure [dbo].[SelectStudentApplicationProfile]    Script Date: 2022/12/21 15:53:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER Proc [dbo].[SelectStudentApplicationProfile]   -- Exec  [SelectStudentApplicationList] 2, 'All'

@StudentApplicationID int 
as

 
SELECT Distinct B.[StudentApplicantID]
      , B.[StudentFirstName]
      , B.[StudentMiddleName]
	  , B.[StudentLastName]
	  , B.[StudentGender]
      , B.[StudentIdentificationNumber]
      , B.[StudentEmailAddress]
      , B.[StudentMobileNumber]
      , B.[StudentHomeAddress]
      , B.[StudentNationality]
      , B.[StudentInstitution]
      , B.[StudentFaculty]
      , B.[StudentCourse]
      , B.[StudentNumber]
      , B.[StudentAcademicYear]
	  , B.[StudentCourseDuration]
	  , App.*
	  , ad.[StudentApplicationDepositID]  
      ,ad.[DocumentName]
      ,ad.[ContentType]
      ,ad.[Size]
   
      ,ad.[DepositAmount]
      ,ad.[DepositSource]

, Acco.StudentAccommodationName
,AccoUnit.RENTAL_AMOUNT AS DepositRequired
,AccoUnit.UNIT_NUMBER
, (Select Top(1) Aps.ApplicationStatus From [dbo].[Student_ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID Where (su.StudentApplicationID = App.StudentApplicationID)   order by su.StatusDate Desc) as StudentApplicationStatus
, (Select Top(1) su.StatusDate From [dbo].[Student_ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID  Where (su.StudentApplicationID = App.StudentApplicationID)   order by su.StatusDate Desc) as StudentApplicationStatusDate
, (Select  Count(AU.StudentApplicationID)  From [dbo].[Student_ApplicationStatusUpdate]AU Where AU.StudentApplicationID = App.StudentApplicationID and AU.ApplicationStatusID = 4) as ApplicationSuccessful
, case when (Select Count(AA.[StudentApplicationID]) From [dbo].[Student_ApplicationStatusUpdate]AA Where AA.StudentApplicationID = App.StudentApplicationID and AA.ApplicationStatusID = 4) > 0 then 'Yes' else 'No' end as StudentApplicationApproved
, (Select Top(1) L.StudentLeaseID From [dbo].[Student_Lease]L Where L.StudentApplicationID = App.StudentApplicationID) as StudentLeaseID
, case when (Select Count(AD.[StudentApplicationID]) From [dbo].[Student_ApplicationDocument]AD Where AD.[StudentApplicationID] = App.StudentApplicationID and AD.DocumentCategoryID = 10) = 0 and (Select Count(AA.[StudentApplicationID]) From [dbo].[Student_ApplicationStatusUpdate]AA Where AA.StudentApplicationID = App.StudentApplicationID and AA.ApplicationStatusID = 4) > 0 then 1 else 0 end as InspDocUplaoded

  FROM [dbo].[Student_Application]App
  left join [Student_Applicant]B on App.StudentApplicationID = B.StudentApplicationID
  left join [dbo].[Student_ApplicationDeposit]ad on ad.StudentApplicationID = App.StudentApplicationID
  join [dbo].[Student_ApplicationAccommodationUnit]Aau on App.StudentApplicationID = Aau.StudentApplicationID
  join [Student_Accommodation]Acco on Acco.StudentAccommodationID = Aau.StudentAccommodationID
  join [Student_AccommodationUnit]AccoUnit on AccoUnit.StudentAccommodationUnitID = Aau.StudentAccommodationUnitID

  Where (App.StudentApplicationID = @StudentApplicationID or @StudentApplicationID = 0)
 
  Order by B.StudentFirstName
GO


  