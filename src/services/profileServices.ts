import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const profileServices = {
  
  // Get model data from html
  async getUserData(id:number, name:string, email: string) {
    try {
      const response = await axios.put(`${API_URL}/profile`,{
        id,
        name,
        email
      });

      return response.data; 
    } catch (error) {
      console.log('getUserData failed:', error);
      return null;
    }
  }
};