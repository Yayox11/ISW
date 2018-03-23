from django.shortcuts import render
from django.http import HttpResponse

def index(request):
    return HttpResponse("Wena men, este es el index de GPI")