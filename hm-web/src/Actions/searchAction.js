export const hotelSelectionAction = (hotel) => dispatch => {
  dispatch({
    type: 'HOTEL_SELECTION',
    payload: hotel
  })
}

export const roomSearchAction = (rooms) => dispatch => {
  dispatch({
    type: 'ROOM_SEARCH',
    payload: rooms
  })
}