from django.urls import path
from api.views import RegisteredUser

urlpatterns = [
    path('api/users', RegisteredUser.as_view())
]