/*
   Monday, March 6, 20179:16:22 PM
   User: sa
   Server: DESKTOP-INAKV7S
   Database: AP
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.[National]
	(
	national_Id nvarchar(50) NOT NULL,
	nationnal_Name nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.[National] ADD CONSTRAINT
	PK_National PRIMARY KEY CLUSTERED 
	(
	national_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.[National] SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.City
	(
	city_Id nvarchar(50) NOT NULL,
	national_Id nvarchar(50) NULL,
	city_Name nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.City ADD CONSTRAINT
	PK_City PRIMARY KEY CLUSTERED 
	(
	city_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.City ADD CONSTRAINT
	FK_City_National FOREIGN KEY
	(
	national_Id
	) REFERENCES dbo.[National]
	(
	national_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.City SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Route
	(
	route_Id nvarchar(50) NOT NULL,
	route nvarchar(50) NULL,
	from_City nvarchar(50) NULL,
	to_City nvarchar(50) NULL,
	duration nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Route ADD CONSTRAINT
	PK_Route PRIMARY KEY CLUSTERED 
	(
	route_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Route ADD CONSTRAINT
	FK_Route_City FOREIGN KEY
	(
	from_City
	) REFERENCES dbo.City
	(
	city_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Route SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Bus
	(
	bus_Id nvarchar(50) NOT NULL,
	route_Id nvarchar(50) NULL,
	departure_Date date NULL,
	departure_Time time(7) NULL,
	arrival_Date date NULL,
	arrival_Time time(7) NULL,
	fare nchar(10) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Bus ADD CONSTRAINT
	PK_Bus PRIMARY KEY CLUSTERED 
	(
	bus_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.Bus ADD CONSTRAINT
	FK_Bus_Route FOREIGN KEY
	(
	route_Id
	) REFERENCES dbo.Route
	(
	route_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Bus SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Booking
	(
	booking_Id nvarchar(50) NOT NULL,
	passenger_Name nvarchar(50) NOT NULL,
	booking_Closed bit NULL,
	booking_Date date NULL,
	bus_Id nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Booking ADD CONSTRAINT
	PK_Booking PRIMARY KEY CLUSTERED 
	(
	booking_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX IX_Booking ON dbo.Booking
	(
	booking_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Booking ADD CONSTRAINT
	FK_Booking_Bus FOREIGN KEY
	(
	bus_Id
	) REFERENCES dbo.Bus
	(
	bus_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Booking SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Passenger
	(
	passenger_Id nvarchar(50) NOT NULL,
	passenger_Name nvarchar(50) NOT NULL,
	national_Id nvarchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Passenger ADD CONSTRAINT
	PK_Passenger PRIMARY KEY CLUSTERED 
	(
	passenger_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
CREATE NONCLUSTERED INDEX IX_Passenger ON dbo.Passenger
	(
	passenger_Id
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.Passenger ADD CONSTRAINT
	FK_Passenger_National FOREIGN KEY
	(
	national_Id
	) REFERENCES dbo.[National]
	(
	national_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Passenger ADD CONSTRAINT
	FK_Passenger_Booking FOREIGN KEY
	(
	passenger_Name
	) REFERENCES dbo.Booking
	(
	booking_Id
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.Passenger SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
