USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[GetTenantsPaymentPlan]    Script Date: 2022/10/03 20:20:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[GetTenantsPaymentPlan]
	-- Add the parameters for the stored procedure here 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	   [AOD_LeaseDetails].[FullNames]
	  ,[AOD_LeaseDetails].[FullAddress]
	  ,[PaymentPlan].[TotalArrearsAmount]
      ,[PaymentPlan].[MonthlyAffordablePayment]
      ,[PaymentPlan].[DurationInMonths] 
      ,[PaymentPlan].[CurrentPlan_DueDate]
      ,[PaymentPlan].[CreatedBy] 
	  ,CASE
			WHEN [TenantPaymentPlan].[IsConfirmed] = 1 THEN 'Yes' 
			ELSE 'No'
		END AS IsConfirmed
	  ,[TenantPaymentPlan].[ConfirmedDateTime]

	FROM [joshco_pms].[dbo].[TenantPaymentPlan]

	INNER JOIN [joshco_pms].[dbo].[PaymentPlan]
	ON [PaymentPlan].[PaymentPlanId] = [TenantPaymentPlan].[PaymentPlanId]

	INNER JOIN [joshco_pms].[dbo].[AOD_LeaseDetails]
	ON [AOD_LeaseDetails].[Id] = [PaymentPlan].[TenantId]

	
END
