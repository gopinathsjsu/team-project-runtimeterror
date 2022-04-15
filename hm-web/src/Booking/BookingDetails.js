import React, { useEffect, useState } from 'react'
import { useParams } from "react-router-dom";
import { getBookingDetails } from '../helpers/API'
import { Box, Typography, Button, Container, Paper, Grid } from '@mui/material';
import { styled } from '@mui/material/styles';
import styles from '../styles/booking.module.css'
import { get, isEmpty } from 'lodash';
import Hotel from './Hotel';
import { currencyFormatter, dateFormatter } from '../helpers/constants';
import { cancelBooking } from '../helpers/API'
import ConfirmationDialog from '../Common/Confirmation';
import { useNavigate } from 'react-router-dom';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

export default function BooknigDetails() {
  const navigate = useNavigate()
  const { bookingId } = useParams();
  const [booking, setBooking] = useState()
  const [confirmation, setConfirmation] = useState()

  const cancelCurrentBooking = async (confirm) => {
    setConfirmation(false)
    if (!confirm)
      return
    await cancelBooking(bookingId)
    navigate(`/mybookings`)
  }


  const modifyBooking = async () => {

  }


  useEffect(async () => {
    const { data } = await getBookingDetails(bookingId)
    setBooking(data)
  }, [])

  const hotelDetails = get(booking, `rooms[0].room.hotel`)

  if (isEmpty(booking)) {
    return null
  }

  return (<Paper className={styles.bookingWrapper} elevation={6}>
    <Box sx={{
      padding: '1.6rem',
    }}>
      <Typography variant="h5" mb>Booking Confirmation</Typography>
      <Typography variant="subtitle1" mb>Congratulations! Your stay has been confirmed
        from {dateFormatter(booking.checkInDate)} to {dateFormatter(booking.checkOutDate)}.
      </Typography>
      <Hotel {...hotelDetails} />
      <Grid container spacing={2}>
        <Grid item xs={12}>
          <Item>
            <Typography variant="h5" component="div">
              Price: <b>{currencyFormatter.format(booking.totalPrice)}</b>
            </Typography>
            <Box>
              <Typography variant="subtitle1" component="div">
                Price Breakdown:
              </Typography>
              <span dangerouslySetInnerHTML={{ __html: booking.bookingDetails }}></span>
            </Box>
          </Item>
        </Grid>
        <Grid item xs={12}>
          <Container sx={{ display: 'flex', justifyContent: 'space-around' }}>
            <Button variant="outlined" onClick={() => { modifyBooking() }}>Modify</Button>
            <Button onClick={() => { setConfirmation(true) }} variant="outlined" size="medium">Cancel</Button>
          </Container>
        </Grid>
      </Grid>
    </Box>
    <ConfirmationDialog open={confirmation} onClose={cancelCurrentBooking} />
  </Paper>)

}
