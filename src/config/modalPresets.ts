import { ModalType, ModalPreset } from '@/types/Modal'
import type { ModalOptions } from '@/types/Modal'

export const modalPresets: Record<
  ModalPreset,
  Omit<ModalOptions, 'message'>
> = {
  [ModalPreset.CONFIRM]: {
    title: 'modalPage.messageConfirm',
    type: ModalType.WARNING,
    showCancel: true
  },
  [ModalPreset.DELETE]: {
    title: 'modalPage.messageDelete',
    type: ModalType.ERROR,
    showCancel: true
  },
  [ModalPreset.SUCCESS]: {
    title: 'modalPage.messageSuccess',
    type: ModalType.SUCCESS,
    showCancel: false
  },
  [ModalPreset.ERROR]: {
    title: 'modalPage.messageError',
    type: ModalType.ERROR,
    showCancel: false
  }
}