<?php
require_once '../api/CRUD.php';

session_start();

// Leer el JSON enviado
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data)){
  echo json_encode([
    'success' => false,
    'message' => 'No se recibió ID de servicio'
  ]);
  exit;
}

$idServicio = $data['idServicio'];

$crud = new CRUD();
$datosServicio = $crud->getServicioById($idServicio);

if ($datosServicio == null){
  echo json_encode([
    'success' => false,
    'message' => 'Error en la obtención de datos'
  ]);
  exit;
}

echo json_encode([
  'success' => true,
  'message' => 'Datos de servicio obtenido',
  'datos' => $datosServicio
]);

?>