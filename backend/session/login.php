<?php
require_once '../api/CRUD.php';

session_start();

// Leer el JSON enviado
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['dni'])) {
    echo json_encode([
        'success' => false,
        'message' => 'No se recibió el DNI'
    ]);
    exit;
}

$dni = $data['dni'];

$crud = new CRUD();
$cliente = $crud->getClienteByDNI($dni);

if ($cliente == null){
    echo json_encode([
        'success' => false,
        'message' => 'DNI no encontrado'
    ]);
    exit;
}

if (!isset($data['password'])) {
    echo json_encode([
        'success' => false,
        'message' => 'No se recibió contraseña'
    ]);
    exit;
}

    $passwordGuess = $data['password'];
    $password = $cliente["contraseña"];

if (!password_verify($passwordGuess, $password)) {
    echo json_encode([
        'success' => false,
        'message' => 'Contraseña incorrecta'
    ]);
    exit;
}

$_SESSION['cliente_id'] = $cliente['id'];
$_SESSION['cliente_nombre'] = $cliente['nombre'];
$_SESSION['cliente_dni'] = $cliente['dni'];

echo json_encode([
'success' => true,
'message' => 'Login correcto',
'cliente' => $cliente
]);

?>
