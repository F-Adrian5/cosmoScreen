import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const buffetServices = {
  
  // Get all buffetItems method
  async getBuffetItem() {
    try {
      const response = await axios.get(`${API_URL}/getBuffet`);
      return response.data; 
    } catch (error) {
      console.log('getBuffetItem failed:', error);
      return null;
    }
  },

  // Get all buffet types method
  async getBuffetTypes() {
    try {
      const response = await axios.get(`${API_URL}/getBuffetTypes`);
      return response.data;
    } catch (error) {
      console.log('getBuffetTypes failed:', error);
      return null;
    }
  }
};