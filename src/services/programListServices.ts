import axios from 'axios';

export const movieService = {
  
  // Get all movies method
  async getPrograms() {
    const response = await axios.get(`http://localhost:3000/getPrograms`);
    return response.data;
  },

  // Get all genres method
  async getGenres() {
    const response = await axios.get(`http://localhost:3000/getGenres`);
    return response.data;
  }
};