from django.shortcuts import render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from GPI.models import *
from django.views.generic import ListView, CreateView, FormView, TemplateView, RedirectView
from django.contrib import auth
from GPI.forms import *
from django.contrib.auth.decorators import login_required
from django.utils import timezone
import pickle
from django.forms.models import model_to_dict

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

dict_elementos = {}
dict_html = {}

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
            material.solicitud = solicitud
            material.save()
            return HttpResponseRedirect('loggedin')

        ''''
        if "enviar" in request.POST and dict_elementos.__len__() != 0:
            for element in dict_elementos.values():
                element[1].save()
                element[0].solicitud = element[1]
                element[0].save()
            solicitud_form = SolicitudForm()
            material_form = MaterialForm()
            return render(request, 'pedido.html', {'solicitud_form': solicitud_form, 'material_form': material_form})
        elif 'agregar' in request.POST:
            if solicitud_form.is_valid() and material_form.is_valid():
                material = material_form.save(commit=False)
                solicitud = solicitud_form.save(commit=False)
                solicitud.trabajadorobra = request.user.trabajadorobra
                solicitud.fecha_solicitud = timezone.now()
                dict_elementos[material_form.cleaned_data['nombre']]=(material,solicitud)
                dict_html[material_form.cleaned_data['nombre']] = (material_form.cleaned_data['nombre'],material_form.cleaned_data['cantidad'],solicitud_form.cleaned_data['fecha_requerida'],material_form.cleaned_data['urgencia'])
                solicitud_form = SolicitudForm()
                material_form = MaterialForm()
                return render(request, 'pedido.html',{'solicitud_form': solicitud_form, 'material_form': material_form, 'items' : dict_html.values()})
    '''
    else:
        solicitud_form = SolicitudForm()
        material_form = MaterialForm()

    return render(request, 'pedido.html',{'solicitud_form': solicitud_form, 'material_form': material_form})

def ver_pedidos(request):
    obra_trabajador = Obra.objects.filter(bodeguero__user__email=request.user.email).distinct().prefetch_related('bodeguero').order_by('nombre')
    lista_ordenes = []
    for ob in obra_trabajador:
        lista_ordenes.append(SolicitudMaterial.objects.filter(obra__nombre=ob).distinct().prefetch_related('obra').order_by('fecha_requerida','fecha_solicitud','obra'))
    return render(request,'ver_pedidos.html',{'ordenes':lista_ordenes})

def ver_materiales(request):
    if request.method == 'POST':
        stock_form = StockFrom(request.user.email)
        nombre = Obra.objects.filter(pk=request.POST.get('obra'))
        try:
            materiales_obra = Materiales.objects.filter(obra=nombre[0])
        except Materiales.DoesNotExist:
            materiales_obra = []
        print(materiales_obra)
        return render(request,'stock.html',{'stock_form':stock_form, 'lista_materiales':materiales_obra})
    stock_form = StockFrom(request.user.email)
    return render(request,'stock.html',{'stock_form':stock_form,'lista_materiaes':[]})

def stock(request):
    return render(request, 'stock.html')
