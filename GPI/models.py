from django.db import models
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
# Create your models here.


class MyUserManager(BaseUserManager):
    def create_user(self, email, first_name, second_name, apellido_paterno, apellido_materno, rut, password=None, **extra_fields):
        if not email:
            raise ValueError('Los usuarios deben tener una dirección de correo')

        user = self.model(
            email=self.normalize_email(email),
            rut=rut,
            first_name = first_name,
            second_name = second_name,
            apellido_paterno = apellido_paterno,
            apellido_materno = apellido_materno,
            **extra_fields,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, first_name, second_name, apellido_paterno, apellido_materno, rut, password, **extra_fields):
        user = self.create_user(
            email,
            second_name=second_name,
            password=password,
            rut=rut,
            first_name=first_name,
            apellido_paterno = apellido_paterno,
            apellido_materno = apellido_materno,
            **extra_fields,
        )
        user.is_superuser = True
        user.is_admin = True
        user.save(using=self._db)
        return user

    def create_bodeguero(self, email, first_name, second_name, apellido_paterno, apellido_materno, rut, password, **extrafields):
        user = self.create_user(
            email,
            first_name = first_name,
            second_name = second_name,
            password = password,
            rut = rut,
            apellido_paterno = apellido_paterno,
            apellido_materno = apellido_materno,
            **extrafields,
        )
        user.is_bodeguero = True
        user.save(using=self._db)
        return user

def create_trabajador(self, email, first_name, second_name, apellido_paterno, apellido_materno, rut, password,**extrafields):
        user = self.create_user(
            email,
            first_name=first_name,
            second_name=second_name,
            password=password,
            rut=rut,
            apellido_paterno=apellido_paterno,
            apellido_materno=apellido_materno,
            **extrafields,
        )
        user.is_trabajador_obra = True
        user.save(using=self._db)
        return user


def create_encargado_compras(self, email, first_name, second_name, apellido_paterno, apellido_materno, rut, password,
                     **extrafields):
    user = self.create_user(
        email,
        first_name=first_name,
        second_name=second_name,
        password=password,
        rut=rut,
        apellido_paterno=apellido_paterno,
        apellido_materno=apellido_materno,
        **extrafields,
    )
    user.is_encargado_compras = True
    user.save(using=self._db)
    return user


class MyUser(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique = True,
    )
    first_name = models.CharField(max_length=254)
    second_name = models.CharField(max_length=254, blank=True)
    apellido_paterno = models.CharField(max_length=254)
    apellido_materno = models.CharField(max_length=254, blank=True)
    rut = models.CharField(max_length=9)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_bodeguero = models.BooleanField(default=False)
    is_trabajador_obra = models.BooleanField(default=False)
    is_encargado_compras = models.BooleanField(default=False)

    objects = MyUserManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['first_name','second_name','apellido_paterno', 'apellido_materno','rut']

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

class Bodeguero(models.Model):
    user = models.OneToOneField(MyUser, on_delete=models.CASCADE, primary_key=True)


class TrabajadorObra(models.Model):
    user = models.OneToOneField(MyUser, on_delete=models.CASCADE, primary_key=True)


class EncargadoCompras(models.Model):
    user = models.OneToOneField(MyUser, on_delete=models.CASCADE, primary_key=True)


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

    def __str__(self):
        return self.nombre


class SolicitudMaterial(models.Model):
    numero_orden = models.AutoField(primary_key=True)
    fecha_solicitud = models.DateField()
    fecha_requerida = models.DateField()
    fecha_estimada = models.DateField(null=True, blank=True)
    trabajadorobra = models.ForeignKey(TrabajadorObra, on_delete=models.CASCADE)
    obra = models.ForeignKey(Obra, on_delete=models.CASCADE)


class MaterialSolicitado(models.Model):
    URGENCIA_CHOICES = (
        ('urgente','Urgente'),
        ('normal', 'Normal'),
        ('baja', 'Baja'),
    )
    nombre = models.CharField(max_length=100)
    cantidad = models.IntegerField()
    urgencia = models.CharField(max_length=10, choices=URGENCIA_CHOICES)
    unidades = models.CharField(max_length=20)
    solicitud = models.ForeignKey(SolicitudMaterial, on_delete=models.CASCADE)


class OrdenCompra(models.Model):
    fecha = models.DateField()
    material = models.CharField(max_length=100)
    solicitudmaterial = models.ManyToManyField(SolicitudMaterial)
    encargadocompras = models.ManyToManyField(EncargadoCompras)

