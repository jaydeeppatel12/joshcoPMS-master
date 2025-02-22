USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[InsertPaymentPlan]    Script Date: 2022/10/03 20:54:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPaymentPlan]
	-- Add the parameters for the stored procedure here
	@PaymentPlanId uniqueidentifier, 
	@TenantId uniqueidentifier, 
	@TotalArrearsAmount [nvarchar](100),
	@MonthlyAffordablePayment [nvarchar](100) NULL,
	@DurationInMonths [nvarchar](100) NULL,
	@CurrentPlan_DueDate datetime,
	@CreatedBy nvarchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO [dbo].[PaymentPlan]
           ([PaymentPlanId]
		   ,[TenantId] 
           ,[TotalArrearsAmount]
           ,[MonthlyAffordablePayment]
           ,[DurationInMonths] 
           ,[CurrentPlan_DueDate]
           ,[CreatedBy]
           ,[CreatedDateTime])
     VALUES
           (@PaymentPlanId
		   ,@TenantId
           ,@TotalArrearsAmount
           ,@MonthlyAffordablePayment
           ,@DurationInMonths 
           ,@CurrentPlan_DueDate
           ,@CreatedBy
		   ,GETDATE())

END
