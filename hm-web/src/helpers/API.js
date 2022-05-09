import axios from 'axios';
import * as Config from './Config';
import Cookies from 'js-cookie';
import { isEmpty } from 'lodash';

const hotelManagementAPI = axios.create({
  baseURL: Config.BASE_URL,
});

export async function getHotels() {
  return await hotelManagementAPI.get(`/api/hotel`)
}

export async function searchRooms(hotelId) {
  return await hotelManagementAPI.get(`/api/hotel/${hotelId}/rooms`)
}

export async function registerUser(username, email, password) {
  return await hotelManagementAPI.post(`/api/user/signup`, {
    username, email, password, role: ["user"]
  })
}

export async function getUser() {
  const userId = Cookies.get('userId')
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.get(`/api/user/${userId}`, config)
}

export async function updateAccount(username, email, password) {
  const userId = Cookies.get('userId')
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.put(`/api/user/${userId}`, {
    username, email, password, role: ["user"]
  }, config)
}

export async function getMyBooking() {
  const userId = Cookies.get('userId')
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.get(`/api/booking/getbookingbyuserid/${userId}`, config)
}

export async function cancelBooking(bookingId) {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.delete(`/api/booking/${bookingId}`, config)
}

export async function loginUser(username, password) {
  return await hotelManagementAPI.post(`/api/user/signin`, {
    username, password
  })
}

export function logoutUser() {
  Cookies.remove('accessToken')
  Cookies.remove('email')
  Cookies.remove('username')
  Cookies.remove('userId')
  window.location = "/"
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

export async function bookHotel(payload) {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };

  return await hotelManagementAPI.post(`api/booking`, payload, config)
}

export async function getBookingDetails(bookingId) {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };

  return await hotelManagementAPI.get(`api/booking/${bookingId}`, config)
}

export async function getPricingStrategies() {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.get(`/api/admin/pricingstrategy`, config)
}

export async function setPricingStrategy(payload) {
  const token = Cookies.get('accessToken')
  if (isEmpty(token))
    throw "user not authorized"
  const config = {
    headers: { Authorization: `Bearer ${token}` }
  };
  return await hotelManagementAPI.put(`/api/admin/pricingstrategy`, payload, config)
}