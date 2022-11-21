SELECT * FROM Production.Product
SELECT * FROM Production.ProductCategory
SELECT * FROM Production.ProductSubcategory


SELECT p.Name,s.Name,c.Name
FROM Production.ProductSubcategory s, Production.ProductCategory c, Production.Product p
WHERE s.ProductCategoryID=c.ProductCategoryID AND s.ProductSubcategoryID=p.ProductSubcategoryID

--Hangi kategoride kaçar tane alt kategori var

SELECT c.Name,COUNT(*) AS Adet
FROM Production.ProductSubcategory s, Production.ProductCategory c
WHERE s.ProductCategoryID=c.ProductCategoryID
GROUP BY c.Name

------------SELECT 
USE Calisma

SELECT * FROM Personel
SELECT * FROM Bolum
--Eþleþen kayýtlar
SELECT p.Ad,P.Soyad,b.BolumAdi FROM Personel p, Bolum b
WHERE P.BolumID=b.BolumID
--Eþleþmeyen kayýtlar
SELECT p.Ad,P.Soyad,b.BolumAdi FROM Personel p FULL JOIN Bolum b
ON P.BolumID=b.BolumID
-- Query > Design Query in Editor > Add Table 
-- CTRL + SHIFT + Q
SELECT Ad,Soyad,BolumAdi
FROM     Bolum INNER JOIN
                  Personel ON Bolum.BolumID = Personel.BolumID

SELECT * FROM Bolum
INSERT INTO Bolum Values(4,'Arge') -- 4TE IK vardý , unique olmadý

--CONSTRAINTS (KISITLAR)
--Primary Key > Benzersiz olmalý, bir tabloda bir tane PK olabilir. (Compozit Key hariç - Özel bir durumdur
-- Bir PK de 2 tane bileþen olduðunu gösterir)
--Bir tabloda PK oluþtuðunda otomatik olarak CLUSTERED Index oluþturulur.
--IDENTITY ile PK ayný þey deðildir.

--Foreign Key
-- Unique olmak zordunda deðildir, bir tabloda birden fazla FK(Secondary Key) olabilir.
USE AdventureWorks2014
--query ile yazma 
SELECT Production.Product.Name, Production.ProductSubcategory.Name AS Expr1, Production.ProductCategory.Name AS Expr2
FROM     Production.ProductSubcategory INNER JOIN
                  Production.Product ON Production.ProductSubcategory.ProductSubcategoryID = Production.Product.ProductSubcategoryID INNER JOIN
                  Production.ProductCategory ON Production.ProductSubcategory.ProductCategoryID = Production.ProductCategory.ProductCategoryID
				  
USE Calisma
--Primary Key oluþturulduðu zaman index oluþur , FK de oluþmaz
-------------------
--IDENTIY >	 otomatik sayaç
--PK nýn ihtiyacý olan benzersiz deðerleri oluþturur.
DROP TABLE Bolum
DROP TABLE Personel

USE Calisma
--Kodla tablo oluþtururken ilk önce yardýmcý tablolar oluþturulmalýdýr.

--Kod ile PK, FK ve IDENTITY oluþturma
CREATE TABLE Bolum(
					BolumID int IDENTITY PRIMARY KEY,
					BolumAdi varchar(50)
					)
CREATE TABLE Personel(
		PerID int PRIMARY KEY IDENTITY(100,5),
		                                                   --100den baþla 5 er 5 er git
		Ad varchar(20),
		Soyad varchar(20),
		BolumID int REFERENCES Bolum(BolumID)
		)

INSERT INTO Bolum VALUES('Muhasebe'),('Satýþ'),('BIM'),('IK')
INSERT INTO Personel VALUES('Cevdet','Korkmaz',1),('Selami','Dursun',2),('Dursun','Durmasýn',2),
('Cavit','Mavi',3),('Zafer','Mavi',4)

---Composite Key : Bir tabloda birden fazla alanýn bir araya gelerek bir PK oluþturmasýna denir.
-- Kullanýrken ID'nin Sonradan deðiþmeyeceði konusu önemlidir.