USE [joshco_pms]
GO
/****** Object:  StoredProcedure [dbo].[GetTenantDetailsById]    Script Date: 2022/10/03 21:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTenantDetailsById]
	-- Add the parameters for the stored procedure here
 @TenantId uniqueidentifier
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
  FROM [joshco_pms].[dbo].[AOD_LeaseDetails]

  WHERE [AOD_LeaseDetails].[Id] = @TenantId

END
