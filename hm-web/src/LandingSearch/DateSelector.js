import React from 'react'
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDateFns } from '@mui/x-date-pickers/AdapterDateFns';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import TextField from '@mui/material/TextField';


export default function DateSelector(props) {
  const [value, setValue] = React.useState();

  const handleChange = (newValue) => {
    setValue(newValue);
  };

  return <LocalizationProvider dateAdapter={AdapterDateFns}>
    <DatePicker
      label={props.label}
      inputFormat="MM/dd/yyyy"
      value={value}
      onChange={handleChange}
      renderInput={(params) => <TextField {...params} />}
    />
  </LocalizationProvider>
}