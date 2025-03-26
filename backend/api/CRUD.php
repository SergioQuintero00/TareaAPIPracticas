<?php
require_once 'conexion.php';

class CRUD
{
    private $pdo;

    public function __construct()
    {
        // Instanciamos la conexión a la base de datos usando la clase Conexion
        $conexion = new Conexion();
        $this->pdo = $conexion->getConexion();
    }

    /**
     * Obtiene todos los servicios con información del cliente asociado.
     * 
     * @return array Listado de servicios con datos del cliente.
     */
    public function getServicios()
    {
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
    public function getServicioById($id)
    {

        try {
            // Verificar si $id es un valor válido
            if (!is_numeric($id) || $id <= 0) {
                return ["success" => false, "message" => "ID no válido."];
            }

            // Consulta SQL
            $sql = 'SELECT s.id, s.idCliente, s.asunto, s.estado, s.detalles, s."ObservacionTec", s."Fecha_Entrada", 
                    s."Fecha_Salida", s."Fecha_Creacion", s."TipoServicio", c.nombre AS cliente_nombre, c.dni AS cliente_dni,
                    c.telefono AS cliente_telefono
                    FROM servicio s
                    JOIN Cliente c ON s.idCliente = c.id
                    WHERE s.id = :id';

            // Preparar y ejecutar la consulta
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id]);

            // Obtener el resultado
            $servicio = $stmt->fetch(PDO::FETCH_ASSOC);

            // Si no se encuentra el servicio
            if (!$servicio) {
                return ["success" => false, "message" => "No se encontró el servicio con ID $id"];
            }

            return ["success" => true, "data" => $servicio];
        } catch (PDOException $e) {
            // Capturar errores en la consulta
            return ["success" => false, "message" => "Error en la consulta: " . $e->getMessage()];
        }
    }

    /**
     * Obtiene todos los servicios de un cliente en concreto
     * 
     * @param int $idCliente ID del cliente
     * @return array|null Listado de los servicios de un cliente.
     */
    public function getServiciosPorCliente($idCliente)
    {
        $sql = 'SELECT s.id, s.idCliente, s.asunto, s.estado, s.detalles, s."ObservacionTec", s."Fecha_Entrada", 
                s."Fecha_Salida", s."Fecha_Creacion", s."TipoServicio"
        FROM Servicio s
        WHERE s.idCliente = :idCliente
        ORDER BY s.id';


        $stmt = $this->pdo->prepare($sql);
        $stmt->bindParam(':idCliente', $idCliente, PDO::PARAM_INT);
        $stmt->execute();

        $servicios = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return $servicios;
    }

    /**
     * Obtiene los detalles de un servicio por id
     * 
     * @param int $idServicio ID del servicio
     * @return array|null Listado de servicios con datos del cliente.
     */
    // public function getDetallesServicio($idServicio) {
    //     $sql = "SELECT d.id, d.idservicio, d.detalle
    //             FROM serviciodetalle d
    //             WHERE d.idservicio = :idservicio
    //             ORDER BY d.id";
    //     $stmt = $this->pdo->prepare($sql);
    //     $stmt->bindParam(':idservicio', $idServicio, PDO::PARAM_INT);
    //     $stmt->execute();
    //     return $stmt->fetchAll(PDO::FETCH_ASSOC);
    // }

    /**
     * Obtiene el historial de un servicio ordenado de más antiguo a más actual
     * 
     * @param int $idServicio ID del servicio
     * @return array|null Listado de servicios con datos del cliente.
     */
    public function getHistorialServicio($idServicio)
    {

        $sql = 'SELECT h.id, h."IDServicio", h."Detalle", h."Fechayhora"
                FROM "Serv_Historial" h
                WHERE h."IDServicio" = :idservicio
                ORDER BY h."Fechayhora" ASC';
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
    public function getClienteByDNI($dni)
    {
        $sql = "SELECT id, nombre, contraseña, dni, telefono FROM Cliente WHERE dni = :dni";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['dni' => $dni]);
        return $stmt->fetch(PDO::FETCH_ASSOC); // Retorna false si no lo encuentra
    }
}
