import React from 'react'
import TextField from '@mui/material/TextField';
import PersonIcon from '@mui/icons-material/Person';
import InputAdornment from '@mui/material/InputAdornment';
import Modal from '@mui/material/Modal';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import Counter from './Counter'
import Stack from '@mui/material/Stack';
import { Button } from '@mui/material';


const style = {
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  bgcolor: 'background.paper',
  boxShadow: 24,
  p: 4,
};
export default function Travellers(props) {
  const [open, setOpen] = React.useState(false);
  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);
  const { rooms, setRooms, guests, setGuests } = props
  return (<>
    <TextField
      fullWidth={true}
      onClick={handleOpen}
      id="outlined-read-only-input"
      label="Travellers"
      value={`${rooms} room${rooms > 1 ? `s` : ``}, ${guests} traveller${guests > 1 ? `s` : ``}`}
      InputProps={{
        startAdornment: (
          <InputAdornment position="start">
            <PersonIcon />
          </InputAdornment>
        ),
        readOnly: true,
      }}
    />
    <Modal
      open={open}
      aria-labelledby="modal-modal-title"
      aria-describedby="modal-modal-description"
    >
      <Box sx={style}>
        <Typography id="modal-modal-title" variant="h6" component="h2">
          Travellers
        </Typography>
        <Stack sx={{minWidth: '14rem'}} spacing={3} mt pt>
          <Box> Rooms: <Counter value={rooms} handleChange={setRooms} /></Box>
          <Box> Guests: <Counter value={guests} handleChange={setGuests} /></Box>
          <Button variant="outlined" onClick={handleClose}>
            Done
          </Button>
        </Stack>
      </Box>
    </Modal>
  </>)
}