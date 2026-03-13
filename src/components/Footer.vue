<template>
  <div class="container-fluid bg-body-tertiary mt-auto footerStyle">
    <div class="row justify-content-center align-items-center py-3 bg-dark text-light">
      
      <!-- brand -->
      <div class="col-lg-3 col-md-6 col-12 footer-col footerLogo text-center mb-3 fs-3">
        CosmoScreen
        <br>
        <span class="fs-6">
          &bdquo; Ahol minden képkocka egy új világ! &rdquo;
        </span>
      </div>

      <!-- location -->
      <div class="col-lg-3 col-md-6 col-12 footer-col text-center fw-bold mb-3 fs-5">
        <i class="fa-solid fa-map-location-dot"></i>
        Látogass meg minket
        <div class="fw-light fs-5 footerText">
          <div>
            6900 Makó, Posta u. 2.
          </div>
          <div>
            <a href="https://maps.google.com/?q=Makó+Posta+utca+2" 
               target="_blank" 
               class="link_color">
              Megnyitás térképen
            </a>
          </div>
        </div>
      </div>
      
      <!-- contacts -->
      <div class="col-lg-3 col-md-6 col-12 footer-col text-center fw-bold mb-3 fs-5">
        <i class="fa-solid fa-address-book"></i>
        {{ $t('footer.contacts') }}
        <div class="fw-light fs-5 footerText">
          <div>
            <i class="fa-solid fa-envelope"></i>
            CosmoScreen@gmail.com
          </div>
          <div>
            <i class="fa-solid fa-phone"></i>
            Tel.: +36303456789
          </div>
        </div>
      </div>
      
      <!-- informations -->
      <div class="col-lg-3 col-md-6 col-12 footer-col fw-bold text-center mb-3 fs-5">
        <i class="fa-solid fa-circle-info"></i>
        {{ $t('footer.informations') }}

        <div class="fw-light fs-5 footerText">
          <div>
            <RouterLink class="link_color" to="/rules">
              {{ $t('footer.regulations') }}
            </RouterLink>
          </div>
          
          <div>
            <RouterLink class="link_color" to="/dataFishing">
              {{ $t('footer.dataFishing') }}
            </RouterLink>
          </div>
        </div>
      </div>

      <hr>
      
      <!-- watermark -->
      <p class="fs-xs mb-0 text-center fw-bold fs-5">
        {{ $t('footer.copyright') }} {{ new Date().getFullYear() }} &copy;
      </p>

    </div>
  </div>
</template>