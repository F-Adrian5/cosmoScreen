<template>
  <div class="container my-3">

    <!-- title -->
    <div class="row mb-5">
      <div class="col text-center">
        <h1 class="display-4 fw-bold text-primary">
          {{ $t('regulationsPage.rulesTitle') }}
        </h1>
        <p class="text-light fs-5">
          {{ $t('regulationsPage.rulesAttention') }}
        </p>
      </div>
    </div>

    <!-- rules in card -->
    <!-- general rules card -->
    <div class="row mb-4">
      <div class="col">
        <div class="card shadow-sm rounded-4 p-4 bg-dark border-primary">
          <h3 class="mb-3 text-primary pb-2">
             {{ $t('regulationsPage.generalRules') }}
          </h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.followRules') }}</span> 
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.ticketInfo') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.enterRestriction') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.noSmoke') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.turnOffPhones') }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- safety and hygiene card-->
    <div class="row mb-4">
      <div class="col">
        <div class="card shadow-sm rounded-4 p-4 bg-dark border-primary">
          <h3 class="mb-3 text-primary pb-2">
             {{ $t('regulationsPage.safetyAndHygiene') }}
          </h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.exitAttention') }}</span> 
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.cleanSurrounding') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.leftoverArea') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.disinfectionPoint') }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- ticket card-->
    <div class="row mb-4">
      <div class="col">
        <div class="card shadow-sm rounded-4 p-4 bg-dark border-primary">
          <h3 class="mb-3 text-primary pb-2">
             {{ $t('regulationsPage.ticketPurchaseTitle') }}
          </h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.ticketDate') }}</span> 
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.returnInfo') }}</span>
            </li>
            <li class="list-group-item bg-dark text-light d-flex align-items-start">
              <span>{{ $t('regulationsPage.onlinePurchase') }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- contacts -->
    <div class="row mt-5">
      <div class="col text-center">
        <p class="text-light fs-6 mb-3">
          {{ $t('regulationsPage.contactUs') }}
        </p>
      </div>
    </div>

  </div>
</template>

<style scoped>
  .list-group-item {
    font-size: 1rem;
    padding: 0.75rem 1rem;
  }
</style>