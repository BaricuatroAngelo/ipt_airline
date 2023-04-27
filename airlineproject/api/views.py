from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password

# Create your views here.

@csrf_exempt
def register(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        
        if User.objects.filter(email=email).exists():
            response = JsonResponse({'success': False, 'message': 'Email already exists.'})
            response.status_code = 409
            return response
        
        user = User(username=email, email=email, first_name=name, password=make_password(password))
        user.save()
        response = JsonResponse({'success': True, 'message': 'Registration successful.'})
        response.status_code = 201
        return response
    else:
        response = JsonResponse({'success': False, 'message': 'Invalid request method.'})
        response.status_code = 405
        return response
