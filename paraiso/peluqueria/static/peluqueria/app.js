<!-- Scripts caja_a_excel
-->

function mostrardia() {
  var today = new Date();
  var dd = today.getDate();
  var mm = today.getMonth()+1; //Enero is 0!
  var yyyy = today.getFullYear();
  if(dd<10) {
     dd='0'+dd
  }
  if(mm<10) {
     mm='0'+mm
  }
  hoy = dd+'/'+mm+'/'+yyyy;
  document.getElementById('dia').value = hoy;
  document.getElementById('caja').value = 'xdia';
  document.getElementById('divDia').style.display = '';
  document.getElementById('divMes').style.display = 'none';
  document.getElementById('divAnio').style.display = 'none';
}
function mostrarmes() {
  document.getElementById('caja').value = 'xmes';
  var d = new Date();
  document.getElementById('aniomes').value = d.getFullYear();
  document.getElementById('divDia').style.display = 'none';
  document.getElementById('divMes').style.display = '';
  document.getElementById('divAnio').style.display = 'none';
}
function mostraranio() {
  document.getElementById('caja').value = 'xanio';
  var d = new Date();
  document.getElementById('anio').value = d.getFullYear();
  document.getElementById('divDia').style.display = 'none';
  document.getElementById('divMes').style.display = 'none';
  document.getElementById('divAnio').style.display = '';
}
