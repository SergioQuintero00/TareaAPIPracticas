
function validaInicio() {
  
  const nombre = document.getElementById("nombre");
  const password = document.getElementById("password");

  const errorAlias = document.getElementById("errorNombre");
  const errorPassword = document.getElementById("errorPassword");

  let esValido = true;

  // Validar el campo "nombre"
  if (!(/^.{3,30}$/).test(nombre.value)) {
    errorAlias.style.display = "inline";
    esValido = false;
  } else {
    errorAlias.style.display = "none";
  }

  // Validar el campo "DNI"
  if (!(/^.{3,30}$/).test(password.value)) {
    errorPassword.style.display = "inline";
    esValido = false;
  } else {
    errorPassword.style.display = "none";
  }

  if (esValido == true){
    login();
  }
}

function login(){
    // Capturar los valores del formulario
    var username = document.getElementById('username').value;
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
          document.getElementById("loginMessage").innerHTML = "Error: " + response.message;
        }
      }
    };
    
    // Configurar la petición: método POST y URL del script PHP
    xmlhttp.open("POST", "login.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    
    // Convertir los datos a formato JSON y enviarlos
    var data = JSON.stringify({ username: username, password: password });
    xmlhttp.send(data);
}