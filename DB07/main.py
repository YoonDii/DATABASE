import sys
import os
import django
sys.dont_write_bytecode = True
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
django.setup()

from db.models import *

# 아래에 코드를 기록하세요.
# 코드 실행은 터미널에서 shell을 실행시켜서 해주세요. 
# $ python manage.py shell_plus 

#3
directors = [
    ("봉준호","1993-01-01","KOR"),
    ("김한민","1999-01-01","KOR"),
    ("최동훈","2004-01-01","KOR"),
    ("이정재","2022-01-01","KOR"),
    ("이경규","1992-01-01","KOR"),
    ("한재림","2005-01-01","KOR"),
    ("Joseph Kosinski","1999-01-01","KOR"),
    ("김철수","2022-01-01","KOR"),
]
for director in directors:
    name_ = director[0]
    debut_ = director[1]
    country_ = director[2]
    Director.objects.create(name=name_, debut=debut_, country=country_)

genres = ["액션","드라마","사극","범죄","스릴러","SF","무협","첩보","재난"]

for title_ in genres:
    genre = Genre()
    genre.title = title_
    genre.save()

#4
bong = Director.objects.get(id=1)
print(f'id : {bong.id}\nname : {bong.name}\ndebut : {bong.debut}\ncountry : {bong.country}')   

#5
ren = Genre.objects.get(title='드라마')
print(f'id : {ren.id}\ntitle : {ren.title}')

#6
director_ = Director.objects.get(name='봉준호')
genre_ = Genre.objects.get(title='드라마')

movie = Movie()
movie.director = director_
movie.genre = genre_
movie.title = '기생충'
movie.opening_date = '2019-05-30'
movie.running_time = '132'
movie.screening = 'False'
movie.save()

#7
movies = [
    ("봉준호", "드라마", "괴물", "2006-07-27", 119, False),
    ("봉준호", "SF", "설국열차", "2013-10-30", 125, False),
    ("김한민", "사극", "한산", "2022-07-27", 129, True),
    ("최동훈", "SF", "외계+인", "2022-07-20", 142, False),
    ("이정재", "첩보", "헌트", "2022-08-10", 125, True),
    ("이경규", "액션", "복수혈전", "1992-10-10", 88, False),
    ("한재림", "재난", "비상선언", "2022-08-03", 140, True),
    ("Joseph Kosinski", "액션", "탑건 : 매버릭", "2022-06-22", 130, True),
]

for movie in movies:
    movie = Movie(
        director = Director.objects.get(name=movie[0]),
        genre = Genre.objects.get(title=movie[1]),
        title = movie[2],
        opening_date = movie[3],
        running_time = movie[4],
        screening = movie[5]
    )
    movie.save()

#8
info = Movie.objects.all()
for v in info:
    print(v.director,v.genre,v.title,v.opening_date,v.running_time,v.screening)

#9
info = Movie.objects.all()
for v in info:
    print(Director.objects.get(id = v.director_id).name,v.genre,v.title,v.opening_date,v.running_time,v.screening)


#10
info = Movie.objects.all()
for v in info:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#11
date = Movie.objects.order_by('-opening_date')
for v in date:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#12
Movie.objects.order_by('opening_date')
print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#13
date = Movie.objects.order_by('opening_date')
date_ = date.filter(screening = 'True')
for v in date_:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)


#14
date = Movie.objects.order_by('opening_date')
for v in date:
    if Director.objects.get(id = v.director_id).name=='봉준호':
        print(Director.objects.get(id = v.director_id).name,
        Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#15
date = Movie.objects.filter(director_id = 1).order_by('opening_date')[1:2]
for v in date:
    if Director.objects.get(id = v.director_id).name=='봉준호':
        print(Director.objects.get(id = v.director_id).name,
        Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#16
time_ = Movie.objects.filter(running_time__gt = 119).order_by('running_time')
for v in time_:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#17
time_ = Movie.objects.filter(running_time__gte = 119).order_by('running_time')
for v in time_:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#18
date = Movie.objects.filter(opening_date__gt ='2022-01-01').order_by('opening_date')
for v in date:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#19
movie = Movie.objects.filter(director_id = 1,genre_id = 2).order_by('opening_date') 
for v in movie:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)

#20
movie = Movie.objects.exclude(director_id = 1,genre_id = 2).order_by('opening_date') 
for v in movie:
    print(Director.objects.get(id = v.director_id).name,
    Genre.objects.get(id = v.genre_id).title,v.title,v.opening_date,v.running_time,v.screening)