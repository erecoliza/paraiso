from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.views.generic import TemplateView, ListView, FormView, DetailView, View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse, HttpResponseRedirect
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from django.core.urlresolvers import reverse_lazy, reverse
from django.db.models import Q
from django.shortcuts import render_to_response
from django.template import RequestContext
from .utils import ArmoExcel, ImportarExcel
from django import forms
from django.core.paginator import Paginator
from django.core.paginator import EmptyPage
from django.core.paginator import PageNotAnInteger
from django.contrib.admin import widgets
from django.contrib.admin.widgets import AdminDateWidget


from .forms import PostForm, TipoTarjetaForm, TarjetaForm

import datetime
from datetime import date

from peluqueria.models import (Cliente, Tarjeta, TipoTarjeta)

class Index(TemplateView):
    template_name = 'inicio.html'

class Menu(LoginRequiredMixin, TemplateView):
    template_name = "menu.html"

class Cliente_buscar(LoginRequiredMixin, View):
    def get(self, request):
        if 'q' in request.GET and request.GET['q']:
            q = request.GET['q']
            return redirect(reverse('clientes') + '?q='  + q)
        return render_to_response('cliente_buscar.html')

class Cliente_list(LoginRequiredMixin, ListView):
    def get_queryset(self):
        request = self.request
        q = request.GET.get('q')
        if q:
            # Apellido o Nombre = q
           return Cliente.objects.filter(Q(Apellido__icontains=q) | Q(Nombre__icontains=q)).order_by('Apellido')
        return Cliente.objects.all().order_by('Apellido')
    template_name = 'cliente_list.html'
    context_object_name = 'cliente_list'
    paginate_by = 20

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
    paginate_by = 20

@login_required
def CumpleAExcel(request):
    if 'mes' in request.GET and request.GET['mes']:
        q = request.GET['mes']
        cumple_mes = Cliente.objects.all().filter(Cumpleaños__month=q)
        exportar = ArmoExcel(cumple_mes)
        response = HttpResponse(exportar, content_type='application/vnd.ms-excel')
        response['Content-Disposition'] = 'filename = "cumple_mes.xlsx"'
        return response
    else:
        return render_to_response('cumple_a_excel.html')

class UploadFileForm(forms.Form):
    file = forms.FileField()

@login_required
def ImportData(request):
    if request.method == "POST":
        form = UploadFileForm(request.POST,
                              request.FILES)
        if form.is_valid():
            archivo = request.FILES['file']
            importar = ImportarExcel(archivo)
            return redirect(reverse('clientes'))
        else:
            return HttpResponseBadRequest()
    else:
        form = UploadFileForm()
    return render_to_response('upload_form.html',
                              {'form':form},
                              context_instance=RequestContext(request))

class Mapa(LoginRequiredMixin, TemplateView):
    template_name = "mapa.html"

class TipoTarjeta_list(LoginRequiredMixin, ListView):
    def get_queryset(self):
        request = self.request
        q = request.GET.get('q')
        if q:
           return TipoTarjeta.objects.filter(tipo_tarjeta__icontains=q).order_by('tipo_tarjeta')
        return TipoTarjeta.objects.all().order_by('tipo_tarjeta')
    template_name = 'tipotarjeta_list.html'
    context_object_name = 'tipotarjeta_list'
    paginate_by = 10

class TipoTarjetaCreate(LoginRequiredMixin,CreateView):
    model = TipoTarjeta
    # El diseño del form se traen del form_class de Forms.py
    form_class = TipoTarjetaForm
    template_name = "tipotarjeta_new.html"
    success_url = "/tipotarjeta"

class TipoTarjetaUpdate(LoginRequiredMixin, UpdateView):
    model = TipoTarjeta
    # El diseño del form se traen del form_class de Forms.py
    form_class = TipoTarjetaForm
    template_name_suffix = '_update_form'
    success_url = "/tipotarjeta"

class TipoTarjetaDelete(LoginRequiredMixin, DeleteView):
    model = TipoTarjeta
    success_url = "/tipotarjeta"

class Tarjeta_list(LoginRequiredMixin, ListView):
    def get_queryset(self):
        request = self.request
        q = request.GET.get('q')
        if q:
           return TipoTarjeta.objects.filter(tipo_tarjeta__icontains=q).order_by('tipo_tarjeta')
        return Tarjeta.objects.all().order_by('-fecha_operacion')
    template_name = 'tarjeta_list.html'
    context_object_name = 'tarjeta_list'
    paginate_by = 10

class TarjetaCreate(LoginRequiredMixin,CreateView):
    model = Tarjeta
    """
    El diseño del form se traen del form_class de Forms.py
    No obstante puedo utilizar los campos que designo con fields
    """
    fields = ['fecha_operacion',
    'tipo_tarjeta',
    'importe',
    'lote',]
    widgets = {'fecha_operacion' : AdminDateWidget}
    template_name = "tarjeta_new.html"
    success_url = "/tarjetas"

class TarjetaUpdate(LoginRequiredMixin, UpdateView):
    model = Tarjeta
    # El diseño del form se traen del form_class de Forms.py
    form_class = TarjetaForm
    template_name_suffix = '_update_form'
    success_url = "/tarjetas"

class TarjetaDelete(LoginRequiredMixin, DeleteView):
    model = Tarjeta
    success_url = "/tarjetas"
