import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const registerServices = {
  
  // Get user data
  async getUserData(name:string, email: string, password: string) {

    try {
      const response = await axios.post(`${API_URL}/register`,{
        name,
        email,
        password
      });
    
      return response.data;
    } catch (error) {
      console.log('getUserData failed:', error);
      return null;
    }
  }
};