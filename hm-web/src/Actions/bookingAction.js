export const setCheckInDate = (checkIn) => dispatch => {
  dispatch({
    type: 'CHECK_IN_DATE',
    payload: checkIn
  })
}

export const setCheckOutDate = (checkOut) => dispatch => {
  dispatch({
    type: 'CHECK_OUT_DATE',
    payload: checkOut
  })
}
export const setRoomCount = (roomCount) => dispatch => {
  dispatch({
    type: 'SET_ROOM_COUNT',
    payload: roomCount
  })
}

export const setGuestCount = (guestCount) => dispatch => {
  dispatch({
    type: 'SET_GUEST_COUNT',
    payload: guestCount
  })
}

export const roomSelect = (roomTypeCode) => dispatch => {
  dispatch({
    type: 'ROOM_SELECT',
    payload: roomTypeCode
  })
}

export const selectAminities = (amenities) => dispatch => {
  dispatch({
    type: 'SELECT_AMINITIES',
    payload: amenities
  })
}