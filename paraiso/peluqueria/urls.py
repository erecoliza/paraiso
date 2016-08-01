from django.conf.urls import patterns, include, url
from django.contrib import admin
from peluqueria.views import (Menu,
Cliente_buscar,
Cliente_list,
ClienteCreate,
ClienteUpdate,
ClienteDelete,
Cumple)

from . import views

urlpatterns = patterns('',
url(r'^$', 'django.contrib.auth.views.login',
 {'template_name':'inicio.html'}, name="login"),
 url(r'^menu/$', Menu.as_view(), name="menu"),
 url(r'^cliente_buscar/$', views.Cliente_buscar, name="cliente_buscar"),
 url(r'^clientes/$',Cliente_list.as_view(), name="clientes"),
 url(r'cliente_add/$', ClienteCreate.as_view(), name='cliente-add'),
 url(r'cliente/(?P<pk>[0-9]+)/$', ClienteUpdate.as_view(), name='cliente-update'),
 url(r'cliente/(?P<pk>[0-9]+)/delete/$', ClienteDelete.as_view(), name='cliente-delete'),
 url(r'^cumple/$',Cumple.as_view(), name="cumple"),
 url(r'^admin/', admin.site.urls),
 url(r'^cerrar/$', 'django.contrib.auth.views.logout_then_login',
    name='logout'),
)
