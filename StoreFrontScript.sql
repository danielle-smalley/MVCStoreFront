/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT IF EXISTS [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_StockStatuses]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[StockStatuses]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[StockStatuses]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[ProductCategories]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/27/2021 11:46:44 AM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DeptID] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DeptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmpID] [int] IDENTITY(1,1) NOT NULL,
	[DeptID] [int] NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[JobTitle] [varchar](50) NOT NULL,
	[HireDate] [date] NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[DirectReportID] [int] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Price] [money] NOT NULL,
	[ItemsPerUnit] [int] NOT NULL,
	[UnitsOnOrder] [int] NOT NULL,
	[UnitsSold] [int] NULL,
	[UnitsInStock] [int] NOT NULL,
	[StockStatusID] [int] NOT NULL,
	[Image] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[StockStatuses]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StockStatuses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StockStatuses](
	[StockStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockStatuses] PRIMARY KEY CLUSTERED 
(
	[StockStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 7/27/2021 11:46:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[UserID] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202106301603401_InitialCreate', N'MVCStoreFront.UI.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE4B8117D0F907F10F49404DE962F99C1C468EFC2DBB61323E30BA6ED41DE066C89DD1646A2B412E5B511EC97E5219F945F4851A26EBC4854B7DCDD5E2CB0708BC553C56215592C16E77FFFF9EFF4A79730B09E7192FA1139B38F2687B685891B793E599DD9195DFEF0C9FEE9C73FFE617AE9852FD6D792EE84D1414F929ED94F94C6A78E93BA4F3844E924F4DD244AA3259DB851E8202F728E0F0FFFE61C1D3918206CC0B2ACE9978C503FC4F90FF8398B888B639AA1E026F27090F2EFD032CF51AD5B14E234462E3EB36FBECEE6344AF05512113A79BC9E145D6CEB3CF0118833C7C1D2B61021114514843D7D4CF19C02F16A1EC307143CBCC618E8962848311FC4694D6E3A9EC363361EA7EE5842B9594AA37020E0D109579023765F4BCD76A54050E125A89ABEB251E76A3CB3AF3D9C7FFA1205A00091E1E92C48183168BA62719EC6B7984ECA8E9302F22A01B85FA3E4FBA489786019F73BA80CEA7872C8FE3BB0665940B3049F119CD1040507D67DB6087CF79FF8F521FA8EC9D9C9D16279F2E9C347E49D7CFC2B3EF9D01C298C15E85A1FE0D37D12C53801D9F0B21ABF6D39ED7E8ED8B1EAD6E85368056C097CC3B66ED0CB674C56F409BCE6F8936D5DF92FD82BBF70E37A243EB81274A249063F6FB320408B0057ED4E274FF6FF0EAEC71F3E8EC2F5163DFBAB7CEA05FEE03809F8D5171CE4ADE9931F17EED59AEF6F9C0CFC3164BFDBF655B47E9B4759E2B2C1445A920794AC306D4B37756AE33532690635BE5997A8FB6FDA4C52D9BC95A46C40EB7842C962DBDE50CAFBB67C8D2DEE3C8E61F272D3621AE93438F58E351120C0BA04C2DA888E4C8D88C0E07ECF6BE26588FC608445D1800B04254B3F097135CA9F2330414406CB7C8FD214D604EF1F287DEA101DFE1C41F43976B3044C754E5118BF39B7FBA788E0DB2C5C300FD81EAFD1A6E6E1D7E80AB9E0739784F5DA18EF73E47E8F327A49BC0B44F123754B40F6F3C10FCD014611E7DC75719A5E8131636F1641CC5D025E137A723C188EAD52BB0E4A6601F243755422ACA7DF4AD23A32515348D189864C15A17489FA395AF9C44CD492542F6A41D12B2A271B2A2A0333939453EA05CD097AE52CA8468BF9F2191A3FE8CB61F73FEADB6CF3D6AD050D35E651C9DF31C1092C63DE3DA21427A49E0193756317C1423E7D8CE99BEF4D39A7AF28C8C666B59637E48BC0F8DE90C3EEBF37E462C2E767DF635189C151A8240678237AF529ABDFE704C9B6ED0EAD616E9BF976D6009DBB9CA769E4FAB9172892603C85D1961F6238AB3F9F518C46CC89C0C0C0D07DB6E5C117189B2D1AD51DB9C001A6D83A778B24E10CA52EF26435C280BC0182953BAA42B03A37D216EE2F124FB0749CB04E881D8252F0549F50D92D7CE2FA310A7AB524F434DCC2D8D82B1E62CB058E31610C7B3561C25C9D0A6102547C8449E9D3D0D469585CB7216AA256DD9CF785B0F5BC4B198AADD8644FECACB14B1EBFBD8961766B6C0BC6D9AD121301B469BD5D18283FAB981A807870D93703154E4C1A03E521D5560CB4ADB11D18685B25EFCE408B23AAE9FC0BE7D57D33CFF64179FBDB7AA7BA76609B2D7DEC996916B127F4A1D00327B2795E2C58237EA18AC319C8C9CF67290F75451361E0734CDB299B3ADE55C6A14E378868445D80B5A1F580F20B41094872A801C295B9BC4EE978143100B6CCBB75C2F2B55F806DD8808CDDBC186D10EAAF4F45E3343A7D5423ABAC413272A3C34203476110E2E2D51EB88152747959593126B1F09068B831303E191D0AEA895C354A2A0733BA964AD3ECD7922A201B12926DA425217CD268A91CCCE85AE236DAAF24455030202CD84845ED2D7C24672B331DD56E53B54D9DA2688A7F983A9AEAAAE90D8A639FAC1AD556FC8B352F4AAD663FCC87971F850586E3A68A2AA44ADA8A138D12B4C2422BB00649AFFC24A51788A20562799E99174A64CABD55B3FC972C9BDBA73C89E53E5052B3BF8B1EBA6BFCD6862B47241CE80A8619B2B026C7501881BABBC54AE050801245FA7E16055948F45196BE777189D7EC5F7C9111A68E20BF1445492A9362DDB6FE8D6647F68C3167AA8A64D69F2D3D844EE7651CDAD4BA2E36D5A394A9AA268A2E7DB5B3D9D38534C3674C0C19874F582FC2DB7818AF536902F04F03311AA50E1258A3CD1CB55D8DD2C46CB798230A25274D48A1698094CDC2929690CD86B5F0341A55539873904B499AE872AB39B2A2A8A409AD685E035B21B3D8668EAAA83B69022B9ACDB1EB22147125DDE33D4C7B90D96C132B0EBC9BED621A8CB75916C7D9041BF7FA4DA0C6E78158FCE65E02E3DFF7D2A4B4A7BECD4CAA48766C66521A0CFD1AD4BA166F2F419D77F97ACCD65D776B99EFBAEBD7E30D33DC37350FE9E4279254DCAB13A070D29BF25357FF631BE9185690D856A946D8E25F538AC3092398CC7F0966818FD9825E12DC20E22F714A8BFA0EFBF8F0E85878AAB33FCF669C34F502C5A955F776A63D675B28D522CF28719F5022174E6CF0B4A4069572D2D7C4C32F67F6BFF35EA7797A83FD957F3EB0AED347E2FF9241C3439261EB37B910749C527B83C71D95A0BFBD8B5713E62ABFFED7B7A2EB817597803B9D5A8782A2D799FEF65B8A41D2145D379066ED1716EFD7DB5A8F1694A882B7ACFF4661E1D351DE279452FE29442F7F1E2A9AF20DC246888A770663E18DA242DD3B8275B0B46F083CF849F33704C306AB7E53B08E68DAF7043E190E26BE26305F86CA9E3BDC8714A7A66D2C49B99E7BABB1372ACDDCF5DE24156D6FE4E87261F600B8518BAF370B51DE5951F3685BA7A2667934EC5DDAFD9B172AEF4B6D721DB4EFB624799B55C81DF74BBFABE2E33D28975394FFECBEC478DBB6A64B03EF799DE6B042E23D3336BECDEFBE5C78DBC6A64B10EFB9B10D2A0ADE335BDBD5FEB9634B33DE42775EE22B572B69AE735459E4BE12DE22E50EC7FF450446504494C5CB4B75CD5857BD6B0FC39A44CF545FAC2632961C47E22B5174B31D3656BEE1770E96D374B3D5947876F1E6EB7F276F4ED3CD5B5338B98BE26365E9A2AA20BC671DEBAAA67A4FC5C6AD91F4D4B6F7C5AC9D77F3EFA9B67814A5B4BC4773BBFC7E4A894751C998AE33A07458BE2886BDB3F16F37C2FE9DFAAB1A82FD4B8E04BBAD5DB3A2B926CBA8DCBC05894A122143738329F2604B3D4FA8BF442E85669680CE9F8EE7493D760DB2C0DE35B9CB689C5118320E17412BE1C582802EFE797D745BE6E95DCC7EA5630C01C4F459E2FE8EFC9CF98157C97DA5C80969205874C1D3BD6C2E294BFBAE5E2BA4DB88180271F55541D1030EE300C0D23B3247CF781DD9C0FC3EE315725FEB0CA00EA47F22DA6A9F5EF86895A030E518757FF80936EC852F3FFE1F77CB26DFC2540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2d0dbae9-5575-4f24-abe9-66b63a8e08f8', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3e0a0658-0b34-406f-903b-f32150ced1a7', N'Admin')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4653ed26-d51f-46a0-982c-a596dbca4721', N'3e0a0658-0b34-406f-903b-f32150ced1a7')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'936fdade-1359-4a24-900e-29f9c7469a98', N'2d0dbae9-5575-4f24-abe9-66b63a8e08f8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c4151ede-262d-41cb-a9cd-f569b18cdf19', N'2d0dbae9-5575-4f24-abe9-66b63a8e08f8')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4653ed26-d51f-46a0-982c-a596dbca4721', N'admin@example.com', 0, N'ANRL14WGdTsrMqu6mWgrkCK1S1AtEP7f9QBx3c3bUioQbmVbClJtJ6Eiam9rIBccZw==', N'8c0eeaab-f3e5-40e2-bb80-91a53b6b4390', NULL, 0, 0, NULL, 0, 0, N'admin@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4c703f33-246b-4384-a475-57a95718fbc9', N'test@example.com', 0, N'AI8jXevBUC2WXTTVxqsDm2nlcHUj5GnuWlSdCTosI8fqdoOuFJBj07xrUd1g/QA4UA==', N'98774301-529e-489b-bb2b-fa289ce08c99', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'8c301af4-f597-4bc4-863b-23df93266414', N'test@example.com', 0, N'AK0YvPNzrbe0h1ghIn68WaeBJVqazIctDzCk/WlMmW5d2PSU+wKQtfRpHiMjOQkjVg==', N'a8cffd33-fa85-4396-a03a-ca6e32ce2075', NULL, 0, 0, NULL, 1, 0, N'test@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'936fdade-1359-4a24-900e-29f9c7469a98', N'user2@example.com', 0, N'APXGQJ6+FBUL7YnCZ6cWkChQXSMjqlVFRUoYby9yrgUMVLPvillRz0ib0HH1hyK4QQ==', N'8bd63027-93ac-42f3-a533-2aecf54d6051', NULL, 0, 0, NULL, 1, 0, N'user2@example.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ae5e4079-189a-4602-86ef-3c26a8d4c8de', N'test@test.com', 0, N'AAoPVGpvNALehY1K2NqBghQivWI0cawuihcSxReB/0/OcXydWTISnXiEUvpE/WSQIw==', N'260413de-80a3-46f9-96bd-355ef6d8fd04', NULL, 0, 0, NULL, 1, 0, N'test@test.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c4151ede-262d-41cb-a9cd-f569b18cdf19', N'user@example.com', 0, N'ANKxXxq1KDINy+PlEabd4oYoMQvvEQwAAIeB+bDYVujdu9ZJ1Ry8bYFToBv3dUV3uA==', N'2a6ec7b8-2414-4934-9be4-92d8bbbda8c8', NULL, 0, 0, NULL, 1, 0, N'user@example.com')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (1, N'Sales')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (2, N'HR')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (3, N'Operations')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (4, N'CustomerService')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (5, N'Purchasing')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (6, N'ShippingandReturns')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (7, N'Medical')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (8, N'IT')
INSERT [dbo].[Departments] ([DeptID], [DeptName]) VALUES (9, N'Executive')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (2, 9, N'Sherry', N'Cruz', N'CEO', CAST(N'2005-02-01' AS Date), N'111-11-1111', N'scruz@catstore.com', NULL)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (3, 9, N'Dwight', N'Cole', N'Vice President', CAST(N'2005-02-01' AS Date), N'222-22-2222', N'dcole@catstore.com', 2)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (4, 8, N'Faye', N'Watts', N'Web App Developer', CAST(N'2013-06-20' AS Date), N'333-33-3333', N'fwatts@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (5, 7, N'Derek', N'Rodriguez', N'Staff Veterinarian', CAST(N'2006-03-01' AS Date), N'444-44-4444', N'drodriguez@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (8, 6, N'Ora', N'Brock', N'Shipping Manager', CAST(N'2010-06-30' AS Date), N'555-55-5555', N'obrock@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (9, 6, N'Lamar', N'Powell', N'Returns Manager', CAST(N'2010-12-02' AS Date), N'666-66-6666', N'lpowell@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (10, 5, N'Kathy', N'Briggs', N'Purchasing Manager', CAST(N'2005-02-28' AS Date), N'777-77-7777', N'kbriggs@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (11, 4, N'Sadie', N'Thompson', N'Customer Service Manager', CAST(N'2008-04-18' AS Date), N'888-88-8888', N'sthompson@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (12, 3, N'Noel', N'Joseph', N'Operations Manager', CAST(N'2006-03-20' AS Date), N'999-99-9999', N'njoseph@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (13, 2, N'Leigh', N'Hopkins', N'HR Manager', CAST(N'2006-03-15' AS Date), N'101-22-3344', N'lhopkins@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (14, 1, N'Vivian', N'Flowers', N'Sales Lead', CAST(N'2007-06-01' AS Date), N'556-77-8899', N'vflowers@catstore.com', 3)
INSERT [dbo].[Employees] ([EmpID], [DeptID], [FirstName], [LastName], [JobTitle], [HireDate], [Phone], [Email], [DirectReportID]) VALUES (16, 1, N'Test', N'Test', N'Test', CAST(N'2021-01-01' AS Date), N'555-333-4444', N'test@testest.com', 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (1, N'Food')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (2, N'Collars Etc')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (3, N'Treats')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (4, N'Toys')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (5, N'Furniture')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (6, N'Litter Etc')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (7, N'Clothing')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (8, N'Medical')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (9, N'Cleaning')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (10, N'Grooming')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (11, N'Carriers/Crates')
INSERT [dbo].[ProductCategories] ([CategoryID], [CategoryName]) VALUES (12, N'Bowls Etc')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (1, N'Best Wet Cat Food', 1, N'The tastiest wet cat food money can buy', 9.9900, 12, 2000, 100000, 8000, 1, N'5a95c1aa-9a73-498f-8008-581986ce6d05.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (2, N'Best Dry Kibble 5lb Bag', 1, N'The tastiest kibble money can buy', 7.9900, 1, 3000, 160000, 9000, 1, N'92540fcb-625e-479a-8138-7a64a9f2ecfa.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (3, N'Purple Collar', 2, N'Basic purple cat collar', 5.9900, 1, 50, 2000, 300, 1, N'cb1ca9a7-18f5-439e-bc51-89a48ee581a1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (4, N'Leash and Harness', 2, N'A safe leash/harness combination to walk your cat with', 9.9900, 1, 20, 1800, 150, 1, N'84e1af37-526c-4544-b6ee-10aba80b90a5.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (5, N'Tasty Chicken Treats', 3, N'A 12oz bag of all natural chicken-flavored treats', 3.9900, 1, 450, 30000, 2000, 1, N'8cebc751-b715-44da-9c30-11a10e97c07f.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (7, N'Tasty Beef Treats', 3, N'A 12oz bag of cravable, all natural beef flavorited treats', 3.9900, 1, 400, 3000, 1800, 1, N'65fe640b-fbca-49d0-846b-b845f597b4a7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (8, N'Laser Pointer', 4, N'This displays the formidable red dot. Battery included!', 5.5000, 1, 200, 3000, 500, 1, N'2a6fce2e-dffe-4f59-9d12-25962a94d662.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (9, N'Yarn Ball', 4, N'A colorful ball of yarn', 3.5000, 1, 100, 500, 0, 3, N'1b1117fa-755d-432f-b457-8e231dbb8835.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (10, N'Cat Condo', 5, N'A tall cat condo with scratch areas and toys built in', 79.9900, 1, 50, 1500, 75, 1, N'6d1c67a9-1ef9-42df-bff2-f7a4cb9c9124.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (11, N'Plush Bed', 5, N'A luxuriously plushy cat bed', 32.9900, 1, 18, 800, 18, 2, N'9b255e82-b8f3-40c9-88c1-ad31dbb6eb06.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (15, N'Best Litter', 6, N'20 lbs of low dust litter for the chore we abhor', 12.9900, 1, 1000, 80000, 5000, 1, N'2e668149-cf6e-4407-b1bc-3f7833a094ee.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (16, N'Jumbo Litterbox', 6, N'Big litterbox with lid, for big kitties', 15.9900, 1, 550, 55000, 900, 1, N'c658c8b0-6740-40ae-998b-f0ac05e1e42f.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (17, N'Seal Costume', 7, N'Dress your furbaby as an adorable baby seal', 18.9900, 1, 15, 450, 15, 3, N'794920cc-8642-4ae9-a52e-684fa3981300.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (18, N'Banana Costume', 7, N'Dress your furbaby as a cute banana', 18.9900, 1, 22, 600, 30, 1, N'6df69400-ccc6-49ea-b4eb-d87f57ba5c97.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (19, N'Senior Cat Supplement - 30 capsules', 8, N'A month''s supply of this supplement for senior kitties to promote optimal health', 21.9900, 1, 30, 900, 150, 1, N'93b12beb-35e7-4560-b5b2-d6928444ed20.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (21, N'Flea and Tick Ointment', 8, N'A month''s supply of preventative flea and tick ointment safe for kittens and adult cats', 19.9900, 1, 45, 3500, 300, 1, N'30398602-bc61-436b-bf6b-a9ec87ea7383.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (22, N'Puppy Pads', 9, N'They''re for cats, too! Good for litterbox training', 19.9900, 60, 200, 5600, 400, 1, N'437941ae-721f-41be-b186-c932f739e114.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (23, N'Cleaning Wipes', 9, N'Cats are messy, you''ll definitely  need these! Container of 75 disinfecting wipes, safe for cats.', 4.9900, 1, 650, 20000, 2000, 1, N'5ba151c7-7d19-4240-a1e0-71e1fbfb1802.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (24, N'Nail Trimmer', 10, N'Safe for cats nail trimmer', 12.9900, 1, 400, 5000, 1050, 1, N'd80f3e6b-9a78-40e2-9e5b-64942166b87e.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (25, N'Cat Toothbrush', 10, N'A small toothbrush designed for cats teeth. Brush daily to prevent plaque build-up!', 6.9900, 1, 250, 4000, 300, 1, N'4f3a73dc-1d5a-489e-8d03-41ada060ee21.jpeg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (26, N'Kitten Carrier', 11, N'A small carrier, cozy for your kitten', 18.9900, 1, 300, 8000, 400, 1, N'8d3ea339-2f6b-4c19-b2a4-8b09801bc817.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (27, N'Adult Cat Carrier', 11, N'A large carrier, suitable for adult cats', 24.9900, 1, 400, 8000, 600, 1, N'8b982c97-56dc-4215-8b18-ab984d18c15b.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (28, N'Metal Bowl', 12, N'Stainless steel bowl, for food or water', 8.9900, 1, 5000, 100000, 8000, 1, N'08252737-0937-433f-872b-6e5f72395e31.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (29, N'Automatic Feeder', 12, N'An automatic feeder that locks when it''s not food time. Set on a timer for automatic feeding', 59.9900, 1, 350, 5000, 500, 1, N'14f8d6bf-cd84-4846-8170-55e7cb4a9a02.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (30, N'Water Fountain', 12, N'A solar powered water fountain that keeps their water circulating and fresh', 29.9900, 1, 300, 6000, 500, 1, N'0711829f-63f9-499a-9c64-487c6f3f1ff4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (31, N'Best Toy Ever', 4, N'The toy your cat loves most, most funnest toy ever', 10.9900, 1, 0, 150000, 0, 4, N'efcf9378-e91a-4b6c-aac6-91ebb1466ad2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Description], [Price], [ItemsPerUnit], [UnitsOnOrder], [UnitsSold], [UnitsInStock], [StockStatusID], [Image]) VALUES (34, N'Test5', 7, N'fdsafsa', 1.9900, 2, 2, 2, 4, 1, N'f45ac5ef-aa5c-4f5a-97b9-6da5a1419f26.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[StockStatuses] ON 

INSERT [dbo].[StockStatuses] ([StockStatusID], [Status]) VALUES (1, N'In Stock')
INSERT [dbo].[StockStatuses] ([StockStatusID], [Status]) VALUES (2, N'Out of Stock')
INSERT [dbo].[StockStatuses] ([StockStatusID], [Status]) VALUES (3, N'On Backorder')
INSERT [dbo].[StockStatuses] ([StockStatusID], [Status]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[StockStatuses] OFF
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'4c703f33-246b-4384-a475-57a95718fbc9', N'User', N'Name')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'8c301af4-f597-4bc4-863b-23df93266414', N'User', N'Name')
INSERT [dbo].[UserDetails] ([UserID], [FirstName], [LastName]) VALUES (N'ae5e4079-189a-4602-86ef-3c26a8d4c8de', N'test', N'test')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DeptID])
REFERENCES [dbo].[Departments] ([DeptID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[ProductCategories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_StockStatuses] FOREIGN KEY([StockStatusID])
REFERENCES [dbo].[StockStatuses] ([StockStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_StockStatuses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_StockStatuses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
