from django.db import models

# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=40)
    email = models.EmailField(max_length=40)
    password = models.CharField(max_length=40)
    confirmpassword = models.CharField(max_length=40)