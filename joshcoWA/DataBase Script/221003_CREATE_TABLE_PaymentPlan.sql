USE [joshco_pms]
GO

/****** Object:  Table [dbo].[PaymentPlan]    Script Date: 2022/10/03 20:59:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PaymentPlan](
	[PaymentPlanId] [uniqueidentifier] NOT NULL,
	[TenantId] [uniqueidentifier] NULL,
	[TotalArrearsAmount] [nvarchar](100) NULL,
	[MonthlyAffordablePayment] [nvarchar](100) NULL,
	[DurationInMonths] [nvarchar](100) NULL,
	[CurrentPlan_DueDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_PaymentPlan] PRIMARY KEY CLUSTERED 
(
	[PaymentPlanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


