<?php
require_once '../api/CRUD.php';

session_start();


if (isset($_SESSION['cliente_id'])){
  $idCliente = $_SESSION['cliente_id'];

  $crud = new CRUD();
  $servicios = $crud->getServiciosPorCliente($idCliente);

  if ($servicios){
    echo json_encode([
      'success' => true,
      'message' => 'Busqueda de servicios exitosa',
      'servicios' => $servicios
    ]);
  }else{
    echo json_encode([
      'success' => true,
      'message' => 'No existen servicios',
      'servicios' => null
    ]);
  }

}else{
  echo json_encode([
    'success' => false,
    'message' => 'No se encontró la variable ID'
  ]);
}

?>