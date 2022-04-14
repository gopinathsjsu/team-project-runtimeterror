import axios from 'axios';
import * as Config from './Config';
import Cookies from 'js-cookie';
import { isEmpty } from 'lodash';

const hotelManagementAPI = axios.create({
  baseURL: Config.BASE_URL,
});

export function BookRoom() {

}

export async function getHotels() {
  return await hotelManagementAPI.get(`/api/hotel`)
}

export async function searchRooms(hotelId) {
  return await hotelManagementAPI.get(`/api/hotel/${hotelId}/rooms`)
}

export async function registerUser(username, email, password) {
  return await hotelManagementAPI.post(`/api/auth/signup`, {
    username, email, password, role: ["user"]
  })
}

export async function loginUser(username, password) {
  return await hotelManagementAPI.post(`/api/auth/signin`, {
    username, password
  })
}

export async function searchAmenities(hotelId) {
  return await hotelManagementAPI.get(`/api/hotel/${hotelId}/amenities`)
}

export async function calculatePrice(payload) {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };

  return await hotelManagementAPI.post(`api/booking/calculate`, payload, config)
}