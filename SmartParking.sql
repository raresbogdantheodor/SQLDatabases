USE [SmartParking]
GO
/****** Object:  Table [dbo].[Masini]    Script Date: 7/7/2016 8:59:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Masini](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ModelID] [int] NOT NULL,
	[Numar] [nvarchar](20) NOT NULL,
	[Color] [nvarchar](20) NULL,
 CONSTRAINT [PK_Masini] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Model]    Script Date: 7/7/2016 8:59:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProducatorID] [int] NOT NULL,
	[Nume] [nvarchar](100) NULL,
	[An] [int] NULL,
	[Activ] [bit] NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producator]    Script Date: 7/7/2016 8:59:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](100) NULL,
	[Activ] [bit] NULL,
 CONSTRAINT [PK_Producator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vizite]    Script Date: 7/7/2016 8:59:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vizite](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MasinaID] [int] NOT NULL,
	[DataSosire] [datetime] NOT NULL,
	[DataPlecare] [datetime] NULL,
	[Durata]  AS (datediff(minute,[DataSosire],[DataPlecare])),
 CONSTRAINT [PK_Vizite] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Masini] ON 

INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (1, 1, N'PH-29-GRL', N'Roz')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (2, 1, N'B-33-ADD', N'Roz')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (3, 3, N'B-293-LUX', N'Roz')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (4, 2, N'TM-25-BBR', N'Albastru')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (5, 4, N'BV-34-DDM', N'Verde')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (6, 3, N'GR-24-TTM', N'Rosu')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (7, 3, N'B-22-ALM', N'Negru')
INSERT [dbo].[Masini] ([ID], [ModelID], [Numar], [Color]) VALUES (8, 1, N'CL-03-RWR', N'Argintiu')
SET IDENTITY_INSERT [dbo].[Masini] OFF
SET IDENTITY_INSERT [dbo].[Model] ON 

INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (1, 1, N'Logan', 2005, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (2, 1, N'Duster', 2010, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (3, 2, N'LaFerrari', 2013, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (4, 3, N'Gallardo', 2014, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (5, 3, N'Aventador', 2014, 1)
INSERT [dbo].[Model] ([ID], [ProducatorID], [Nume], [An], [Activ]) VALUES (6, 4, N'Zonda', 2015, 1)
SET IDENTITY_INSERT [dbo].[Model] OFF
SET IDENTITY_INSERT [dbo].[Producator] ON 

INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (1, N'Dacia', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (2, N'Ferrari', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (3, N'Lamborghini', 1)
INSERT [dbo].[Producator] ([ID], [Nume], [Activ]) VALUES (4, N'Pagani', 1)
SET IDENTITY_INSERT [dbo].[Producator] OFF
SET IDENTITY_INSERT [dbo].[Vizite] ON 

INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (1, 1, CAST(N'2016-03-03 12:00:00.000' AS DateTime), CAST(N'2016-03-03 14:00:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (2, 2, CAST(N'2016-03-04 12:00:00.000' AS DateTime), CAST(N'2016-03-04 15:00:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (3, 3, CAST(N'2016-04-06 15:35:00.000' AS DateTime), CAST(N'2016-04-07 12:00:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (4, 4, CAST(N'2016-04-06 14:00:00.000' AS DateTime), CAST(N'2016-04-08 15:33:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (5, 1, CAST(N'2016-09-10 10:23:23.000' AS DateTime), CAST(N'2016-09-10 21:21:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (6, 4, CAST(N'2016-12-12 23:00:00.000' AS DateTime), CAST(N'2016-12-13 10:00:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (7, 5, CAST(N'2016-12-12 21:00:00.000' AS DateTime), CAST(N'2016-12-12 21:01:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (8, 6, CAST(N'2016-07-08 11:11:11.000' AS DateTime), CAST(N'2016-07-08 12:12:12.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (9, 7, CAST(N'2016-07-09 10:00:00.000' AS DateTime), CAST(N'2016-07-11 11:00:00.000' AS DateTime))
INSERT [dbo].[Vizite] ([ID], [MasinaID], [DataSosire], [DataPlecare]) VALUES (10, 8, CAST(N'2016-08-08 08:08:00.000' AS DateTime), CAST(N'2016-08-08 09:09:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vizite] OFF
ALTER TABLE [dbo].[Masini]  WITH CHECK ADD  CONSTRAINT [FK_Masini_Model] FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ID])
GO
ALTER TABLE [dbo].[Masini] CHECK CONSTRAINT [FK_Masini_Model]
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Producator] FOREIGN KEY([ProducatorID])
REFERENCES [dbo].[Producator] ([ID])
GO
ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Producator]
GO
ALTER TABLE [dbo].[Vizite]  WITH CHECK ADD  CONSTRAINT [FK_Vizite_Masini] FOREIGN KEY([MasinaID])
REFERENCES [dbo].[Masini] ([ID])
GO
ALTER TABLE [dbo].[Vizite] CHECK CONSTRAINT [FK_Vizite_Masini]
GO
