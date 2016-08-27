from django.contrib import admin
from .models import (Cliente, TipoTarjeta, Tarjeta, TipoOperacion, Caja)

class ClienteAdmin(admin.ModelAdmin):
    list_display = ('Apellido', 'Nombre')
    list_display_links = ('Apellido', 'Nombre')
    search_fields = ['Apellido','Nombre']

    fieldsets = [
        [None, {
                'fields':[ ('Apellido',
             'Nombre')]
            }],
        ['Datos Generales', {
                'fields': [('email', 'Cumpleaños'),'Teléfono'],

            }],
        ['Tratamiento en Peluqueria Paraíso de Amor', {
            'fields': ('Tratamiento'
            , 'fecha')
        }],
        ]

class TipoTarjetaAdmin(admin.ModelAdmin):
    list_display = ('tipo_tarjeta',)
    search_fields = ['tipo_tarjeta']

class TipoOperacionAdmin(admin.ModelAdmin):
    list_display = ('tipo_operacion',)
    search_fields = ['tipo_operacion']

admin.site.register(Cliente, ClienteAdmin)
admin.site.register(TipoTarjeta, TipoTarjetaAdmin)
admin.site.register(Tarjeta)
admin.site.register(TipoOperacion, TipoOperacionAdmin)
admin.site.register(Caja)
