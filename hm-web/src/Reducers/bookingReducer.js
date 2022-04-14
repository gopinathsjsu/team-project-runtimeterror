export const checkInReducer = (state = {}, action) => {
  switch (action.type) {
    case 'CHECK_IN_DATE':
      return action.payload
    default:
      return state
  }
}

export const checkOutReducer = (state = {}, action) => {
  switch (action.type) {
    case 'CHECK_OUT_DATE':
      return action.payload
    default:
      return state
  }
}

export const selectRoomReducer = (state = {}, action) => {
  switch (action.type) {
    case 'ROOM_SELECT':
      return action.payload
    default:
      return state
  }
}

export const guestCountReducer = (state = {}, action) => {
  switch (action.type) {
    case 'SET_GUEST_COUNT':
      return action.payload
    default:
      return state
  }
}

export const roomCountReducer = (state = {}, action) => {
  switch (action.type) {
    case 'SET_ROOM_COUNT':
      return action.payload
    default:
      return state
  }
}

export const selectAmenitiesReducer = (state = {}, action) => {
  switch (action.type) {
    case 'SELECT_AMINITIES':
      return {
        result: action.payload
      }
    default:
      return state
  }
}

