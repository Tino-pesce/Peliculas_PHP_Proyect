<?php
require_once '../../libraries/autoload.php';

try {
    if( !empty($_FILES["imagen"]["tmp_name"]) ){
        $nombreImagen = Imagen::subirImagen($_FILES, "");
    }
    (new Personaje)->insert($_POST["nombre"],$_POST["alias"],$_POST["creador"],$_POST["primera_aparicion"],$_POST["biografia"],$nombreImagen);
    (new Alerta())->add_alerta("Se pudo agregar Personaje", "success");
    header("Location: ../index.php?sec=admin_personajes");
} catch (\Throwable $th) {
    die("Error al insertar personaje");
}
