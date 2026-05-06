export interface LoginUserData {
  email: string, 
  password: string,
  showPassword: boolean,
}

export interface RegisterUserData {
  name: string,
  email: string, 
  password: string,
  showPassword: boolean,
}

export interface ProfilUserData {
  name: string,
  email: string,
  isDisabled: boolean,
  originalName: string,
  originalEmail: string,
}

export interface PasswordUserData {
  new_password: string,
  new_password_again: string,
  showPassword1: boolean,
  showPassword2: boolean,
}