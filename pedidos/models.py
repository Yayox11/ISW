from django.db import models

# Create your models here.
class Solicitud_Pedido(models.Model):
    id_pedido = models.IntegerField(max_length=200, blank=False, null=False)
    estado = models.CharField(max_length=20, blank=False, null=False)

class Productos(models.Model):
    id_producto = models.IntegerField(max_length=200, blank=False, null=False)
    nombre = models.CharField(max_length=30, blank=False, null=False)
    descripcion = models.CharField(max_length=200, blank=False, null=True)

class Solicitados(models.Model):
    pedido_id = models.ForeignKey(Solicitud_Pedido,on_delete=models.PROTECT,blank=False, null=False)
    producto_id = models.ForeignKey(Productos, on_delete=models.PROTECT, blank=False, null=False)
    cantidad = models.IntegerField(default=1, blank=False, null=False)

class Inventario(models.Model):
    id_inventario = models.IntegerField(max_length= 20, blank=False,null=False)
    nombre = models.CharField(max_length= 200, blank=False,null=False)