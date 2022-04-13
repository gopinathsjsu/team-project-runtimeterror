export default (state = {}, action) => {
  switch (action.type) {
    case 'ROOM_SEARCH':
      return {
        result: action.payload
      }
    default:
      return state
  }
}
