CREATE DATABASE KÝTAPÇI
USE Kitapcý
CREATE TABLE kitaplr (
ISBN_id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
yzr_id int,
stk_id int,
fiyat NVARCHAR(5) NOT NULL,
kitp_ad NVARCHAR(20) NOT NULL,
y_tarihi datetime NOT NULL,
)
CREATE TABLE yazarlr (
yzr_id int IDENTITY(1,1) NOT NULL primary key,
Yzr_ad NVARCHAR(20) NOT NULL,
adresi NVARCHAR(20) NOT NULL,
tel NVARCHAR(11) not null,
)
CREATE TABLE müsterilr (
müþtr_id int IDENTITY(1,1) not null primary key,
müþtr_ad NVARCHAR(10) not null,
adres NVARCHAR(20) not null, 
telfn NVARCHAR(10) not null,
e_mail NVARCHAR(15) not null
)
CREATE TABLE depo_stok(
stk_id int IDENTITY(1,1) not null primary key,
depo_adrs NVARCHAR(20) not null,
adet NVARCHAR(10) not null,
)

CREATE TABLE sepete_ekle(
spt_id int IDENTITY(1,1) not null primary key,
müþtr_id int,
ISBN_id int,
)

CREATE TABLE sipariþver(
sprþ_id int IDENTITY(1,1) not null primary key,
müþtr_id int,
spt_id int,
ürün_ad nvarchar(20),
fiyat nvarchar(20),
ISBN_id int,
s_trhi nvarchar(20)not null,
)
INSERT INTO kitaplr(fiyat, kitp_ad, y_tarihi)values('20','ince memet','12.05.1995') 
INSERT INTO kitaplr(fiyat, kitp_ad, y_tarihi)values('25','çalýkuþu','1.11.2019')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('24','simyacý','4.10.2011')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('23','eylül','12.01.1997')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('22','dönüþüm','9.03.2001')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('23','son ada','5.8.2017')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('21','korku','08.03.1987')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('20','santranç','11.11.2015')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('26','dava','06.04.2003')
INSERT INTO kitaplr( fiyat, kitp_ad, y_tarihi)values('25','serenad','4.05.2020')
select*from kitaplr
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Yaþar Kemal','Ankara','258')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('R.Nuri Güntekin','maraþ','147')
INSERT INTO yazarlr (Yzr_ad,adresi,tel) values('Poulo Coelho','ingiltere','898')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Mehmet Rauf','izmir',' 658')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Franz Kafka','fransa','364')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Zülfü Livaneli','mersin','564')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Stefan Zweig','fransa','324')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Anton Çehov','ingiltre','468')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Orhan Pamuk','istanbul','167')
INSERT INTO yazarlr(Yzr_ad,adresi,tel) values('Zülfü Livaneli','mersin','564')
select *from yazarlr
SET IDENTITY_INSERT yazarlr ON; INSERT INTO dbo.yazarlr(Yzr_ad,adresi,tel) VALUES ('R.Nuri Güntekin','maraþ','147') SET IDENTITY_INSERT yazarlr OFF;

INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Ahmet A','istanbul','416','ahmet@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Mehmet B','izmir','216','memet@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Bahar C','ankara','564','bhr@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Deniz D','mersin','784','dnz@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Dünya E','urfa','542','dnya@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Ada F	','konya','123','ada@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Nur G	','antep','654','ndhft@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('Haydar K','batman','152','nrdjh@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('mert H ','muþ','845','mrtyu@.com')
INSERT INTO müsterilr(müþtr_ad,adres,telfn,e_mail) VALUES('yusuf S','tekirdað','147','ysfcm@.com')

INSERT INTO depo_stok (depo_adrs,adet)VALUES ('A','10')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('B','15')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('C','13')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('D','17')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('E','10')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('F','12')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('G','14')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('H','16')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('K','18')
INSERT INTO depo_stok (depo_adrs,adet)VALUES ('L','17')
SELECT  
       kitaplr.ISBN_id,kitaplr.stk_id,kitaplr.yzr_id,kitaplr.kitp_ad,kitaplr.fiyat,kitaplr.y_tarihi,
	   sepete_ekle.ISBN_id,sepete_ekle.müþtr_id,sepete_ekle.spt_id,
	   sipariþver.ISBN_id,sipariþver.müþtr_id,sipariþver.spt_id
FROM  kitaplr,sepete_ekle,sipariþver,yazarlr
 WHERE  kitaplr.ISBN_id= sepete_ekle.ISBN_id  AND sepete_ekle.ISBN_id  =sipariþver.ISBN_id 



select müþtr_id,fiyat,kitp_ad,y_tarihi from kitaplr k inner join müsterilr m on  k.ISBN_id=m.müþtr_id

select*  from kitaplr k inner join yazarlr y on  k.yzr_id=y.yzr_id 
select kitp_ad,y_tarihi from kitaplr k inner join sipariþver s on  k.ISBN_id=s.ISBN_id
select  müþtr_id, spt_id,ISBN_id,s_trhi from sipariþver s inner join yazarlr y on s.sprþ_id=y.yzr_id

 
select k.kitp_ad,y.Yzr_ad from kitaplr k
inner join yazarlr y
on
k.yzr_id = y.yzr_id

select k.ISBN_id,y.Yzr_ad,d.adet from kitaplr k
inner join yazarlr y
on
k.yzr_id = y.yzr_id
inner join depo_stok d
on
k.stk_id= d.stk_id
create trigger deneme_güncel
on sipariþler

use KÝTAPÇI
GO
CREATE TRIGGER trg_stk_güncel
ON sipariþver
 after insert
 as 
 begin 
 select 
 select sipariþver.ISBN_id,sipariþver. from sipariþver where koltuk_durum='BOÞ' ,
'boþ koltuk için yeni rezervasyon isteði (yeni kayýt yapýldý)'



AFTER INSERT
AS 
DECLARE @ISBN_id int
select @ISBN_id=COUNT(i.spt_id)
FROM depo_stok d INNER JOIN inserted i ON d.stk_id=i.spt_id
where (d.adet>i.spt_id) IF @ISBN_id>0 
BEGIN 
ROLLBACK TRANSACTION 
RAISERROR ('girilen ürünlerden biri stoktan fazla',16,1)
end else
update depo_stok set adet=d.adet-i.spt_id
FROM depo_stok d INNER JOIN inserted i ON d.adet=i.spt_id


CREATE TRIGGER sprsil_stokgüncelle on depo_sk e
AFTER delete
as
update depo_stok set adet=e.adet-i.spt_id
FROM depo_stok e INNER JOIN deleted i ON e.adet=i.spt_id

select * from sipariþver delete from sipariþver where sprþ_id=''
select max(fiyat) from sipariþver


CREATE TRIGGER sp_mak_satýþlar 
AFTER INSERT
AS 
DECLARE @max int, @i int, @pno int, @maxpno int;
DECLARE @Müþtr_ad nVARCHAR(10);
DECLARE @satýþ decimal(15,2), @maxsatis decimal(15,2);
SET @satýþ=0;
SET @maxsatis=0;
 
SELECT @max= MAX( müþtr_id) FROM müsterilr;
SELECT @i= MIN(müþtr_id) FROM sipariþver;
 
WHILE (@i<=@max)
BEGIN
SELECT @satýþ=SUM(fiyat*adet),@pno=müþtr_id from sipariþver WHERE stk_id=@i GROUP BY müþtr_id;
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
 
SELECT @Müþtr_ad = @Müþtr_ad FROM müsterilr WHERE müþtr_id=@maxpno;
PRINT  @Müþtr_ad+' '+''+ convert(nvarchar, @maxsatis);
 
END

Select distinct müsterilr.* from müsterilr
join yazarlr on müsterilr.müþtr_id = yazarlr.yzr_id
join kitaplr on kitaplr.ISBN_id = müsterilr.müþtr_id
where yazarlr.Yzr_ad = 'Yaþar kemal' 

Select count(distinct yazarlr) from müsterilr
join sipariþver on müsterilr.müþtr_id = sipariþver.müþtr_id
join kitaplr on kitaplr.ISBN_id = sipariþver.ISBN_id 
where müsterilr.müþtr_ad= '',

Select count(*) from kitaplr



Select count(*) kitapsayýsý
from müsterilr
join kitaplr  on kitaplr.ISBN_id=müsterilr.müþtr_id
group by müsterilr.müþtr_ad,müsterilr.telfn
order by müþtr_ad desc



Select count(*) from kitaplr
join yazarlr on yazarlr.yzr_id=kitaplr.ISBN_id
where yazarlr.yzr_id = '8' 


