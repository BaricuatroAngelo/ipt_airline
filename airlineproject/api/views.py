from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.http import JsonResponse
from .models import User


def register(request):
    if request.method == 'POST':
        email = request.POST['email']
        password = request.POST['password']
        name = request.POST['name']

        if not email or not password or not name:
            return JsonResponse({'error': 'All fields are required'})

        try:
            user = User.objects.create_user(email=email, password=password, name=name)
        except Exception as e:
            return JsonResponse({'error': str(e)})

        login(request, user)
        return JsonResponse({'success': True})

    return render(request, 'registration.html')

