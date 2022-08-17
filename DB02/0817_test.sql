--1. 추가되어 있는 모든 데이터의 수를 출력하시오.
SELECT count(*) FROM healthcare;

--2. 연령 코드(age)의 최대, 최소 값을 모두 출력하시오.
SELECT max(age),min(age) from healthcare WHERE age;

--3. 신장(height)과 체중(weight)의 최대, 최소 값을 모두 출력하시오.
SELECT max(height),min(height),max(weight),min(weight) FROM healthcare WHERE height AND weight;

--4. 신장(height)이 160이상 170이하인 사람은 몇 명인지 출력하시오.
SELECT count(height) FROM healthcare WHERE height >= 160 AND height <= 170;

--5. 음주(is_drinking)를 하는 사람(1)의 허리 둘레(waist)를 높은 순으로 5명 출력하시오. 
SELECT waist from healthcare WHERE is_drinking = 1 ORDER BY waist DESC LIMIT 5;

--6. 시력 양쪽(va_left, va_right)이 1.5이상이면서 음주(is_drinking)를 하는 사람의 수를 출력하시오.
SELECT count(is_drinking) from healthcare where va_left >= 1.5 and va_right >= 1.5 and is_drinking = 1;

--7. 혈압(blood_pressure)이 정상 범위(120미만)인 사람의 수를 출력하시오.
SELECT count(blood_pressure) from healthcare where blood_pressure < 120;

--8. 혈압(blood_pressure)이 140이상인 사람들의 평균 허리둘레(waist)를 출력하시오.
SELECT avg(waist) from healthcare where blood_pressure >= 140;

--9. 성별(gender)이 1인 사람의 평균 키(height)와 평균 몸무게(weight)를 출력하시오.
SELECT avg(height),avg(weight) from healthcare where gender = 1;

--10. 키가 가장 큰 사람 중에 두번째로 무거운 사람의 id와 키(height), 몸무게(weight)를 출력하시오.
SELECT id, height, weight from healthcare order by height DESC, weight DESC LIMIT 1 OFFSET 2;

--11. BMI가 30이상인 사람의 수를 출력하시오. 
SELECT COUNT(*) FROM healthcare WHERE weight/(height*height*0.0001) >= 30;

--12. 흡연(smoking)이 3인 사람의 BMI지수가 제일 높은 사람 순서대로 5명의 id와 BMI를 출력하시오.
SELECT id, weight/(height*height*0.0001) AS BMI from healthcare WHERE smoking = 3 ORDER by weight/(height*height*0.0001) DESC LIMIT 5;

--13.성별이 2면서 키 180이상인 사람의 수를 출력하시오.
SELECT count(*) from healthcare where gender = 2 and height >= 180;

--14.흡연수치가 1이고, 음주가 1이면서, 혈압이 130 이상인 사람
SELECT count(*) from healthcare where smoking = 1 and is_drinking = 1 and blood_pressure >= 130;

--15.키 작은 순과 몸무게 큰순으로 5명만 나타내라.
SELECT height, weight from healthcare ORDER by height ASC, weight DESC LIMIT 5;