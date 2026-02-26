export interface LoginUserdata {
  email: string, 
  password: string,
  showPassword: boolean,
}

export interface RegisterUserdata {
  name: string,
  email: string, 
  password: string,
  showPassword: boolean,
}

export interface ProfilUserdata {
  name: string,
  email: string,
  isDisabled: boolean,
  originalName: string,
  originalEmail: string,
}

export interface PasswordUserdata {
  new_password: string,
  new_password_again: string,
  showPassword1: boolean,
  showPassword2: boolean,
}