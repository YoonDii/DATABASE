-- 테이블 만들기
CREATE TABLE healthcare (
id PRIMARY KEY,
sido INTEGER NOT NULL,
gender INTEGER NOT NULL,
age INTEGER NOT NULL,
height INTEGER NOT NULL,
weight INTEGER NOT NULL,
waist REAL NOT NULL,
va_left REAL NOT NULL,
va_right REAL NOT NULL,
blood_pressure INTEGER NOT NULL,
smoking INTEGER NOT NULL,
is_drinking BOOLEAN NOT NULL
);

-- csv import 하기
.mode csv 
.import health.csv healthcare

SELECT COUNT(*) FROM healthcare WHERE age <10;

SELECT COUNT(*) FROM healthcare WHERE gender=1;

SELECT COUNT(*) FROM healthcare WHERE smoking and is_drinking=3 and 1;

SELECT COUNT(*) FROM healthcare WHERE va_left and va_right <= 2.0 and 2.0;

SELECT DISTINCT sido FROM healthcare;

SELECT COUNT(*) FROM healthcare WHERE gender and smoking = 1 and 1;
 --조건찾기