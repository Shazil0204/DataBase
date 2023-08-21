CREATE DATABASE Influencerne;

USE Influencerne;

CREATE TABLE Influencerne(
	influencerID INT NOT NULL,
	Influencernename varchar(30),
	age tinyint,
	instagramFollowers INT,
	PRIMARY KEY (influencerID)
);

CREATE TABLE SocialMediaPlatforms(
	platformID INT,
	socialMediaPlatformName varchar(30),
	averageUserAge DECIMAL(3,1),
	totalUsers INT,
	PRIMARY KEY (platformID)
);

CREATE TABLE Brands(
	brandID INT,
	brandName varchar(50),
	category varchar(30),
	PRIMARY KEY (brandID)
);

CREATE TABLE collaborations(
	collaborationID INT,
	influencerID INT,
	brandID INT,
	platformID INT,
	duration TINYINT,
	payment FLOAT,
	FOREIGN KEY(influencerID) REFERENCES Influencerne (influencerID),
	FOREIGN KEY(brandID) REFERENCES Brands (brandID),
	FOREIGN KEY(platformID) REFERENCES SocialMediaPlatforms (platformID)
);

DROP TABLE collaborations;

-- INSERTING INTO Influencerne
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(1, 'Anna', 24, 50000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(2, 'Bent', 22, 20000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(3, 'Caroline', 26, 80000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(4, 'David', 28, 45000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(5, 'Ella', 30, 70000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(6, 'Frank', 27, 32000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(7, 'Grace', 29, 92000);
INSERT INTO Influencerne(influencerID, Influencernename, age, instagramFollowers) values(8, 'Henry', 31, 48000);
-- Check if Insert successfully
SELECT * FROM Influencerne;


--INSERTING INTO SocialMediaPlatforms
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(1, 'Instagram', 24.5, 1000000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(2, 'Tiktok', 18.5, 2000000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(3, 'YouTube', 28.5, 1500000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(4, 'Snapchat', 20.0, 800000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(5, 'Twitter', 27.5, 500000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(6, 'Facebook', 32.5, 2000000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(7, 'Pinterest', 29.0, 600000);
INSERT INTO SocialMediaPlatforms(platformID, socialMediaPlatformName, averageUserAge, totalUsers) values(8, 'Linkedin', 34.0, 400000);
-- Check if Insert successfully
SELECT * FROM SocialMediaPlatforms;


-- INSERTING INTO Brands
INSERT INTO Brands(brandID, brandName, category) values(1, 'FashionCo', 'fashion');
INSERT INTO Brands(brandID, brandName, category) values(2, 'BeautyBliss', 'beauty');
INSERT INTO Brands(brandID, brandName, category) values(3, 'TechTron', 'technology');
INSERT INTO Brands(brandID, brandName, category) values(4, 'GlamGlow', 'beauty');
INSERT INTO Brands(brandID, brandName, category) values(5, 'SportSpot', 'sports');
INSERT INTO Brands(brandID, brandName, category) values(6, 'EcbEssentials', 'lifestyle');
INSERT INTO Brands(brandID, brandName, category) values(7, 'TrendTech', 'technology');
INSERT INTO Brands(brandID, brandName, category) values(8, 'MystiqueMakeup', 'beauty');
-- Check if Insert successfully
SELECT * FROM Brands;


-- INSERTING INTO collaborations
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(1, 1, 1, 1, 30, 5000.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(2, 2, 3, 2, 10, 3000.50);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(3, 3, 2, 3, 20, 7500.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(4, 4, 4, 4, 15, 2500.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(5, 1, 2, 1, 25, 6000.50 );
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(6, 3, 1, 2, 40, 6500.75);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(7, 5, 5, 5, 45, 5300.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(8, 6, 6, 6, 20, 3500.25);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(9, 7, 7, 7, 115, 4700.50);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(10, 8, 8, 8, 25, 2900.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(11, 5, 7, 1, 30, 5100.75);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(12, 6, 5, 2, 40, 4400.00);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(13, 7, 6, 3, 35, 6500.25);
INSERT INTO collaborations(collaborationID, influencerID, brandID, platformID, duration, payment) VALUES(14, 8, 7, 4, 20, 7000.50);
-- Check if Insert successfully
SELECT * FROM collaborations;
