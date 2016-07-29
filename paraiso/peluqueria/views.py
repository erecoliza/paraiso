from django.shortcuts import render, redirect
from django.views.generic import TemplateView, ListView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse

import datetime
from datetime import date

from django import forms
from .forms import PostForm

from peluqueria.models import Cliente

class Index(TemplateView):
    template_name = 'inicio.html'

class Menu(LoginRequiredMixin, TemplateView):
    template_name = "menu.html"

def Cliente_new(request):
        form = PostForm(request.POST)
        if request.method == "POST":
            if form.is_valid():
                post = form.save(commit=False)
                post.save()
                return redirect('/cumple')
        else:
           return render(request, 'cliente_new.html', {'form': form})


class Cumple(ListView):
    def get_queryset(self):
        #return Cliente.cumplen_este_mes.all()
        return Cliente.objects.all().order_by('Apellido')
    template_name = "cumple.html"
    context_object_name = 'cumple_list'
