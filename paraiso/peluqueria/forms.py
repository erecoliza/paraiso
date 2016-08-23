from django import forms
from django.forms import ModelForm

from peluqueria.models import (Cliente, TipoTarjeta, Tarjeta)

class PostForm(forms.ModelForm):
    class Meta:
        model = Cliente
        # todos los campos del modelo Cliente
        fields = '__all__'

class TipoTarjetaForm(forms.ModelForm):
    class Meta:
        model = TipoTarjeta
        # todos los campos del modelo TipoTarjeta
        fields = '__all__'

class TarjetaForm(forms.ModelForm):
    class Meta:
        model = Tarjeta
        # todos los campos del modelo Tarjeta
        fields = '__all__'
