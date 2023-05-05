from rest_framework import serializers
from registration.models import User, Flight, Airline


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'password', 'email']

class FlightSerializer(serializers.ModelSerializer):
    class Meta:
        model = Flight
        fields = ['flightID', 'flightDestination', 'flightTime', 'flightDate', 'flightPrice', 'airlineID']

class AirlineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Airline
        fields = ['airlineID', 'airline_name']
