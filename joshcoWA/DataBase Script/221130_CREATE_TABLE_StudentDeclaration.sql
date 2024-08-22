

CREATE TABLE [dbo].[Student_Declaration](
	[StudentDeclarationID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[StudentDeclaration1] [bit] NULL,
	[StudentDeclaration2] [bit] NULL,
	[StudentDeclaration3] [bit] NULL,
	[SignedAtStudentPlace] [varchar](50) NULL,
	[SignedAtStudentDate] [date] NULL,
 CONSTRAINT [PK_StudentDeclaration] PRIMARY KEY CLUSTERED 
(
	[StudentDeclarationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


