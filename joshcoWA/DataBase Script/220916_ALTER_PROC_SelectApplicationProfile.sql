SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE or ALTER   Proc [dbo].[FM_GetNotifications]
@NotificationType varchar(50),
@SentSuccessful bit = null
as

IF(@SentSuccessful is null)
BEGIN
	SELECT *
	FROM [joshco_pms].[dbo].[NotificationLog]
	where NotificationType = @NotificationType and SentSuccessful= 0
	order by NotificationLogID desc
END
ELSE
BEGIN
	SELECT *
	FROM [joshco_pms].[dbo].[NotificationLog]
	where NotificationType = @NotificationType
	AND SentSuccessful = @SentSuccessful
	order by NotificationLogID desc
END

-----

ALTER TABLE  [dbo].[NotificationLog]
ADD Body VARCHAR(max) NULL, [To] VARCHAR (255) NULL,[Reference] VARCHAR (255) NULL ;


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[SelectApplicationProfile]   -- Exec  [SelectApplicationList] 2, 'All'

@ApplicationID int 
as

 
SELECT Distinct B.[ApplicantID]
      , B.[FullName]
      , B.[MaidenName]
      , B.[IdentityNumber]
      , B.[Nationality]
      , B.[WorkNumber]
      , B.[MobileNumber]
      , B.[EmailAddress]
      , B.[ResidentialAddress]
      , B.[MaritalStatusID]
      , B.[AlternativeContactPersonFullName]
      , B.[AlternativeContactPersonMobile]
      , B.[PropertyOwner]
	  , App.*, 
ad.[ApplicationDepositID]
  
      ,ad.[DocumentName]
      ,ad.[ContentType]
      ,ad.[Size]
   
      ,ad.[DepositAmount]
      ,ad.[DepositSource]

, p.PropertyName
,pu.EstRatePerSQM AS DepositRequired
,pu.PropertyUnit
, (Select Top(1) Aps.ApplicationStatus From [dbo].[ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID Where (su.ApplicationID = App.ApplicationID)   order by su.StatusDate Desc) as ApplicationStatus
, (Select Top(1) su.StatusDate From [dbo].[ApplicationStatusUpdate]su join [dbo].[ApplicationStatus]Aps on su.ApplicationStatusID = Aps.ApplicationStatusID  Where (su.ApplicationID = App.ApplicationID)   order by su.StatusDate Desc) as ApplicationStatusDate
, (Select  Count(AU.ApplicationID)  From [dbo].[ApplicationStatusUpdate]AU Where AU.ApplicationID = App.ApplicationID and AU.ApplicationStatusID = 4) as ApplicationSuccessful
, case when (Select Count(AA.[ApplicationID]) From [dbo].[ApplicationStatusUpdate]AA Where AA.ApplicationID = App.ApplicationID and AA.ApplicationStatusID = 4) > 0 then 'Yes' else 'No' end as ApplicationApproved
, (Select Top(1) L.LeaseID From [dbo].[Lease]L Where L.ApplicationID = App.ApplicationID) as LeaseID
, case when (Select Count(AD.[ApplicationID]) From [dbo].[ApplicationDocument]AD Where AD.[ApplicationID] = App.ApplicationID and AD.DocumentCategoryID = 10) = 0 and (Select Count(AA.[ApplicationID]) From [dbo].[ApplicationStatusUpdate]AA Where AA.ApplicationID = App.ApplicationID and AA.ApplicationStatusID = 4) > 0 then 1 else 0 end as InspDocUplaoded

  FROM [dbo].[Application]App
  join [Applicant]B on App.ApplicantID = B.ApplicantID
  left join [dbo].[ApplicationDeposit]ad on ad.ApplicationID = App.ApplicationID

    left join [dbo].[Property]p on App.PropertyID = p.PropertyID 
	  left join [dbo].[PropertyUnit] pu
  on pu.PropertyUnitID = APP.PropertyUnitID
  Where (App.ApplicationID =@ApplicationID or @ApplicationID = 0)
 
  Order by B.FullName