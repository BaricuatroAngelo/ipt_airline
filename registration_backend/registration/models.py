from django.db import models

# Create your models here.

class User(models.Model):
    username = models.CharField(max_length=40, unique=True)
    first_name = models.CharField(max_length=30, default='')
    last_name = models.CharField(max_length=30, default='')
    email = models.EmailField(max_length=40)
    password = models.CharField(max_length=40)

class Flight(models.Model):
    flightID = models.AutoField(primary_key=True)
    flightDestination = models.CharField(max_length=255)
    flightTime = models.TimeField()
    flightDate = models.DateField()
    flightPrice = models.DecimalField(max_digits=8, decimal_places=2)
    airlineID = models.ForeignKey('Airline', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.flightID} - {self.flightDestination}"
    
class Airline(models.Model):
    airlineID = models.AutoField(primary_key=True)
    airline_name = models.CharField(max_length=300, default='')