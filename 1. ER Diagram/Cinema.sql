-- DATABASE Cinema
CREATE DATABASE DBCinema;

USE DBCinema;

-- Cinemas
CREATE TABLE Cinemas(
	Cinema_ID INT NOT NULL,
	Cinema_Name VARCHAR(50) NOT NULL,
	Cinema_Address VARCHAR(50) NOT NULL,
	Total_Cinema_Hall INT NOT NULL,
	PRIMARY KEY (Cinema_ID)
);

-- Cinema_Halls
CREATE TABLE Cinema_Halls(
	Cinema_Hall_ID INT NOT NULL,
	Cinema_ID INT NOT NULL,
	Seat INT NOT NULL,
	PRIMARY KEY (Cinema_Hall_ID)
	-- FOREIGN KEY (Cinema_ID) REFERENCES Cinema (Cinema_ID)
);

-- Viewers
CREATE TABLE Viewers(
	Viewer_ID INT NOT NULL,
	Cinema_Hall_ID INT NOT NULL,
	Total_Viewer INT NOT NULL,
	PRIMARY KEY (Viewer_ID)
	-- FOREIGN key (Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID)
);

-- Films
CREATE TABLE Films(
	Film_ID INT NOT NULL,
	Title VARCHAR(50) NOT NULL,
	Cinema_Hall_ID INT NOT NULL,
	Release_Date DATE,
	Genre VARCHAR(50) NOT NULL,
	FIlm_Length INT NOT NULL,
	Ticket_ID INT NOT NULL,
	PRIMARY key (Film_ID)
	-- FOREIGN key (Ticket_ID) REFERENCES Tickets (Ticket_ID)
);

-- Directors
CREATE TABLE Directors(
	Director_ID INT NOT NULL,
	Director_Name VARCHAR(50) NOT NULL,
	Film_ID INT NOT NULL,
	PRIMARY KEY (Director_ID)
	-- FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID)
);

-- Actors
CREATE TABLE Actors(
	Actor_ID INT NOT NULL,
	Actor_Name VARCHAR(50) NOT NULL,
	PRIMARY KEY (Actor_ID)
);

-- Tickets
CREATE TABLE Tickets(
	Ticket_ID INT NOT NULL,
	Cinema_ID INT NOT NULL,
	Price INT NOT NULL,
	PRIMARY KEY (Ticket_ID)
	-- FOREIGN KEY () REFERENCES Cinemas (Cinema_ID)
);

-- Participants
CREATE TABLE Participants(
	Participant_ID INT NOT NULL,
	Participant_Name VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Ticket_ID INT NOT NULL,
	PRIMARY KEY (Participant_ID)
	-- FOREIGN KEY (Ticket_ID) REFERENCES Tickets (Ticket_ID)
);

-- Cinema_Hall_Films
CREATE TABLE Cinema_Hall_Films(
	Cinema_Hall_Film_ID INT NOT NULL,
	Cinema_Hall_ID INT NOT NULL,
	Film_ID INT NOT NULL,
	PRIMARY KEY (Cinema_Hall_Film_ID)
	-- FOREIGN KEY (Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID),
	-- FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID)
);
-- Cinema_Ticket
CREATE TABLE Cinema_Ticket(
	Cinema_Ticket_ID INT NOT NULL,
	Cinema_ID INT NOT NULL,
	Ticket_ID INT NOT NULL,
	PRIMARY KEY (Cinema_Ticket_ID)
	-- FOREIGN KEY (Cinema_ID) REFERENCES Cinemas (Cinema_ID),
	-- FOREIGN KEY (Ticket_ID) REFERENCES Tickets (Ticket_ID)
);

-- Film_Actor
CREATE TABLE Film_Actor(
	Film_Actor_ID INT NOT NULL,
	Actor_ID INT NOT NULL,
	Film_ID INT NOT NULL,
	PRIMARY KEY (Film_Actor_ID)
	-- FOREIGN KEY (Actor_ID) REFERENCES Actors (Actor_ID),
	-- FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID)
);

-- Film_Director
CREATE TABLE Film_Director(
	Film_Director_ID INT NOT NULL,
	Film_ID INT NOT NULL,
	Director_ID INT NOT NULL,
	PRIMARY KEY (Film_Director_ID)
	-- FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID),
	-- FOREIGN key (Director_ID) REFERENCES Directors (Director_ID) 
);

-- All my alters code are here

-- Cinema_Halls
ALTER TABLE Cinema_Halls ADD FOREIGN KEY (Cinema_ID) REFERENCES Cinemas (Cinema_ID);

-- Viewers
ALTER TABLE Viewers ADD FOREIGN key (Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID);

-- Films
ALTER TABLE Films ADD FOREIGN key (Ticket_ID) REFERENCES Tickets (Ticket_ID);

-- Directors
ALTER TABLE Directors ADD FOREIGN KEY (Film_ID) REFERENCES Films(Film_ID);

-- Tickets
ALTER TABLE Tickets ADD FOREIGN KEY (Cinema_ID) REFERENCES Cinemas (Cinema_ID);

-- Participants
ALTER TABLE Participants ADD FOREIGN KEY (Ticket_ID) REFERENCES Tickets (Ticket_ID);

-- Cinema_Hall_Films
ALTER TABLE Cinema_Hall_Films ADD FOREIGN KEY (Cinema_Hall_ID) REFERENCES Cinema_Halls (Cinema_Hall_ID);
ALTER TABLE Cinema_Hall_Films ADD FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID);

-- Cinema_Ticket
ALTER TABLE Cinema_Ticket ADD FOREIGN KEY (Cinema_ID) REFERENCES Cinemas (Cinema_ID);
ALTER TABLE Cinema_Ticket ADD FOREIGN KEY (Ticket_ID) REFERENCES Tickets (Ticket_ID);

-- Film_Actor
ALTER TABLE Film_Actor ADD FOREIGN KEY (Actor_ID) REFERENCES Actors (Actor_ID);
ALTER TABLE Film_Actor ADD FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID);

-- Film_Director
ALTER TABLE Film_Director ADD FOREIGN KEY (Film_ID) REFERENCES Films (Film_ID);
ALTER TABLE Film_Director ADD FOREIGN key (Director_ID) REFERENCES Directors (Director_ID);

-- INSERTING data

INSERT INTO Viewers(Viewer_ID, Cinema_Hall_ID, Total_Viewer) VALUES
(1, 1, 650),
(2, 2, 375),
(3, 3, 950),
(4, 4, 700),
(5, 4, 800)

INSERT INTO Cinema_Halls(Cinema_Hall_ID, Cinema_ID, Seat) VALUES
(1, 3, 200),
(2, 1, 150),
(3, 4, 150),
(4, 3, 250),
(5, 2, 300)

INSERT INTO Cinema_Hall_Films(Cinema_Hall_Film_ID, Cinema_Hall_ID, Film_ID) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 2, 3),
(4, 4, 3),
(5, 5, 5)

INSERT INTO Cinemas(Cinema_ID, Cinema_Name, Cinema_Address, Total_Cinema_Hall) VALUES
(1, 'Panorama', 'Nattergalevej 3 4200', 5),
(2, 'Movie house', 'valmuemarken 3 4200', 4),
(3, 'ZBC', 'ahorn alle 3-5 4100', 7),
(4, 'MikkelsBio', 'MikkelGade 69 6900', 3),
(5, 'KrisMovies', 'KrisGade 43 1242', 4)

INSERT INTO Cinema_Ticket(Cinema_Ticket_ID, Cinema_ID, Ticket_ID) VALUES
(1, 1, 56),
(2, 2, 23),
(3, 3, 54),
(4, 4, 29),
(5, 5, 75)

INSERT INTO Tickets(Ticket_ID, Cinema_ID, Price) VALUES
(56, 1, 100),
(23, 2, 110),
(54, 3, 100),
(29, 4, 200),
(75, 5, 150)

INSERT INTO Participants(Participant_ID, Participant_Name, Email, Ticket_ID) VALUES
(1, 'Lucas', 'LucasWithGlasses@gmail.com', 56),
(2, 'Emre', 'EmreLikesFaxeKondi@hotmail.com', 23),
(3, 'Robert', 'RobertTattoo@outlook.com', 54),
(4, 'Rune', 'RuneTheGreat@zbc.dk', 29),
(5, 'Rasmus', 'RasmusGreatSmile@yahoo.com', 75)

INSERT INTO Films(Film_ID, Title, Cinema_Hall_ID, Release_Date, Genre, FIlm_Length, Ticket_ID) VALUES
(1, 'Return of the ooga booga', 1, '2023-08-23', 'Horror', 123, 56),
(2, 'Yordan attacks', 2, '2005-01-19', 'Horror', 110, 23),
(3, 'Jonas the handsome', 4, '2004-11-06', 'Drama', 69, 54),
(4, 'Shazil the terrorist', 3, '2004-01-23', 'Comedy', 90, 29),
(5, 'Magnus and the beast', 5, '2004-08-14', 'Horror', 100, 75)

INSERT INTO Actors(Actor_ID, Actor_Name) VALUES
(1, 'Robert De Niro'),
(2, 'Jack Nicholson'),
(3, 'Marlon Brando'),
(4, 'Denzel Washington'),
(5, 'Katharine Hepburn')

INSERT INTO Film_Actor(Film_Actor_ID, Actor_ID, Film_ID) VALUES
(1, 2, 1),
(2, 4, 2),
(3, 5, 3),
(4, 1, 4),
(5, 1, 4),
(6, 3, 5)

INSERT INTO Directors(Director_ID, Director_Name, Film_ID) VALUES
(1, 'Mikkel', 1),
(2, 'Yordan', 2),
(3, 'Jonas', 3),
(4, 'Shazil', 4),
(5, 'Magnus', 5)

INSERT INTO Film_Director(Film_Director_ID, Film_ID, Director_ID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5)