SELECT * FROM Production.Product
SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory


SELECT p.Name,s.Name,c.Name
FROM Production.ProductSubcategory s, Production.ProductCategory c, Production.Product p
WHERE s.ProductCategoryID=c.ProductCategoryID AND s.ProductSubcategoryID=p.ProductSubcategoryID

--Hangi kategoride ka�ar tane alt kategori var

SELECT c.Name,COUNT(*) AS Adet
FROM Production.ProductSubcategory s, Production.ProductCategory c
WHERE s.ProductCategoryID=c.ProductCategoryID
GROUP BY c.Name

------------SELECT 
USE Calisma

SELECT * FROM Personel
SELECT * FROM Bolum
--E�le�en kay�tlar
SELECT p.Ad,P.Soyad,b.BolumAdi FROM Personel p, Bolum b
WHERE P.BolumID=b.BolumID
--E�le�meyen kay�tlar
SELECT p.Ad,P.Soyad,b.BolumAdi FROM Personel p FULL JOIN Bolum b
ON P.BolumID=b.BolumID
-- Query > Design Query in Editor > Add Table 
-- CTRL + SHIFT + Q
SELECT Ad,Soyad,BolumAdi
FROM     Bolum INNER JOIN
                  Personel ON Bolum.BolumID = Personel.BolumID

SELECT * FROM Bolum
INSERT INTO Bolum Values(4,'Arge') -- 4TE IK vard� , unique olmad�

--CONSTRAINTS (KISITLAR)
--Primary Key > Benzersiz olmal�, bir tabloda bir tane PK olabilir. (Compozit Key hari� - �zel bir durumdur
-- Bir PK de 2 tane bile�en oldu�unu g�sterir)
--Bir tabloda PK olu�tu�unda otomatik olarak CLUSTERED Index olu�turulur.
--IDENTITY ile PK ayn� �ey de�ildir.

--Foreign Key
-- Unique olmak zordunda de�ildir, bir tabloda birden fazla FK(Secondary Key) olabilir.
USE AdventureWorks2014
--query ile yazma 
SELECT Production.Product.Name, Production.ProductSubcategory.Name AS Expr1, Production.ProductCategory.Name AS Expr2
FROM     Production.ProductSubcategory INNER JOIN
                  Production.Product ON Production.ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID INNER JOIN
                  Production.ProductCategory ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
				  
USE Calisma
--Primary Key olu�turuldu�u zaman index olu�ur , FK de olu�maz
-------------------
--IDENTIY >	 otomatik saya�
--PK n�n ihtiyac� olan benzersiz de�erleri olu�turur.
DROP TABLE Bolum
DROP TABLE Personel

USE Calisma
--Kodla tablo olu�tururken ilk �nce yard�mc� tablolar olu�turulmal�d�r.

--Kod ile PK, FK ve IDENTITY olu�turma
CREATE TABLE Bolum(
					BolumID int IDENTITY PRIMARY KEY,
					BolumAdi varchar(50)
					)
CREATE TABLE Personel(
		PerID int PRIMARY KEY IDENTITY(100,5),
		                                                   --100den ba�la 5 er 5 er git
		Ad varchar(20),
		Soyad varchar(20),
		BolumID int REFERENCES Bolum(BolumID)
		)

INSERT INTO Bolum VALUES('Muhasebe'),('Sat��'),('BIM'),('IK')
INSERT INTO Personel VALUES('Cevdet','Korkmaz',1),('Selami','Dursun',2),('Dursun','Durmas�n',2),
('Cavit','Mavi',3),('Zafer','Mavi',4)

---Composite Key : Bir tabloda birden fazla alan�n bir araya gelerek bir PK olu�turmas�na denir.
-- Kullan�rken ID'nin Sonradan de�i�meyece�i konusu �nemlidir.