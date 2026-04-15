import { defineStore } from 'pinia'
import type { ModalOptions } from '@/types/Modal'
import { ModalPreset, ModalType } from '@/types/Modal'
import { modalPresets } from '@/config/modalPresets'

interface ModalState {
  show: boolean
  title: string
  message: string
  type: ModalType
  showCancel: boolean
  resolver: ((value: boolean) => void) | null
}

export const useModalStore = defineStore('modal', {
  state: (): ModalState => ({
    show: false,
    title: '',
    message: '',
    type: ModalType.INFO,
    showCancel: false,
    resolver: null
  }),

  actions: {
    
    open(options: ModalOptions): Promise<boolean> {
      this.title = options.title ?? ''
      this.message = options.message
      this.type = options.type ?? ModalType.INFO
      this.showCancel = options.showCancel ?? false
      this.show = true

      return new Promise<boolean>((resolve) => {
        this.resolver = resolve
      })
    },

    openPreset(preset: ModalPreset, message: string): Promise<boolean> {
      const config = modalPresets[preset]

      return this.open({
        ...config,
        message
      })
    },

    confirm(): void {
      this.show = false
      this.resolver?.(true)
      this.reset()
    },

    cancel(): void {
      this.show = false
      this.resolver?.(false)
      this.reset()
    },

    reset(): void {
      this.title = ''
      this.message = ''
      this.type = ModalType.INFO
      this.showCancel = false
      this.resolver = null
    }
  }
})