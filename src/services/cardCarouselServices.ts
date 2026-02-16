import axios from 'axios';

// setting a port
const port = 3000;

export const carouselMovieServices = {
  
  // Get all movies method
  async getMovies() {
    const response = await axios.get(`http://localhost:${port}/getMovies`);
    return response.data;
  }
};