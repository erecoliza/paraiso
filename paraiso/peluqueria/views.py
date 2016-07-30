from django.shortcuts import render, redirect
from django.views.generic import TemplateView, ListView, FormView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.views.generic.edit import CreateView, UpdateView, DeleteView

import datetime
from datetime import date

from django import forms
from .forms import PostForm

from peluqueria.models import Cliente

class Index(TemplateView):
    template_name = 'inicio.html'

class Menu(LoginRequiredMixin, TemplateView):
    template_name = "menu.html"

class Cliente_new(LoginRequiredMixin, FormView):
    form_class = PostForm
    template_name = "cliente_new.html"
    success_url = "/cumple"

class ClienteCreate(LoginRequiredMixin,CreateView):
    model = Cliente
    fields = ['Apellido',
    'Nombre',
    'Cumpleaños',
    'email',
    'Teléfono',
    'Tratamiento',]
    template_name = "cliente_new.html"
    success_url = "/cumple"

class Cumple(LoginRequiredMixin,ListView):
    def get_queryset(self):
        #return Cliente.cumplen_este_mes.all()
        return Cliente.objects.all().order_by('Apellido')
    template_name = "cumple.html"
    context_object_name = 'cumple_list'
