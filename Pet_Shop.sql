USE [PROG260FA22]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SuppliersByProduct'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SuppliersByProduct'
GO
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT [FK_Shipment_Supplier]
GO
ALTER TABLE [dbo].[Shipment] DROP CONSTRAINT [FK_Shipment_Product]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_EmployeeManager]
GO
ALTER TABLE [dbo].[Employee] DROP CONSTRAINT [FK_Employee_Employee_PIN]
GO
/****** Object:  View [dbo].[vw_SuppliersByProduct]    Script Date: 12/4/2022 10:27:21 PM ******/
DROP VIEW [dbo].[vw_SuppliersByProduct]
GO
/****** Object:  View [dbo].[vw_ProductsBySupplier]    Script Date: 12/4/2022 10:27:21 PM ******/
DROP VIEW [dbo].[vw_ProductsBySupplier]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 12/4/2022 10:27:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Shipment]') AND type in (N'U'))
DROP TABLE [dbo].[Shipment]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/4/2022 10:27:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Supplier]') AND type in (N'U'))
DROP TABLE [dbo].[Supplier]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/4/2022 10:27:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
DROP TABLE [dbo].[Product]
GO
/****** Object:  View [dbo].[vw_EmployeePIN]    Script Date: 12/4/2022 10:27:21 PM ******/
DROP VIEW [dbo].[vw_EmployeePIN]
GO
/****** Object:  Table [dbo].[Employee_PIN]    Script Date: 12/4/2022 10:27:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee_PIN]') AND type in (N'U'))
DROP TABLE [dbo].[Employee_PIN]
GO
/****** Object:  View [dbo].[vw_EmployeeManagers]    Script Date: 12/4/2022 10:27:21 PM ******/
DROP VIEW [dbo].[vw_EmployeeManagers]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/4/2022 10:27:21 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[manager_id] [int] NULL,
	[pin_id] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_EmployeeManagers]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_EmployeeManagers] AS
SELECT a.ID, a.name as 'Employee_Name', b.name as 'Manager_Name'
FROM Employee a
JOIN Employee b
ON a.manager_id = b.ID 


GO
/****** Object:  Table [dbo].[Employee_PIN]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_PIN](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PIN] [int] NOT NULL,
 CONSTRAINT [PK_Employee_PIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_EmployeePIN]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_EmployeePIN] AS
SELECT a.ID, a.name, b.PIN
FROM Employee a
JOIN Employee_PIN b
ON a.pin_id = b.ID
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipment]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ProductsBySupplier]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ProductsBySupplier] AS
SELECT b.name, STRING_AGG(c.name, ', ') as 'Products' 
FROM Shipment a
JOIN Supplier b
ON a.supplier_id = b.ID
JOIN Product c
ON a.product_id = c.ID
GROUP BY b.name
GO
/****** Object:  View [dbo].[vw_SuppliersByProduct]    Script Date: 12/4/2022 10:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SuppliersByProduct]
AS
SELECT        b.name, STRING_AGG(c.name, ', ') AS Suppliers
FROM            dbo.Shipment AS a INNER JOIN
                         dbo.Product AS b ON a.product_id = b.ID INNER JOIN
                         dbo.Supplier AS c ON a.supplier_id = c.ID
GROUP BY b.name
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (1, N'Jeff', 11, 6)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (2, N'Casey', NULL, 9)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (3, N'Eric', 5, 3)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (5, N'Sebastian', NULL, 4)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (6, N'Nick', 2, 2)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (7, N'Gavin', 11, 1)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (8, N'Kiyan', 2, 5)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (9, N'Joseph', 11, 10)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (10, N'Marco', 11, 8)
INSERT [dbo].[Employee] ([ID], [name], [manager_id], [pin_id]) VALUES (11, N'Duncan', NULL, 7)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee_PIN] ON 

INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (1, 1234)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (2, 5648)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (3, 3975)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (4, 3672)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (5, 3987)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (6, 9785)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (7, 4587)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (8, 3156)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (9, 1687)
INSERT [dbo].[Employee_PIN] ([ID], [PIN]) VALUES (10, 6666)
SET IDENTITY_INSERT [dbo].[Employee_PIN] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [name]) VALUES (1, N'Kibble')
INSERT [dbo].[Product] ([ID], [name]) VALUES (2, N'Fish Pellets')
INSERT [dbo].[Product] ([ID], [name]) VALUES (3, N'Canned Food')
INSERT [dbo].[Product] ([ID], [name]) VALUES (4, N'Crickets')
INSERT [dbo].[Product] ([ID], [name]) VALUES (5, N'Raw Diet')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipment] ON 

INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (1, 1, 1)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (2, 1, 2)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (3, 1, 3)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (4, 1, 5)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (5, 2, 1)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (6, 2, 5)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (7, 3, 4)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (8, 3, 2)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (9, 4, 2)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (10, 5, 5)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (11, 5, 1)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (12, 6, 1)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (13, 6, 5)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (14, 6, 3)
INSERT [dbo].[Shipment] ([ID], [supplier_id], [product_id]) VALUES (15, 7, 4)
SET IDENTITY_INSERT [dbo].[Shipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([ID], [name]) VALUES (1, N'PetMax')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (2, N'Fromms')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (3, N'JurassicFeed')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (4, N'AquaWorld')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (5, N'Blue')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (6, N'Golds')
INSERT [dbo].[Supplier] ([ID], [name]) VALUES (7, N'HerpMax')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Employee_PIN] FOREIGN KEY([pin_id])
REFERENCES [dbo].[Employee_PIN] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Employee_PIN]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeManager] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_EmployeeManager]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Product]
GO
ALTER TABLE [dbo].[Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Supplier] FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[Shipment] CHECK CONSTRAINT [FK_Shipment_Supplier]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 102
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 102
               Left = 262
               Bottom = 198
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SuppliersByProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SuppliersByProduct'
GO
