import React from 'react'
import { connect } from 'react-redux';
import { Navigate } from 'react-router-dom'
import { isEmpty } from 'lodash';
import Paper from '@mui/material/Paper';
import { Box } from '@mui/material';
import styles from '../styles/booking.module.css'
import Hotel from './Hotel'
import Rooms from './Rooms'


const mapStateToProps = state => ({
  ...state
})


function Booking(props) {

  if (isEmpty(props.hotel) || isEmpty(props.rooms)) {
    return <Navigate to="/" />
  }

  const { hotel: {result: hotelDetails}, rooms: {result: roomDetails} } = props
  return <Paper className={styles.bookingWrapper} elevation={6}>
    <Box sx={{
      padding: '1.6rem',
    }}>
      <Hotel {...hotelDetails} />
      <Rooms {...roomDetails} />
    </Box>
  </Paper>

}

export default connect(mapStateToProps)(Booking)