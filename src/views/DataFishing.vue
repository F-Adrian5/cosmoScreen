<template>
  <div class="container my-5">

    <!-- title -->
    <div class="row mb-5">
      <div class="col text-center">
        <h1 class="display-4 fw-bold text-warning">
          Adathalászat Tájékoztató
        </h1>
        <p class="text-light  fs-5">
          Csak hivatalos oldalunkon vásárolj jegyet, és védje adatait!
        </p>
      </div>
    </div>

    <!-- card -->
    <div class="row mb-4">

      <!-- content -->
      <div class="col">
        <div class="card shadow-sm rounded-4 p-4 
                    bg-dark text-light border-warning border-3">
          <h3 class="mb-3 text-warning border-secondary pb-2">
                Fontos tudnivalók
          </h3>
          
          <ul class="list-group list-group-flush bg-dark text-light">
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
                <span class="me-2 fs-5">🎟️</span>
              Csak a hivatalos mozi weboldalán vagy 
              pénztárában vásárolj jegyet.
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">🔒</span>
              Soha ne add meg a jelszavad vagy bankkártya 
              adataid ismeretlen oldalon.
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">⚠️</span>
              Figyeld a weboldal URL-jét, csak a hivatalos 
              CosmoScreen domain a biztonságos.
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">📧</span>
              Gyanús e-mail esetén ne kattints linkekre, 
              inkább lépj kapcsolatba velünk.
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<!-- scoped style -->
<style scoped>
  .list-group-item {
    font-size: 1rem;
    padding: 0.75rem 1rem;
    border: none;
  }
</style>