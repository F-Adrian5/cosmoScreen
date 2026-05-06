import { defineStore } from 'pinia'
import type { ModalOptions } from '@/types/Modal'
import { ModalPreset, ModalType } from '@/types/Modal'
import { modalPresets } from '@/config/modalPresets'
import language from '@/languages/language'

//This defines everything needed to control how the modal behaves and what it displays
interface ModalState {
  show: boolean       //Visibility
  title: string       //Title
  message: string     //Content
  type: ModalType     //Type(info,success,warning,error)
  showCancel: boolean //Cancel button visibility
  resolver: ((value: boolean) => void) | null //A function used to resolve a promise when the user interacts with the modal
}

//Creating a store to manage modal state globally in the program
export const useModalStore = defineStore('modal', {

  //Sets the initial state of the modal
  state: (): ModalState => ({
    show: false,
    title: '',
    message: '',
    type: ModalType.INFO,
    showCancel: false,
    resolver: null
  }),

  actions: {
    //Opens the modal fills it with the provided data and returns a promise that resolves when the user responds.
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

    //Applies preset settings
    openPreset(preset: ModalPreset, message: string): Promise<boolean> {
      const config = modalPresets[preset];

      //Translates title, sets the message and calls open
      return this.open({
        ...config,
         title: language.t(config.title),
        message
      })
    },

    //Called when the user confirms the modal
    confirm(): void {
      this.show = false //Hides the modal
      this.resolver?.(true) //Gives true which means the user confirmed the action
      this.reset() //Resets modal back to default
    },

    //Called when the user cancels the modal
    cancel(): void {
      this.show = false //Hides the modal
      this.resolver?.(false) //Gives false which means the user canceled the action
      this.reset() //Resets modal back to default
    },

    //Reset function which sets everything back to default
    reset(): void {
      this.title = ''
      this.message = ''
      this.type = ModalType.INFO
      this.showCancel = false
      this.resolver = null
    }
  }
})