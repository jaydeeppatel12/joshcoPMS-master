USE [joshco_pms]
GO

/****** Object:  Table [dbo].[AOD_LeaseDetails]    Script Date: 9/26/2022 10:16:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AOD_LeaseDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[TPNReference] [nvarchar](50) NULL,
	[ReferenceNumber] [nvarchar](50) NULL,
	[IDNumber] [nvarchar](50) NULL,
	[FullNames] [nvarchar](100) NULL,
	[FullAddress] [nvarchar](250) NULL,
	[ContactNumber] [nvarchar](100) NULL,
	[EmailAddress] [nvarchar](100) NULL,
	[AccountType] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[Installment] [nvarchar](50) NULL,
	[OpenDate] [nvarchar](50) NULL,
	[EndDate] [nvarchar](50) NULL,
	[TerminatedDate] [nvarchar](50) NULL,
	[RPPAdded] [nvarchar](50) NULL,
	[LandlordName] [nvarchar](100) NULL,
	[LandlordCell] [nvarchar](50) NULL,
	[LandlordEmail] [nvarchar](100) NULL,
	[CreatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_LeaseDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[AOD_Notification]    Script Date: 9/26/2022 10:17:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AOD_Notification](
	[NotificationId] [uniqueidentifier] NOT NULL,
	[UserDetailId] [uniqueidentifier] NULL,
	[NotificationType] [nvarchar](10) NULL,
	[Message] [text] NULL,
	[Status] [nvarchar](30) NULL,
	[CreatedDateTime] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_AOD_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AOD_UserOtp]    Script Date: 9/26/2022 10:17:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AOD_UserOtp](
	[OtpId] [uniqueidentifier] NOT NULL,
	[UserDetailId] [uniqueidentifier] NULL,
	[Otp] [nvarchar](10) NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmedDate] [datetime] NULL,
	[ExpiryDateTime] [datetime] NULL,
	[SentDateTime] [datetime] NULL,
 CONSTRAINT [PK_AOD_UserOtp] PRIMARY KEY CLUSTERED 
(
	[OtpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  StoredProcedure [dbo].[GetNotificationReportData]    Script Date: 9/26/2022 10:18:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNotificationReportData]
	-- Add the parameters for the stored procedure here
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [AOD_LeaseDetails].[IDNumber]
      ,[AOD_LeaseDetails].[FullNames]
	  ,[AOD_LeaseDetails].[ContactNumber]
	  ,[AOD_LeaseDetails].[EmailAddress]
	  ,[AOD_LeaseDetails].[Installment] As DebtAmount
	  ,[AOD_LeaseDetails].[CreatedDateTime] AS ReportDate
	  ,[AOD_Notification].[CreatedDateTime] AS NoticeDate
      ,[AOD_Notification].[Status]
      ,[AOD_Notification].[Message] 
  FROM [joshco_pms].[dbo].[AOD_LeaseDetails] 

  LEFT JOIN [joshco_pms].[dbo].[AOD_Notification]
  ON [AOD_Notification].UserDetailId = [AOD_LeaseDetails].Id

  WHERE CAST([AOD_LeaseDetails].CreatedDateTime AS DATE) = CAST(GETDATE() -1 AS DATE) OR
  CAST([AOD_LeaseDetails].[CreatedDateTime] AS DATE) = CAST(GETDATE() AS DATE)

END

/****** Object:  StoredProcedure [dbo].[GetUserDebtInformation]    Script Date: 9/26/2022 10:18:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[GetUserDebtInformation] 
	-- Add the parameters for the stored procedure here 
	@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id] 
      ,[IDNumber]
      ,[FullNames] 
      ,[ContactNumber] 
	  ,[FullAddress]
	  ,[OpenDate] As DefaultDate
	  ,[Installment]
	  ,(SELECT TOP 1 IsConfirmed FROM [dbo].[AOD_UserOtp]
	    WHERE UserDetailId = @Id
		ORDER BY SentDateTime DESC) AS OtpConfirmed
  FROM [joshco_pms].[dbo].[AOD_LeaseDetails] LD
  INNER JOIN [dbo].[AOD_Notification] N  -- ensure we not retrieve details for someone who hasnt got the sms
  ON LD.Id = N.UserDetailId
  WHERE LD.Id = @Id

END


/****** Object:  StoredProcedure [dbo].[GetUserForAODNotification]    Script Date: 9/26/2022 10:18:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[GetUserForAODNotification] 
	-- Add the parameters for the stored procedure here 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (200) [Id] 
      ,[IDNumber]
      ,[FullNames] 
      ,[ContactNumber]
      ,[EmailAddress]     
  FROM [joshco_pms].[dbo].[AOD_LeaseDetails]
  WHERE Id NOT IN (SELECT UserDetailId 
  FROM [dbo].[AOD_Notification] 
  WHERE [Status] IN ('Failed','Sent'))
  AND CreatedDateTime BETWEEN GETDATE() -1 AND GETDATE()
  AND ContactNumber IS NOT NULL OR EmailAddress IS NOT NULL

END

/****** Object:  StoredProcedure [dbo].[GetUserOtp]    Script Date: 9/26/2022 10:19:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[GetUserOtp] 
	-- Add the parameters for the stored procedure here 
	@Id uniqueidentifier
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT TOP (1) [OtpId]
      ,[UserDetailId]
      ,[Otp]
      ,[IsConfirmed]
      ,[ConfirmedDate]
      ,[ExpiryDateTime]
      ,[SentDateTime]
  FROM [joshco_pms].[dbo].[AOD_UserOtp]
  WHERE UserDetailId = @Id
  ORDER BY [SentDateTime] DESC

END

/****** Object:  StoredProcedure [dbo].[InsertAODLeaseDetail]    Script Date: 9/26/2022 10:19:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertAODLeaseDetail] 
	-- Add the parameters for the stored procedure here
	@TPNReference nvarchar(50), 
	@ReferenceNumber nvarchar(50),
	@IDNumber nvarchar(50),
	@FullNames nvarchar(100),
	@FullAddress nvarchar(250),
	@ContactNumber nvarchar(100),
	@EmailAddress nvarchar(100),
	@AccountType nvarchar(50),
	@Status nvarchar(50),
	@Installment nvarchar(50),
	@OpenDate nvarchar(50),
	@EndDate nvarchar(50),
	@TerminatedDate nvarchar(50),
	@RPPAdded nvarchar(50),
    @LandlordName nvarchar(100),
    @LandlordCell nvarchar(50),
    @LandlordEmail nvarchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[AOD_LeaseDetails]
           ([Id]
           ,[TPNReference]
           ,[ReferenceNumber]
           ,[IDNumber]
           ,[FullNames]
           ,[FullAddress]
           ,[ContactNumber]
           ,[EmailAddress]
           ,[AccountType]
           ,[Status]
           ,[Installment]
           ,[OpenDate]
           ,[EndDate]
           ,[TerminatedDate]
           ,[RPPAdded]
           ,[LandlordName]
           ,[LandlordCell]
           ,[LandlordEmail]
		   ,[CreatedDateTime])
     VALUES
           (NEWID()
           ,@TPNReference
           ,@ReferenceNumber
           ,@IDNumber
           ,@FullNames 
           ,@FullAddress
           ,@ContactNumber
           ,@EmailAddress
           ,@AccountType
           ,@Status
           ,@Installment
           ,@OpenDate
           ,@EndDate
           ,@TerminatedDate
           ,@RPPAdded
           ,@LandlordName
           ,@LandlordCell
           ,@LandlordEmail
		   ,GETDATE())
END


/****** Object:  StoredProcedure [dbo].[InsertAODNotification]    Script Date: 9/26/2022 10:20:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertAODNotification] 
	-- Add the parameters for the stored procedure here
	@UserDetailId uniqueidentifier, 
	@NotificationType nvarchar(10),
	@Message text,
	@Status nvarchar(30) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[AOD_Notification]
           ([NotificationId]
           ,[UserDetailId]
           ,[NotificationType]
           ,[Message]
           ,[Status]
           ,[CreatedDateTime]
           ,[IsActive])
     VALUES
           (NEWID()
           ,@UserDetailId
           ,@NotificationType
           ,@Message
           ,@Status 
           ,GETDATE()
           ,1 )
END

/****** Object:  StoredProcedure [dbo].[InsertAODUserOtp]    Script Date: 9/26/2022 10:20:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertAODUserOtp] 
	-- Add the parameters for the stored procedure here
	@UserDetailId uniqueidentifier, 
	@Otp nvarchar(10),
	@ExpiryDateTime datetime 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[AOD_UserOtp]
           ([OtpId]
           ,[UserDetailId]
           ,[Otp]
           ,[IsConfirmed]
           ,[ConfirmedDate]
           ,[ExpiryDateTime]
           ,[SentDateTime])
     VALUES
           (NEWID()
           ,@UserDetailId
           ,@Otp
           ,NULL
           ,NULL
           ,@ExpiryDateTime
           ,GETDATE())
END

/****** Object:  StoredProcedure [dbo].[UpdateUserOtp]    Script Date: 9/26/2022 10:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE  [dbo].[UpdateUserOtp] 
	-- Add the parameters for the stored procedure here 
	@OtpId uniqueidentifier,
	@IsConfirmed bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
UPDATE [dbo].[AOD_UserOtp]
   SET [IsConfirmed] = @IsConfirmed
      ,[ConfirmedDate] = GETDATE()
 WHERE [OtpId] = @OtpId

END
