
//Esto es un evento que el menu.html crear un accordion personalizado 
//esto proximamente sera cambiado por las consultas y un bucle para añadir todos los servicios

document.addEventListener("DOMContentLoaded", function () {

    const idServicio = 5214;
    const asunto = "El coche pierde aceite";
    const estado = "Pendiente";
    const detalle = "El coche esta perdiendo aceite por un agujero en el motor en la zona inferior";

    const divPadre = document.getElementById("accordionServicios");
    //id es el atributo id
    const collapseVar = "collapse" + idServicio;
    const headingVar = "heading" + idServicio;
    //Creamos el div padre de cada elemento del accordion
    const divAcordion = document.createElement("div");
    divAcordion.className = "accordion-item";
    //Creamos el h2 que ira dentro del div
    const h2 = document.createElement("h2");
    h2.className = "accordion-header";
    h2.id = headingVar;
    //Creamos el button que va dentro del h2
    const button = document.createElement("button");
    button.className = "accordion-button collapsed";
    button.type = "button";
    //Asignamos los atributos de esta manera
    button.setAttribute("data-bs-toggle", "collapse");
    button.setAttribute("data-bs-target", "#" + collapseVar);
    button.setAttribute("aria-controls", collapseVar);
    //Creamos los span y div que van dentro del button
    const spanAsunto = document.createElement("span");
    spanAsunto.className = "me-auto";
    //Aqui editamos y ponemos la variable con el asunto
    spanAsunto.textContent = asunto;
    const spanId = document.createElement("span");
    spanId.className = "me-3";
    //Aqui editamos y ponemos la variable con el ID
    spanId.textContent = idServicio;

    const divEstado = document.createElement("div");
    //Creamos un div para depende de que estado sea tener un color y contenido diferente
    if (estado === "Completado") {
        divEstado.className = "badge bg-success";
        divEstado.textContent = "Completado";
    }
    else if (estado === "Pendiente") {
        divEstado.className = "badge bg-warning";
        divEstado.textContent = "Pendiente"
    }
    else if (estado === "En proceso") {
        divEstado.className = "badge bg-info";
        divEstado.textContent = "En proceso"
    }
    const divCollapse = document.createElement("div");
    divCollapse.className = "accordion-collapse collapse";
    divCollapse.id = collapseVar;
    divCollapse.setAttribute("aria-labelledby", headingVar);
    divCollapse.setAttribute("data-bs-parent", "#accordionServicios");

    const divAcordionBody = document.createElement("div");
    divAcordionBody.className = "accordion-body";
    //Añadir la variable de los detalles
    divAcordionBody.textContent = detalle;

    divCollapse.appendChild(divAcordionBody);
    button.appendChild(spanAsunto);
    button.appendChild(spanId);
    button.appendChild(divEstado);
    h2.appendChild(button);
    divAcordion.appendChild(h2);
    divAcordion.appendChild(divCollapse);
    divPadre.appendChild(divAcordion)

});