<?php

$id = $_GET['id'] ?? FALSE;
$peliculas = (new Pelicula())->catalogo_x_id($id);
$capitulos = (new Capitulo())->lista_completa();
$personajes = (new Personaje())->lista_completa();
$guionistas = (new Guionista())->lista_completa();
$artistas = (new Artista())->lista_completa();

?>

<div class="row my-5">
    <div class="col">

        <h1 class="text-center mb-5 fw-bold">Edición de datos de: <span class="text-danger"><?= $pelicula->nombre_completo() ?><span></h1>
        <div class="row mb-5 d-flex align-items-center">
            <div class="row mb-5 d-flex align-items-center">

                <form class="row g-3" action="actions/edit_pelicula_acc.php?id=<?= $pelicula->getId() ?>" method="POST" enctype="multipart/form-data">

                    <div class="col-md-6 mb-3">
                        <label for="titulo" class="form-label">Titulo</label>
                        <input type="text" class="form-control" id="titulo" name="titulo" required value="<?= $pelicula->getTitulo() ?>">
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="capitulo_id" class="form-label">Capitulo</label>
                        <select class="form-select" name="capitulo_id" id="capitulo_id" required>
                            <option value="" selected disabled>Elija una opción</option>
                            <?PHP foreach ($capitulos as $S) { ?>
                                <option value="<?= $S->getId() ?>" <?= $S->getId() == $pelicula->getSerieId() ? "selected" : "" ?>>
                                    <?= $S->getNombre() ?></option>
                            <?PHP } ?>
                        </select>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="personaje_principal_id" class="form-label">Personaje Principal</label>
                        <select class="form-select" name="personaje_principal_id" id="personaje_principal_id" required>
                            <option value="" selected disabled>Elija una opción</option>
                            <?PHP foreach ($personajes as $P) { ?>
                                <option value="<?= $P->getId() ?>" <?= $P->getId() == $pelicula->getPersonajePrincipalId() ? "selected" : "" ?>><?= $P->getNombre() ?></option>
                            <?PHP } ?>
                        </select>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="volumen" class="form-label">Volumen</label>
                        <input type="number" class="form-control" id="volumen" name="volumen" required value="<?= $pelicula->getVolumen() ?>">
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="number" class="form-label">Numero</label>
                        <input type="number" class="form-control" id="numero" name="numero" required value="<?= $pelicula->getNumero() ?>">
                    </div>

				<div class="col-md-4 mb-3">
					<label for="portada_og" class="form-label">Portada Actual</label>
					<img src="<?= $pelicula->getPortada() ?>" alt="Imágen Illustrativa de <?= $pelicula->getTitulo() ?>" class="img-fluid rounded shadow-sm d-block">
					<input class="form-control" type="hidden" id="portada_og" name="portada_og" required value="<?= $pelicula->getPortada() ?>">
				</div>

                <div class="col-md-4 mb-3">
					<label for="imagen" class="form-label">Reemplazar Portada</label>
					<input class="form-control" type="file" id="imagen" name="imagen">
				</div>

                    <div class="col-md-6 mb-3">
                        <label for="publicacion" class="form-label">Publicacion</label>
                        <input type="date" class="form-control" id="publicacion" name="publicacion" required value="<?= $pelicula->getPublicacion() ?>">
                    </div>


                    <div class="col-md-6 mb-3">
                        <label for="guionista_id" class="form-label">Guionista</label>
                        <select class="form-select" name="guionista_id" id="guionista_id" required>
                            <option value="" selected disabled>Elija una opción</option>
                            <?PHP foreach ($guionistas as $G) { ?>
                                <option <?= $G->getId() == $pelicula->getGuionistaId() ? "selected" : "" ?> value="<?= $G->getId() ?>"><?= $G->getNombreCompleto() ?></option>
                            <?PHP } ?>
                        </select>
                    </div>

                    <div class="col-md-6 mb-3">
                        <label for="artista_id" class="form-label">Artista</label>
                        <select class="form-select" name="artista_id" id="artista_id" required>
                            <option value="" selected disabled>Elija una opción</option>
                            <?PHP foreach ($artistas as $A) { ?>
                                <option <?= $A->getId() == $pelicula->getArtistaId() ? "selected" : "" ?> value="<?= $A->getId() ?>"><?= $A->getNombreCompleto() ?></option>
                            <?PHP } ?>
                        </select>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="origen" class="form-label">Origen</label>
                        <select class="form-select" name="origen" id="origen" required>
                            <option value="" selected disabled>Elija una opción</option>
                            <option <?= $pelicula->getOrigen() == "Estados Unidos" ? "selected" : "" ?>>Estados Unidos</option>
                            <option <?= $pelicula->getOrigen() == "Europa" ? "selected" : "" ?>>Europa</option>
                            <option <?= $pelicula->getOrigen() == "Argentina" ? "selected" : "" ?>>Argentina</option>
                        </select>
                    </div>

                    <div class="col-md-4 mb-3">
                        <label for="editorial" class="form-label">Editorial</label>
                        <input type="text" class="form-control" id="editorial" name="editorial" required value="<?= $pelicula->getEditorial() ?> ">
                    </div>


                    <div class="col-md-4 mb-3">
                        <label for="precio" class="form-label">Precio</label>
                        <input type="number" class="form-control" id="precio" name="precio" required value="<?= $pelicula->getPrecio() ?>">
                    </div>

                    <div class="col-md-12 mb-3">

                    <label class="form-label d-block">Personajes Secundarios</label>   
                        <?php foreach( $personajes as $p ){ 
                            $ps_selected = $pelicula->getPersonajeSecundarioIds();    
                        ?>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="checkbox" <?= in_array($p->getId(), $ps_selected) ? "checked" : "" 
                                ?>
                                value="<?=$p->getId()?>"
                                name="personajes_secundarios[]"
                                />
                                <label class="form-check-label mb-2"  > <?= $p->getNombre() ?> </label>
                            </div>                            
                        <?php } ?>    
                    </div>

                    <div class="col-md-12 mb-3">
                        <label for="bajada" class="form-label">Bajada</label>
                        <textarea class="form-control" id="bajada" name="bajada" rows="7"><?= $comic->getBajada() ?></textarea>
                    </div>


                    <button type="submit" class="btn btn-primary">Editar</button>
                </form>
            </div>
        </div>
    </div>