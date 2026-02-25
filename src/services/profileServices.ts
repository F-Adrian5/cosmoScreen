import axios from 'axios';

// setting a port
const port = 3000;

export const profileServices = {
  
  // Get model data from html
  async getUserData(id:number, name:string, email: string) {
    const response = await axios.put(`http://localhost:${port}/profile`,{
      id,
      name,
      email
    });
    return response.data;
  }
};