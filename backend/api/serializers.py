from rest_framework import serializers
from registration.models import User, Airline, Flights

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'first_name', 'last_name', 'email', 'password']

class AirlineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Airline
        fields = ['airlineID', 'airline_name']

class FlightSerializer(serializers.ModelSerializer):

    class Meta:
        model = Flights
        fields = ['tripType', 'countryFrom', 'countryTo', 'departDate', 'returnDate']
