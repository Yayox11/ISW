from django.db import models

# Create your models here.
class Usuario(models.Model):
    user_name = models.CharField(max_length=50)
    password = models.CharField(max_length=50)

class Admin(Usuario):
    nombre = models.CharField(max_length=50)

class Bodeguero(Usuario):
    nombre = models.CharField(max_length=50)

class TrabajadorObra(Usuario):
    nombre = models.CharField(max_length=50)

class EncargadoCompras(Usuario):
    nombre = models.CharField(max_length=50)

class Obra(models.Model):
    direccion = models.CharField(max_length=100)
    nombre = models.CharField(max_length=50)
    trabajadorobra = models.ForeignKey(TrabajadorObra, on_delete=models.CASCADE)

class Materiales(models.Model):
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField()
    obra = models.ManyToManyField(Obra)

class SolicitudMaterial(models.Model):
    fecha = models.DateField()
    material = models.CharField(max_length=100)
    trabajadorobra = models.ManyToManyField(TrabajadorObra)
    bodeguero = models.ManyToManyField(Bodeguero)

class OrdenCompra(models.Model):
    fecha = models.DateField()
    material = models.CharField(max_length=100)
    solicitudmaterial = models.ManyToManyField(SolicitudMaterial)
    encargadocompras = models.ManyToManyField(EncargadoCompras)

