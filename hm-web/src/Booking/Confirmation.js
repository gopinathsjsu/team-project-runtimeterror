import React, { useEffect, useState } from 'react'
import { connect } from 'react-redux';
import Paper from '@mui/material/Paper';
import { Box, Typography, Button, Container } from '@mui/material';
import styles from '../styles/booking.module.css'
import { find, isEmpty } from 'lodash';
import { Navigate, useNavigate } from 'react-router-dom';
import Hotel from './Hotel'
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Grid from '@mui/material/Grid';
import { styled } from '@mui/material/styles';
import Counter from '../LandingSearch/Counter';
import { AMENITIES_LIST } from '../helpers/constants';
import { calculatePrice, bookHotel } from '../helpers/API'
import Cookies from 'js-cookie';
import { currencyFormatter } from '../helpers/constants';

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

const mapStateToProps = state => ({
  ...state
})

const mapDispatchToProps = () => ({

})

function Confirmation(props) {
  const navigate = useNavigate()
  const { selectedAmenities = [] } = props
  const [price, setPrice] = useState()
  const [priceBreakdown, setPriceBreakdown] = useState()
  const localAmMap = {}
  selectedAmenities.forEach(amen => {
    localAmMap[amen.amenityCode] = amen.count
  })
  const [localAmenityCount, setLocalAmenityCount] = useState(localAmMap)

  const getBookingPayload = () => {
    const amenities = Object.keys(localAmenityCount).map(key => {
      return {
        amenityCode: key,
        count: localAmenityCount[key]
      }
    })
    return {
      userId,
      checkInDate,
      checkOutDate,
      guestCount,
      roomCount,
      roomTypeCode: selectedRoom.roomTypeCode,
      roomId: selectedRoom.roomTypeId,
      hotelId: hotelDetails.id,
      amenities
    }
  }

  const calculatePriceEstimate = async () => {
    const payload = getBookingPayload()
    const { data } = await calculatePrice(payload)
    const { bookingTotal, bookingDetails } = data
    setPrice(currencyFormatter.format(bookingTotal))
    setPriceBreakdown(bookingDetails)
  }

  const confirmBooking = async () => {
    const payload = getBookingPayload()
    const { data } = await bookHotel(payload)
    navigate(`/booking/${data.bookingId}`)
  }

  useEffect(() => {
    calculatePriceEstimate()
  }, [])
  if (isEmpty(props.hotel) || isEmpty(props.rooms)) {
    return <Navigate to="/" />
  }

  const {
    hotel: { result: hotelDetails },
    roomCount,
    selectedRoom,
    guestCount,
    checkInDate,
    checkOutDate
  } = props

  const userId = +Cookies.get('userId')
  const updateAmenityCount = (count, amCode) => {
    localAmenityCount[amCode] = count
    setLocalAmenityCount(localAmenityCount)
    calculatePriceEstimate()
  }

  if (isEmpty(props.hotel) || isEmpty(props.rooms)) {
    return <Navigate to="/" />
  }

  return <Paper className={styles.bookingWrapper} elevation={6}>
    <Box sx={{
      padding: '1.6rem',
    }}>
      <Typography variant="h5" mb>Confirm Booking</Typography>
      <Hotel {...hotelDetails} />
      <Card variant='outlined'>
        <CardContent>
          <Grid container spacing={2}>
            <Grid item xs={12} md={6}>
              <Item>Check In: <b>{checkInDate}</b></Item>
            </Grid>
            <Grid item xs={12} md={6}>
              <Item>Check Out: <b>{checkOutDate}</b></Item>
            </Grid>
            <Grid item xs={12} md={4}>
              <Item>Room Type: <b>{selectedRoom.roomTypeName}</b></Item>
            </Grid>
            <Grid item xs={6} md={4}>
              <Item>Guests: <b>{guestCount}</b></Item>
            </Grid>
            <Grid item xs={6} md={4}>
              <Item>Rooms: <b>{roomCount}</b></Item>
            </Grid>
            {
              selectedAmenities.length > 0 ?
                <Grid item xs={12}>
                  <Item>
                    {selectedAmenities.map(sel => {
                      const amenity = find(AMENITIES_LIST, a => a.amenityCode === sel.amenityCode)
                      return (<Box mb sx={{ display: 'flex', justifyContent: 'space-between' }}>
                        <Box sx={{ display: 'flex' }}><amenity.amenityIcon />
                          <Typography ml>{amenity.amenityName}:</Typography>
                        </Box>
                        <Counter value={1} handleChange={(count) => { updateAmenityCount(count, sel.amenityCode) }} /></Box>)
                    })}
                  </Item>
                </Grid>
                : null
            }
            <Grid item xs={12}>
              <Item>
                <Typography variant="h5" component="div">
                  Price: <b>{price}</b>
                </Typography>
                <Box>
                  <Typography variant="subtitle1" component="div">
                    Price Breakdown:
                  </Typography>
                  <span dangerouslySetInnerHTML={{ __html: priceBreakdown }}></span>
                </Box>
              </Item>
            </Grid>
            <Grid item xs={12}>
              <Container sx={{ display: 'flex', justifyContent: 'space-around' }}>
                <Button variant="outlined" onClick={() => { navigate(`/book`) }}>Edit</Button>
                <Button onClick={() => { confirmBooking() }} variant="outlined" size="medium">Confirm</Button>
              </Container>
            </Grid>
          </Grid>
        </CardContent>
      </Card>
    </Box>
  </Paper>
}

export default connect(mapStateToProps, mapDispatchToProps())(Confirmation)