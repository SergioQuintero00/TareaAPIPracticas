<?php
require_once 'Conexion.php';

// Datos del usuario a insertar
$nombre = "sergio";
$dni = "22222222R";
$telefono = "601058114";
$passwordPlano = "sergio";

// Hashear la contraseña
$passwordHash = password_hash($passwordPlano, PASSWORD_DEFAULT);

try {
    // Crear instancia de conexión y obtener el PDO
    $conexion = new Conexion();
    $pdo = $conexion->getConexion();

    // Insertar el usuario en la tabla Cliente
    $stmt = $pdo->prepare("INSERT INTO Cliente (nombre, dni, telefono, contraseña) VALUES (:nombre, :dni, :telefono, :password)");
    $stmt->bindParam(':nombre', $nombre);
    $stmt->bindParam(':dni', $dni);
    $stmt->bindParam(':telefono', $telefono);
    $stmt->bindParam(':password', $passwordHash);
    $stmt->execute();

    echo "Usuario 'sergio' insertado correctamente.";
} catch (PDOException $e) {
    echo "Error al insertar usuario: " . $e->getMessage();
}
?>