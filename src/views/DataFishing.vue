<template>
  <div class="container my-5">

    <!-- title -->
    <div class="row mb-5">
      <div class="col text-center">
        <h1 class="display-4 fw-bold text-warning">
         {{ $t('dataFishing.dataFishingTitle') }}
        </h1>
        <p class="text-light  fs-5">
           {{ $t('dataFishing.dataFishingSubtitle') }}
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
                {{ $t('dataFishing.importantInfo') }}
          </h3>
          
          <ul class="list-group list-group-flush bg-dark text-light">
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
                <span class="me-2 fs-5">🎟️</span>
                 {{ $t('dataFishing.onlyOfficial') }}
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">🔒</span>
              {{ $t('dataFishing.neverShareData') }}
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">⚠️</span>
               {{ $t('dataFishing.checkUrl') }}
            </li>
            
            <li class="list-group-item bg-dark text-light 
                       d-flex align-items-start">
              <span class="me-2 fs-5">📧</span>
               {{ $t('dataFishing.suspiciousEmail') }}
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