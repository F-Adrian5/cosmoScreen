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