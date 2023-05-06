from django.urls import path
from api.views import UserList, AirlineList, FlightsView

urlpatterns = [
    path('api/users', UserList.as_view()),
    path('api/airline', AirlineList.as_view()),
    path('api/booked', FlightsView.as_view())
]