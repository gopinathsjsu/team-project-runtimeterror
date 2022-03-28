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

export function GetListings(startDate, endDate, destination) {
  // TODO: replace with real API request
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve({
        listings: [
            { hotelId: "1d0239", location: "Serbia", roomTypeCode: "SIG", amenities: ["CB", "FR", "SW"] },
            { hotelId: "1d0239", location: "Serbia", roomTypeCode: "DBL", amenities: ["CB", "FR", "SW"] },
            { hotelId: "1d0239", location: "Serbia", roomTypeCode: "QN", amenities: ["CB", "FR", "SW"] },
            { hotelId: "1d0239", location: "Serbia", roomTypeCode: "KNG", amenities: ["CB", "FR", "SW"] },
            { hotelId: "1d0239", location: "Serbia", roomTypeCode: "STE", amenities: ["CB", "FR", "SW"] },
            { hotelId: "fjie01", location: "Beijing", roomTypeCode: "SIG", amenities: ["PK", "CB", "FR"] },
            { hotelId: "fjie01", location: "Beijing", roomTypeCode: "DBL", amenities: ["PK", "CB", "FR"] },
            { hotelId: "fjie01", location: "Beijing", roomTypeCode: "QN", amenities: ["PK", "CB", "FR"] },
            { hotelId: "fjie01", location: "Beijing", roomTypeCode: "KNG", amenities: ["PK", "CB", "FR"] },
            { hotelId: "fjie01", location: "Beijing", roomTypeCode: "STE", amenities: ["PK", "CB", "FR"] },
            { hotelId: "ajfie3", location: "Honolulu", roomTypeCode: "SIG", amenities: ["CB", "AM"] },
            { hotelId: "ajfie3", location: "Honolulu", roomTypeCode: "DBL", amenities: ["CB", "AM"] },
            { hotelId: "ajfie3", location: "Honolulu", roomTypeCode: "QN", amenities: ["CB", "AM"] },
            { hotelId: "ajfie3", location: "Honolulu", roomTypeCode: "KNG", amenities: ["CB", "AM"] },
            { hotelId: "ajfie3", location: "Honolulu", roomTypeCode: "STE", amenities: ["CB", "AM"] },
            { hotelId: "fjroel", location: "Maui", roomTypeCode: "SIG", amenities: ["PK"] },
            { hotelId: "fjroel", location: "Maui", roomTypeCode: "DBL", amenities: ["PK"] },
            { hotelId: "fjroel", location: "Maui", roomTypeCode: "QN", amenities: ["PK"] },
            { hotelId: "fjroel", location: "Maui", roomTypeCode: "KNG", amenities: ["PK"] },
            { hotelId: "fjroel", location: "Maui", roomTypeCode: "STE", amenities: ["PK"] },
        ]
      });
    }, 300);
  });
}
