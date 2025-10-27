
USE [NFC]
GO
/****** Object:  UserDefinedTableType [dbo].[tblContactInfo]    Script Date: 6/16/2022 12:51:18 AM ******/
CREATE TYPE [dbo].[tblContactInfo] AS TABLE(
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[Address1] [nvarchar](150) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](30) NULL,
	[WorkPhone] [varchar](30) NULL,
	[WorkPhoneExt] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[IsActive] [bit] NULL,
	[RefPhone] [varchar](30) NULL,
	[Title] [varchar](100) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[TypeOfContact] [varchar](300) NULL,
	[CompanyName] [varchar](100) NULL,
	[Category] [varchar](30) NULL,
	[IsEmailFlow] [smallint] NULL,
	[Website] [varchar](100) NULL
)
GO
/****** Object:  Table [dbo].[Child]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Child](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NOT NULL,
	[UserDefinedId] [int] NOT NULL,
	[Code] [nvarchar](300) NULL,
	[Description] [nvarchar](300) NULL,
	[CompanyId] [int] NULL,
	[CreatedBy] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[UpdatedDate] [datetime] NULL,
	[OwnerId] [nvarchar](20) NULL,
 CONSTRAINT [PK_dbo.Child] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Address] [nvarchar](150) NULL,
	[Address1] [nvarchar](150) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](30) NULL,
	[State] [varchar](20) NULL,
	[City] [varchar](30) NULL,
	[Zip] [varchar](10) NULL,
	[Phone] [varchar](30) NULL,
	[WorkPhone] [varchar](30) NULL,
	[WorkPhoneExt] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[Website] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[ProfileLogo] [varchar](300) NULL,
	[CompanyName] [varchar](100) NULL,
	[IsOverwrite] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
	[UserTypeContact] [varchar](30) NULL,
	[Other] [varchar](300) NULL,
	[CreatedBy] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](30) NULL,
	[UpdatedDate] [datetime] NULL,
	[RefPhone] [varchar](30) NULL,
	[Title] [varchar](100) NULL,
	[TypeOfContact] [varchar](300) NULL,
	[Memo] [varchar](250) NULL,
	[CountryCode] [varchar](5) NULL,
	[Longitude] [varchar](30) NULL,
	[Latitude] [varchar](30) NULL,
	[IsEmailFlow] [smallint] NULL,
 CONSTRAINT [PK_ContactInformation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[iso] [char](2) NULL,
	[name] [nvarchar](80) NULL,
	[nicename] [nvarchar](80) NULL,
	[iso3] [char](3) NULL,
	[numcode] [smallint] NULL,
	[phonecode] [int] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GlobalID]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlobalID](
	[ObjectID] [varchar](255) NOT NULL,
	[ItemID] [varchar](255) NOT NULL,
	[IDForYear] [int] NULL,
	[IDForMonth] [int] NULL,
	[IDForDate] [datetime] NULL,
	[CurrentID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Master]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserDefinedId] [int] NOT NULL,
	[Code] [nvarchar](20) NULL,
	[Description] [nvarchar](100) NULL,
	[CreatedBy] [smallint] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.Master] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[States]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[States](
	[STATE] [varchar](2) NOT NULL,
	[STATENAME] [varchar](50) NULL,
	[SalesTaxRate] [numeric](6, 3) NULL,
	[FreightTaxable] [char](1) NULL,
	[ShippingSurcharge] [numeric](6, 2) NULL,
 CONSTRAINT [PK_REFSTATES] PRIMARY KEY CLUSTERED 
(
	[STATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLog_Data]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLog_Data](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[SessionId] [nvarchar](500) NULL,
	[UserId] [int] NULL,
	[LoginDate] [datetime] NULL,
	[Status] [bit] NULL,
	[LastUpdate] [datetime] NULL,
 CONSTRAINT [PK_UserLog_Data] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[Serial] [varchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Phone] [varchar](30) NULL,
	[PhoneVerifyCode] [varchar](30) NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[ProfileLogo] [varchar](300) NULL,
	[CompanyName] [varchar](100) NULL,
	[CompanyLogo] [varchar](300) NULL,
	[WorkPhone] [varchar](30) NULL,
	[WorkPhoneExt] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[IsPhoneVerified] [bit] NULL,
	[IsNewUser] [bit] NULL,
	[IsAgree] [bit] NULL,
	[DoNotEmbedProfile] [bit] NULL,
	[DoNotEmbedCompany] [bit] NULL,
	[Address] [nvarchar](150) NULL,
	[Address1] [nvarchar](150) NULL,
	[Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[State] [varchar](20) NULL,
	[City] [varchar](30) NULL,
	[Zip] [varchar](10) NULL,
	[Other] [varchar](300) NULL,
	[DatabaseName] [varchar](50) NULL,
	[DatabaseLocation] [varchar](200) NULL,
	[UserTypeContact] [varchar](20) NULL,
	[IsAdmin] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsActive] [bit] NULL,
	[CanLogin] [bit] NULL,
	[IsUserProfileComplete] [bit] NULL,
	[IsBillingComplete] [bit] NULL,
	[IsOverwrite] [bit] NULL,
	[Website] [varchar](100) NULL,
	[Category] [varchar](30) NULL,
	[YTD_Contact_Export_Limit] [varchar](10) NULL,
	[YTD_Contact_Export] [varchar](10) NULL,
	[MTD_Contact_Import] [varchar](10) NULL,
	[MTD_Contact_Import_Limit] [varchar](10) NULL,
	[CreatedBy] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[RefPhone] [varchar](30) NULL,
	[Title] [varchar](100) NULL,
	[TypeOfContact] [varchar](30) NULL,
	[SubscriptionType] [varchar](20) NULL,
	[SubscriptionExpiredOn] [datetime] NULL,
	[StorageExpiredOn] [datetime] NULL,
	[IsStorageSubscription] [bit] NULL,
	[LastImportedDate] [datetime] NULL,
	[LastExportedDate] [datetime] NULL,
	[Contact_Storage_Limit] [varchar](10) NULL,
	[IsSentMail] [bit] NULL,
	[CountryCode] [varchar](5) NULL,
	[Longitude] [varchar](30) NULL,
	[Latitude] [varchar](30) NULL,
	[IsEmailFlow] [bit] NULL,
	[EmailFlowCreatedOn] [datetime] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NULL,
	[UserDefineId] [int] NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[andVerCode] [varchar](20) NULL,
	[andVerLabel] [varchar](20) NULL,
	[andMustUpdate] [bit] NULL,
	[andVerNote] [varchar](max) NULL,
	[andLink] [varchar](255) NULL,
	[iOsVerCode] [varchar](20) NULL,
	[iOsVerLabel] [varchar](20) NULL,
	[iOsMustUpdate] [bit] NULL,
	[iOsLink] [varchar](255) NULL,
	[iOsVerNote] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Child] ON 
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (1, 8, 8, N'Cash', N'Cash', NULL, 9, CAST(N'2018-05-07T18:48:19.670' AS DateTime), NULL, NULL, N'')
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (2, 8, 8, N'Check', N'Check', NULL, 9, CAST(N'2018-05-07T18:57:01.743' AS DateTime), NULL, NULL, N'')
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (9, 9, 9, N'Category1', N'Category1', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (10, 9, 9, N'Category2', N'Category2', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (12, 9, 9, N'Category3', N'Category 3', NULL, 2, CAST(N'2020-03-31T02:29:12.223' AS DateTime), NULL, NULL, N'2')
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (14, 9, 9, N'cat001', N'Personal', NULL, 1, CAST(N'2020-04-10T21:14:38.547' AS DateTime), NULL, NULL, N'1')
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (228, 4, 4, N'Abortion Policy', N'Abortion Policy', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (229, 4, 4, N'Accountants', N'Accountants', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (230, 4, 4, N'Advertising/Public Relations', N'Advertising/Public Relations', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (231, 4, 4, N'Aerospace, Defense Contractors', N'Aerospace, Defense Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (232, 4, 4, N'Agribusiness', N'Agribusiness', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (233, 4, 4, N'Agricultural Services & Products', N'Agricultural Services & Products', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (234, 4, 4, N'Agriculture', N'Agriculture', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (235, 4, 4, N'Air Transport', N'Air Transport', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (236, 4, 4, N'Air Transport Unions', N'Air Transport Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (237, 4, 4, N'Airlines', N'Airlines', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (238, 4, 4, N'Alcoholic Beverages', N'Alcoholic Beverages', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (239, 4, 4, N'Alternative Energy ', N'Alternative Energy ', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (240, 4, 4, N'Architectural Services', N'Architectural Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (241, 4, 4, N'Attorneys/Law Firms', N'Attorneys/Law Firms', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (242, 4, 4, N'Auto Dealers', N'Auto Dealers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (243, 4, 4, N'Auto Dealers, Japanese', N'Auto Dealers, Japanese', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (244, 4, 4, N'Auto Manufacturers', N'Auto Manufacturers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (245, 4, 4, N'Automotive', N'Automotive', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (246, 4, 4, N'Banking, Mortgage', N'Banking, Mortgage', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (247, 4, 4, N'Banks, Commercial', N'Banks, Commercial', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (248, 4, 4, N'Banks, Savings & Loans', N'Banks, Savings & Loans', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (249, 4, 4, N'Bars & Restaurants', N'Bars & Restaurants', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (250, 4, 4, N'Beer, Wine & Liquor', N'Beer, Wine & Liquor', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (251, 4, 4, N'Books, Magazines & Newspapers', N'Books, Magazines & Newspapers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (252, 4, 4, N'Broadcasters, Radio/TV', N'Broadcasters, Radio/TV', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (253, 4, 4, N'Builders/General Contractors', N'Builders/General Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (254, 4, 4, N'Builders/Residential', N'Builders/Residential', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (255, 4, 4, N'Building Materials & Equipment', N'Building Materials & Equipment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (256, 4, 4, N'Building Trade Unions', N'Building Trade Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (257, 4, 4, N'Business Associations', N'Business Associations', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (258, 4, 4, N'Business Services', N'Business Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (259, 4, 4, N'Cable & Satellite TV ', N'Cable & Satellite TV ', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (260, 4, 4, N'Car Dealers', N'Car Dealers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (261, 4, 4, N'Car Dealers, Imports', N'Car Dealers, Imports', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (262, 4, 4, N'Car Manufacturers', N'Car Manufacturers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (263, 4, 4, N'Carpet Cleaning', N'Carpet Cleaning', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (264, 4, 4, N'Casinos / Gambling', N'Casinos / Gambling', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (265, 4, 4, N'Cattle Ranchers/Livestock', N'Cattle Ranchers/Livestock', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (266, 4, 4, N'Chemical & Related Manufacturing', N'Chemical & Related Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (267, 4, 4, N'Chiropractors', N'Chiropractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (268, 4, 4, N'Civil Servants/Public Officials', N'Civil Servants/Public Officials', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (269, 4, 4, N'Clergy & Religious Organizations', N'Clergy & Religious Organizations', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (270, 4, 4, N'Clothing Manufacturing', N'Clothing Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (271, 4, 4, N'Coal Mining', N'Coal Mining', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (272, 4, 4, N'Colleges, Universities & Schools', N'Colleges, Universities & Schools', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (273, 4, 4, N'Commercial Banks', N'Commercial Banks', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (274, 4, 4, N'Commercial TV & Radio Stations', N'Commercial TV & Radio Stations', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (275, 4, 4, N'Communications/Electronics', N'Communications/Electronics', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (276, 4, 4, N'Computer Software', N'Computer Software', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (277, 4, 4, N'Conservative/Republican', N'Conservative/Republican', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (278, 4, 4, N'Construction', N'Construction', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (279, 4, 4, N'Construction Services', N'Construction Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (280, 4, 4, N'Construction Unions', N'Construction Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (281, 4, 4, N'Credit Unions', N'Credit Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (282, 4, 4, N'Crop Production & Basic Processing', N'Crop Production & Basic Processing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (283, 4, 4, N'Cruise Lines', N'Cruise Lines', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (284, 4, 4, N'Cruise Ships & Lines', N'Cruise Ships & Lines', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (285, 4, 4, N'Dairy', N'Dairy', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (286, 4, 4, N'Defense', N'Defense', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (287, 4, 4, N'Defense Aerospace', N'Defense Aerospace', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (288, 4, 4, N'Defense Electronics', N'Defense Electronics', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (289, 4, 4, N'Defense/Foreign Policy Advocates', N'Defense/Foreign Policy Advocates', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (290, 4, 4, N'Democratic Candidate Committees', N'Democratic Candidate Committees', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (291, 4, 4, N'Democratic Leadership PACs', N'Democratic Leadership PACs', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (292, 4, 4, N'Democratic/Liberal', N'Democratic/Liberal', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (293, 4, 4, N'Dentists', N'Dentists', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (294, 4, 4, N'Doctors & Other Health Professionals', N'Doctors & Other Health Professionals', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (295, 4, 4, N'Drug Manufacturers', N'Drug Manufacturers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (296, 4, 4, N'Education', N'Education', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (297, 4, 4, N'Electric Utilities', N'Electric Utilities', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (298, 4, 4, N'Electronics Manufacturing & Equipment', N'Electronics Manufacturing & Equipment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (299, 4, 4, N'Electronics, Defense Contractors', N'Electronics, Defense Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (300, 4, 4, N'Energy & Natural Resources', N'Energy & Natural Resources', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (301, 4, 4, N'Entertainment Industry', N'Entertainment Industry', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (302, 4, 4, N'Environment', N'Environment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (303, 4, 4, N'Farm Bureaus', N'Farm Bureaus', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (304, 4, 4, N'Farming', N'Farming', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (305, 4, 4, N'Finance / Credit Companies', N'Finance / Credit Companies', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (306, 4, 4, N'Finance, Insurance & Real Estate', N'Finance, Insurance & Real Estate', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (307, 4, 4, N'Food & Beverage', N'Food & Beverage', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (308, 4, 4, N'Food Processing & Sales', N'Food Processing & Sales', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (309, 4, 4, N'Food Products Manufacturing', N'Food Products Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (310, 4, 4, N'Food Stores', N'Food Stores', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (311, 4, 4, N'For-profit Education', N'For-profit Education', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (312, 4, 4, N'For-profit Prisons', N'For-profit Prisons', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (313, 4, 4, N'Foreign & Defense Policy', N'Foreign & Defense Policy', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (314, 4, 4, N'Forestry & Forest Products', N'Forestry & Forest Products', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (315, 4, 4, N'Foundations, Philanthropists ', N'Foundations, Philanthropists ', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (316, 4, 4, N'Funeral Services', N'Funeral Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (317, 4, 4, N'Gambling & Casinos', N'Gambling & Casinos', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (318, 4, 4, N'Gambling, Indian Casinos', N'Gambling, Indian Casinos', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (319, 4, 4, N'Garbage Collection/Waste', N'Garbage Collection/Waste', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (320, 4, 4, N'Gas & Oil', N'Gas & Oil', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (321, 4, 4, N'Gay & Lesbian Rights & Issues', N'Gay & Lesbian Rights & Issues', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (322, 4, 4, N'General Contractors', N'General Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (323, 4, 4, N'Government Employee Unions', N'Government Employee Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (324, 4, 4, N'Government Employees', N'Government Employees', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (325, 4, 4, N'Gun Control', N'Gun Control', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (326, 4, 4, N'Gun Rights', N'Gun Rights', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (327, 4, 4, N'Health', N'Health', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (328, 4, 4, N'Health Professionals', N'Health Professionals', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (329, 4, 4, N'Health Services/HMOs', N'Health Services/HMOs', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (330, 4, 4, N'Hedge Funds', N'Hedge Funds', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (331, 4, 4, N'HMOs & Health Care Services', N'HMOs & Health Care Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (332, 4, 4, N'Home Builders', N'Home Builders', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (333, 4, 4, N'Hospitals & Nursing Homes', N'Hospitals & Nursing Homes', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (334, 4, 4, N'Hotels, Motels & Tourism', N'Hotels, Motels & Tourism', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (335, 4, 4, N'Human Rights', N'Human Rights', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (336, 4, 4, N'Ideological/Single-Issue', N'Ideological/Single-Issue', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (337, 4, 4, N'Indian Gaming', N'Indian Gaming', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (338, 4, 4, N'Industrial Unions', N'Industrial Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (339, 4, 4, N'Insurance', N'Insurance', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (340, 4, 4, N'Internet', N'Internet', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (341, 4, 4, N'Labor', N'Labor', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (342, 4, 4, N'Lawyers & Lobbyists', N'Lawyers & Lobbyists', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (343, 4, 4, N'Lawyers / Law Firms', N'Lawyers / Law Firms', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (344, 4, 4, N'Leadership PACs', N'Leadership PACs', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (345, 4, 4, N'Liberal/Democratic', N'Liberal/Democratic', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (346, 4, 4, N'Liquor, Wine & Beer', N'Liquor, Wine & Beer', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (347, 4, 4, N'Livestock', N'Livestock', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (348, 4, 4, N'Lobbyists', N'Lobbyists', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (349, 4, 4, N'Lodging / Tourism', N'Lodging / Tourism', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (350, 4, 4, N'Logging, Timber & Paper Mills', N'Logging, Timber & Paper Mills', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (351, 4, 4, N'Manufacturing, Misc', N'Manufacturing, Misc', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (352, 4, 4, N'Marijuana', N'Marijuana', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (353, 4, 4, N'Marine Transport', N'Marine Transport', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (354, 4, 4, N'Meat processing & products', N'Meat processing & products', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (355, 4, 4, N'Medical Supplies', N'Medical Supplies', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (356, 4, 4, N'Mining', N'Mining', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (357, 4, 4, N'Misc Business', N'Misc Business', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (358, 4, 4, N'Misc Finance', N'Misc Finance', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (359, 4, 4, N'Misc Manufacturing & Distributing', N'Misc Manufacturing & Distributing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (360, 4, 4, N'Misc Unions', N'Misc Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (361, 4, 4, N'Miscellaneous Defense', N'Miscellaneous Defense', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (362, 4, 4, N'Miscellaneous Services', N'Miscellaneous Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (363, 4, 4, N'Mortgage Bankers & Brokers', N'Mortgage Bankers & Brokers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (364, 4, 4, N'Motion Picture Production & Distribution', N'Motion Picture Production & Distribution', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (365, 4, 4, N'Music Production', N'Music Production', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (366, 4, 4, N'Natural Gas Pipelines', N'Natural Gas Pipelines', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (367, 4, 4, N'Newspaper, Magazine & Book Publishing', N'Newspaper, Magazine & Book Publishing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (368, 4, 4, N'Non-profits, Foundations & Philanthropists', N'Non-profits, Foundations & Philanthropists', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (369, 4, 4, N'Nurses', N'Nurses', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (370, 4, 4, N'Nursing Homes/Hospitals', N'Nursing Homes/Hospitals', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (371, 4, 4, N'Nutritional & Dietary Supplements', N'Nutritional & Dietary Supplements', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (372, 4, 4, N'Oil & Gas', N'Oil & Gas', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (373, 4, 4, N'Other', N'Other', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (374, 4, 4, N'Payday Lenders', N'Payday Lenders', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (375, 4, 4, N'Pharmaceutical Manufacturing', N'Pharmaceutical Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (376, 4, 4, N'Pharmaceuticals / Health Products', N'Pharmaceuticals / Health Products', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (377, 4, 4, N'Phone Companies', N'Phone Companies', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (378, 4, 4, N'Physicians & Other Health Professionals', N'Physicians & Other Health Professionals', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (379, 4, 4, N'Postal Unions', N'Postal Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (380, 4, 4, N'Poultry & Eggs', N'Poultry & Eggs', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (381, 4, 4, N'Power Utilities', N'Power Utilities', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (382, 4, 4, N'Printing & Publishing', N'Printing & Publishing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (383, 4, 4, N'Private Equity & Investment Firms', N'Private Equity & Investment Firms', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (384, 4, 4, N'Pro-Israel', N'Pro-Israel', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (385, 4, 4, N'Professional Sports, Sports Arenas & Related Equipment & Services', N'Professional Sports, Sports Arenas & Related Equipment & Services', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (386, 4, 4, N'Progressive/Democratic', N'Progressive/Democratic', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (387, 4, 4, N'Public Employees', N'Public Employees', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (388, 4, 4, N'Public Sector Unions', N'Public Sector Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (389, 4, 4, N'Publishing & Printing', N'Publishing & Printing', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (390, 4, 4, N'Radio/TV Stations', N'Radio/TV Stations', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (391, 4, 4, N'Railroads', N'Railroads', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (392, 4, 4, N'Real Estate', N'Real Estate', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (393, 4, 4, N'Record Companies/Singers', N'Record Companies/Singers', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (394, 4, 4, N'Recorded Music & Music Production', N'Recorded Music & Music Production', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (395, 4, 4, N'Recreation / Live Entertainment', N'Recreation / Live Entertainment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (396, 4, 4, N'Religious Organizations/Clergy', N'Religious Organizations/Clergy', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (397, 4, 4, N'Republican Candidate Committees', N'Republican Candidate Committees', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (398, 4, 4, N'Republican Leadership PACs', N'Republican Leadership PACs', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (399, 4, 4, N'Republican/Conservative', N'Republican/Conservative', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (400, 4, 4, N'Residential Construction', N'Residential Construction', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (401, 4, 4, N'Restaurants & Drinking Establishments', N'Restaurants & Drinking Establishments', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (402, 4, 4, N'Retail Sales', N'Retail Sales', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (403, 4, 4, N'Retired', N'Retired', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (404, 4, 4, N'Savings & Loans', N'Savings & Loans', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (405, 4, 4, N'Schools/Education', N'Schools/Education', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (406, 4, 4, N'Sea Transport', N'Sea Transport', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (407, 4, 4, N'Securities & Investment', N'Securities & Investment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (408, 4, 4, N'Special Trade Contractors', N'Special Trade Contractors', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (409, 4, 4, N'Sports, Professional', N'Sports, Professional', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (410, 4, 4, N'Steel Production', N'Steel Production', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (411, 4, 4, N'Stock Brokers/Investment Industry', N'Stock Brokers/Investment Industry', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (412, 4, 4, N'Student Loan Companies', N'Student Loan Companies', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (413, 4, 4, N'Sugar Cane & Sugar Beets', N'Sugar Cane & Sugar Beets', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (414, 4, 4, N'Teachers Unions', N'Teachers Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (415, 4, 4, N'Teachers/Education', N'Teachers/Education', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (416, 4, 4, N'Telecom Services & Equipment', N'Telecom Services & Equipment', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (417, 4, 4, N'Telephone Utilities', N'Telephone Utilities', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (418, 4, 4, N'Textiles', N'Textiles', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (419, 4, 4, N'Timber, Logging & Paper Mills', N'Timber, Logging & Paper Mills', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (420, 4, 4, N'Tobacco', N'Tobacco', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (421, 4, 4, N'Transportation', N'Transportation', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (422, 4, 4, N'Transportation Unions', N'Transportation Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (423, 4, 4, N'Trash Collection/Waste Management', N'Trash Collection/Waste Management', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (424, 4, 4, N'Trucking', N'Trucking', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (425, 4, 4, N'TV / Movies / Music', N'TV / Movies / Music', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (426, 4, 4, N'TV Production', N'TV Production', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (427, 4, 4, N'Unions', N'Unions', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (428, 4, 4, N'Unions, Airline', N'Unions, Airline', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (429, 4, 4, N'Unions, Building Trades', N'Unions, Building Trades', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (430, 4, 4, N'Unions, Industrial', N'Unions, Industrial', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (431, 4, 4, N'Unions, Misc', N'Unions, Misc', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (432, 4, 4, N'Unions, Public Sector', N'Unions, Public Sector', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (433, 4, 4, N'Unions, Teacher', N'Unions, Teacher', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (434, 4, 4, N'Unions, Transportation', N'Unions, Transportation', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (435, 4, 4, N'Universities, Colleges & Schools', N'Universities, Colleges & Schools', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (436, 4, 4, N'Vegetables & Fruits', N'Vegetables & Fruits', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (437, 4, 4, N'Venture Capital', N'Venture Capital', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (438, 4, 4, N'Waste Management', N'Waste Management', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (439, 4, 4, N'Wine, Beer & Liquor', N'Wine, Beer & Liquor', NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Child] ([Id], [ParentId], [UserDefinedId], [Code], [Description], [CompanyId], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [OwnerId]) VALUES (440, 4, 4, N'Women''s Issues', N'Women''s Issues', NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Child] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (1, N'AF', N'AFGHANISTAN', N'Afghanistan', N'AFG', 4, 93)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (2, N'AL', N'ALBANIA', N'Albania', N'ALB', 8, 355)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (3, N'DZ', N'ALGERIA', N'Algeria', N'DZA', 12, 213)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (4, N'AS', N'AMERICAN SAMOA', N'American Samoa', N'ASM', 16, 1684)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (5, N'AD', N'ANDORRA', N'Andorra', N'AND', 20, 376)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (6, N'AO', N'ANGOLA', N'Angola', N'AGO', 24, 244)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (7, N'AI', N'ANGUILLA', N'Anguilla', N'AIA', 660, 1264)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (8, N'AQ', N'ANTARCTICA', N'Antarctica', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (9, N'AG', N'ANTIGUA AND BARBUDA', N'Antigua and Barbuda', N'ATG', 28, 1268)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (10, N'AR', N'ARGENTINA', N'Argentina', N'ARG', 32, 54)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (11, N'AM', N'ARMENIA', N'Armenia', N'ARM', 51, 374)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (12, N'AW', N'ARUBA', N'Aruba', N'ABW', 533, 297)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (13, N'AU', N'AUSTRALIA', N'Australia', N'AUS', 36, 61)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (14, N'AT', N'AUSTRIA', N'Austria', N'AUT', 40, 43)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (15, N'AZ', N'AZERBAIJAN', N'Azerbaijan', N'AZE', 31, 994)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (16, N'BS', N'BAHAMAS', N'Bahamas', N'BHS', 44, 1242)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (17, N'BH', N'BAHRAIN', N'Bahrain', N'BHR', 48, 973)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (18, N'BD', N'BANGLADESH', N'Bangladesh', N'BGD', 50, 880)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (19, N'BB', N'BARBADOS', N'Barbados', N'BRB', 52, 1246)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (20, N'BY', N'BELARUS', N'Belarus', N'BLR', 112, 375)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (21, N'BE', N'BELGIUM', N'Belgium', N'BEL', 56, 32)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (22, N'BZ', N'BELIZE', N'Belize', N'BLZ', 84, 501)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (23, N'BJ', N'BENIN', N'Benin', N'BEN', 204, 229)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (24, N'BM', N'BERMUDA', N'Bermuda', N'BMU', 60, 1441)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (25, N'BT', N'BHUTAN', N'Bhutan', N'BTN', 64, 975)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (26, N'BO', N'BOLIVIA', N'Bolivia', N'BOL', 68, 591)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (27, N'BA', N'BOSNIA AND HERZEGOVINA', N'Bosnia and Herzegovina', N'BIH', 70, 387)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (28, N'BW', N'BOTSWANA', N'Botswana', N'BWA', 72, 267)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (29, N'BV', N'BOUVET ISLAND', N'Bouvet Island', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (30, N'BR', N'BRAZIL', N'Brazil', N'BRA', 76, 55)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (31, N'IO', N'BRITISH INDIAN OCEAN TERRITORY', N'British Indian Ocean Territory', NULL, NULL, 246)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (32, N'BN', N'BRUNEI DARUSSALAM', N'Brunei Darussalam', N'BRN', 96, 673)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (33, N'BG', N'BULGARIA', N'Bulgaria', N'BGR', 100, 359)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (34, N'BF', N'BURKINA FASO', N'Burkina Faso', N'BFA', 854, 226)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (35, N'BI', N'BURUNDI', N'Burundi', N'BDI', 108, 257)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (36, N'KH', N'CAMBODIA', N'Cambodia', N'KHM', 116, 855)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (37, N'CM', N'CAMEROON', N'Cameroon', N'CMR', 120, 237)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (38, N'CA', N'CANADA', N'Canada', N'CAN', 124, 1)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (39, N'CV', N'CAPE VERDE', N'Cape Verde', N'CPV', 132, 238)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (40, N'KY', N'CAYMAN ISLANDS', N'Cayman Islands', N'CYM', 136, 1345)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (41, N'CF', N'CENTRAL AFRICAN REPUBLIC', N'Central African Republic', N'CAF', 140, 236)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (42, N'TD', N'CHAD', N'Chad', N'TCD', 148, 235)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (43, N'CL', N'CHILE', N'Chile', N'CHL', 152, 56)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (44, N'CN', N'CHINA', N'China', N'CHN', 156, 86)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (45, N'CX', N'CHRISTMAS ISLAND', N'Christmas Island', NULL, NULL, 61)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (46, N'CC', N'COCOS (KEELING) ISLANDS', N'Cocos (Keeling) Islands', NULL, NULL, 672)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (47, N'CO', N'COLOMBIA', N'Colombia', N'COL', 170, 57)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (48, N'KM', N'COMOROS', N'Comoros', N'COM', 174, 269)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (49, N'CG', N'CONGO', N'Congo', N'COG', 178, 242)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (50, N'CD', N'CONGO, THE DEMOCRATIC REPUBLIC OF THE', N'Congo, the Democratic Republic of the', N'COD', 180, 242)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (51, N'CK', N'COOK ISLANDS', N'Cook Islands', N'COK', 184, 682)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (52, N'CR', N'COSTA RICA', N'Costa Rica', N'CRI', 188, 506)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (53, N'CI', N'COTE D''IVOIRE', N'Cote D''Ivoire', N'CIV', 384, 225)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (54, N'HR', N'CROATIA', N'Croatia', N'HRV', 191, 385)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (55, N'CU', N'CUBA', N'Cuba', N'CUB', 192, 53)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (56, N'CY', N'CYPRUS', N'Cyprus', N'CYP', 196, 357)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (57, N'CZ', N'CZECH REPUBLIC', N'Czech Republic', N'CZE', 203, 420)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (58, N'DK', N'DENMARK', N'Denmark', N'DNK', 208, 45)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (59, N'DJ', N'DJIBOUTI', N'Djibouti', N'DJI', 262, 253)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (60, N'DM', N'DOMINICA', N'Dominica', N'DMA', 212, 1767)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (61, N'DO', N'DOMINICAN REPUBLIC', N'Dominican Republic', N'DOM', 214, 1809)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (62, N'EC', N'ECUADOR', N'Ecuador', N'ECU', 218, 593)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (63, N'EG', N'EGYPT', N'Egypt', N'EGY', 818, 20)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (64, N'SV', N'EL SALVADOR', N'El Salvador', N'SLV', 222, 503)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (65, N'GQ', N'EQUATORIAL GUINEA', N'Equatorial Guinea', N'GNQ', 226, 240)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (66, N'ER', N'ERITREA', N'Eritrea', N'ERI', 232, 291)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (67, N'EE', N'ESTONIA', N'Estonia', N'EST', 233, 372)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (68, N'ET', N'ETHIOPIA', N'Ethiopia', N'ETH', 231, 251)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (69, N'FK', N'FALKLAND ISLANDS (MALVINAS)', N'Falkland Islands (Malvinas)', N'FLK', 238, 500)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (70, N'FO', N'FAROE ISLANDS', N'Faroe Islands', N'FRO', 234, 298)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (71, N'FJ', N'FIJI', N'Fiji', N'FJI', 242, 679)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (72, N'FI', N'FINLAND', N'Finland', N'FIN', 246, 358)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (73, N'FR', N'FRANCE', N'France', N'FRA', 250, 33)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (74, N'GF', N'FRENCH GUIANA', N'French Guiana', N'GUF', 254, 594)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (75, N'PF', N'FRENCH POLYNESIA', N'French Polynesia', N'PYF', 258, 689)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (76, N'TF', N'FRENCH SOUTHERN TERRITORIES', N'French Southern Territories', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (77, N'GA', N'GABON', N'Gabon', N'GAB', 266, 241)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (78, N'GM', N'GAMBIA', N'Gambia', N'GMB', 270, 220)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (79, N'GE', N'GEORGIA', N'Georgia', N'GEO', 268, 995)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (80, N'DE', N'GERMANY', N'Germany', N'DEU', 276, 49)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (81, N'GH', N'GHANA', N'Ghana', N'GHA', 288, 233)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (82, N'GI', N'GIBRALTAR', N'Gibraltar', N'GIB', 292, 350)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (83, N'GR', N'GREECE', N'Greece', N'GRC', 300, 30)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (84, N'GL', N'GREENLAND', N'Greenland', N'GRL', 304, 299)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (85, N'GD', N'GRENADA', N'Grenada', N'GRD', 308, 1473)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (86, N'GP', N'GUADELOUPE', N'Guadeloupe', N'GLP', 312, 590)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (87, N'GU', N'GUAM', N'Guam', N'GUM', 316, 1671)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (88, N'GT', N'GUATEMALA', N'Guatemala', N'GTM', 320, 502)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (89, N'GN', N'GUINEA', N'Guinea', N'GIN', 324, 224)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (90, N'GW', N'GUINEA-BISSAU', N'Guinea-Bissau', N'GNB', 624, 245)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (91, N'GY', N'GUYANA', N'Guyana', N'GUY', 328, 592)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (92, N'HT', N'HAITI', N'Haiti', N'HTI', 332, 509)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (93, N'HM', N'HEARD ISLAND AND MCDONALD ISLANDS', N'Heard Island and Mcdonald Islands', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (94, N'VA', N'HOLY SEE (VATICAN CITY STATE)', N'Holy See (Vatican City State)', N'VAT', 336, 39)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (95, N'HN', N'HONDURAS', N'Honduras', N'HND', 340, 504)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (96, N'HK', N'HONG KONG', N'Hong Kong', N'HKG', 344, 852)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (97, N'HU', N'HUNGARY', N'Hungary', N'HUN', 348, 36)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (98, N'IS', N'ICELAND', N'Iceland', N'ISL', 352, 354)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (99, N'IN', N'INDIA', N'India', N'IND', 356, 91)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (100, N'ID', N'INDONESIA', N'Indonesia', N'IDN', 360, 62)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (101, N'IR', N'IRAN, ISLAMIC REPUBLIC OF', N'Iran, Islamic Republic of', N'IRN', 364, 98)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (102, N'IQ', N'IRAQ', N'Iraq', N'IRQ', 368, 964)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (103, N'IE', N'IRELAND', N'Ireland', N'IRL', 372, 353)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (104, N'IL', N'ISRAEL', N'Israel', N'ISR', 376, 972)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (105, N'IT', N'ITALY', N'Italy', N'ITA', 380, 39)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (106, N'JM', N'JAMAICA', N'Jamaica', N'JAM', 388, 1876)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (107, N'JP', N'JAPAN', N'Japan', N'JPN', 392, 81)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (108, N'JO', N'JORDAN', N'Jordan', N'JOR', 400, 962)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (109, N'KZ', N'KAZAKHSTAN', N'Kazakhstan', N'KAZ', 398, 7)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (110, N'KE', N'KENYA', N'Kenya', N'KEN', 404, 254)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (111, N'KI', N'KIRIBATI', N'Kiribati', N'KIR', 296, 686)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (112, N'KP', N'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', N'Korea, Democratic People''s Republic of', N'PRK', 408, 850)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (113, N'KR', N'KOREA, REPUBLIC OF', N'Korea, Republic of', N'KOR', 410, 82)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (114, N'KW', N'KUWAIT', N'Kuwait', N'KWT', 414, 965)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (115, N'KG', N'KYRGYZSTAN', N'Kyrgyzstan', N'KGZ', 417, 996)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (116, N'LA', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', N'Lao People''s Democratic Republic', N'LAO', 418, 856)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (117, N'LV', N'LATVIA', N'Latvia', N'LVA', 428, 371)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (118, N'LB', N'LEBANON', N'Lebanon', N'LBN', 422, 961)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (119, N'LS', N'LESOTHO', N'Lesotho', N'LSO', 426, 266)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (120, N'LR', N'LIBERIA', N'Liberia', N'LBR', 430, 231)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (121, N'LY', N'LIBYAN ARAB JAMAHIRIYA', N'Libyan Arab Jamahiriya', N'LBY', 434, 218)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (122, N'LI', N'LIECHTENSTEIN', N'Liechtenstein', N'LIE', 438, 423)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (123, N'LT', N'LITHUANIA', N'Lithuania', N'LTU', 440, 370)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (124, N'LU', N'LUXEMBOURG', N'Luxembourg', N'LUX', 442, 352)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (125, N'MO', N'MACAO', N'Macao', N'MAC', 446, 853)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (126, N'MK', N'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', N'Macedonia, the Former Yugoslav Republic of', N'MKD', 807, 389)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (127, N'MG', N'MADAGASCAR', N'Madagascar', N'MDG', 450, 261)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (128, N'MW', N'MALAWI', N'Malawi', N'MWI', 454, 265)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (129, N'MY', N'MALAYSIA', N'Malaysia', N'MYS', 458, 60)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (130, N'MV', N'MALDIVES', N'Maldives', N'MDV', 462, 960)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (131, N'ML', N'MALI', N'Mali', N'MLI', 466, 223)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (132, N'MT', N'MALTA', N'Malta', N'MLT', 470, 356)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (133, N'MH', N'MARSHALL ISLANDS', N'Marshall Islands', N'MHL', 584, 692)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (134, N'MQ', N'MARTINIQUE', N'Martinique', N'MTQ', 474, 596)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (135, N'MR', N'MAURITANIA', N'Mauritania', N'MRT', 478, 222)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (136, N'MU', N'MAURITIUS', N'Mauritius', N'MUS', 480, 230)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (137, N'YT', N'MAYOTTE', N'Mayotte', NULL, NULL, 269)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (138, N'MX', N'MEXICO', N'Mexico', N'MEX', 484, 52)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (139, N'FM', N'MICRONESIA, FEDERATED STATES OF', N'Micronesia, Federated States of', N'FSM', 583, 691)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (140, N'MD', N'MOLDOVA, REPUBLIC OF', N'Moldova, Republic of', N'MDA', 498, 373)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (141, N'MC', N'MONACO', N'Monaco', N'MCO', 492, 377)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (142, N'MN', N'MONGOLIA', N'Mongolia', N'MNG', 496, 976)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (143, N'MS', N'MONTSERRAT', N'Montserrat', N'MSR', 500, 1664)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (144, N'MA', N'MOROCCO', N'Morocco', N'MAR', 504, 212)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (145, N'MZ', N'MOZAMBIQUE', N'Mozambique', N'MOZ', 508, 258)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (146, N'MM', N'MYANMAR', N'Myanmar', N'MMR', 104, 95)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (147, N'NA', N'NAMIBIA', N'Namibia', N'NAM', 516, 264)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (148, N'NR', N'NAURU', N'Nauru', N'NRU', 520, 674)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (149, N'NP', N'NEPAL', N'Nepal', N'NPL', 524, 977)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (150, N'NL', N'NETHERLANDS', N'Netherlands', N'NLD', 528, 31)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (151, N'AN', N'NETHERLANDS ANTILLES', N'Netherlands Antilles', N'ANT', 530, 599)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (152, N'NC', N'NEW CALEDONIA', N'New Caledonia', N'NCL', 540, 687)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (153, N'NZ', N'NEW ZEALAND', N'New Zealand', N'NZL', 554, 64)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (154, N'NI', N'NICARAGUA', N'Nicaragua', N'NIC', 558, 505)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (155, N'NE', N'NIGER', N'Niger', N'NER', 562, 227)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (156, N'NG', N'NIGERIA', N'Nigeria', N'NGA', 566, 234)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (157, N'NU', N'NIUE', N'Niue', N'NIU', 570, 683)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (158, N'NF', N'NORFOLK ISLAND', N'Norfolk Island', N'NFK', 574, 672)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (159, N'MP', N'NORTHERN MARIANA ISLANDS', N'Northern Mariana Islands', N'MNP', 580, 1670)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (160, N'NO', N'NORWAY', N'Norway', N'NOR', 578, 47)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (161, N'OM', N'OMAN', N'Oman', N'OMN', 512, 968)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (162, N'PK', N'PAKISTAN', N'Pakistan', N'PAK', 586, 92)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (163, N'PW', N'PALAU', N'Palau', N'PLW', 585, 680)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (164, N'PS', N'PALESTINIAN TERRITORY, OCCUPIED', N'Palestinian Territory, Occupied', NULL, NULL, 970)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (165, N'PA', N'PANAMA', N'Panama', N'PAN', 591, 507)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (166, N'PG', N'PAPUA NEW GUINEA', N'Papua New Guinea', N'PNG', 598, 675)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (167, N'PY', N'PARAGUAY', N'Paraguay', N'PRY', 600, 595)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (168, N'PE', N'PERU', N'Peru', N'PER', 604, 51)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (169, N'PH', N'PHILIPPINES', N'Philippines', N'PHL', 608, 63)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (170, N'PN', N'PITCAIRN', N'Pitcairn', N'PCN', 612, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (171, N'PL', N'POLAND', N'Poland', N'POL', 616, 48)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (172, N'PT', N'PORTUGAL', N'Portugal', N'PRT', 620, 351)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (173, N'PR', N'PUERTO RICO', N'Puerto Rico', N'PRI', 630, 1787)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (174, N'QA', N'QATAR', N'Qatar', N'QAT', 634, 974)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (175, N'RE', N'REUNION', N'Reunion', N'REU', 638, 262)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (176, N'RO', N'ROMANIA', N'Romania', N'ROM', 642, 40)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (177, N'RU', N'RUSSIAN FEDERATION', N'Russian Federation', N'RUS', 643, 70)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (178, N'RW', N'RWANDA', N'Rwanda', N'RWA', 646, 250)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (179, N'SH', N'SAINT HELENA', N'Saint Helena', N'SHN', 654, 290)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (180, N'KN', N'SAINT KITTS AND NEVIS', N'Saint Kitts and Nevis', N'KNA', 659, 1869)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (181, N'LC', N'SAINT LUCIA', N'Saint Lucia', N'LCA', 662, 1758)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (182, N'PM', N'SAINT PIERRE AND MIQUELON', N'Saint Pierre and Miquelon', N'SPM', 666, 508)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (183, N'VC', N'SAINT VINCENT AND THE GRENADINES', N'Saint Vincent and the Grenadines', N'VCT', 670, 1784)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (184, N'WS', N'SAMOA', N'Samoa', N'WSM', 882, 684)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (185, N'SM', N'SAN MARINO', N'San Marino', N'SMR', 674, 378)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (186, N'ST', N'SAO TOME AND PRINCIPE', N'Sao Tome and Principe', N'STP', 678, 239)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (187, N'SA', N'SAUDI ARABIA', N'Saudi Arabia', N'SAU', 682, 966)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (188, N'SN', N'SENEGAL', N'Senegal', N'SEN', 686, 221)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (189, N'CS', N'SERBIA AND MONTENEGRO', N'Serbia and Montenegro', NULL, NULL, 381)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (190, N'SC', N'SEYCHELLES', N'Seychelles', N'SYC', 690, 248)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (191, N'SL', N'SIERRA LEONE', N'Sierra Leone', N'SLE', 694, 232)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (192, N'SG', N'SINGAPORE', N'Singapore', N'SGP', 702, 65)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (193, N'SK', N'SLOVAKIA', N'Slovakia', N'SVK', 703, 421)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (194, N'SI', N'SLOVENIA', N'Slovenia', N'SVN', 705, 386)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (195, N'SB', N'SOLOMON ISLANDS', N'Solomon Islands', N'SLB', 90, 677)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (196, N'SO', N'SOMALIA', N'Somalia', N'SOM', 706, 252)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (197, N'ZA', N'SOUTH AFRICA', N'South Africa', N'ZAF', 710, 27)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (198, N'GS', N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', N'South Georgia and the South Sandwich Islands', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (199, N'ES', N'SPAIN', N'Spain', N'ESP', 724, 34)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (200, N'LK', N'SRI LANKA', N'Sri Lanka', N'LKA', 144, 94)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (201, N'SD', N'SUDAN', N'Sudan', N'SDN', 736, 249)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (202, N'SR', N'SURINAME', N'Suriname', N'SUR', 740, 597)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (203, N'SJ', N'SVALBARD AND JAN MAYEN', N'Svalbard and Jan Mayen', N'SJM', 744, 47)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (204, N'SZ', N'SWAZILAND', N'Swaziland', N'SWZ', 748, 268)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (205, N'SE', N'SWEDEN', N'Sweden', N'SWE', 752, 46)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (206, N'CH', N'SWITZERLAND', N'Switzerland', N'CHE', 756, 41)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (207, N'SY', N'SYRIAN ARAB REPUBLIC', N'Syrian Arab Republic', N'SYR', 760, 963)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (208, N'TW', N'TAIWAN, PROVINCE OF CHINA', N'Taiwan, Province of China', N'TWN', 158, 886)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (209, N'TJ', N'TAJIKISTAN', N'Tajikistan', N'TJK', 762, 992)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (210, N'TZ', N'TANZANIA, UNITED REPUBLIC OF', N'Tanzania, United Republic of', N'TZA', 834, 255)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (211, N'TH', N'THAILAND', N'Thailand', N'THA', 764, 66)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (212, N'TL', N'TIMOR-LESTE', N'Timor-Leste', NULL, NULL, 670)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (213, N'TG', N'TOGO', N'Togo', N'TGO', 768, 228)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (214, N'TK', N'TOKELAU', N'Tokelau', N'TKL', 772, 690)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (215, N'TO', N'TONGA', N'Tonga', N'TON', 776, 676)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (216, N'TT', N'TRINIDAD AND TOBAGO', N'Trinidad and Tobago', N'TTO', 780, 1868)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (217, N'TN', N'TUNISIA', N'Tunisia', N'TUN', 788, 216)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (218, N'TR', N'TURKEY', N'Turkey', N'TUR', 792, 90)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (219, N'TM', N'TURKMENISTAN', N'Turkmenistan', N'TKM', 795, 7370)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (220, N'TC', N'TURKS AND CAICOS ISLANDS', N'Turks and Caicos Islands', N'TCA', 796, 1649)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (221, N'TV', N'TUVALU', N'Tuvalu', N'TUV', 798, 688)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (222, N'UG', N'UGANDA', N'Uganda', N'UGA', 800, 256)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (223, N'UA', N'UKRAINE', N'Ukraine', N'UKR', 804, 380)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (224, N'AE', N'UNITED ARAB EMIRATES', N'United Arab Emirates', N'ARE', 784, 971)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (225, N'GB', N'UNITED KINGDOM', N'United Kingdom', N'GBR', 826, 44)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (226, N'US', N'UNITED STATES', N'United States', N'USA', 840, 1)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (227, N'UM', N'UNITED STATES MINOR OUTLYING ISLANDS', N'United States Minor Outlying Islands', NULL, NULL, 1)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (228, N'UY', N'URUGUAY', N'Uruguay', N'URY', 858, 598)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (229, N'UZ', N'UZBEKISTAN', N'Uzbekistan', N'UZB', 860, 998)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (230, N'VU', N'VANUATU', N'Vanuatu', N'VUT', 548, 678)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (231, N'VE', N'VENEZUELA', N'Venezuela', N'VEN', 862, 58)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (232, N'VN', N'VIET NAM', N'Viet Nam', N'VNM', 704, 84)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (233, N'VG', N'VIRGIN ISLANDS, BRITISH', N'Virgin Islands, British', N'VGB', 92, 1284)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (234, N'VI', N'VIRGIN ISLANDS, U.S.', N'Virgin Islands, U.s.', N'VIR', 850, 1340)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (235, N'WF', N'WALLIS AND FUTUNA', N'Wallis and Futuna', N'WLF', 876, 681)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (236, N'EH', N'WESTERN SAHARA', N'Western Sahara', N'ESH', 732, 212)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (237, N'YE', N'YEMEN', N'Yemen', N'YEM', 887, 967)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (238, N'ZM', N'ZAMBIA', N'Zambia', N'ZMB', 894, 260)
GO
INSERT [dbo].[Country] ([Id], [iso], [name], [nicename], [iso3], [numcode], [phonecode]) VALUES (239, N'ZW', N'ZIMBABWE', N'Zimbabwe', N'ZWE', 716, 263)
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
INSERT [dbo].[GlobalID] ([ObjectID], [ItemID], [IDForYear], [IDForMonth], [IDForDate], [CurrentID]) VALUES (N'User', N'Id', 2022, NULL, NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[Master] ON 
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 1, N'01', N'Country', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 2, N'02', N'Currency', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 3, N'03', N'State', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 4, N'04', N'Contact Type', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 5, N'05', N'No Order Reason', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 6, N'06', N'Month', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 7, N'07', N'Ledger Code', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 8, N'08', N'Payment Mode', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Master] ([Id], [UserDefinedId], [Code], [Description], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 9, N'09', N'Category', 1, CAST(N'2018-01-31T00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Master] OFF
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'AK', N'ALASKA', CAST(0.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'AL', N'ALABAMA', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'AR', N'ARKANSAS', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'AZ', N'ARIZONA', CAST(5.600 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'CA', N'CALIFORNIA', CAST(7.250 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'CO', N'COLORADO', CAST(2.900 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'CT', N'CONNECTICUT', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'DC', N'DISTRICT OF COLUMBIA', CAST(5.750 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'DE', N'DELAWARE', CAST(0.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'FL', N'FLORIDA', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'GA', N'GEORGIA', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'HI', N'HAWAII', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'IA', N'IOWA', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'ID', N'IDAHO', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'IL', N'ILLINOIS', CAST(6.250 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'IN', N'INDIANA', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'KS', N'KANSAS', CAST(5.300 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'KY', N'KENTUCKY', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'LA', N'LOUISIANA', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MA', N'MASSACHUSETTS', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MD', N'MARYLAND', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'ME', N'MAINE', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MI', N'MICHIGAN', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MN', N'MINNESOTA', CAST(6.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MO', N'MISSOURI', CAST(4.225 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MS', N'MISSISSIPPI', CAST(7.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'MT', N'MONTANA', CAST(0.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NC', N'NORTH CAROLINA', CAST(4.250 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'ND', N'NORTH DAKOTA', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NE', N'NEBRASKA', CAST(5.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NH', N'NEW HAMPSHIRE', CAST(0.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NJ', N'NEW JERSEY', CAST(6.875 AS Numeric(6, 3)), N'Y', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NM', N'NEW MEXICO', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NV', N'NEVADA', CAST(6.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'NY', N'NEW YORK', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'OH', N'OHIO', CAST(5.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'OK', N'OKLAHOMA', CAST(4.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'OR', N'OREGON', CAST(0.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'PA', N'PENNSYLVANIA', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'RI', N'RHODE ISLAND', CAST(7.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'SC', N'SOUTH CAROLINA', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'SD', N'SOUTH DAKOTA', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'TN', N'TENNESSEE', CAST(7.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'TX', N'TEXAS', CAST(6.250 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'UT', N'UTAH', CAST(4.750 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'VA', N'VIRGINIA', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'VT', N'VERMONT', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'WA', N'WASHINGTON', CAST(6.500 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'WI', N'WISCONSIN', CAST(5.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'WV', N'WEST VIRGINIA', CAST(6.000 AS Numeric(6, 3)), N'N', NULL)
GO
INSERT [dbo].[States] ([STATE], [STATENAME], [SalesTaxRate], [FreightTaxable], [ShippingSurcharge]) VALUES (N'WY', N'WYOMING', CAST(4.000 AS Numeric(6, 3)), N'N', NULL)
GO
SET IDENTITY_INSERT [dbo].[UserLog_Data] ON 
GO
INSERT [dbo].[UserLog_Data] ([LogId], [SessionId], [UserId], [LoginDate], [Status], [LastUpdate]) VALUES (16, N'2s1rs5f0n2hlc2t5ilelesen', 2, CAST(N'2022-06-15T00:30:31.573' AS DateTime), 1, CAST(N'2022-06-15T00:30:31.573' AS DateTime))
GO
INSERT [dbo].[UserLog_Data] ([LogId], [SessionId], [UserId], [LoginDate], [Status], [LastUpdate]) VALUES (17, N'2s1rs5f0n2hlc2t5ilelesen', 2, CAST(N'2022-06-15T00:37:57.303' AS DateTime), 1, CAST(N'2022-06-15T00:37:57.303' AS DateTime))
GO
INSERT [dbo].[UserLog_Data] ([LogId], [SessionId], [UserId], [LoginDate], [Status], [LastUpdate]) VALUES (18, N'2s1rs5f0n2hlc2t5ilelesen', 2, CAST(N'2022-06-15T00:47:28.717' AS DateTime), 1, CAST(N'2022-06-15T00:47:28.717' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserLog_Data] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [Serial], [Password], [Email], [Phone], [PhoneVerifyCode], [FirstName], [MiddleName], [LastName], [ProfileLogo], [CompanyName], [CompanyLogo], [WorkPhone], [WorkPhoneExt], [Fax], [IsPhoneVerified], [IsNewUser], [IsAgree], [DoNotEmbedProfile], [DoNotEmbedCompany], [Address], [Address1], [Region], [Country], [State], [City], [Zip], [Other], [DatabaseName], [DatabaseLocation], [UserTypeContact], [IsAdmin], [IsDeleted], [IsActive], [CanLogin], [IsUserProfileComplete], [IsBillingComplete], [IsOverwrite], [Website], [Category], [YTD_Contact_Export_Limit], [YTD_Contact_Export], [MTD_Contact_Import], [MTD_Contact_Import_Limit], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [RefPhone], [Title], [TypeOfContact], [SubscriptionType], [SubscriptionExpiredOn], [StorageExpiredOn], [IsStorageSubscription], [LastImportedDate], [LastExportedDate], [Contact_Storage_Limit], [IsSentMail], [CountryCode], [Longitude], [Latitude], [IsEmailFlow], [EmailFlowCreatedOn]) VALUES (1, N'8801817708660', N'U00000000001', N'MTIz', N'aftabudduza@gmail.com', N'8801817708660', N'983353', N'Aftab', NULL, N'Udduza', N'U00000000001_P_IMG_20191121_232745.jpg', N'2RSolution', N'U00000000001_C_1.jpg', N'8801817708660', N'111', N'8801817708660', 1, 0, 1, 1, 1, N'100', N'100', N'Newark', N'US', N'ny', N'new york', N'19034', N'none', NULL, NULL, N'2', 1, 0, 1, 1, 1, 1, 1, NULL, NULL, N'250', N'11', N'1', N'10', N'8801817708660', CAST(N'2020-01-21T18:23:38.623' AS DateTime), N'8801817708660', CAST(N'2020-05-10T14:37:01.990' AS DateTime), NULL, N'Aftab', NULL, N'Basic', CAST(N'2021-05-10T00:45:13.563' AS DateTime), NULL, 0, CAST(N'2021-05-09T16:36:39.347' AS DateTime), CAST(N'2021-05-09T16:14:54.803' AS DateTime), N'500', 1, N'880', NULL, NULL, 0, CAST(N'2021-05-06T12:24:01.993' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([Id], [Username], [Serial], [Password], [Email], [Phone], [PhoneVerifyCode], [FirstName], [MiddleName], [LastName], [ProfileLogo], [CompanyName], [CompanyLogo], [WorkPhone], [WorkPhoneExt], [Fax], [IsPhoneVerified], [IsNewUser], [IsAgree], [DoNotEmbedProfile], [DoNotEmbedCompany], [Address], [Address1], [Region], [Country], [State], [City], [Zip], [Other], [DatabaseName], [DatabaseLocation], [UserTypeContact], [IsAdmin], [IsDeleted], [IsActive], [CanLogin], [IsUserProfileComplete], [IsBillingComplete], [IsOverwrite], [Website], [Category], [YTD_Contact_Export_Limit], [YTD_Contact_Export], [MTD_Contact_Import], [MTD_Contact_Import_Limit], [CreatedBy], [CreatedDate], [UpdatedBy], [UpdatedDate], [RefPhone], [Title], [TypeOfContact], [SubscriptionType], [SubscriptionExpiredOn], [StorageExpiredOn], [IsStorageSubscription], [LastImportedDate], [LastExportedDate], [Contact_Storage_Limit], [IsSentMail], [CountryCode], [Longitude], [Latitude], [IsEmailFlow], [EmailFlowCreatedOn]) VALUES (2, N'8801817708662', N'U00000000002', N'MTIz', N'aftabudduza@gmail.com', N'8801817708662', N'9451', N'Mohammad', NULL, N'Aftabudduza', NULL, N'A+', NULL, N'01817708662', NULL, NULL, 1, 0, 1, 0, 0, N'House: 187, First Floor, Prof. Ismail Bhaban, Road: 8, Block: B, Chandgaon Residential Area, Chandgaon', NULL, NULL, N'BD', NULL, NULL, NULL, N'', NULL, NULL, N'2', 0, 0, 1, 1, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'8801817708662', CAST(N'2022-06-14T00:46:26.450' AS DateTime), N'8801817708662', CAST(N'2022-06-15T00:41:46.483' AS DateTime), NULL, N'25', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, N'880', NULL, NULL, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 
GO
INSERT [dbo].[UserType] ([Id], [UserType], [UserDefineId]) VALUES (1, N'Admin', 1)
GO
INSERT [dbo].[UserType] ([Id], [UserType], [UserDefineId]) VALUES (8, N'Normal', 2)
GO
INSERT [dbo].[UserType] ([Id], [UserType], [UserDefineId]) VALUES (10, N'Dealer', 3)
GO
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[ContactInformation] ADD  CONSTRAINT [DF_ContactInformation_IsEmailFlow]  DEFAULT ((0)) FOR [IsEmailFlow]
GO
ALTER TABLE [dbo].[States] ADD  CONSTRAINT [DF_REFSTATES_STATE]  DEFAULT ('') FOR [STATE]
GO
ALTER TABLE [dbo].[States] ADD  CONSTRAINT [DF_REFSTATES_STATENAME]  DEFAULT ('') FOR [STATENAME]
GO
ALTER TABLE [dbo].[States] ADD  CONSTRAINT [DF_REFSTATES_FreightTaxable]  DEFAULT ('N') FOR [FreightTaxable]
GO
ALTER TABLE [dbo].[States] ADD  DEFAULT ((0)) FOR [ShippingSurcharge]
GO
ALTER TABLE [dbo].[UserLog_Data] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_HasSystemInfo]  DEFAULT ((0)) FOR [IsPhoneVerified]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_HasSystemInfo1]  DEFAULT ((0)) FOR [IsNewUser]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_HasSystemInfo3]  DEFAULT ((0)) FOR [IsAgree]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_HasContactProfile]  DEFAULT ((0)) FOR [DoNotEmbedProfile]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_HasPropertyLocation]  DEFAULT ((0)) FOR [DoNotEmbedCompany]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_CanLogin]  DEFAULT ((0)) FOR [CanLogin]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_IsStorageSubscription]  DEFAULT ((0)) FOR [IsStorageSubscription]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_IsAgree1]  DEFAULT ((0)) FOR [IsSentMail]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_IsSentMail1]  DEFAULT ((0)) FOR [IsEmailFlow]
GO
ALTER TABLE [dbo].[Version] ADD  CONSTRAINT [DF_Version_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Child]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Child_dbo.Master_MasterId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Master] ([Id])
GO
ALTER TABLE [dbo].[Child] CHECK CONSTRAINT [FK_dbo.Child_dbo.Master_MasterId]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetID]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetID]
	@ObjectID [varchar](255),
	@ItemID [varchar](255),
	@IDForYear [int] = NULL,
	@IDForMonth [int] = NULL,
	@IDForDate [datetime] = NULL,
	@NewID [int] = NULL OUTPUT
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON;

	IF @IDForDate IS NOT NULL
	  BEGIN
		--Current ID
		SELECT @NewID = CurrentID FROM GlobalID 
		WHERE ObjectID = @ObjectID AND ItemID = @ItemID AND 
		  IDForDate = @IDForDate AND IDForMonth IS NULL AND IDForYear IS NULL 

		--If not exist Set NewID=1 and Save in table
		IF @NewID IS NULL
	      BEGIN
			SET @NewID = 1
			INSERT INTO GlobalID(ObjectID, ItemID, IDForYear, IDForMonth, IDForDate, CurrentID)
			VALUES(@ObjectID, @ItemID, @IDForYear, @IDForMonth, @IDForDate, 2)
		  END
		ELSE
	      BEGIN
			UPDATE GlobalID SET CurrentID = CurrentID + 1
			WHERE ObjectID = @ObjectID AND ItemID = @ItemID AND 
			  IDForDate = @IDForDate AND IDForMonth IS NULL AND IDForYear IS NULL 
		  END

		SET NOCOUNT OFF;
		RETURN
	  END

	--Generate Squence Monthly
	IF @IDForMonth IS NOT NULL
	  BEGIN
		SELECT @NewID = CurrentID FROM GlobalID 
		WHERE ObjectID = @ObjectID AND ItemID = @ItemID AND 
		  IDForMonth = @IDForMonth AND IDForDate IS NULL AND IDForYear IS NULL 
		
		--If not exist Set NewID=1 and Save in table
		IF @NewID IS NULL
	      BEGIN
			SET @NewID = 1
			INSERT INTO GlobalID(ObjectID, ItemID, IDForYear, IDForMonth, IDForDate, CurrentID)
			VALUES(@ObjectID, @ItemID, @IDForYear, @IDForMonth, @IDForDate, 2)
		  END
		ELSE
	      BEGIN
			UPDATE GlobalID SET CurrentID = CurrentID + 1
			WHERE ObjectID = @ObjectID AND ItemID = @ItemID AND 
			  IDForMonth = @IDForMonth AND IDForDate IS NULL AND IDForYear IS NULL 
		  END

		SET NOCOUNT OFF;
		RETURN
	  END
	
	--Generate Squence Yearly
	declare @NewIdFromUnit int
	IF @IDForYear IS NOT NULL
	  BEGIN
	  
	 
	 
	--SELECT CONVERT(int, RIGHT ('1000000'+'5', 6))
		SELECT @NewID = CurrentID FROM GlobalID WHERE ObjectID = @ObjectID AND ItemID = @ItemID 

		--If not exist Set NewID=1 and Save in table
		IF @NewID IS NULL
	      BEGIN
			SET @NewID = 1
			INSERT INTO GlobalID(ObjectID, ItemID, IDForYear, IDForMonth, IDForDate, CurrentID)
			VALUES(@ObjectID, @ItemID, @IDForYear, @IDForMonth, @IDForDate, 2)
		  END
		ELSE
	      BEGIN
		   if(@ObjectID ='User')
				  begin	 
					set @NewIdFromUnit=( select isnull(CONVERT(int, RIGHT ('100000000000'+CONVERT(varchar,max(Serial)), 11)),0)   from dbo.userprofile )
					
					UPDATE GlobalID SET CurrentID = @NewIdFromUnit + 1	WHERE ObjectID = @ObjectID AND ItemID = @ItemID 
					
					set @NewID = @NewIdFromUnit + 1
				  end
		  else if(@ObjectID ='Dealer')
				  begin	 
					  set @NewIdFromUnit=( select isnull(CONVERT(int, RIGHT ('100000'+CONVERT(varchar,max(serialCode)), 5)),0)    from Dealer_SalesPartner)
					  
					  UPDATE GlobalID SET CurrentID = @NewIdFromUnit + 1 WHERE ObjectID = @ObjectID AND ItemID = @ItemID 
					  
					  set @NewID = @NewIdFromUnit + 1
				  end
		   else if(@ObjectID ='Billing')
				  begin	 
					   set @NewIdFromUnit=( select isnull(CONVERT(int, RIGHT ('100000000000'+CONVERT(varchar,max(Serial)), 11)),0)   from dbo.PaymentHistory)
					   
					   UPDATE GlobalID SET CurrentID = @NewIdFromUnit + 1 WHERE ObjectID = @ObjectID AND ItemID = @ItemID 
					   
					   set @NewID = @NewIdFromUnit + 1
				  end
		  else if(@ObjectID ='Account')
				  begin	 
				  set @NewIdFromUnit=( select isnull(CONVERT(int, RIGHT ('100000000000'+CONVERT(varchar,max(Serial)), 11)),0)   from dbo.FinancialTransaction )
				  UPDATE GlobalID SET CurrentID = @NewIdFromUnit + 1
						WHERE ObjectID = @ObjectID AND ItemID = @ItemID 
						  set @NewID = @NewIdFromUnit + 1
				  end
		  else 
				  begin
					  UPDATE GlobalID SET CurrentID = CurrentID + 1 WHERE ObjectID = @ObjectID AND ItemID = @ItemID  
				  end  

			
		  END

		SET NOCOUNT OFF;
		RETURN
	  END
	
	--Generate Squence
	IF @IDForDate IS NULL AND @IDForMonth IS NULL AND @IDForYear IS NULL
	  BEGIN
		SELECT @NewID = CurrentID FROM GlobalID 
		WHERE ObjectID = @ObjectID AND ItemID = @ItemID 

		--If not exist Set NewID=1 and Save in table
		IF @NewID IS NULL
		  BEGIN
			SET @NewID = 1
			INSERT INTO GlobalID(ObjectID, ItemID, IDForYear, IDForMonth, IDForDate, CurrentID)
			VALUES(@ObjectID, @ItemID, @IDForYear, @IDForMonth, @IDForDate, 2)
		  END
		ELSE
		  BEGIN
			UPDATE GlobalID SET CurrentID = CurrentID + 1
			WHERE ObjectID = @ObjectID AND ItemID = @ItemID 
		  END

		SET NOCOUNT OFF;
		RETURN
	  END

GO
/****** Object:  StoredProcedure [dbo].[usp_getPhoneNoByAutoComplete]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_getPhoneNoByAutoComplete]
	@autocompleteText [varchar](20),
	@GroupCodeFor [varchar](10)
WITH EXECUTE AS CALLER
AS
begin
if(@GroupCodeFor ='Dealer')
begin
select (Isnull(Phone,'') + ' - ' + Isnull(FirstName,'') + ' ' +  Isnull(LastName,'')) label, id  from UserProfile u where u.[UserTypeContact] = 3 and Phone like '%'+@autocompleteText+'%'
end
else
begin
select (Isnull(Phone,'') + ' - ' + Isnull(FirstName,'') + ' ' +  Isnull(LastName,'')) label,id   from UserProfile u where u.[UserTypeContact] <> 3 and Phone like '%'+@autocompleteText+'%'
end
end


GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateUserProfileEmailAndPassword]    Script Date: 6/16/2022 12:51:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateUserProfileEmailAndPassword]
	@Password [varchar](max),
	@Email [varchar](30),
	@MobileNo [varchar](30)
WITH EXECUTE AS CALLER
AS
begin
update UserProfile set Password=@Password, Email=@Email,UpdatedBy=@MobileNo,UpdatedDate=GETDATE() where Username=@MobileNo
end

GO
USE [master]
GO
ALTER DATABASE [NFC] SET  READ_WRITE 
GO
