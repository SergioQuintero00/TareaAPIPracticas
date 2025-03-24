
function validaInicio() {
  
  const dni = document.getElementById("dni");
  const password = document.getElementById("password");

  let esValido = true;

  // Validar el campo "dni"
  if (!(/^\d{8}[a-zA-Z]$/).test(dni.value)) {
    alert("DNI inválido")
    esValido = false;
    return null;
  }

  // Validar el campo "DNI"
  if (!(/^.{1,30}$/).test(password.value)) {
    alert("Introduzca una contraseña")
    esValido = false;
    return null;
  }

  if (esValido == true){
    login();
  }
}

function login(){
    // Capturar los valores del formulario
    var dni = document.getElementById('dni').value;
    var password = document.getElementById('password').value;
    
    // Crear la petición AJAX
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState === 4 && this.status === 200) {
        // Procesar la respuesta JSON del servidor
        var response = JSON.parse(this.responseText);
        if (response.success) {
          // Redirigir a menu.html si el login es exitoso
          window.location.href = "menu.html";
        } else {
          alert(response.message)
        }
      }
    };
    
    // Configurar la petición: método POST y URL del script PHP
    xmlhttp.open("POST", "../backend/session/login.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    
    // Convertir los datos a formato JSON y enviarlos
    var data = JSON.stringify({ dni: dni, password: password });
    xmlhttp.send(data);
}