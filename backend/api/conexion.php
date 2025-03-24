<?php

class Conexion
{
  private $host = "localhost";
  private $dbname = "taller";
  private $dbuser = "abel";
  private $dbpassword = "12341234";
  private $pdo;

  public function __construct()
  {
    $dsn = "pgsql:host=" . $this->host . ";dbname=" . $this->dbname;
    try {
      $this->pdo = new PDO($dsn, $this->dbuser, $this->dbpassword, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
      ]);
    } catch (PDOException $e) {
      // Si ocurre un error en la conexión, se detiene el script mostrando el error.
      die("Error de conexión: " . $e->getMessage());
    }
  }

  // Método para obtener la instancia de PDO
  public function getConexion()
  {
    return $this->pdo;
  }

  public function cerrarConexion()
  {
    $this->pdo = null;
  }
}
