<?php

session_start();

if (isset($_SESSION["cliente_nombre"])){
  $nombre = $_SESSION["cliente_nombre"];
  $dni = $_SESSION["cliente_dni"];
  
  echo json_encode([
    'success' => true,
    'nombre' => $nombre,
    'dni' => $dni
  ]);
}else {
  echo json_encode([
    'success' => false,
    'message' => "Sesión no iniciada"
  ]);
}

?>