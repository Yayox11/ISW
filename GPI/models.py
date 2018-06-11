from django.db import models
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
# Create your models here.


class MyUserManager(BaseUserManager):
    def create_user(self, email, rut, password=None, **extra_fields):
        if not email:
            raise ValueError('Los usuarios deben tener una dirección de correo')

        user = self.model(
            email=self.normalize_email(email),
            rut=rut,
            **extra_fields,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, rut, password, **extra_fields):
        user = self.create_user(
            email,
            password=password,
            rut=rut,
            **extra_fields,
        )
        user.is_superuser = True
        user.is_admin = True
        user.save(using=self._db)
        return user


class MyUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique = True,
    )
    username = models.CharField(max_length=254, unique=True)
    rut = models.CharField(max_length=9)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['rut']

    class Meta:
        verbose_name = ('user')
        verbose_name_plural = ('users')

    def __str__(self):
        return self.email

    def get_absolute_url(self):
        return "/users/%s/" % urlquote(self.email)

    def has_perm(self, perm, obj = None):
        return True

    def has_module_perm(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin


class Admin(MyUser):
    nombre = models.CharField(max_length=50)


class Bodeguero(MyUser):
    nombre = models.CharField(max_length=50)


class TrabajadorObra(MyUser):
    nombre = models.CharField(max_length=50)


class EncargadoCompras(MyUser):
    nombre = models.CharField(max_length=50)


class Obra(models.Model):
    direccion = models.CharField(max_length=100)
    nombre = models.CharField(max_length=50)
    trabajadorobra = models.ForeignKey(TrabajadorObra, on_delete=models.CASCADE)
    bodeguero = models.ManyToManyField(Bodeguero)

    def __str__(self):
        return self.nombre


class Materiales(models.Model):
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField()
    obra = models.ManyToManyField(Obra)


class SolicitudMaterial(models.Model):
    fecha = models.DateField()
    material = models.CharField(max_length=100)
    urgencia = models.CharField(max_length=1)
    trabajadorobra = models.ManyToManyField(TrabajadorObra)
    bodeguero = models.ManyToManyField(Bodeguero)


class OrdenCompra(models.Model):
    fecha = models.DateField()
    material = models.CharField(max_length=100)
    solicitudmaterial = models.ManyToManyField(SolicitudMaterial)
    encargadocompras = models.ManyToManyField(EncargadoCompras)

