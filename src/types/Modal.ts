//Enum defining the possible types of a modal
export enum ModalType {
  INFO = 'info',        //Informational message
  SUCCESS = 'success',  //Success message
  WARNING = 'warning',  //Warning message
  ERROR = 'error'       //Error message
}

//Enum for predefined modal presets which groups together modal configurations under simple names.
export enum ModalPreset {
  CONFIRM = 'confirm', //Confirmation dialog preset
  DELETE = 'delete',   //Delete message preset
  SUCCESS = 'success', //Success message preset
  ERROR = 'error'      //Error message preset
}

//Defines what data is required or optional to display a modal
export interface ModalOptions {
  title: string
  message: string
  type?: ModalType
  showCancel?: boolean
}