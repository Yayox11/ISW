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
    path('pedido2',views.pedir_view,name='pedido2'),
    path('logout', logout, {'next_page': settings.LOGOUT_REDIRECT_URL}, name='logout'),
]
