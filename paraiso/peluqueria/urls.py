from django.conf.urls import patterns, include, url
from django.contrib import admin
from peluqueria.views import (Menu,
Cliente_buscar,
Cliente_list,
ClienteCreate,
ClienteUpdate,
ClienteDelete,
Tarjeta_list,
TarjetaCreate,
TarjetaUpdate,
TarjetaDelete,
Cumple,
CumpleAExcel,
ImportData,
Mapa,
TipoTarjeta_list,
TipoTarjetaCreate,
TipoTarjetaUpdate,
TipoTarjetaDelete,
UploadFileForm,)

from . import views

urlpatterns = patterns('',
url(r'^$', 'django.contrib.auth.views.login',
 {'template_name':'inicio.html'}, name="login"),
 url(r'^menu/$', Menu.as_view(), name="menu"),
 url(r'^cliente_buscar/$', Cliente_buscar.as_view(), name="cliente-buscar"),
 url(r'^clientes/$',Cliente_list.as_view(), name="clientes"),
 url(r'^cliente_add/$', ClienteCreate.as_view(), name='cliente-add'),
 url(r'^cliente/(?P<pk>[0-9]+)/$', ClienteUpdate.as_view(), name='cliente-update'),
 url(r'^cliente/(?P<pk>[0-9]+)/delete/$', ClienteDelete.as_view(), name='cliente-delete'),
 url(r'^tarjetas/$',Tarjeta_list.as_view(), name="tarjeta"),
 url(r'^tarjeta_add/$', TarjetaCreate.as_view(), name='tarjeta-add'),
 url(r'^tarjeta/(?P<pk>[0-9]+)/$', TarjetaUpdate.as_view(), name='tarjeta-update'),
 url(r'^tarjeta/(?P<pk>[0-9]+)/delete/$', TarjetaDelete.as_view(), name='tarjeta-delete'),
 url(r'^cumple/$',Cumple.as_view(), name="cumple"),
 url(r'^cumple_a_excel/$', views.CumpleAExcel, name="cumple_a_excel"),
 url(r'^import_excel/$', views.ImportData, name="import_data"),
 url(r'^mapa/$', Mapa.as_view(), name="mapa"),
 url(r'^tipotarjeta/$',TipoTarjeta_list.as_view(), name="tipotarjeta"),
 url(r'^tipotarjeta_add/$', TipoTarjetaCreate.as_view(), name='tipotarjeta-add'),
 url(r'^tipotarjeta/(?P<pk>[0-9]+)/$', TipoTarjetaUpdate.as_view(), name='tipotarjeta-update'),
 url(r'^tipotarjeta/(?P<pk>[0-9]+)/delete/$', TipoTarjetaDelete.as_view(), name='tipotarjeta-delete'),
 url(r'^admin/', admin.site.urls),
 url(r'^cerrar/$', 'django.contrib.auth.views.logout_then_login',
    name='logout'),
)
