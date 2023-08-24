-- ALL JOINS TESTING
CREATE DATABASE StuderendeInfo;

USE StuderendeInfo;

CREATE TABLE Studerende(
	StuderendeID INT,
	Navn VARCHAR(50),
	PRIMARY KEY(StuderendeID)
);

CREATE TABLE Kurser(
	KursurID INT,
	StuderendeID INT,
	KursurNavn VARCHAR(50),
	FOREIGN KEY(StuderendeID) REFERENCES Studerende(StuderendeID)
);

INSERT INTO Studerende(StuderendeID, Navn) VALUES(1, 'Anders');
INSERT INTO Studerende(StuderendeID, Navn) VALUES(2, 'Birgitte');
INSERT INTO Studerende(StuderendeID, Navn) VALUES(3, 'Carl');

INSERT INTO Kurser(KursurID, StuderendeID, KursurNavn)
VALUES
(101, 1, 'Matematik'),
(102, 2, 'Dansk'),
(103, 3, 'Historie');

UPDATE Kurser SET StuderendeID = 1 WHERE KursurID = 102; 

-- INNER JON
SELECT * FROM Studerende S INNER JOIN Kurser K ON S.StuderendeID = K.StuderendeID;

-- LEFT JOIN
SELECT * FROM Studerende S LEFT JOIN Kurser K ON S.StuderendeID = K.StuderendeID;

-- RIGHT JOIN
SELECT * FROM Studerende S RIGHT JOIN Kurser K ON S.StuderendeID = K.StuderendeID;

-- FULL JOIN
SELECT * FROM Studerende S FULL OUTER JOIN Kurser K ON S.StuderendeID = K.StuderendeID;

-- CROSS JOIN
SELECT * FROM Studerende CROSS JOIN Kurser;