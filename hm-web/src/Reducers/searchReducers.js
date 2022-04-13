export default (state = {}, action) => {
  switch (action.type) {
   case 'HOTEL_SELECTION':
    return {
     result: action.payload
    }
   default:
    return state
  }
 }