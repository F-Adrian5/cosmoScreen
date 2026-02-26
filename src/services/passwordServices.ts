import axios from 'axios';

// setting a port
const port = 3000;

export const passwordServices = {
  
  // Get model data from html
  async getUserData(id:number,new_password:string) {
    const response = await axios.put(`http://localhost:${port}/password`,{
      id,
      new_password
    });
    return response.data;
  }
};