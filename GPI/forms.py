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
