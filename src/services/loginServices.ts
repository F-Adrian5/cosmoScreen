import axios from 'axios';

// setting a port
const port = 3000;

export const loginServices = {
  
  // Get model data from html
  async getUserData(email: string, password: string) {
    const response = await axios.post(`http://localhost:${port}/login`,{
      email,
      password
    });
    
    return response.data;
  }
};