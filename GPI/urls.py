from django.urls import path
from django.contrib.auth.views import login,logout
from . import views
from django.conf import settings
urlpatterns = [
    path('index_default', views.inicio, name='index'),
    path('index', views.inicio, name='inicio'),
    path('pedido', views.SolicitudCreate, name='pedido'), #método as_view para vistas con clases
    path('', views.login, name = 'login'),
    path('auth', views.auth_view, name = 'auth'),
    path('loggedin', views.loggedin, name = 'loggedin'),
    path('invalid_login', views.invalid_login, name ='invalid_login'),
    path('logout', logout, {'next_page': settings.LOGOUT_REDIRECT_URL}, name='logout'),
    path('ver_pedidos', views.ver_pedidos, name = 'ver_pedidos'),
    path('stock', views.ver_materiales, name = 'stock'),
]
