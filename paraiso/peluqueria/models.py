from django.db import models
from datetime import date
today = date.today

class CumplenEsteMes(models.Manager):
    def get_queryset(self):
        return super().get_queryset().filter(Cumpleaños__month=today().month)


class Cliente(models.Model):
    objects = models.Manager()
    cumplen_este_mes = CumplenEsteMes()

    Apellido = models.CharField(max_length=200)
    Nombre = models.CharField(max_length=200)
    Cumpleaños = models.DateField('Fecha de cumpleaños', blank=True)
    email=models.CharField(max_length=200, blank=True)
    Teléfono=models.CharField(max_length=200, blank=True)
    Tratamiento=models.CharField(max_length=200)
    fecha = models.DateField('Fecha de Registro', default=date.today)

    def __str__(self):              # __unicode__ on Python 2
        return '%s %s' % (self.Apellido, self.Nombre)
