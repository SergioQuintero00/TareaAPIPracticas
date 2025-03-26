document.addEventListener("DOMContentLoaded", function () {
  let urlParams = new URLSearchParams(window.location.search);
  const idServicio = urlParams.get('id');
  console.log("ID obtenido de la URL:", idServicio);

  if (idServicio) {
    getDatosServicio(idServicio);
    getHistorialServicio(idServicio);
  } else {
    console.error("No se encontró el parámetro 'id' en la URL.");
  }
});

//Hace la consulta a la base de datos sobre los datos del Servicio
function getDatosServicio(idServicio) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      // Procesar la respuesta JSON del servidor
      var response = JSON.parse(this.responseText);
      if (response.success) {
        setDatosServicio(response.datos.data);
      } else {
        alert(response.message)
      }
    }
  };

  // Configurar la petición: método POST y URL del script PHP
  xmlhttp.open("POST", "../backend/servicios/getServicio.php", true);
  xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  // Convertir los datos a formato JSON y enviarlos
  var data = JSON.stringify({ idServicio: idServicio });
  xmlhttp.send(data);
}

function getHistorialServicio(idServicio) {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
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
  var data = JSON.stringify({ idServicio: idServicio });
  xmlhttp.send(data);
}

//Este método inserta los datos en el html o inserta html en la página sobre los datos del servicio
function setDatosServicio(datos) {
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

  document.getElementById("asuntoId").innerHTML = asunto + " #" + idServicio;
  document.getElementById("fechaEntrada").innerHTML = Fecha_Entrada;
  document.getElementById("fechaSalida").innerHTML = Fecha_Salida;
  document.getElementById("estado").innerHTML = estado;
  document.getElementById("tipoServicio").innerHTML = TipoServicio;
  document.getElementById("observaciones").innerHTML = ObservacionTec;
  document.getElementById("idServicio").innerHTML = idServicio;

}







//Este método inserta los datos en el html o inserta html en la página sobre el historial del servicio
function setDatosHistorial(historial) {
  const timelineContainer = document.querySelector('.timeline');
  let html;
  historial.forEach(item => {
    // Extrae los datos del historial
    const idHistorial = item.id;
    const idServicio = item.IDServicio;
    const detalle = item.Detalle;
    const fechayhora = item.Fechayhora;

    // Crea un bloque HTML para cada evento del historial
    html += `
      <div class="timeline-item">
        <br>
        <h5>Evento ${idHistorial}</h5>
        <small class="text-muted">${fechayhora}</small>
        <p class="mt-2">${detalle}</p>
      </div>
    `;
  });

  // Inserta el HTML generado en el contenedor de la línea de tiempo
  timelineContainer.innerHTML = html;
}
