import axios from 'axios';

// setting a port
const port = 3000;

export const registerServices = {
  
  // Get all movies method
  async getUserData(name:string, email: string, password: string) {
    const response = await axios.post(`http://localhost:${port}/register`,{
      name,
      email,
      password
    });
    return response.data;
  }
};