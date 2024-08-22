USE [joshco_pms]
GO

CREATE TABLE [dbo].[Student_Lease](
	[StudentLeaseID] [int] IDENTITY(1,1) NOT NULL,
	[Frequency] [varchar](20) NULL,
	[PropertyUnitID] [int] NULL,
	[StudentTenantID] [int] NULL,
	[Area] [decimal](18, 2) NULL,
	[InitialValue] [money] NULL,
	[Vatable] [varchar](5) NULL,
	[Escalation] [decimal](18, 2) NULL,
	[Commencement] [datetime] NULL,
	[Termination] [datetime] NULL,
	[Interest] [varchar](10) NULL,
	[InterestPercentage] [decimal](18, 2) NULL,
	[TypeOfLease] [int] NULL,
	[LeaseStatus] [varchar](50) NULL,
	[Approved] [bit] NULL,
	[Comment] [varchar](5000) NULL,
	[LesseeFinYear] [date] NULL,
	[FinYearNoOfDays] [int] NULL,
	[FinYearEndDate] [date] NULL,
	[RatePerSQM] [money] NULL,
	[StudentApplicationID] [int] NULL,
	[DepositAmount] [decimal](18, 2) NULL,
	[PaidDeposit] [bit] NULL,
	[MoveInInspectionID] [int] NULL,
	[MoveOutInspectionID] [int] NULL,
 CONSTRAINT [PK_Student_Lease] PRIMARY KEY CLUSTERED 
(
	[StudentLeaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


