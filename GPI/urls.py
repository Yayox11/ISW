from django.urls import path
from django.contrib.auth.views import login,logout
from . import views
urlpatterns = [
    path('index_default', views.index, name='index'),
    path('index', views.inicio, name='inicio'),
    path('pedido', views.PedidoCreate.as_view(), name='pedido'), #método as_view para vistas con clases
    path('', views.login, name = 'login'),
    path('auth', views.auth_view, name = 'auth'),
    path('loggedin', views.loggedin, name = 'loggedin'),
    path('invalid_login', views.invalid_login, name ='invalid_login'),
]
