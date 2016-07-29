from django import forms

from peluqueria.models import Cliente

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
