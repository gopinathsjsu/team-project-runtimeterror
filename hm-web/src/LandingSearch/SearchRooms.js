import React from 'react'
import Backdrop from '@mui/material/Backdrop';
import CircularProgress from '@mui/material/CircularProgress';
import Button from '@mui/material/Button';
import { searchRooms } from '../helpers/API'
import { isEmpty } from 'lodash'
export default function SearchRooms(props) {
  const { hotel } = props
  const [open, setOpen] = React.useState(false);
  const handleClose = () => {
    setOpen(false);
  };

  const handleSearch = async () => {
    if (isEmpty(hotel)) return
    const { id } = hotel
    setOpen(true)
    const roomsResponse = await searchRooms(id)
    setOpen(false)
  }
  return <><Button onClick={handleSearch} variant="outlined" size="large">Search</Button>
    <Backdrop
      sx={{ color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={open}
      onClick={handleClose}
    >
      <CircularProgress color="inherit" />
    </Backdrop>
  </>
}