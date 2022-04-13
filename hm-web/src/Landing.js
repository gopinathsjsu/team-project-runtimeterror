import React from 'react'
import Paper from '@mui/material/Paper';
import styles from './styles/Landing.module.css'
import Grid from '@mui/material/Grid';
import HotelsAuocomplete from './LandingSearch/HotelsAutocomplete';
import { Box, Typography } from '@mui/material';
import DateSelector from './LandingSearch/DateSelector';
import Travellers from './LandingSearch/Travellers';
import SearchRooms from './LandingSearch/SearchRooms';


function Landing() {
  const tomorrow = new Date()
  tomorrow.setDate(tomorrow.getDate() + 1)
  const dayAfterTomorrow = new Date()
  dayAfterTomorrow.setDate(dayAfterTomorrow.getDate() + 2)
  const fiveDaysFromNow = new Date()
  fiveDaysFromNow.setDate(fiveDaysFromNow.getDate() + 5)

  const getMinCheckoutDate = () => {
    const checkInDate = new Date(checkIn)
    if (dayAfterTomorrow < checkInDate) {
      checkInDate.setDate(checkInDate.getDate() + 1)
      return checkInDate
    }
    return dayAfterTomorrow;
  }

  const [checkIn, setCheckIn] = React.useState(tomorrow.toLocaleDateString())
  const [checkOut, setCheckOut] = React.useState(fiveDaysFromNow.toLocaleDateString())
  const [rooms, setRooms] = React.useState(1)
  const [guests, setGuests] = React.useState(2)

  return (
    <Paper className={styles.landingWrapper} elevation={6}>
      <Box sx={{
        padding: '1.6rem',
      }}>
        <Grid container justifyContent="center" spacing={2}>
          <Grid item xs={12} md={12} lg={12}>
            <Typography variant="h5" display="block" gutterBottom >
              Search Hotels
            </Typography>
          </Grid>
          <Grid item xs={12} md={4} lg={4}>
            <HotelsAuocomplete />
          </Grid>
          <Grid item xs={6} md={2} lg={2}>
            <DateSelector date={checkIn} setDate={setCheckIn} minDate={tomorrow} label={"Check-in"} />
          </Grid>
          <Grid item xs={6} md={2} lg={2}>
            <DateSelector date={checkOut} setDate={setCheckOut} minDate={getMinCheckoutDate()} label={"Check-out"} />
          </Grid>
          <Grid item xs={12} md={4} lg={4}>
            <Travellers
              rooms={rooms}
              guests={guests}
              setRooms={setRooms}
              setGuests={setGuests}
            />
          </Grid>
          <Grid item>
            <SearchRooms checkIn={checkIn} checkOut={checkOut} guests={guests} rooms={rooms} />
          </Grid>
        </Grid>
      </Box>
    </Paper>)
}

export default Landing