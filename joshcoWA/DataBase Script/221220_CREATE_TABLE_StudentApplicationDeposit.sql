USE [joshco_pms]
GO

/****** Object:  Table [dbo].[ApplicationDeposit]    Script Date: 2022/12/20 09:57:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student_ApplicationDeposit](
	[StudentApplicationDepositID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[DocumentName] [varchar](500) NOT NULL,
	[ContentType] [varchar](150) NOT NULL,
	[Size] [bigint] NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[DepositAmount] [decimal](18, 0) NOT NULL,
	[DepositSource] [varchar](50) NULL,
	[DatePaid] [datetime] NULL,
	[ReferenceNo] [varchar](max) NULL,
	[PayFastPaymentId] [int] NULL,
 CONSTRAINT [PK_StudentApplicationDeposit] PRIMARY KEY CLUSTERED 
(
	[StudentApplicationDepositID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


