# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-18 03:22
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('peluqueria', '0011_auto_20160818_0019'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tarjeta',
            name='fecha_pago',
            field=models.DateField(blank=True, verbose_name='Fecha de pago'),
        ),
    ]
