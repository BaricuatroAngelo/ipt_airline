from django.db import models

# Create your models here.
class User(models.Model):
    userID: models.AutoField(primary_key=True)
    username = models.CharField(max_length=40, unique=True)
    first_name = models.CharField(max_length=30, default='')
    last_name = models.CharField(max_length=30, default='')
    email = models.EmailField(max_length=40)
    password = models.CharField(max_length=40)

class Airline(models.Model):
    airlineID = models.AutoField(primary_key=True)
    airline_name = models.CharField(max_length=300, default='')

class Flights(models.Model):
    flightID = models.AutoField(primary_key=True)
    tripType = models.CharField(max_length=255, default='')
    countryFrom = models.CharField(max_length=255)
    countryTo = models.CharField(max_length=255)
    departDate = models.DateField()
    returnDate = models.DateField()

    def __str__(self):
        return f"{self.tripType} trip from {self.countryFrom} to {self.countryTo}"