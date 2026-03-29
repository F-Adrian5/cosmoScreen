import axios from 'axios';

// setting a port
const port = 3000;

export const movieService = {
  
  // Get all movies method
  async getPrograms() {
    const response = await axios.get(`http://localhost:${port}/getPrograms`);
    return response.data;
  },

  // Get all genres method
  async getGenres() {
    const response = await axios.get(`http://localhost:${port}/getGenres`);
    return response.data;
  }
};