import React from 'react'
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFns';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import TextField from '@mui/material/TextField';


export default function DateSelector(props) {
  const { date, setDate, label, minDate } = props
  const handleChange = (newValue) => {
    setDate(newValue);
  };

  return <LocalizationProvider dateAdapter={AdapterDateFns}>
    <DatePicker
      allowSameDateSelection={true}
      minDate={minDate}
      label={label}
      inputFormat="MM/dd/yyyy"
      value={date}
      onChange={handleChange}
      renderInput={(params) => <TextField fullWidth={true} {...params} />}
    />
  </LocalizationProvider>
}