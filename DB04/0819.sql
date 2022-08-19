
--customers에 null값있음.


--3. 앨범(albums) 테이블의 데이터를 출력하세요.
SELECT title from albums ORDER by title DESC LIMIT 5; 

--4. 고객(customers) 테이블의 행 개수를 출력하세요.단, 컬럼명을 `고객 수`로 출력하세요.
SELECT count(rowid) as "고객 수" from customers;

--5. 고객(customers) 테이블에서 고객이 사는 나라가 `USA`인 고객의 `FirstName`, `LastName`을 출력하세요.
--각각의 컬럼명을 `이름`, `성`으로 출력하고, `이름`을 기준으로 내림차순으로 5개까지 출력하세요.
SELECT firstname as "이름",lastname as "성" from customers where country = 'USA' ORDER by firstname DESC LIMIT 5;

--6. 송장(invoices) 테이블에서 `BillingPostalCode`가 `NULL` 이 아닌 행의 개수를 출력하세요.
--컬렴명을 `송장수`로 출력하세요.
SELECT count(rowid) as "송장 수" from invoices where BillingPostalCode is not NULL order by billingpostalcode;
--SELECT count(rowid) as "송장 수" from invoices where BillingPostalCode is NULL order by billingpostalcode; 28

--7. 송장(invoices) 테이블에서 `BillingState`가 `NULL` 인 데이터를 출력하세요.
--단, `InvoiceDate`를 기준으로 내림차순으로 5개까지 출력하세요.
SELECT InvoiceDate, invoicedate,billingstate from invoices where billingstate is NULL group by invoicedate ORDER by invoicedate DESC LIMIT 5;

--8. 송장(invoices) 테이블에서 `InvoiceDate`의 년도가 `2013`인 행의 개수를 출력하세요.
--`strftime`를 검색해서 활용해보세요.
SELECT count(rowid) from invoices WHERE InvoiceDate BETWEEN "2013-01-01" AND "2014-01-01";
select count(*) from invoices where strftime('%Y',InvoiceDate) = '2013';

--9. 고객(customers) 테이블에서 `FirstName`이 `L` 로 시작하는 고객의 `CustomerId`, `FirstName`, `LastName`을 출력하세요.
--각각의 컬럼명을 `고객ID`, `이름`,`성`으로 출력하고, `고객ID`을 기준으로 오름차순으로 출력하세요.
SELECT customerid as "고객ID", firstname as "이름", lastname as "성" from customers where firstname LIKE 'L%'  ORDER by customerid asc ;

--10. 고객(customers) 테이블에서 각 나라의 고객 수와 해당 나라 이름을 출력하세요.
--단, 각각의 컬렴명을 `고객 수`,`나라`로 출력하고, 고객 수 상위 5개의 나라만 출력하세요.
SELECT COUNT(*) AS "고객 수" ,COUNTRY AS "나라" FROM customers  GROUP BY COUNTRY ORDER BY "고객 수" DESC LIMIT 5;

--11. 앨범(albums) 테이블에서 가장 많은 앨범이 있는 Artist의 `ArtistId`와 `앨범 수`를 출력하세요.
select artistid , count(*) as "앨범 수" from albums group by artistid ORDER by count(*) DESC LIMIT 1;

--12. 앨범(albums) 테이블에서 보유 앨범 수가 10개 이상인 Artist의 `ArtistId`와 `앨범 수` 출력하세요
--단, 앨범 수를 기준으로 내림차순으로 출력하세요
SELECT artistid, count(*) as "앨범 수" from albums group by artistid HAVING count(*) >= 10 ORDER by count(*) DESC ;

--13. 고객(customers) 테이블에서 `State`가 존재하는 고객들을 `Country` 와 `State`를 기준으로 그룹화해서 각 그룹의 `고객 수`, `Country`, `State` 를 출력하세요.
--`고객 수`, `Country` 순서 기준으로 내림차순으로 5개까지 출력하세요.
select count(*) as "고객 수", country, state from customers where state is not null group by country, state order by  "고객 수" DESC, country  DESC LIMIT 5;

--14.  고객(customers) 테이블에서 `Fax` 가 `NULL`인 고객은 'X' NULL이 아닌 고객은 'O'로 `Fax 유/무` 컬럼에 표시하여 출력하세요.
--단, `CustomerId`와 `Fax 유/무` 컬럼만 출력하고, `CustomerId` 기준으로 오름차순으로 5개까지 출력하세요. 
select customerid, 
  case 
    when fax is null then 'X' 
    WHEN fax is not null then 'O' 
    end AS "fax 유/무"
from customers
order by customerid ASC LIMIT 5;

--15. 점원(employees) 테이블에서 `올해년도 - BirthDate 년도 + 1` 를 계산해서 `나이` 컬럼에 표시하여 출력하세요.
--단, 점원의 `LastName`, `FirstName`, `나이` 컬럼만 출력하고, `EmployeeId`를 기준으로 오름차순으로 출력하세요.
--cast(), strftime(), 오늘 날짜를 구하는 함수를 검색하고, 활용해보세요.
SELECT lastname, firstname, datetime ('now') - birthdate + 1 AS "나이" 
from employees ORDER by employeeid ASC;

--16. 가수(artists) 테이블에서 앨범(albums)의 개수가 가장 많은 가수의 `Name`을 출력하세요.
--artists 테이블과 albums 테이블의 `ArtistId` 활용하세요.
SELECT artistid, name from artists where artistid = (select artistid from albums GROUP by artistid order by count(*) DESC LIMIT 1);

--17. 장르(genres) 테이블에서 음악(tracks)의 개수가 가장 적은 장르의 `Name`을 출력하세요.
--genres 테이블과 tracks 테이블의 `GenreId` 활용하세요
SELECT genreid, name from genres where genreid = (select genreid from tracks GROUP by genreid order by count(*) asc LIMIT 1);