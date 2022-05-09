import { combineReducers } from 'redux';
import hotelReducer from './hotelReducer';
import roomReducer from './roomReducer'
import {
  checkInReducer,
  checkOutReducer,
  guestCountReducer,
  roomCountReducer,
  selectAmenitiesReducer,
  selectRoomReducer
} from './bookingReducer'

export default combineReducers({
  hotel: hotelReducer,
  rooms: roomReducer,
  selectedRoom: selectRoomReducer,
  selectedAmenities: selectAmenitiesReducer,
  checkInDate: checkInReducer,
  checkOutDate: checkOutReducer,
  guestCount: guestCountReducer,
  roomCount: roomCountReducer
})
