USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[InsertTenantPaymentPlan]    Script Date: 2022/10/03 20:59:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertTenantPaymentPlan]
	-- Add the parameters for the stored procedure here
	@PaymentPlanId uniqueidentifier  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[TenantPaymentPlan]
           ([TenantPaymentPlanId]
           ,[PaymentPlanId]
           ,[IsConfirmed]
           ,[ConfirmedDateTime]
           ,[CreatedDateTime])
     VALUES
           (NEWID()
           ,@PaymentPlanId
           ,1
           ,GETDATE()
           ,GETDATE())
END
