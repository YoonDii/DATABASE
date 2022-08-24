from django.db import models


    # Genre 클래스를 만드는데, models.model 내부 클래스를 상속받는다.
    # Class Genre(models.Model):
    #     name = models.chatField(max_length=30)
    # 상속을 받는 이유는 미리만들어진 기능들을 활용하고싶어서


class Director(models.Model):
    name = models.TextField()
    debut = models.DateTimeField()
    country = models.TextField()


class Genre(models.Model):
    title = models.TextField()
