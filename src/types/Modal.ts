export enum ModalType {
  INFO = 'info',
  SUCCESS = 'success',
  WARNING = 'warning',
  ERROR = 'error'
}

export enum ModalPreset {
  CONFIRM = 'confirm',
  DELETE = 'delete',
  SUCCESS = 'success',
  ERROR = 'error'
}

export interface ModalOptions {
  title: string
  message: string
  type?: ModalType
  showCancel?: boolean
}