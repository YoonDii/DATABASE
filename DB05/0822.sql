
--1
SELECT * from playlist_track A order by A.playlistId DESC LIMIT 5;

--2
SELECT * from tracks B order by B.trackId ASC LIMIT 5;

--3
SELECT A.playlistid, B.name 
from playlist_track A 
inner join tracks B 
on A.trackid = B.trackid 
order by A.playlistid DESC 
LIMIT 10;

--4
SELECT A.playlistid, B.name 
from playlist_track A 
inner join tracks B
on A.trackid = B.trackid
where A.playlistid = 10
ORDER by B.name DESC
LIMIT 5;

--5
SELECT count(*) 
FROM tracks A
inner JOIN artists B
on A.composer = B.name ;

--6
SELECT count(*) 
FROM tracks A 
LEFT JOIN artists B
on A.composer = B.name;

--7
--inner join은 A,B테이블에 공통으로 있는 데이터를 보는 교집합을 의미하고, 
--left join은 A테이블의 데이터와 A와B의 교집합데이터를 같이 본다.

--8
SELECT invoicelineid, invoiceid FROM invoice_items ORDER by invoiceid ASC LIMIT 5;

--9
SELECT InvoiceId, CustomerId FROM invoices order by invoiceid ASC LIMIT 5;

--10
SELECT A.InvoiceLineId, B.InvoiceId from invoice_items A 
inner join invoices B 
on A.invoiceid = B.invoiceid
ORDER BY B.invoiceid DESC 
LIMIT 5;

--11
SELECT A.InvoiceId, B.CustomerId FROM invoices A 
inner join customers B 
on A.customerid = B.customerid 
ORDER BY A.InvoiceId DESC
LIMIT 5;

--12
SELECT A.InvoiceLineId, A.InvoiceId, C.CustomerId 
FROM invoice_items A
INNER JOIN invoices B
ON A.InvoiceId = B.InvoiceId
INNER JOIN customers C
ON B.CustomerId = C.CustomerId
ORDER BY A.InvoiceId DESC
LIMIT 5;

--13
SELECT C.customerid, count(*)
FROM invoice_items A
inner join (SELECT * FROM invoices A inner join customers B on A.customerid = B.customerid) C
on A.invoiceid = C.invoiceid
GROUP by C.customerid
ORDER by C.customerid ASC
LIMIT 5;

