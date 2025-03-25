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
$historialServicio = $crud->getHistorialServicio($idServicio);

if ($historialServicio == null){
  echo json_encode([
    'success' => false,
    'message' => 'No tiene historial'
  ]);
  exit;
}

echo json_encode([
  'success' => true,
  'message' => 'Historial obtenido',
  'historial' => $historialServicio
]);

?>