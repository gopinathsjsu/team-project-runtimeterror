import React from 'react'
import { Typography } from '@mui/material';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Rating from '@mui/material/Rating';


export default function Hotel(props) {
  const { address, cityName, countryName, hotelName, location, stars } = props
  return (
    <Card variant='outlined'>
      <CardContent>
        <Typography sx={{ fontSize: 14 }} color="text.secondary" gutterBottom>
          {hotelName}
        </Typography>
        <Typography variant="h5" component="div">
          {location}
        </Typography>
        <Typography sx={{ mb: 1.5 }} color="text.secondary">
          {address} {cityName}
        </Typography>
        <Typography variant="body2">
          {countryName}
        </Typography>
        <Rating name="read-only" value={stars} readOnly />
      </CardContent>
    </Card>)
}
