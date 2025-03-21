<?php
// login.php

// Leer el contenido JSON recibido
$data = json_decode(file_get_contents("php://input"), true);

// Extraer y limpiar los datos recibidos
$username = isset($data['username']) ? trim($data['username']) : '';
$password = isset($data['password']) ? trim($data['password']) : '';

// Aquí se debe conectar a la base de datos y validar las credenciales.
// Este ejemplo usa valores fijos para ilustrar el proceso:
if ($username === 'admin' && $password === 'admin123') {
    echo json_encode([
        'success' => true,
        'message' => 'Login exitoso'
    ]);
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Credenciales incorrectas'
    ]);
}
?>