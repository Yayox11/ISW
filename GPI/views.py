from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from GPI.models import *
from django.views.generic import ListView, CreateView, FormView, TemplateView, RedirectView
from django.contrib import auth
from GPI.forms import *

# Create your views here.


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def inicio(request):
    return render(request, 'index.html')


class PedidoCreate(CreateView):
    model = SolicitudMaterial
    form_class = PedidoForm
    template_name = 'pedir.html'


def login(request):
    c = {}
    return render(request, 'login.html', c)

def auth_view(request):
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username = username, password = password)
    print(password)
    if user is not None:
        auth.login(request,user)
        print(request.user.email)
        return HttpResponseRedirect('loggedin')
    else:
        return HttpResponseRedirect('invalid_login')


def loggedin(request):
    print("request:", request.user.is_anonymous)
    return render(request, 'loggedin.html', {'user': request.user})


def invalid_login(request):
    return render(request, 'invalid_login.html')