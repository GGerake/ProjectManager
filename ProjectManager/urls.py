
from django.contrib import admin
from django.urls import path
from django.http import HttpResponse
from ProjectManager.settings import DEBUG

urlpatterns = [
    path('', lambda x: HttpResponse('Django Docker!!!'))
]

if DEBUG: urlpatterns.append(path('admin/', admin.site.urls))
