<template>
    <div class="container-fluid bg-body-tertiary mt-auto footerStyle">
      <div class="row justify-content-center align-items-center 
                  py-3 bg-dark text-light">

        <div class="col fw-bold text-center mb-3 fs-3">CosmoScreen</div>
        <div class="col text-center fw-bold mb-3 fs-4">Elérhetőségek 
          <div class="fw-light fs-5 footerText">
            <div>CosmoScreen@gmail.com</div>
            <div>Tel.: +36303456789</div>
          </div>
        </div>
        <div class="col fw-bold text-center mb-3 fs-4">Információk

          <div class="fw-light fs-5 footerText">
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

        <p class="fs-xs text-start mb-0 text-center fw-bold fs-5">
          Minden jog fentartva CosmoScreen - 2025&copy;
        </p>
      </div>
    </div>
</template>