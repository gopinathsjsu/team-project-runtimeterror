import * as React from 'react';
import List from '@mui/material/List';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import { connect } from 'react-redux';
import Typography from '@mui/material/Typography';
import { useNavigate } from 'react-router-dom';
import Box from '@mui/material/Box'
import { Button, Container } from '@mui/material';
import { selectAminities } from '../Actions/bookingAction'
import { AMENITIES_LIST } from '../helpers/constants';


const mapStateToProps = state => ({
  ...state
})

const mapDispatchToProps = () => ({
  selectAminities
})


function Amenities(props) {
  const navigate = useNavigate()
  const { closeSelf, selectAminities, hotel: { result: hotelDetails } } = props

  const continueBooking = async (event) => {
    event.preventDefault()
    const checkboxes = document.getElementsByName('aminities')
    const checkboxesChecked = [];
    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {

        checkboxesChecked.push({ amenityCode: checkboxes[i].value, count: 1 });
      }
    }
    selectAminities(checkboxesChecked)
    navigate("/confirm")
  }

  return (<>
    <Typography id="modal-modal-title" variant="h6" component="h2">
      Amenities (optional)
    </Typography>
    <Box component="form" onSubmit={continueBooking} noValidate sx={{ mt: 1 }}>
      <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
        {AMENITIES_LIST.map((value) => {
          return (
            <FormControlLabel key={value.amenityCode} name='aminities' disableTypography sx={{ width: '100%' }} value={value.amenityCode} control={<Checkbox />} label={
              <Container disableGutters sx={{ display: 'flex', justifyContent: 'space-between' }}>
                {value.amenityName}<value.amenityIcon />
              </Container>}
            />
          );
        })}
      </List>
      <Container sx={{ display: 'flex', justifyContent: 'space-around' }}>
        <Button onClick={closeSelf}>Cancel</Button>
        <Button type='submit' variant="outlined" size="medium">Continue</Button>
      </Container>
    </Box>
  </>
  );
}

export default connect(mapStateToProps, mapDispatchToProps())(Amenities)