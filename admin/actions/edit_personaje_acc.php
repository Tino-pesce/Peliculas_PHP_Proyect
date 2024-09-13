<?php
require_once "../../libraries/autoload.php";

$postData = $_POST;
$id = $_GET["id"] ?? false;
$fileData = $_FILES ?? FALSE;

echo "<pre>";
print_r($postData);
echo "</pre>";
echo $postData['imagen_og'];
if(!$id){
    header("Location: ../index.php?sec=admin_personajes");
}

try {
    if( $fileData ){
        if(!empty($postData['imagen_og'])){
            Imagen::borrarImagen("".$postData['imagen_og']);
        }
        $nombreImagen = Imagen::subirImagen($fileData, "");
    }
    (new Personaje())->edit($postData["nombre"], $postData["alias"], $postData["creador"], intval($postData["primera_aparicion"]), $postData["biografia"],$nombreImagen, $id);
    header('Location: ../index.php?sec=admin_personajes');
} catch (Exception $e) {
    echo $e->getMessage();
    die("Error al editar personaje");
}