from django.conf.urls import patterns, include, url
from django.contrib import admin
from peluqueria.views import Menu, Cumple, Cliente_new
from . import views

urlpatterns = patterns('',
url(r'^$', 'django.contrib.auth.views.login',
 {'template_name':'inicio.html'}, name="login"),
 url(r'^menu/$', Menu.as_view(), name="menu"),
 url(r'^cliente_new/$', views.Cliente_new, name='cliente_new'),
 url(r'^cumple/$',Cumple.as_view(), name="cumple"),
 url(r'^admin/', admin.site.urls),
 url(r'^cerrar/$', 'django.contrib.auth.views.logout_then_login',
    name='logout'),
)
