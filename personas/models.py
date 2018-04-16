from django.db import models

# Create your models here.
class Cliente_interno(models.Model):
    nombre = models.CharField(max_length=200, verbose_name="Nombre",blank=False,null=True)
    rut = models.CharField(max_length=15,verbose_name="RUT",blank=False,null=True)
    correo = models.EmailField(max_length=15,verbose_name="Correo electronico", blank=True,null=True)