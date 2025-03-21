<?php
require_once 'CRUD.php';

// Iniciar sesión si planeas mantener al cliente logueado
session_start();

// Verificar si se recibió el DNI (por POST o GET)
if (isset($_POST['dni'])) {
    $dni = $_POST['dni'];

    $crud = new CRUD();
    $cliente = $crud->getClienteByDNI($dni);

    if ($cliente) {
        if (isset($_POST['password'])){
            $passwordGuess = $_POST['password'];
            $password = $cliente["contraseña"];

            if (password_verify($passwordGuess, $password)){
                // Guardamos info del cliente en la sesión si quieres usarla después
                $_SESSION['cliente_id'] = $cliente['id'];
                $_SESSION['cliente_nombre'] = $cliente['nombre'];
                
                // Devolver respuesta JSON indicando éxito
                echo json_encode([
                    'success' => true,
                    'message' => 'Login correcto',
                    'cliente' => $cliente
                ]);
            }else{
                // Contraseña incorrecta
                echo json_encode([
                    'success' => false,
                    'message' => 'Contraseña incorrecta'
                ]);
            }
        }else {
            // Contraseña no encontrada
            echo json_encode([
                'success' => false,
                'message' => 'No se recibió contraseña'
            ]);
        }
        
    } else {
        // Cliente no encontrado
        echo json_encode([
            'success' => false,
            'message' => 'DNI no encontrado'
        ]);
    }
} else {
    // No se recibió DNI
    echo json_encode([
        'success' => false,
        'message' => 'No se recibió el DNI'
    ]);
}
?>
