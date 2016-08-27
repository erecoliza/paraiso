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
    Cumpleaños = models.DateField('Fecha de cumpleaños', null=True, blank=True)
    email=models.CharField(max_length=200, blank=True)
    Teléfono=models.CharField(max_length=200, blank=True)
    Tratamiento=models.CharField(max_length=200)
    fecha = models.DateField('Fecha de Registro', default=date.today)

    def __str__(self):              # __unicode__ on Python 2
        return '%s %s' % (self.Apellido, self.Nombre)

    def get_absolute_url(self):
        return reverse('cliente-detail', kwargs={'pk': self.pk})

class TipoTarjeta(models.Model):
    tipo_tarjeta = models.CharField(max_length=50)

    def __str__(self):              # __unicode__ on Python 2
        return '%s' % (self.tipo_tarjeta)

    class meta:
        ordering = ['tipo_tarjeta']

class Tarjeta(models.Model):
    fecha_operacion = models.DateField('Fecha de Operación', default=date.today)
    tipo_tarjeta = models.ForeignKey(TipoTarjeta, on_delete = models.CASCADE)
    importe = models.DecimalField(max_digits=12, decimal_places=2)
    lote = models.IntegerField()
    fecha_pago = models.DateField('Fecha de pago', null=True, blank=True)

    def __str__(self):              # __unicode__ on Python 2
        return '%s, %s, %s, %s, %s' % (self.fecha_operacion, self.tipo_tarjeta, self.importe, self.lote, self.fecha_pago)

    class meta:
        ordering = ['tipo_tarjeta', 'fecha_operacion']

class TipoOperacion(models.Model):
    tipo_operacion = models.CharField(max_length=50)

    def __str__(self):              # __unicode__ on Python 2
        return '%s' % (self.tipo_operacion)

    class meta:
        ordering = ['tipo_operacion']

class Caja(models.Model):
    fecha_operacion = models.DateField('Fecha de Operación', default=date.today)
    tipo_operacion = models.ForeignKey(TipoOperacion, on_delete = models.CASCADE)
    importe = models.DecimalField(max_digits=12, decimal_places=2)
    concepto = models.CharField(max_length=255)

    def __str__(self):              # __unicode__ on Python 2
        return '%s, %s, %s, %s' % (self.fecha_operacion, self.tipo_operacion, self.importe, self.concepto)

    class meta:
        ordering = ['tipo_tarjeta', 'fecha_operacion']
