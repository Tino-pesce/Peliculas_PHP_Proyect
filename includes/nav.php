<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="img/covers/logo.png" alt="Logo" width="80" height="auto" class="d-inline-block align-text-top">
            La Tiendita de Peliculas
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="index.php?sec=home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?sec=quienes_somos">¿Quiénes somos?</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?sec=catalogo_completo">Todos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?sec=peliculas&&capitulo=1">Star wars saga</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?sec=envios">Envíos</a>
                </li>
                
               <li>

               <a class="nav-link active <?= isset($_SESSION["loggedIn"]) ? "d-none" : ""  ?>" href="index.php?sec=login">Login</a>
               </li>

               <li>

               <a class="nav-link active <?= isset($_SESSION["loggedIn"]) ? "" : "d-none"  ?>" href="admin/actions/auth_logout.php">Salir</a>
               
               </li>
            </ul>
        </div>
    </div>
</nav>
