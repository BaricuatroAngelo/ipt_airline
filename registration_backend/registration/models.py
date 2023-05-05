from django.db import models

# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=40, unique=True)
    first_name = models.CharField(max_length=30, default='')
    last_name = models.CharField(max_length=30, default='')
    email = models.EmailField(max_length=40)
    password = models.CharField(max_length=40)