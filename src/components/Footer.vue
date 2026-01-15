<template>
  <div class="container-fluid bg-body-tertiary mt-auto footerStyle">
    <div class="row justify-content-center align-items-center 
                py-3 bg-dark text-light">
      
      <!-- brand -->
      <div class="col footerLogo text-center mb-3 fs-3">
        CosmoScreen
      </div>
      
      <!-- contacts -->
      <div class="col text-center fw-bold mb-3 fs-4">
        {{ $t('footer.contacts') }}
        <div class="fw-light fs-5 footerText">
          <div>CosmoScreen@gmail.com</div>
          <div>Tel.: +36303456789</div>
        </div>
      </div>
      
      <!-- informations -->
      <div class="col fw-bold text-center mb-3 fs-4">
        {{ $t('footer.informations') }}

        <!-- rules -->
        <div class="fw-light fs-5 footerText">
          <div>
            <RouterLink class="link_color" to="/rules">
              {{ $t('footer.regulations') }}
            </RouterLink>
          </div>
          
          <!-- data fishing -->
          <div>
            <RouterLink class="link_color" to="/dataFishing">
              {{ $t('footer.dataFishing') }}
            </RouterLink>
          </div>
        
        </div>
      </div>
      <hr>
      
      <!-- watermark -->
      <p class="fs-xs text-start mb-0 text-center fw-bold fs-5">
       {{ $t('footer.copyright') }} {{ new Date().getFullYear() }} &copy;
      </p>
    </div>
  </div>
</template>