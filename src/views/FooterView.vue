<template>
    <div class="container-fluid bg-body-tertiary mt-auto">
      <div class="row justify-content-center py-3 bg-dark text-light">

        <div class="col fw-bold text-center">CosmoScreen</div>
        <div class="col text-center fw-bold">Elérhetőségek 
          <div class="fw-light">
            <div>CosmoScreen@gmail.com</div>
            <div>Tel.: +36303456789</div>
          </div>
        </div>
        <div class="col">Információk

          <div class="fw-light">
            <div>
              <RouterLink class="footer-info" to="/rules">
                Szabályzatok
              </RouterLink>
            </div>
            
            <div>
              <RouterLink class="footer-info" to="/dataFishing">
                Adathalászat
              </RouterLink>
            </div>
          
          </div>
        </div>

        <p class="fs-xs text-start mb-0">
          Minden jog fentartva CosmoScreen - 2025&copy;
        </p>
      </div>
    </div>
</template>