<?PHP

class Guionista
{
        protected $id;
        protected $nombre_completo;
        protected $biografia;
        protected $foto_perfil;

        /**
         * Get the value of nombre_completo
         */
        public function getNombreCompleto()
        {
                return $this->nombre_completo;
        }

        /**
         * Set the value of nombre_completo
         */
        public function setNombreCompleto($nombre_completo): self
        {
                $this->nombre_completo = $nombre_completo;

                return $this;
        }

        /**
         * Get the value of biografia
         */
        public function getBiografia()
        {
                return $this->biografia;
        }

        /**
         * Set the value of biografia
         */
        public function setBiografia($biografia): self
        {
                $this->biografia = $biografia;

                return $this;
        }

        /**
         * Get the value of foto_perfil
         */
        public function getFotoPerfil()
        {
                return $this->foto_perfil;
        }

        /**
         * Set the value of foto_perfil
         */
        public function setFotoPerfil($foto_perfil): self
        {
                $this->foto_perfil = $foto_perfil;

                return $this;
        }

        public function get_x_id(int $id): ?Guionista
        {
                $conexion = Conexion::getConexion();
                $query = "SELECT * FROM guionistas WHERE id = $id";

                $PDOStatement = $conexion->prepare($query);
                $PDOStatement->setFetchMode(PDO::FETCH_CLASS, self::class);
                $PDOStatement->execute();

                $resultado = $PDOStatement->fetch();

                return $resultado ? $resultado : null;
        }
        /**
         * Devuelve todos los guoinistas en base
         * @return Guionista[]
         */
        public function lista_completa(): array
        {
                $conexion = Conexion::getConexion();
                $query = "SELECT * FROM guionistas";

                $PDOStatement = $conexion->prepare($query);
                $PDOStatement->setFetchMode(PDO::FETCH_CLASS, self::class);
                $PDOStatement->execute();

                $result = $PDOStatement->fetchAll();

                return $result;
        }

        public function getId(){
                return $this->id;
        }
}