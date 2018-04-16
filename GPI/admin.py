from django.contrib import admin
from __future__ import unicode_literals
# Register your models here.

from .models import Solicitud_Pedido, Productos, Solicitados, Inventario, Cliente_interno

admin.site.register(Solicitud_Pedido)
admin.site.register(Productos)
admin.site.register(Solicitados)
admin.site.register(Inventario)
admin.site.register(Cliente_interno)