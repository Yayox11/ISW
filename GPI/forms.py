from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from GPI.models import *
from django.db.models import Q
from django.contrib.admin.widgets import AdminDateWidget

class SolicitudForm(forms.ModelForm):
   class Meta:
       model = SolicitudMaterial
       fields = [
            'fecha_requerida',
           'obra',
       ]

       labels = {
            'fecha_requerida': 'Fecha requerida',
            'obra': 'Obra',
        }

       widgets = {
            'fecha_requerida': forms.SelectDateWidget(attrs={'class':'form-group'}),
            'obra': forms.Select(attrs={'class':'form-group'}),
       }

class StockFrom(forms.ModelForm):
    class Meta:
        model = Materiales
        exclude = ('trabajadorobra', 'direccion')
        fields = [
            'obra'
        ]
        labels={
            'obra':'Obra'
        }
        widgets = {
            'obra': forms.Select(attrs={'class':'form-control'})
        }

    def __init__(self, user, *args, **kwargs):
        super(StockFrom, self).__init__(*args, **kwargs)
        self.fields['obra'].queryset = Obra.objects.filter(Q(bodeguero__user__email=user) | Q(trabajadorobra__user__email = user))

class MaterialForm(forms.ModelForm):
    class Meta:
        model = MaterialSolicitado
        fields = [
            'nombre',
            'cantidad',
            'unidades',
            'urgencia',
        ]

        labels = {
            'nombre': 'Nombre del material',
            'cantidad': 'Cantidad',
            'unidades': 'Unidades de medida',
            'urgencia': 'Urgencia',
        }

        widgets = {
            'nombre': forms.TextInput(attrs={'class':'form-group'}),
            'cantidad': forms.NumberInput(attrs={'class':'form-group'}),
            'unidades': forms.TextInput(attrs={'class':'form-froup'}),


        }

class MyUserCreationForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super(MyUserCreationForm, self).__init__(*args, **kwargs)
        del self.fields['username']

    class Meta:
        model = MyUser
        fields = ("email",)


##class MyUserChangeForm(UserChangeForm):
    ##def __init__(self, *args, **kwargs):
        ##super(MyUserChangeForm, self).__init__(*args, **kwargs)
        ##del self.fields['username']

    ##class Meta:
        ##model = MyUser
"""
class PedidoForm2(forms.ModelForm):
    urgencia = forms.ChoiceField(choices=[('urgente','Urgente'),('normal','Normal'),('bajo','Bajo')])
    class Meta:
        model = SolicitudMaterial

        fields = [
            'fecha_requerida',
            'material',
            'cantidad',
            'unidades',
            'urgencia',
            'obra',
        ]
        labels = {
            'fecha_requerida': 'Fecha requerida',
            'material':'Material',
            'cantidad':'Cantidad',
            'unidades':'Unidades',
            'urgencia':'Urgencia',
            'obra:': 'Obra',
        }
        widgets = {
            'fecha_requerida':forms.DateInput(attrs={'class': 'form-group'}),
            'material':forms.CheckboxSelectMultiple(),
            'cantidad':forms.NumberInput(attrs={'class': 'form-group'}),
            'unidades': forms.TextInput(attrs={'class': 'form-group'}),
            'urgencia': forms.SelectMultiple()
            'obra':forms.Select(attrs={'class': 'form-group'}),
        }
"""
