<template>
  <div v-if="modal.show">
    <div class="modal fade show d-block">
      <div class="modal-dialog">
        <div class="modal-content custom-modal" :class="modal.type">

          <div class="modal-header text-white">
            <h5 class="modal-title">{{ modal.title }}</h5>
          </div>

          <div class="modal-body text-white">
            <p>{{ modal.message }}</p>
          </div>

          <div class="modal-footer">
            <button v-if="modal.showCancel"
                    class="btn btn-danger"
                    @click="modal.cancel">
              Cancel
            </button>

            <button class="btn"
                    style="background-color: rgb(130, 194, 193);"
                    @click="modal.confirm">
              OK
            </button>
          </div>

        </div>
      </div>
    </div>

    <div class="modal-backdrop fade show"></div>
  </div>
</template>

<script setup lang="ts">
  import { useModalStore } from '@/stores/modal'

  const modal = useModalStore()
</script>