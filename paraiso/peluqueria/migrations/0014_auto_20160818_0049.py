# -*- coding: utf-8 -*-
# Generated by Django 1.9.7 on 2016-08-18 03:49
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('peluqueria', '0013_auto_20160818_0047'),
    ]

    operations = [
        migrations.AlterField(
            model_name='cliente',
            name='Cumpleaños',
            field=models.DateField(blank=True, null=True, verbose_name='Fecha de cumpleaños'),
        ),
    ]
