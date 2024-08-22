

CREATE TABLE [dbo].[Student_Application](
	[StudentApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentEmailAddress] [nvarchar](100) NOT NULL,
	[StudentDateAdded] [datetime] NOT NULL,
	[StudentName] [nvarchar](100) NOT NULL,
	[StudentPassword] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Student_Application] PRIMARY KEY CLUSTERED 
(
	[StudentApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


