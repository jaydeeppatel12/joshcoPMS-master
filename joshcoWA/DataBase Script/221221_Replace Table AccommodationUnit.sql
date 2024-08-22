USE [joshco_pms]
GO
/****** Object:  Table [dbo].[Student_AccommodationUnit]    Script Date: 2022/12/21 13:32:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_AccommodationUnit](
	[StudentAccommodationUnitID] [int] IDENTITY(1,1) NOT NULL,
	[StudentAccommodationID] [int]  NULL,
	[UNIT_NUMBER] [nvarchar](10) NULL,
	[UNIT_TYPE] [nvarchar](100) NULL,
	[ROOM_SHARING_QTY] [int] NULL,
	[RATE] [nvarchar](10) NULL,
	[FLOOR] [int] NULL,
	[RENTAL_AMOUNT] [decimal](18, 2) NULL,
 CONSTRAINT [PK_StudentAccommodationUnity] PRIMARY KEY CLUSTERED 
(
	[StudentAccommodationUnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student_AccommodationUnit] ON 
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (1, N'104', N'Single Apartment ', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (2, N'204', N'Single Apartment ', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (3, N'304', N'Single Apartment ', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (4, N'404', N'Single Apartment ', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (5, N'504', N'Single Apartment ', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (6, N'601', N'Single Apartment ', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (7, N'602', N'Single Apartment ', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (8, N'603', N'Single Apartment ', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (9, N'604', N'Single Apartment ', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (10, N'115', N'Sharing 4 Bed Apartment ', 4, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (11, N'116', N'Sharing 4 Bed Apartment ', 4, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (12, N'215', N'Sharing 4 Bed Apartment ', 4, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (13, N'315', N'Sharing 4 Bed Apartment ', 4, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (14, N'415', N'Sharing 4 Bed Apartment ', 4, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (15, N'515', N'Sharing 4 Bed Apartment ', 4, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (16, N'113', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (17, N'114', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (18, N'213', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (19, N'313', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (20, N'413', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (21, N'513', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (22, N'214', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (23, N'314', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (24, N'414', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (25, N'514', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (26, N'117', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (27, N'217', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (28, N'317', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (29, N'417', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (30, N'517', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (31, N'101', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (32, N'102', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (33, N'103', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (34, N'105', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (35, N'106', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (36, N'107', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (37, N'108', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (38, N'109', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (39, N'110', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (40, N'111', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (41, N'112', N'Sharing 2 Bed Apartment ', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (42, N'201', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (43, N'202', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (44, N'203', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (45, N'205', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (46, N'206', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (47, N'207', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (48, N'208', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (49, N'209', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (50, N'210', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (51, N'211', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (52, N'212', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (53, N'302', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (54, N'303', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (55, N'305', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (56, N'306', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (57, N'307', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (58, N'308', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (59, N'309', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (60, N'310', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (61, N'311', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (62, N'312', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (63, N'313', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (64, N'401', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (65, N'402', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (66, N'403', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (67, N'405', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (68, N'406', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (69, N'407', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (70, N'408', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (71, N'409', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (72, N'410', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (73, N'411', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (74, N'412', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (75, N'501', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (76, N'502', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (77, N'503', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (78, N'505', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (79, N'506', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (80, N'507', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (81, N'508', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (82, N'509', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (83, N'510', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (84, N'511', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (85, N'512', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (86, N'216', N'Sharing 2 Bed Apartment ', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (87, N'316', N'Sharing 2 Bed Apartment ', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (88, N'416', N'Sharing 2 Bed Apartment ', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (89, N'516', N'Sharing 2 Bed Apartment ', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (90, N'104', N'Single Apartment', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (91, N'204', N'Single Apartment', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (92, N'304', N'Single Apartment', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (93, N'404', N'Single Apartment', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (94, N'504', N'Single Apartment', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (95, N'601', N'Single Apartment', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (96, N'602', N'Single Apartment', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (97, N'603', N'Single Apartment', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (98, N'604', N'Single Apartment', 1, NULL, 6, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (99, N'115', N'Sharing 4 Bed Apartment', 4, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (100, N'116', N'Sharing 4 Bed Apartment', 4, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (101, N'215', N'Sharing 4 Bed Apartment', 4, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (102, N'315', N'Sharing 4 Bed Apartment', 4, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (103, N'415', N'Sharing 4 Bed Apartment', 4, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitIDD], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (104, N'515', N'Sharing 4 Bed Apartment', 4, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (105, N'113', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (106, N'114', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (107, N'213', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (108, N'313', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (109, N'413', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (110, N'513', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (111, N'214', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (112, N'314', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (113, N'414', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (114, N'514', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (115, N'117', N'Ensuite/Bathrooms inside', 1, NULL, 1, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (116, N'217', N'Ensuite/Bathrooms inside', 1, NULL, 2, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (117, N'317', N'Ensuite/Bathrooms inside', 1, NULL, 3, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (118, N'417', N'Ensuite/Bathrooms inside', 1, NULL, 4, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (119, N'517', N'Ensuite/Bathrooms inside', 1, NULL, 5, CAST(4387.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (120, N'101', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (121, N'102', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (122, N'103', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (123, N'105', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (124, N'106', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (125, N'107', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (126, N'108', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (127, N'109', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (128, N'110', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (129, N'111', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (130, N'112', N'Sharing 2 Bed Apartment', 2, NULL, 1, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (131, N'201', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (132, N'202', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (133, N'203', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (134, N'205', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (135, N'206', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (136, N'207', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (137, N'208', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (138, N'209', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (139, N'210', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (140, N'211', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (141, N'212', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (142, N'301', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (143, N'302', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (144, N'303', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (145, N'305', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (146, N'306', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (147, N'307', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (148, N'308', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (149, N'309', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (150, N'310', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (151, N'311', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (152, N'312', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (153, N'313', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (154, N'401', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (155, N'402', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (156, N'403', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (157, N'405', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (158, N'406', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (159, N'407', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (160, N'408', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (161, N'409', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (162, N'410', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (163, N'411', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (164, N'412', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (165, N'501', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (166, N'502', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (167, N'503', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (168, N'505', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (169, N'506', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (170, N'507', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (171, N'508', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (172, N'509', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (173, N'510', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (174, N'511', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (175, N'512', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (176, N'216', N'Sharing 2 Bed Apartment', 2, NULL, 2, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (177, N'316', N'Sharing 2 Bed Apartment', 2, NULL, 3, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (178, N'416', N'Sharing 2 Bed Apartment', 2, NULL, 4, CAST(3959.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[Student_AccommodationUnit] ([StudentAccommodationUnitID], [UNIT_NUMBER], [UNIT_TYPE], [ROOM_SHARING_QTY], [RATE], [FLOOR], [RENTAL_AMOUNT]) VALUES (179, N'516', N'Sharing 2 Bed Apartment', 2, NULL, 5, CAST(3959.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Student_AccommodationUnit] OFF
GO
