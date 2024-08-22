USE [joshco_pms]
GO

/****** Object:  Table [dbo].[TenantPaymentPlan]    Script Date: 2022/10/03 20:56:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TenantPaymentPlan](
	[TenantPaymentPlanId] [uniqueidentifier] NOT NULL,
	[PaymentPlanId] [uniqueidentifier] NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmedDateTime] [datetime] NULL,
	[CreatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_TenantPaymentPlan] PRIMARY KEY CLUSTERED 
(
	[TenantPaymentPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


