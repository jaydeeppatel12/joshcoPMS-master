USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[GetAcknowladgedTenants]    Script Date: 2022/10/03 21:00:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[GetAcknowladgedTenants]
	-- Add the parameters for the stored procedure here
 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [AOD_LeaseDetails].[Id]
      ,[AOD_LeaseDetails].[FullNames]
      ,[AOD_LeaseDetails].[IDNumber]
      ,[AOD_LeaseDetails].[ContactNumber]
	  ,[AOD_LeaseDetails].[Installment] 
      ,[AOD_LeaseDetails].[FullAddress]
      ,[AOD_UserOtp].[ConfirmedDate]
	  ,[AOD_UserOtp].[IsConfirmed] AS OtpVerified
      ,[AOD_LeaseDetails].[CreatedDateTime] AS ReportDate
  FROM [joshco_pms].[dbo].[AOD_Notification] 

  INNER JOIN [joshco_pms].[dbo].[AOD_UserOtp]
  ON [AOD_Notification] .[UserDetailId] = [AOD_UserOtp].[UserDetailId]

  INNER JOIN [joshco_pms].[dbo].[AOD_LeaseDetails]
  ON [AOD_Notification] .UserDetailId = [AOD_LeaseDetails].Id

  LEFT JOIN [joshco_pms].[dbo].[PaymentPlan]
  ON [PaymentPlan].TenantId = [AOD_LeaseDetails].Id

  WHERE [AOD_UserOtp].[IsConfirmed] = 1 AND NOT EXISTS (SELECT TenantId
  FROM [joshco_pms].[dbo].[PaymentPlan] WHERE [PaymentPlan].TenantId = [AOD_LeaseDetails].Id)

END
