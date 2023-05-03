from django.urls import path
from api.views import UserList

urlpatterns = [
    path('api/users', UserList.as_view())
]