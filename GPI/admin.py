from django.contrib import admin
from django import forms
from django.contrib.auth.models import Group
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.contrib.auth.forms import ReadOnlyPasswordHashField
from GPI.models import *


class UserCreationForm(forms.ModelForm):
    password1 = forms.CharField(label = 'Password', widget=forms.PasswordInput)
    password2 = forms.CharField(label = 'Password confirmation', widget=forms.PasswordInput)

    class Meta:
        model = MyUser
        fields = ('email', 'rut')

    def clean_password2(self):
        password1 = self.cleaned_data.get("password1")
        password2 = self.cleaned_data.get("password2")
        if password1 and password2 and password1 != password2:
            raise forms.ValidationError("Passwords don't match")
        return password2

    def save(self, commit=True):
        user = super().save(commit = False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user


class UserChangeForm(forms.ModelForm):
    password = ReadOnlyPasswordHashField()

    class Meta:
        model = MyUser
        fields = ['email', 'first_name', 'second_name', 'apellido_paterno', 'apellido_materno', 'password', 'rut', 'is_active', 'is_admin', 'is_bodeguero', 'is_encargado_compras', 'is_trabajador_obra']

    def clean_password(self):
        return self.initial["password"]


class UserAdmin(BaseUserAdmin):
    form = UserChangeForm
    add_form = UserCreationForm

    list_display = ('email', 'first_name', 'second_name', 'apellido_paterno', 'apellido_materno', 'rut', 'is_admin', 'is_bodeguero', 'is_encargado_compras', 'is_trabajador_obra')
    list_filter = ('is_admin', 'is_bodeguero', 'is_trabajador_obra', 'is_encargado_compras')

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('rut', 'first_name', 'second_name','apellido_paterno', 'apellido_materno',)}),
        ('Permissions', {'fields': ('is_admin', 'is_bodeguero', 'is_encargado_compras', 'is_trabajador_obra',)}),
    )

    add_fieldsets = (
        (None, {
            'classes':('wide',),
            'fields': ('email', 'rut', 'first_name', 'second_name', 'apellido_paterno', 'apellido_materno', 'password1', 'password2')}
        ),
    )
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ()


admin.site.register(MyUser, UserAdmin)
admin.site.register(Bodeguero)
admin.site.register(TrabajadorObra)
admin.site.register(EncargadoCompras)
admin.site.register(Obra)
admin.site.register(Materiales)
admin.site.register(SolicitudMaterial)
admin.site.register(MaterialSolicitado)
admin.site.unregister(Group)


# Register your models here.
