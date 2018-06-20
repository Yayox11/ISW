from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from GPI.models import *
from django.views.generic import ListView, CreateView, FormView, TemplateView, RedirectView
from django.contrib import auth
from GPI.forms import *
from django.contrib.auth.decorators import login_required
from django.utils import timezone

# Create your views here.


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")


def inicio(request):
    return render(request, 'navbar.html')

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

@login_required(redirect_field_name='login')
def loggedin(request):
    print("request:", request.user.is_anonymous)
    return render(request, 'navbar.html', {'user': request.user})


def invalid_login(request):
    return render(request, 'invalid_login.html')

@login_required(redirect_field_name='login')
def SolicitudCreate(request):
    if request.method == 'POST':
        solicitud_form = SolicitudForm(request.POST)
        material_form = MaterialForm(request.POST)
        if solicitud_form.is_valid() and material_form.is_valid():
            material = material_form.save(commit=False)
            solicitud = solicitud_form.save(commit=False)
            solicitud.trabajadorobra = request.user.trabajadorobra
            solicitud.fecha_solicitud = timezone.now()
            solicitud.save()
            print(solicitud)
            material.solicitud = solicitud
            material.save()
            return HttpResponseRedirect('loggedin')
    else:
        solicitud_form = SolicitudForm()
        material_form = MaterialForm()

    return render(request, 'pedido.html',{'solicitud_form': solicitud_form, 'material_form': material_form})


def pedir_view(request):
    if request.method == 'POST':
        form = PedidoForm2(request.POST)
        print(form)
        if form.is_valid():
            form.save()
        return redirect('index')
    else:
        form = PedidoForm2()
    return render(request,'pedir.html',{'form':form})
def ver_pedidos(request):
    return render(request, 'ver_pedidos.html')

def stock(request):
    return render(request, 'stock.html')
