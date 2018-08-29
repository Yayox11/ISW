from django.contrib import auth
from django.contrib.auth.decorators import login_required, user_passes_test
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils import timezone

from GPI.forms import *
from GPI.odoo import *


# Create your views here.
def admin_check(user):
    return user.is_admin

def bodeguero_check(user):
    return user.is_bodeguero

def encargado_compras_check(user):
    return user.is_encargado_compras

def trabajador_obra_check(user):
    return user.is_trabajador_obra

def trabajador_bodeguero_check(user):
    return (user.is_bodeguero or user.is_trabajador_obra or user.is_admin)

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

    else:
        solicitud_form = SolicitudForm()
        material_form = MaterialForm()

    return render(request, 'pedido.html',{'solicitud_form': solicitud_form, 'material_form': material_form})

@login_required(redirect_field_name='login')
@user_passes_test(trabajador_bodeguero_check, login_url= 'loggedin')
def ver_pedidos(request):
    obra_trabajador = Obra.objects.filter(bodeguero__user__email=request.user.email).distinct().prefetch_related('bodeguero').order_by('nombre')
    lista_ordenes = []
    for ob in obra_trabajador:
        lista_ordenes.append(SolicitudMaterial.objects.filter(obra__nombre=ob).distinct().prefetch_related('obra').order_by('fecha_requerida','fecha_solicitud','obra'))
    return render(request,'ver_pedidos.html',{'ordenes':lista_ordenes})

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url= 'loggedin')
def ver_pedidos_central(request):
    pedidos = list(SolicitudMaterial.objects.filter().order_by('fecha_requerida','fecha_solicitud'))
    contexto = {'pedidos': pedidos}
    return render(request, 'ver_all_pedidos.html', contexto)

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def ver_solicitud(request, id_solicitud):
    solicitud = SolicitudMaterial.objects.get(numero_orden = id_solicitud)
    materiales = list(MaterialSolicitado.objects.filter(solicitud = solicitud))
    if request.method =='GET':
        form = SolicitudForm_edit(instance=solicitud)
    else:
        form = SolicitudForm_edit(request.POST, instance=solicitud)
        if form.is_valid():
            form.save()
            return redirect('pedidos_central')
    contexto = {'solicitud': solicitud, 'materiales': materiales, 'form' : form}
    return render(request, 'ver_solicitud.html', contexto)

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url= 'loggedin')
def material_edit(request, id_material):
    material = MaterialSolicitado.objects.get(id = id_material)
    if request.method == 'GET':
        form = MaterialForm_edit(instance=material)
    else:
        form = MaterialForm_edit(request.POST, instance=material)
        if form.is_valid():
            form.save()
            return redirect('ver_solicitud', id_solicitud = material.solicitud.numero_orden)
    contexto = {'form': form, 'material':material}
    return render(request, 'material_edit.html', contexto)


@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url= 'loggedin')
def delete_material(request, id_material):
    material = MaterialSolicitado.objects.get(id = id_material)
    id_solicitud1 = material.solicitud.numero_orden
    if request.method == 'POST':
        material.delete()
        return redirect('ver_solicitud', id_solicitud= id_solicitud1)
    return render(request, 'delete_material.html', {'material':material})

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url= 'loggedin')
def delete_solicitud(request, id_solicitud):
    solicitud = SolicitudMaterial.objects.get(numero_orden=id_solicitud)
    if request.method == 'POST':
        solicitud.delete()
        return redirect('pedidos_central')
    return render(request, 'delete_solicitud.html',{'solicitud':solicitud})

@login_required(redirect_field_name='login')
@user_passes_test(trabajador_bodeguero_check, login_url='loggedin')
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


@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def Sol_Material(request):
    if request.method == 'POST':
        print("sdadsadsadasPASO11")
        solicitud_form = SolicitudForm(request.POST)
        formset = MaterialesFormSet(request.POST, request.FILES,queryset=MaterialSolicitado.objects.none())
        print("formset_valid :", formset.is_valid())
        print("solicitud_form:", solicitud_form.is_valid())
        if formset.is_valid() and solicitud_form.is_valid():
            print("formset errors:", formset.errors)
            print("PASO")
            solicitud = solicitud_form.save(commit=False)
            solicitud.trabajadorobra = request.user.trabajadorobra
            solicitud.fecha_solicitud = timezone.now()
            solicitud.save()
            for form in formset:
                material = form.save(commit = False)
                material.solicitud = solicitud
                material.save()
            return HttpResponseRedirect('loggedin')
    else:
        print("PASO22")
        solicitud_form = SolicitudForm()
        formset = MaterialesFormSet(queryset=MaterialSolicitado.objects.none())
    return render(request, 'pedido2.html',{'solicitud_form': solicitud_form, 'formset': formset})


@login_required(redirect_field_name='login')
def stock(request):
    return render(request, 'stock.html')

@login_required(redirect_field_name='login')
@user_passes_test(trabajador_bodeguero_check, login_url='loggedin')
def ver_pedido2(request):
    if request.method == 'POST':
        solicitud_form = SolicitudForm(request.POST)
        formset = MaterialesFormSet(request.POST,request.FILES, queryset=MaterialSolicitado.objects.none())
        print("formset_valid :", formset.is_valid())
        print("formset error", solicitud_form.errors)
        print("solicitud_form:", solicitud_form.is_valid())
        print(formset.errors)
        print("ERRORES:", len(formset.errors))
        if formset.is_valid() and solicitud_form.is_valid():
            solicitud = solicitud_form.save(commit=False)
            print("FECHA:", solicitud.fecha_requerida)
            solicitud.trabajadorobra = request.user.trabajadorobra
            solicitud.fecha_solicitud = timezone.now()
            for form in formset:
                if form.is_valid():
                    solicitud.save()
                    material = form.save(commit = False)
                    material.solicitud = solicitud
                    material.save()
                else:
                    solicitud_form = SolicitudForm()
                    formset = MaterialesFormSet(queryset=MaterialSolicitado.objects.none())
                    return render(request, 'pedido2.html', {'solicitud_form': solicitud_form, 'formset': formset})


            return HttpResponseRedirect('loggedin')
    else:
        solicitud_form = SolicitudForm()
        formset = MaterialesFormSet(queryset=MaterialSolicitado.objects.none())
    return render(request, 'pedido2.html',{'solicitud_form': solicitud_form, 'formset': formset})

@login_required(redirect_field_name='login')
def upd_stock(request):
    lista=[]
    odoo_conection = ODOO()
    #odoo_conection = od._init_(self, url="https://drusq.odoo.com",db="drusq", username="cgardillacurada7@gmail.com",password="120696")
    odoo_conection._init_(url="https://drusq.odoo.com",db="drusq", username="cgardillacurada7@gmail.com",password="120696")
    odoo_conection.connect()
    #odoo_conection.search("purchase.order",lista)
    return render(request, 'odoo_sol.html',{"lista" : odoo_conection.search("purchase.order",lista) })

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def CreateUsuario(request):
    if request.method == 'POST':
        user_form = UserCreateForm(request.POST)
        permisos_form = PermisosForm(request.POST)
        print("user_form valid:",user_form.is_valid())
        print('user_form errores:', user_form.errors)
        if user_form.is_valid() and permisos_form.is_valid():
            print('hola')
            usuario = user_form.save(commit=False)
            if permisos_form.cleaned_data['tipo_usuario'] == "admin":
                usuario.is_admin = True
                usuario.is_bodeguero = True
                usuario.is_trabajador_obra = True
                usuario.is_encargado_compras = True
                usuario.save()
                bodeguero = Bodeguero()
                bodeguero.user = usuario
                bodeguero.save()

                trabajador = TrabajadorObra()
                trabajador.user = usuario
                trabajador.save()

                encargado = EncargadoCompras()
                encargado.user = usuario
                encargado.save()

            elif permisos_form.cleaned_data['tipo_usuario'] == "bodeguero":
                usuario.is_bodeguero = True
                usuario.save()
                bodeguero = Bodeguero()
                bodeguero.user = usuario
                bodeguero.save()


            elif permisos_form.cleaned_data['tipo_usuario'] == "trabajador":
                usuario.is_trabajador_obra = True
                usuario.save()
                trabajador = TrabajadorObra()
                trabajador.user = usuario
                trabajador.save()

            else:
                usuario.is_encargado_compras = True
                encargado = EncargadoCompras()
                encargado.user = usuario
                encargado.save()

            return HttpResponseRedirect('loggedin')

    else:
        user_form = UserCreateForm()
        permisos_form = PermisosForm()
    return render(request, 'create_user.html', {'user_form': user_form, 'permisos_form': permisos_form})

@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def ver_usuarios(request):
    users = list(MyUser.objects.filter())
    contexto = {'users': users }
    return render(request, 'ver_usuarios.html', contexto)


@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def edit_usuario(request, id_usuario):
    usuario = MyUser.objects.get(id=id_usuario)
    if request.method == 'GET':
        form = UserCreateForm(instance=usuario)
    else:
        form = UserCreateForm(request.POST, instance=usuario)
        if form.is_valid():
            form.save()
            return redirect('ver_usuarios')
    contexto = {'user_form': form, 'usuario': usuario}
    return render(request, 'editar_usuario.html', contexto)


@login_required(redirect_field_name='login')
@user_passes_test(admin_check, login_url='loggedin')
def delete_usuario(request, id_usuario):
    usuario = MyUser.objects.get(id=id_usuario)
    if request.method == 'POST':
        usuario.delete()
        return redirect('ver_usuarios')
    return render(request, 'delete_usuario.html', {'usuario': usuario})
