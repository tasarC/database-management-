CREATE DATABASE Kitapcý
USE Kitapcý
CREATE TABLE kitaplar (
ISBN_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
fiyat NVARCHAR(10) NOT NULL,
kitp_ism NVARCHAR(20) NOT NULL,
yayin_tarihi datetime NOT NULL
)

CREATE TABLE yazarlar (
yazr_id int IDENTITY(1,1) NOT NULL primary key,
Yazar_ismi NVARCHAR(20) NOT NULL,
adresi NVARCHAR(20) NOT NULL,
tel NVARCHAR(11) not null
)

CREATE TABLE müsteriler (
müþtr_id int IDENTITY(1,1) not null primary key,
Müþteri_ismi NVARCHAR(10) not null,
adres NVARCHAR(20) not null, 
telefon NVARCHAR(10) not null,
e_mail NVARCHAR(15) not null
)
CREATE TABLE depolar(
depo_kod int NOT NULL PRIMARY KEY, 
depo_nmr NVARCHAR(20) not null, 
stok NVARCHAR(20) not null, 
depo_adres NVARCHAR(20) not null,
)
CREATE TABLE sipariþler(
sprþürün_id int not null primary key,
kitp_ism nvarchar(20)not null,
müþtr_id int,
)

CREATE TABLE satýþlar(
stþ_id int IDENTITY(2,2) not null primary key,
müþtr_id int ,
depo_kod int,
adet int,
tarh int,
)

INSERT INTO kitaplar(fiyat, kitp_ism, yayin_tarihi)values('20','ince memet','12.05.1995')
INSERT INTO kitaplar(fiyat, kitp_ism, yayin_tarihi)values('25','çalýkuþu','16.11.2005')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('24','simyacý','4.10.2011')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('23','eylül','12.01.1997')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('22','dönüþüm','9.03.2001')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('23','son ada','5.8.2017')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('21','korku','08.03.1987')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','20','santranç','11.11.1999')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','26','dava','06.04.2003')
INSERT INTO kitaplar( fiyat, kitp_ism, yayin_tarihi)values('10','25','serenad','24.05.1897')

INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Yaþar Kemal','Ankara','258')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Reþat Nuri Güntekin','maraþ','147')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Poulo Coelho','ingiltere','898')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Mehmet Rauf','izmir',' 658')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Franz Kafka','fransa','364')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Zülfü Livaneli','mersin','564')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Stefan Zweig','fransa','324')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Anton Çehov','ingiltre','468')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Orhan Pamuk	','istanbul','167')
INSERT INTO yazarlar(Yazar_ismi,adresi,tel) values('Zülfü Livaneli','mersin','564')

INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Ahmet A','istanbul','416','ahmet@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Mehmet B','izmir','216','memet@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Bahar C','ankara','564','bhr@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Deniz D','mersin','784','dnz@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Dünya E','urfa','542','dnya@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Ada F	','konya','123','ada@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Nur G	','antep','654','ndhft@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('Haydar K','batman','152','nrdjh@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('mert H ','muþ','845','mrtyu@.com')
INSERT INTO müsteriler(Müþteri_ismi,adres,telefon,e_mail) VALUES('yusuf S','tekirdað','147','ysfcm@.com')


ALTER TABLE  satýþlar ADD CONSTRAINT yazr_id FOREIGN KEY  (yazr_id) REFERENCES yazarlar(yazr_id)
ALTER TABLE satýþlar  ADD CONSTRAINT müþtr_id FOREIGN KEY (müþtr_id) REFERENCES müsteriler(müþtr_id)
 

select * from satýþlar s

inner join müsteriler m

on

s.müþtr_id = m.müþtr_id

select * from satýþlar s

inner join  müsteriler m

on
s.müþtr_id = m.müþtr_id


select s.stþ_id,m.müþtr_id ,s.adet,s.tarh,s.fiyat from satýþlar s

inner join müsteriler m

on
s.müþtr_id = m.müþtr_id











SELECT sprþürün_id,sum(fiyat*adet) as TUTAR FROM  sipariþler GROUP BY sprþürün_id

select *from kitaplar order by kitp_ism

use Kitapcý
SELECT *FROM müsteriler
SELECT *FROM satýþlar
SELECT * FROM kitaplar 
SELECT *FROM yazarlar



use Kitapcý
 SELECT * FROM kitaplar WHERE yayin_tarihi BETWEEN '01.01.2015 'AND' 01.01.2020'
 use Kitapcý
 SELECT * FROM kitaplar WHERE ISBN_id BETWEEN 17 AND 26


CREATE TRIGGER  SatýþGir_StokGüncelle 
ON satýþla
FOR INSERT
as
DECLARE @Say int
select @SAY=COUNT(i.müþtr_id)
FROM depolar u INNER JOIN inserted i ON u.stok=i.stþ_id
where (i.adet>u.stok) IF @Say>0 
BEGIN 
ROLLBACK TRANSACTION 
RAISERROR ('girilen ürünlerden biri stoktan fazla',16,1)
end else
update kitaplar set stok =u.stok-i.adet
from kitaplar u INNER JOIN inserted i ON u.ISBN_id =i.stþ_id

USE Kitapcý
GO
EXEC satýþGir_StokGüncelle



use Kitapcý

CREATE TRIGGER sp_maksimum_satýþlar ON satýþlar 
AS
DECLARE @max int, @i int, @pno int, @maxpno int;
DECLARE @Müþteri_ism nVARCHAR(10);
DECLARE @satýþ decimal(15,2), @maxsatis decimal(15,2);
SET @satýþ=0;
SET @maxsatis=0;
 
SELECT @max= MAX( müþtr_id) FROM müsteriler;
SELECT @i= MIN(müþtr_id) FROM müsteriler;
 
WHILE (@i<=@max)
BEGIN
SELECT @satýþ=SUM(adet),@pno=müþtr_id from satýþlar WHERE müþtr_id=@i GROUP BY müþtr_id;
if (@satýþ>0)
BEGIN
if (@satýþ> @maxsatis)
BEGIN
SET @maxsatis=@satýþ;
SET @maxpno= @pno;
 
END
 
END
SET @i=@i+1;
END
 
SELECT @Müþteri_ism = Müþteri_ismi FROM müsteriler WHERE müþtr_id=@maxpno;
PRINT @Müþteri_ism+' '+''+ convert(nvarchar, @maxsatis);
 
END

use Kitapcý
go
exec sp_maksimum_satýþlar