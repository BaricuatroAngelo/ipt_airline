from django.urls import path
from api.views import UserList, AirlineList, FlightList

urlpatterns = [
    path('api/users', UserList.as_view()),
    path('api/flights', FlightList.as_view()),
    path('api/airline', AirlineList.as_view())
]