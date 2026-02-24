import type { LoginUserdata } from '@/types/User'

//Email validation
  export function validEmail(user:LoginUserdata) {

    // this.email -> will show the current email
    // regex.test(x) -> this will test that specific 'x' value,
    // and it will return us a true or false value
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(user.email);
  }

  //password validation
  export function validPassword(user:LoginUserdata) {
    return /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_\-?:+]).{6,}/.test(user.password);
  }