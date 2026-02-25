//Email validation
  export function validEmail(email:string): boolean {

    // this.email -> will show the current email
    // regex.test(x) -> this will test that specific 'x' value,
    // and it will return us a true or false value
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  }

  //password validation
  export function validPassword(password:string): boolean {
    return /(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*_\-?:+]).{6,}/.test(password);
  }