import axios from 'axios';

// setting a port
const port = 3000;

export const buffetServices = {
  
  // Get all buffetItems method
  async getBuffetItem() {
    const response = await axios.get(`http://localhost:${port}/getBuffet`);
    return response.data;
  },

  // Get all buffet types method
  async getBuffetTypes() {
    const response = await axios.get(`http://localhost:${port}/getBuffetTypes`);
    return response.data;
  }
};