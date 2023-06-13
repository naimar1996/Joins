CREATE TABLE Countries(
ID int PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL UNIQUE,
Area decimal (8,2)
)
INSERT INTO Countries VALUES 
('Azerbaijan', 86000.00),
('Turkey', 450000.00),
('Germany',300000.00),
('England',210000)

SELECT * FROM Countries

CREATE TABLE Cities(
ID int PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL UNIQUE,
Area decimal (8,2),
CountryID int FOREIGN KEY REFERENCES Countries(ID)
)

INSERT INTO Cities VALUES
('Baku',2140.00,1),
('Ankara',24521.00,2),
('Berlin', 8918.00,3),
('London',1572.00,4)

SELECT * FROM Cities

CREATE TABLE People(
ID int PRIMARY KEY IDENTITY,
Name nvarchar(50) NOT NULL UNIQUE,
Surname nvarchar(50) NOT NULL,
PhoneNumber nvarchar(50) DEFAULT(+994000000000),
Emial nvarchar(50) NOT NULL UNIQUE,
Age int CHECK(Age > 18),
Gender nvarchar(50) NOT NULL,
HasCitizenship int FOREIGN KEY REFERENCES Countries(ID),
CityID int FOREIGN KEY REFERENCES Cities(ID)
)

INSERT INTO People VALUES 
('Naim','Rahimov',default,'naim.rehimov@gmail.com',27,'male',1,1),
('Burak','Özdemir',default,'burak.oz12@gmail.com',21,'male',2,2),
('Alis','Forleon',default,'aForleon.21.@gmail.com',34,'femail',3,3),
('Robert','Kooper',default,'kooper_32@gmail.com',19,'male',4,4)

SELECT * FROM People

SELECT p.Name AS 'People Name',p.Surname AS 'People Surname',c.Name AS 'Countries Name' FROM People  AS p
INNER JOIN Countries AS c
ON p.HasCitizenship = c.ID

SELECT p.Name AS 'People Name',p.Surname AS 'People Surname',ct.Name AS 'Cities Name' FROM People  AS p
INNER JOIN Cities AS ct
ON p.CityID = ct.ID

SELECT * FROM Countries
ORDER BY Area

SELECT * FROM Cities 
ORDER BY Name DESC

SELECT COUNT(*) FROM Countries
WHERE Area > 20000

SELECT * FROM Countries
UNION 
SELECT * FROM Cities 

SELECT ct.Name,COUNT(p.CityID) AS 'People Count' FROM Cities  AS ct
INNER JOIN People AS p
ON ct.ID = p.CityID
GROUP BY ct.Name

