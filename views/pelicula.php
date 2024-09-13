<?php
//require_once "includes/productos.php";
require_once "libraries/funciones.php";
require_once "libraries/productos.php";

$id = isset($_GET["id"]) ?  $_GET["id"] : false;

if ($id) {
    $pelicula = (new Pelicula())->catalogo_x_id(intVal($id));
}

?>

<div class="row">
    <?PHP if (isset($pelicula)) { ?>
        <h1 class="text-center my-5"> <?= $pelicula->nombre_completo() ?></h1>
        <div class="col">
            <div class="card mb-5">
                <div class="row g-0">
                    <div class="col-md-5">
                        <img src="<?= $pelicula->getPortada(); ?>" class="img-fluid rounded-start border-end" alt="Portada de <?= $pelicula->nombre_completo() ?>">
                    </div>
                    <div class="col-md-7 d-flex flex-column p-3">
                        <div class="card-body flex-grow-0">
                            <p class="fs-4 m-0 fw-bold text-danger"><?= $pelicula->nombre_completo() ?></p>
                            <h2 class="card-title fs-2 mb-4"><?= $pelicula->getTitulo(); ?></h2>
                            <p class="card-text"><?= $pelicula->getBajada() ?></p>
                        </div>

                        <ul class="list-group list-group-flush">
                            <li class="list-group-item"><span class="fw-bold">Guion:</span> <?= $pelicula->getGuionista(); ?></li>
                            <li class="list-group-item"><span class="fw-bold">Arte:</span> <?= $pelicula->getArte(); ?></li>
                            <li class="list-group-item"><span class="fw-bold">Publicación:</span> <?= $pelicula->getPublicacion(); ?></li>
                        </ul>

                        <div class="card-body flex-grow-0 mt-auto">
                            <div class="fs-3 mb-3 fw-bold text-center text-danger">$<?= $pelicula->precio_formateado() ?></div>
                            <form action="admin/actions/add_item_acc.php" method="get">
                                <div class="col-6 d-flex align-items-center">
                                    <label for="q" class="fw-bold me-2">Cantidad: </label>
                                    <input type="number" class="form-control" value="1" name="q" id="q">
                                </div>
                                <input type="hidden" value="<?= $pelicula->getId() ?>" name="id" id="id">
                                <input class="btn btn-danger w-100 fw-bold my-5" type="submit" value="Agregar item" />
                            </form>
                        </div>
                    </div>
                </div>
            </div>


        </div>




    <?PHP } else { ?>
        <div class="col">
            <h2 class="text-center m-5">No se encontró el producto deseado.</h2>
        </div>
    <?PHP } ?>



</div>