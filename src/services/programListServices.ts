import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const movieService = {
  
  // Get all movies method
  async getPrograms() {
    try {
      const response = await axios.get(`${API_URL}/getPrograms`);
      return response.data;
    } catch (error) {
      console.log('getPrograms failed:', error);
      return null;
    }
  },

  // Get all genres method
  async getGenres() {
    try {
      const response = await axios.get(`${API_URL}/getGenres`);
      return response.data;
    } catch (error) {
      console.log('getGenres failed:', error);
      return null;
    }
  },

  async getTickets() {
  try {
    const response = await axios.get(`${API_URL}/getTickets`);
    return response.data;
  } catch (error) {
    console.log('getTickets failed:', error);
    return null;
  }
  },

  // Get all genres method
  async getSeats() {
    try {
      const response = await axios.get(`${API_URL}/getSeats`);
      return response.data;
    } catch (error) {
      console.log('getSeats failed:', error);
      return null;
    }
  }
};