import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const passwordServices = {
  
  // Get model data from html
  async getUserData(id:number,new_password:string) {

    try {
      const response = await axios.put(`${API_URL}/password`,{
        id,
        new_password
      });
      
      return response.data;
    } catch (error) {
      console.log('getUserData failed:', error);
      throw error;
    }
  }
};