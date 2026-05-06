import axios from 'axios';
const API_URL = import.meta.env.VITE_API_URL;

export const reservationService = {

  // make the reservation call to the backend
  async makeReservation(data: {
    user_id: number,
    screening_id: number,
    reservation_date: string,
    pairs: { seat_id: number, ticket_id: number, total_amount: number }[]
  }) {

    try {
      const response = await axios.post(`${API_URL}/reservation`, data);
      return response.data;
    } catch (error) {
      console.log('makeReservation failed:', error);
      throw error;
    }
  },

  // get reservations
  async getReservations() {
    try {
      const response = await axios.get(`${API_URL}/getReservations`);
      return response.data;
    } catch (error) {
      console.log('getReservations failed:', error);
      throw error;
    }
  }
};