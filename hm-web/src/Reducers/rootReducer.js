import { combineReducers } from 'redux';
import hotelReducer  from './hotelReducer';
import roomReducer from './roomReducer'

export default combineReducers({
  hotel: hotelReducer,
  rooms: roomReducer
})
