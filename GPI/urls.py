from django.urls import path, re_path
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
    path('ver_pedido2',views.ver_pedido2,name='pedido2'),
    path('pedidos_central', views.ver_pedidos_central, name= 'pedidos_central'),
    re_path(r'^ver_solicitud/(?P<id_solicitud>\d+)/$', views.ver_solicitud, name = 'ver_solicitud'),
    re_path(r'^delete_solicitud/(?P<id_solicitud>\d+)/$', views.delete_solicitud, name='delete_solicitud'),
    re_path(r'^material_edit/(?P<id_material>\d+)/$', views.material_edit, name = 'material_edit'),
    re_path(r'^delete_material/(?P<id_material>\d+)/$', views.delete_material, name='delete_material'),
    path('upd_stock', views.upd_stock, name='upd_stock'),
    path('crear_usuario', views.CreateUsuario, name = 'crear_usuario'),
    path('ver_usuarios', views.ver_usuarios, name = 'ver_usuarios'),
    re_path(r'^editar_usuario/(?P<id_usuario>\d+)/$', views.edit_usuario, name='edit_usuario'),
    re_path(r'^delete_usuario/(?P<id_usuario>\d+)/$', views.delete_usuario, name='delete_usuario'),
    path('odoo_sol_add', views.Sol_add, name = 'odoo_sol_add'),
]
