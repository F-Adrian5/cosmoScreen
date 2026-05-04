import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const carouselMovieServices = {
  
  // Get all movies method
  async getMovies() {
    try {
      const response = await axios.get(`${API_URL}/getMovies`);
      return response.data;
    } catch (error) {
      console.log('getMovies failed:', error);
      return null;
    }
  },

  // get all actors
  async getActors() {
    try {
      const response = await axios.get(`${API_URL}/getActorInMovie`);
      return response.data;
    } catch (error) {
      console.log('getActors failed:', error);
      return null;
    }
  }
};