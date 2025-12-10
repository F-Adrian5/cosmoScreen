<template>
  <div class="container my-3">

    <!-- Cím -->
    <div class="row mb-5">
      <div class="col text-center">
        <h1 class="display-4 fw-bold text-primary">
          A CosmoScreen Szabályzata
        </h1>
        <p class="text-muted fs-5">
          Kérjük, olvassa el figyelmesen a következő szabályokat!
        </p>
      </div>
    </div>

    <!-- Szabályzat szakaszok card-ban -->
    <div class="row mb-4" 
         v-for="(section, index) in sections" :key="index">
      <div class="col">
        <div class="card shadow-sm rounded-4 p-4 bg-light">
          <h3 class="mb-3 text-warning border-bottom 
                     border-2 border-secondary pb-2">
              {{ section.title }}
          </h3>
          <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex align-items-start" 
                v-for="(item, i) in section.items" :key="i">
              <span>{{ item }}</span>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Kapcsolat -->
    <div class="row mt-5">
      <div class="col text-center">
        <p class="text-muted fs-6 mb-3">
          Kérdés esetén vegye fel bátran velünk a kapcsolatot!
        </p>
      </div>
    </div>

  </div>
</template>

<script setup>
const sections = [
  {
    title: 'Általános szabályok',
    items: [
      'A mozi területén minden látogató köteles a házirendet betartani.',
      'A jegyeket a mozi pénztárában vagy online lehet megváltani.',
      'A filmek elkezdése után a terembe történő belépés csak korlátozottan lehetséges.',
      'A mozi területén tilos a dohányzás.',
      'Kérjük, a mobiltelefonokat kapcsolja ki vagy némítsa el a vetítés alatt.'
    ]
  },
  {
    title: 'Biztonság és higiénia',
    items: [
      'Felhívjuk a figyelmet a kijáratok és vészkijáratok rendeltetésszerű használatára.',
      'Kérjük, tartsa tisztán a saját ülőhelyét és a környezetét.',
      'Az étel- és italmaradékokat a kijelölt helyen helyezze el.',
      'Fertőtlenítő pontok a mozi területén elérhetők.'
    ]
  },
  {
    title: 'Jegyvásárlás és visszatérítés',
    items: [
      'A jegyek csak a vásárlás során feltüntetett időpontra érvényesek.',
      'Visszatérítés csak a mozi szabályzatában rögzített feltételek mellett lehetséges.',
      'Online vásárlás esetén a jegyeket a mobiltelefonon vagy nyomtatott formában lehet bemutatni.'
    ]
  }
]
</script>

<style scoped>
.list-group-item {
  font-size: 1rem;
  padding: 0.75rem 1rem;
}
</style>