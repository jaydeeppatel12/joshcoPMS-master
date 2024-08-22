CREATE TABLE [dbo].[Student_Applicant](
	[StudentApplicantID] [int] IDENTITY(1,1) NOT NULL,
	[StudentApplicationID] [int] NOT NULL,
	[StudentReferenceNo] [nvarchar](max) NULL,
	[StudentFirstName] [varchar](50) NOT NULL,
	[StudentMiddleName] [varchar](50) NULL,
	[StudentLastName] [varchar](50) NOT NULL,
	[StudentGender] [varchar](50) NOT NULL,
	[StudentIdentificationNumber] [nvarchar](20) NOT NULL,
	[StudentEmailAddress] [varchar](80) NOT NULL,
	[StudentMobileNumber] [varchar](50) NOT NULL,
	[StudentHomeAddress] [varchar](150) NOT NULL,
	[StudentNationality] [varchar](50) NOT NULL,
	[StudentOccupation] [nvarchar](50) NULL,
	[StudentEmploymentStatus] [nvarchar](100) NULL,
	[StudentIndustryclassification] [nvarchar](100) NULL,
	[StudentIsProcurementPublicOfficial] [bit] NULL,
	[StudentInstitution] [nvarchar](100) NOT NULL,
	[StudentFaculty] [nvarchar](100) NOT NULL,
	[StudentCourse] [nvarchar](100) NULL,
	[StudentNumber] [nvarchar](50) NOT NULL,
	[StudentAcademicYear] [nvarchar](10) NULL,
	[StudentCourseDuration] [nvarchar](50) NULL,
	[StudentIsOTPVerified] [bit] NULL,
 CONSTRAINT [PK_StudentApplicant] PRIMARY KEY CLUSTERED 
(
	[StudentApplicantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
