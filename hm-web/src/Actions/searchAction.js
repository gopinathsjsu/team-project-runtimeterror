export const hotelSelectionAction = () => dispatch => {
  dispatch({
    type: 'HOTEL_SELECTION',
    payload: 'hotel'
  })
}

export const roomSearchAction = () => dispatch => {
  dispatch({
    type: 'ROOM_SEARCH',
    payload: 'room'
  })
}