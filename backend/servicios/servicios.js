
//Esto es un evento que el menu.html crear un accordion personalizado 
//esto proximamente sera cambiado por las consultas y un bucle para añadir todos los servicios

document.addEventListener("DOMContentLoaded", function () {
  getServiciosCliente();
  setNombreCliente();

  // Función para el filtrado por estado
  const filterSelect = document.getElementById("filterStatus");
  filterSelect.addEventListener("change", function () {
    const selectedStatus = this.value;
    const accordionItems = document.querySelectorAll(".accordion-item");
    accordionItems.forEach(item => {
      const itemStatus = item.getAttribute("data-status");
      // Si se selecciona "todos" o el estado coincide, se muestra el item
      if (selectedStatus === "todos" || itemStatus === selectedStatus) {
        item.style.display = "";
      } else {
        item.style.display = "none";
      }
    });
  });
});

//Esto redirije a la página para ver los datos del servicio y pasa el id por la url
function verDatosServicio(idServicio) { 
  window.location.href = "detallesServicio.html?id=" + idServicio;
}

function getServiciosCliente() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      // Procesar la respuesta JSON del servidor
      var response = JSON.parse(this.responseText);
      if (response.success) {
        setServicios(response.servicios);
      } else {
        alert("Sesión no iniciada");
      }
    }
  };


  // Configurar la petición: método POST y URL del script PHP
  xmlhttp.open("POST", "../backend/servicios/getServiciosClientes.php", true);
  xmlhttp.send();
}

function setServicios(servicios) {
  const divPadre = document.getElementById("accordionServicios");
  divPadre.innerHTML = ""; // Limpiar contenido anterior

  if (servicios != null) {
    servicios.forEach(servicio => {
      const idServicio = servicio.id;
      const asunto = servicio.asunto;
      const estado = servicio.estado;
      // Asumimos que 'detalles' es un array y lo unimos en una cadena HTML
      const detalle = Array.isArray(servicio.detalles)
        ? servicio.detalles.map(d => d.detalle).join("<br>")
        : "";

      // Determinar la clase del badge según el estado
      let badgeClass = "";
      switch (estado) {
        case "Completado":
          badgeClass = "bg-success";
          break;
        case "Pendiente":
          badgeClass = "bg-warning";
          break;
        case "En proceso":
          badgeClass = "bg-info";
          break;
        default:
          badgeClass = "bg-secondary";
      }

      // Usamos un template string para crear el HTML
      const accordionItem = `
              <div class="accordion-item" data-status="${estado.toLowerCase()}">
                <h2 class="accordion-header" id="heading${idServicio}">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${idServicio}" aria-controls="collapse${idServicio}">
                    <span class="me-auto">${asunto}</span>
                    <span class="me-3">#${idServicio}</span>
                    <div class="badge ${badgeClass}">${estado}</div>
                  </button>
                </h2>
                <div id="collapse${idServicio}" class="accordion-collapse collapse" aria-labelledby="heading${idServicio}" data-bs-parent="#accordionServicios">
                  <div class="accordion-body">
                    ${detalle}
                    <a href="servicio.html" class="btn  btn-dark float-end">Ver detalles</a>
                  </div>
                </div>
              </div>
            `;

      divPadre.innerHTML += accordionItem;
    });
  } else {
    divPadre.innerHTML = "<p> No existe ningún servicio </p>";
  }
}

function setNombreCliente() {
  var etiqueta = document.getElementById("nombre_cliente");

  var xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      var respuesta = JSON.parse(this.responseText);
      if (respuesta.success) {
        etiqueta.innerHTML = respuesta.nombre;
      }
    }
  }

  xmlhttp.open("OPEN", "../backend/session/getDatosClientes.php", true);
  xmlhttp.send();
}

function salirSesion() {
  var xmlhttp = new XMLHttpRequest();
  xmlhttp.open("POST", "../backend/session/logout.php");
  xmlhttp.send();
}
