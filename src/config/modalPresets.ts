import { ModalType, ModalPreset } from '@/types/Modal'
import type { ModalOptions } from '@/types/Modal'

export const modalPresets: Record<
  ModalPreset,
  Omit<ModalOptions, 'message'>
> = {
  [ModalPreset.CONFIRM]: {
    title: 'Confirm',
    type: ModalType.WARNING,
    showCancel: true
  },
  [ModalPreset.DELETE]: {
    title: 'Delete',
    type: ModalType.ERROR,
    showCancel: true
  },
  [ModalPreset.SUCCESS]: {
    title: 'Success',
    type: ModalType.SUCCESS,
    showCancel: false
  },
  [ModalPreset.ERROR]: {
    title: 'Error',
    type: ModalType.ERROR,
    showCancel: false
  }
}