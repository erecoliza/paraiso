from django import forms

from peluqueria.models import (Cliente, TipoTarjeta)

class PostForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = ('Apellido',
        'Nombre',
        'Cumpleaños',
        'email',
        'Teléfono',
        'Tratamiento',
        )

class TipoTarjetaForm(forms.ModelForm):
    class Meta:
        model = TipoTarjeta
        fields = ('tipo_tarjeta',)
