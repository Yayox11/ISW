from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from GPI.models import *


class PedidoForm(forms.ModelForm):

    class Meta:
        model = SolicitudMaterial
        fields = ('material', 'urgencia',)


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

class PedidoForm2(forms.ModelForm):
    urgencia = forms.ChoiceField(choices=[('urgente','Urgente'),('normal','Normal'),('bajo','Bajo')])
    class Meta:
        model = SolicitudMaterial

        fields = [
            'fecha',
            'material',
            'cantidad',
            'urgencia',
            'trabajadorobra',
            'obra',
        ]
        labels = {
            'fecha': 'Fecha',
            'material':'Material',
            'cantidad':'Cantidad',
            'urgencia':'Urgencia',
            'trabajadorobra':'Trabajador de Obra',
            'obra':'Obra',
        }
        widgets = {
            'fecha':forms.DateInput(attrs={'class': 'form-group'}),
            'material':forms.CheckboxSelectMultiple(),
            'cantidad':forms.NumberInput(attrs={'class': 'form-group'}),
            'trabajadorobra':forms.CheckboxSelectMultiple(),
            'obra':forms.Select(attrs={'class': 'form-group'}),
        }
