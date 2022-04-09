import React from 'react'
import TextField from '@mui/material/TextField';
import PersonIcon from '@mui/icons-material/Person';
import InputAdornment from '@mui/material/InputAdornment';


export default function Travellers() {
  return (<TextField
    fullWidth={true}
    id="outlined-read-only-input"
    label="Travellers"
    defaultValue="1 room, 2 travellers"
    InputProps={{
      startAdornment: (
        <InputAdornment position="start">
          <PersonIcon />
        </InputAdornment>
      ),
      readOnly: true,
    }}
  />)
}