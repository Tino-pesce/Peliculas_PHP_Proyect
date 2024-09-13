<?php
    //require_once "includes/productos.php";
    require_once "libraries/funciones.php";
    //require_once "libraries/productos.php";

    $capituloSeleccionado = isset($_GET["capitulo"]) ?  $_GET["capitulo"] : false;
    $peliculas = [];
    if($capituloSeleccionado){
        
        $peliculas = (new Pelicula())->catalogo_x_personaje(intval($capituloSeleccionado));
    }

?>

<?php if( count($peliculas) > 0 ){ ?>

<h1 class="text-center my-5"> peliculas de <?= $capituloSeleccionado ?></h1>

<div class="row">
<?php foreach( $peliculas as $pelicula ) {?>
    <div class="col-3">
        <div class="card mb-3">
            <img src="<?= $pelicula->getPortada() ?>" class="card-img-top" alt="Portada de <?=$pelicula->nombre_completo()?>">
            <div class="card-body">
                <p class="fs-6 m-0 fw-bold text-danger"><?=$pelicula->nombre_completo()?></p>
                <h5 class="card-title"> <?= $pelicula->getTitulo(); ?> </h5>
                <p class="card-text"><?= $pelicula->bajada_reducida(15) ?></p>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Guion: <?= $pelicula->getGuionista() ?></li>
                <li class="list-group-item">Arte: <?= $pelicula->getArte() ?></li>
                <li class="list-group-item"><?= $pelicula->getPublicacion() ?></li>
            </ul>
            <div class="card-body">
                <div class="fs-3 mb-3 fw-bold text-center text-danger">$<?= $pelicula->precio_formateado() ?></div>
                <a href="index.php?sec=pelicula&id=<?= $pelicula->getId()?>" class="btn btn-danger w-100 fw-bold">Ver mas</a>
            </div>

        </div>
    </div>


<?php }?>
<?php }else{ ?>

    <h1>No se encontro la pelicula</h1>

<?php }?>