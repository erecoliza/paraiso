from django.shortcuts import render, redirect
from django.views.generic import TemplateView, ListView, FormView, DetailView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.db.models import Q
from django.shortcuts import render_to_response

import datetime
from datetime import date

from django import forms
from .forms import PostForm

from peluqueria.models import Cliente

class Index(TemplateView):
    template_name = 'inicio.html'

class Menu(LoginRequiredMixin, TemplateView):
    template_name = "menu.html"

#class Cliente_buscar(LoginRequiredMixin, CreateView):
def Cliente_buscar(request):
    model = Cliente
    fields = ['Apellido']
    return render_to_response('cliente_buscar.html')

    model = Cliente
    fields = ['Apellido']
    template_name = "cliente_buscar.html"
    success_url = "/clientes"

    if 'q' in request.GET and request.GET['q']:
        q = request.GET['q']
        clientes = Clientes.objects.filter(Apellido__icontains=q)
        return render_to_response('cliente.html', {'clientes': clientes, 'query': q})
    else:
        return HttpResponse('Ingrese un apellido a buscar.')

class Cliente_list(LoginRequiredMixin, ListView):
    def get_queryset(self):
        return Cliente.objects.all().order_by('Apellido')
    template_name = 'cliente.html'
    context_object_name = 'cliente_list'

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
