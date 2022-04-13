import React, { useEffect, useState } from 'react'
import TextField from '@mui/material/TextField';
import Autocomplete from '@mui/material/Autocomplete';
import { getHotels } from '../helpers/API'
import { connect } from 'react-redux';
import { hotelSelectionAction } from '../Actions/searchAction'

const mapStateToProps = state => ({
  ...state
})

const mapDispatchToProps = () => ({
  hotelSelectionAction
})

function HotelsAuocomplete(props) {
  const [hotels, setHotels] = useState([])
  const { selectHotel, hotelSelectionAction } = props
  const onChange = (event, value) => {
    hotelSelectionAction(value)
    selectHotel(value)
  }
  useEffect(async () => {
    const { data } = await getHotels()
    const mappedData = data.map(h => { return { ...h, label: h.hotelName } })
    setHotels(mappedData)
  }, [])
  return (
    <Autocomplete
      onChange={onChange}
      disablePortal
      id="combo-box-demo"
      options={hotels}
      renderInput={(params) => <TextField {...params} label="Going to" />}
    />
  );
}

export default connect(mapStateToProps, mapDispatchToProps())(HotelsAuocomplete)
