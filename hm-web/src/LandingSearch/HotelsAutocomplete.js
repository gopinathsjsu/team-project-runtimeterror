import React, { useEffect, useState } from 'react'
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import { getHotels } from '../helpers/API'

export default function HotelsAuocomplete() {
  const [hotels, setHotels] = useState([])
  useEffect(async () => {
    const { data } = await getHotels()
    const mappedData = data.map(h => { return { ...h, label: h.hotelName } })
    setHotels(mappedData)
  }, [])
  return (
    <Autocomplete
      disablePortal
      id="combo-box-demo"
      options={hotels}
      renderInput={(params) => <TextField {...params} label="Going to" />}
    />
  );
}
