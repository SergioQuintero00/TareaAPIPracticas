document.addEventListener("DOMContentLoaded", function () {
  let urlParams = new URLSearchParams(window.location.search);
  const idServicio = urlParams.get('id');

  getDatosServicio(idServicio);
  getHistorialServicio(idServicio);
});

//Hace la consulta a la base de datos sobre los datos del Servicio
function getDatosServicio(idServicio){
  var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState === 4 && this.status === 200) {
        // Procesar la respuesta JSON del servidor
        var response = JSON.parse(this.responseText);
        if (response.success) {
          setDatosServicio(response.datos);
        } else {
          alert(response.message)
        }
      }
    };
    
    // Configurar la petición: método POST y URL del script PHP
    xmlhttp.open("POST", "../backend/servicios/getServicio.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    
    // Convertir los datos a formato JSON y enviarlos
    var data = JSON.stringify({idServicio: idServicio});
    xmlhttp.send(data);
}

function getHistorialServicio(idServicio){
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
    if (this.readyState === 4 && this.status === 200) {
      // Procesar la respuesta JSON del servidor
      var response = JSON.parse(this.responseText);
      if (response.success) {
        setDatosHistorial(response.historial);
      } else {
        alert(response.message)
      }
    }
  };
  
  // Configurar la petición: método POST y URL del script PHP
  xmlhttp.open("POST", "../backend/servicios/getHistorialServicio.php", true);
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  
  // Convertir los datos a formato JSON y enviarlos
  var data = JSON.stringify({idServicio: idServicio});
  xmlhttp.send(data);
}

//Este método inserta los datos en el html o inserta html en la página sobre los datos del servicio
function setDatosServicio(datos){
  const idServicio = datos.id;
  const idCliente = datos.idCliente;
  const asunto = datos.asunto;
  const estado = datos.estado;
  const detalles = datos.detalles;
  const ObservacionTec = datos.ObservacionTec;
  const Fecha_Entrada = datos.Fecha_Entrada;
  const Fecha_Salida = datos.Fecha_Salida;
  const Fecha_Creacion = datos.Fecha_Creacion;
  const TipoServicio = datos.TipoServicio;
  const cliente_nombre = datos.cliente_nombre;
  const cliente_dni = datos.cliente_dni;
  const cliente_telefono = datos.cliente_telefono;
}

//Este método inserta los datos en el html o inserta html en la página sobre el historial del servicio
function setDatosHistorial(historial){
  historial.forEach(item => {
    const idHistorial = item.id;
    const idServicio = item.IDServicio;
    const detalles = item.Detalle;
    const Fechayhora = item.Fechayhora;



  });
}