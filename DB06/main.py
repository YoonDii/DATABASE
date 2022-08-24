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

Director.objects.create(name='봉준호', debut='1993-01-01', country='KOR')
Director.objects.create(name='김한민', debut='1999-01-01', country='KOR')
Director.objects.create(name='최동훈', debut='2004-01-01', country='KOR')
Director.objects.create(name='이정재', debut='2022-01-01', country='KOR')
Director.objects.create(name='이경규', debut='1992-01-01', country='KOR')
Director.objects.create(name='한재림', debut='2005-01-01', country='KOR')
Director.objects.create(name='Joseph Kosinski', debut='1999-01-01', country='KOR')
Director.objects.create(name='김철수', debut='2022-01-01', country='KOR')

Genre.objects.create(title='액션')
genre = Genre()
genre.title ='드라마'
genre.save()
genre = Genre()
genre.title ='사극'
genre.save()
genre = Genre()
genre.title ='범죄'
genre.save()
genre = Genre()
genre.title ='스릴러'
genre.save()
genre = Genre()
genre.title ='SF'
genre.save()
genre = Genre()
genre.title ='무협'
genre.save()
genre = Genre()
genre.title ='첩보'
genre.save()
genre = Genre()
genre.title ='재난'
genre.save()

dirt = Director.objects.all()
for director in dirt:
    print(director.name,director.debut,director.country)

dirt = Director.objects.get(id=1)
print(dirt.name,dirt.debut,dirt.country)

dirt = Director.objects.get(country='USA')
print(dirt.name,dirt.debut,dirt.country)

dirt = Director.objects.get(name = 'Joseph Kosinski')
dirt.country='USA'
dirt.save()
dirt = Director.objects.get(country= 'USA')
print(dirt.name,dirt.debut,dirt.country)

dirt = Director.objects.get(country= 'KOR')
for d in dirt:
    print(d.name,d.debut,d.country)

dirt = Director.objects.filter(country= 'KOR')
for d in dirt:
    print(d.name,d.debut,d.country)

dirt = Director.objects.get(name = '김철수')    
dirt.delete()