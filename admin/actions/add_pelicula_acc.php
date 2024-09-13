<?php
require_once "../../libraries/autoload.php";

$postData = $_POST;
$personajes_secundarios = $_POST['personajes_secundarios'] ?? false;

try{
    $comic = new Pelicula();
    $imagen = Imagen::subirImagen($_FILES, __DIR__ . "");
    $id_pelicula = $pelicula->insert(
        $postData['titulo'],
        $postData['personaje_principal_id'],
        $postData['capitulo_id'],
        $postData['guionista_id'],
        $postData['artista_id'],
        $postData['volumen'],
        $postData['numero'],
        $postData['publicacion'],
        $postData['origen'],
        $postData['editorial'],
        $postData['bajada'],
        $imagen,
        $postData['precio']
    );
    if(!empty($_POST['personajes_secundarios'])){
        foreach( $personajes_secundarios as $personaje_id ){
            $pelicula->add_personajes_sec($id_pelicula, $personaje_id);
          }
    }
    (new Alerta())->add_alerta("Se pudo agregar Pelicula", "success");
    header('Location: ../index.php?sec=admin_peliculas');
}catch( Exception $e ){
    echo "<pre>";
    print_r($e->getMessage());
    echo "<pre>";
    die("No se pudo cargar el personaje =(");
}
