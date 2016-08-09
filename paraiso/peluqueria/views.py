from django.shortcuts import render, redirect
from django.views.generic import TemplateView, ListView, FormView, DetailView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy, reverse
from django.db.models import Q
from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required

import datetime
from datetime import date

from django import forms
from .forms import PostForm

from peluqueria.models import Cliente

class Index(TemplateView):
    template_name = 'inicio.html'

class Menu(LoginRequiredMixin, TemplateView):
    template_name = "menu.html"

@login_required
def Cliente_form(request):
    return render_to_response('cliente_buscar.html')

@login_required
def Cliente_buscar(request):
    if 'q' in request.GET and request.GET['q']:
        q = request.GET['q']
        return redirect(reverse('clientes') + '?q='  + q)
    return render_to_response('cliente_buscar.html')

class Cliente_list(LoginRequiredMixin, ListView):
    def get_queryset(self):
        request = self.request
        q = request.GET.get('q')
        if q:
           return Cliente.objects.filter(Apellido__icontains=q).order_by('Apellido')
        return Cliente.objects.all().order_by('Apellido')
    template_name = 'cliente_list.html'
    context_object_name = 'cliente_list'
    #paginate_by = 10

class ClienteCreate(LoginRequiredMixin,CreateView):
    model = Cliente
    fields = ['Apellido',
    'Nombre',
    'Cumpleaños',
    'email',
    'Teléfono',
    'Tratamiento',]
    template_name = "cliente_new.html"
    success_url = "/clientes"

class ClienteUpdate(LoginRequiredMixin, UpdateView):
    model = Cliente
    fields = ['Apellido',
    'Nombre',
    'Cumpleaños',
    'email',
    'Teléfono',
    'Tratamiento',]
    template_name_suffix = '_update_form'
    success_url = "/clientes"

class ClienteDelete(LoginRequiredMixin, DeleteView):
    model = Cliente
    success_url = "/clientes"

class Cumple(LoginRequiredMixin,ListView):
    def get_queryset(self):
        #return Cliente.cumplen_este_mes.all()
        return Cliente.objects.all().order_by('Apellido')
    template_name = "cumple.html"
    context_object_name = 'cumple_list'

@login_required
def CumpleAExcel(request):
    if 'mes' in request.GET and request.GET['mes']:
        q = request.GET['mes']
        cumple_mes = Cliente.objects.all().filter(Cumpleaños__month=q)
        return render(request, 'cumple.html' , {'cumple_list':cumple_mes})
    else:
        return render_to_response('cumple_a_excel.html')
