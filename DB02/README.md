# 2일차 실습 0817

## 사전 확인

### 실행

```bash
$ sqlite3 healthcare.sqlite3 
```

### Column 출력 설정

```sql
sqlite3> .headers on 
sqlite3> .mode column
```

### table 및 스키마 조회

```sql
sqlite3> .tables
healthcare

sqlite3> .schema healthcare
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

    blood_pressure INTEGER 
    NOT NULL,
    smoking INTEGER NOT NULL,
    is_drinking BOOLEAN NOT NULL
);
```

## 문제

### 1. 추가되어 있는 모든 데이터의 수를 출력하시오.

```sql
SELECT count(*) FROM healthcare;
```

```
count(*)
--------
1000000
```

### 2. 연령 코드(age)의 최대, 최소 값을 모두 출력하시오. 

```sql
SELECT max(age),min(age) from healthcare WHERE age;
```

```
max(age)  min(age)
--------  --------
18        9
```

### 3. 신장(height)과 체중(weight)의 최대, 최소 값을 모두 출력하시오.

```sql
SELECT max(height),min(height),max(weight),min(weight) FROM healthcare WHERE height AND weight;
```

```
max(height)  min(height)  max(weight)  min(weight)
-----------  -----------  -----------  -----------
195          130          135          30
```

### 4. 신장(height)이 160이상 170이하인 사람은 몇 명인지 출력하시오.

```sql
SELECT count(height) FROM healthcare WHERE height >= 160 and height <= 170;
```

```
count(height)
-------------
516930
```

### 5. 음주(is_drinking)를 하는 사람(1)의 허리 둘레(waist)를 높은 순으로 5명 출력하시오. 

```sql
SELECT waist from healthcare WHERE is_drinking = 1 and waist != '' ORDER BY waist DESC LIMIT 5;
```

```
146.0
142.0
141.4
140.0
140.0
```

### 6. 시력 양쪽(va_left, va_right)이 1.5이상이면서 음주(is_drinking)를 하는 사람의 수를 출력하시오.

```sql
SELECT count(is_drinking) from healthcare where va_left >= 1.5 and va_right >= 1.5 and is_drinking = 1;
```

```
count(is_drinking)
------------------
36697
```

### 7. 혈압(blood_pressure)이 정상 범위(120미만)인 사람의 수를 출력하시오.

```sql
SELECT count(blood_pressure) from healthcare where blood_pressure < 120;
```

```
count(blood_pressure)
---------------------
360808
```

### 8. 혈압(blood_pressure)이 140이상인 사람들의 평균 허리둘레(waist)를 출력하시오.

```sql
SELECT avg(waist) from healthcare where blood_pressure >= 140;
```

```
avg(waist)
----------------
85.8665098512525
```

### 9. 성별(gender)이 1인 사람의 평균 키(height)와 평균 몸무게(weight)를 출력하시오.

```sql
SELECT avg(height),avg(weight) from healthcare where gender = 1;
```

```
avg(height)       avg(weight)
----------------  ----------------
167.452735422145  69.7131620222875
```

### 10. 키가 가장 큰 사람 중에 두번째로 무거운 사람의 id와 키(height), 몸무게(weight)를 출력하시오.

```sql
SELECT id, height, weight from healthcare order by height DESC, weight DESC LIMIT 1 OFFSET 2;
```

```
id      height  weight
------  ------  ------
219595  195     105
```

### 11. BMI가 30이상인 사람의 수를 출력하시오. 

> BMI는 체중/(키*키)의 계산 결과이다. 
> 키는 미터 단위로 계산한다.

```sql
SELECT COUNT(*) FROM healthcare WHERE weight/(height*height*0.0001) >= 30;
```

```
COUNT(*)
--------
53121
```

### 12. 흡연(smoking)이 3인 사람의 BMI지수가 제일 높은 사람 순서대로 5명의 id와 BMI를 출력하시오.

> BMI는 체중/(키*키)의 계산 결과이다. 
> 키는 미터 단위로 계산한다.

```sql
SELECT id, weight/(height*height*0.0001) AS BMI from healthcare WHERE smoking = 3 ORDER by weight/(height*height*0.0001) DESC LIMIT 5;
```

```
id      BMI
------  ----------------
231431  50.78125
934714  49.9479708636837
722707  48.828125
947281  47.7502295684114
948801  47.7502295684114
```

### 13. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.

```sql
성별이 2면서 키 180이상인 사람의 수를 출력하시오.
SELECT count(*) from healthcare where gender = 2 and height >= 180;
```

```
count(*)
--------
31
```

### 14. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.

```sql
흡연수치가 1이고, 음주가 1이면서, 혈압이 130 이상인 사람
SELECT count(*) from healthcare where smoking = 1 and is_drinking = 1 and blood_pressure >= 130;
```

```
count(*)
--------
96364
```

### 15. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.

```sqlite
키 작은 순과 몸무게 큰순으로 5명만 나타내라.
SELECT height, weight from healthcare ORDER by height ASC, weight DESC LIMIT 5;
```

```sqlite
height  weight
------  ------
130     75
130     70
130     70
130     65
130     65
```

