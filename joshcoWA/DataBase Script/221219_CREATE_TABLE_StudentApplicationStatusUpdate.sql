USE [joshco_pms]
GO

/****** Object:  Table [dbo].[ApplicationStatusUpdate]    Script Date: 2022/12/19 14:43:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Student_ApplicationStatusUpdate](
	[StudentApplicationStatusUpdateID] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](4000) NULL,
	[ApplicationStatusID] [int] NULL,
	[StatusDate] [datetime] NULL,
	[StudentApplicationID] [int] NULL,
	[AddedBy] [int] NULL,
	[DateAdded] [datetime] NULL,
 CONSTRAINT [PK_StudentApplicationStatusUpdate] PRIMARY KEY CLUSTERED 
(
	[StudentApplicationStatusUpdateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


