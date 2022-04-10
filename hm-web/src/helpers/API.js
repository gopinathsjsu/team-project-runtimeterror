import axios from 'axios';
import * as Config from './Config';

const hotelManagementAPI = axios.create({
  baseURL: Config.BASE_URL,
});

export function BookRoom() {
  // TODO: replace with real API request
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        bookingDetails: 'Hilton Waikiki \n Room: 502 \n Daily Continental Breakfast: ' + 80,
        bookingTotal: 1000,
      });
    }, 300);
  });
}

export async function getHotels() {
  return await hotelManagementAPI.get(`/hotel/search`)
}

export async function searchRooms(hotelId) {
  return await hotelManagementAPI.get(`/hotel/search/${hotelId}/rooms`)
}
