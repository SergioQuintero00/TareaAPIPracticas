<?php
require_once 'conexion.php';

class CRUD {
    private $pdo;

    public function __construct() {
        // Instanciamos la conexión a la base de datos usando la clase Conexion
        $conexion = new Conexion();
        $this->pdo = $conexion->getConexion();
    }

    /**
     * Obtiene todos los servicios con información del cliente asociado.
     * 
     * @return array Listado de servicios con datos del cliente.
     */
    public function getServicios() {
        $sql = "SELECT s.id, s.idCliente, s.asunto, s.estado, c.nombre AS cliente_nombre, 
                    c.dni AS cliente_dni, c.telefono AS cliente_telefono
                FROM Servicio s
                JOIN Cliente c ON s.idCliente = c.id
                ORDER BY s.id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtiene los datos de un servicio específico, incluyendo sus detalles.
     * 
     * @param int $id ID del servicio a consultar.
     * @return array|null Datos del servicio y un arreglo con sus detalles, o null si no se encuentra.
     */
    public function getServicioById($id) {
        // Consultar la información del servicio y del cliente
        $sql = "SELECT s.id, s.idCliente, s.asunto, s.estado, c.nombre AS cliente_nombre, 
                    c.dni AS cliente_dni, c.telefono AS cliente_telefono
                FROM Servicio s
                JOIN Cliente c ON s.idCliente = c.id
                WHERE s.id = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id]);
        $servicio = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($servicio) {
            // Consultar los detalles del servicio
            $sqlDetalles = "SELECT id, detalle FROM ServicioDetalle WHERE idServicio = :idServicio";
            $stmtDetalles = $this->pdo->prepare($sqlDetalles);
            $stmtDetalles->execute(['idServicio' => $id]);
            $detalles = $stmtDetalles->fetchAll(PDO::FETCH_ASSOC);
            $servicio['detalles'] = $detalles;
        }

        return $servicio;
    }

    /**
     * Obtiene todos los servicios de un cliente en concreto
     * 
     * @param int $idCliente ID del cliente
     * @return array|null Listado de los servicios de un cliente.
     */
    public function getServiciosPorCliente($idCliente) {
        $sql = "SELECT s.id, s.idCliente, s.asunto, s.estado
                FROM Servicio s
                WHERE s.idCliente = :idCliente
                ORDER BY s.id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':idCliente', $idCliente, PDO::PARAM_INT);
        $stmt->execute();

        $servicios = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Para cada servicio, obtenemos sus detalles y los añadimos al array.
        foreach ($servicios as &$servicio) {
            $servicio['detalles'] = $this->getDetallesServicio($servicio['id']);
        }
        
        return $servicios;
    }

    /**
     * Obtiene los detalles de un servicio por id
     * 
     * @param int $idServicio ID del servicio
     * @return array|null Listado de servicios con datos del cliente.
     */
    public function getDetallesServicio($idServicio) {
        $sql = "SELECT d.id, d.idservicio, d.detalle
                FROM serviciodetalle d
                WHERE d.idservicio = :idservicio
                ORDER BY d.id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':idservicio', $idServicio, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtiene los datos de un cliente a partir de su DNI.
     * 
     * @param string $dni DNI del cliente a buscar.
     * @return array|null Arreglo con los datos del cliente (id, nombre, dni, telefono) o null si no se encuentra.
     */
    public function getClienteByDNI($dni) {
      $sql = "SELECT id, nombre, contraseña, dni, telefono FROM Cliente WHERE dni = :dni";
      $stmt = $this->pdo->prepare($sql);
      $stmt->execute(['dni' => $dni]);
      return $stmt->fetch(PDO::FETCH_ASSOC); // Retorna false si no lo encuentra
  }
}
?>
