import React, { useEffect, useState } from 'react'
import { useParams } from "react-router-dom";
import { getBookingDetails } from '../helpers/API'
import { Box, Typography, Button, Container, Paper, Card, CardContent, Grid } from '@mui/material';
import { styled } from '@mui/material/styles';
import styles from '../styles/booking.module.css'
import { get } from 'lodash';
import Hotel from './Hotel';
import { currencyFormatter } from '../helpers/constants';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

export default function BooknigDetails(props) {
  const { bookingId } = useParams();
  const [booking, setBooking] = useState()
  useEffect(async () => {
    const { data } = await getBookingDetails(bookingId)
    setBooking(data)
  }, [])

  const hotelDetails = get(booking, `rooms[0].room.hotel`)

  return (<Paper className={styles.bookingWrapper} elevation={6}>
    <Box sx={{
      padding: '1.6rem',
    }}>
      <Typography variant="h5" mb>Booking Confirmation</Typography>
      <Typography variant="subtitle1" mb>Congratulations! Your stay has been confirmed
        from {new Date(booking.checkInDate).toLocaleDateString()} to {new Date(booking.checkOutDate).toLocaleDateString()}.
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
            <Button variant="outlined" onClick={() => { }}>Modify</Button>
            <Button onClick={() => { }} variant="outlined" size="medium">Cancel</Button>
          </Container>
        </Grid>
      </Grid>
    </Box>
  </Paper>)

}
