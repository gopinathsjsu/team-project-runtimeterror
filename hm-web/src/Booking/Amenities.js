import * as React from 'react';
import List from '@mui/material/List';
import FormGroup from '@mui/material/FormGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import { connect } from 'react-redux';
import Typography from '@mui/material/Typography';

/*
Amenity Icons
*/
import SwimmingPoolIcon from '@mui/icons-material/Pool';
import BreakfastIcon from '@mui/icons-material/FreeBreakfast';
import RestaurantIcon from '@mui/icons-material/Restaurant'
import FitnessIcon from '@mui/icons-material/FitnessCenter'
import ParkingIcon from '@mui/icons-material/LocalParking'
import { Button, Container } from '@mui/material';



const AMENITIES_LIST = [
  { amenityName: `Breakfast`, amenityCode: `CB`, amenityIcon: BreakfastIcon },
  { amenityName: `Parking`, amenityCode: `PR`, amenityIcon: ParkingIcon },
  { amenityName: `Fitness Room`, amenityCode: `FR`, amenityIcon: FitnessIcon },
  { amenityName: `All Meals Included`, amenityCode: `AM`, amenityIcon: RestaurantIcon },
  { amenityName: `Swimming Pool`, amenityCode: `SW`, amenityIcon: SwimmingPoolIcon },
]


const mapStateToProps = state => ({
  ...state
})


function Amenities() {

  return (<>
    <Typography id="modal-modal-title" variant="h6" component="h2">
      Amenities (optional)
    </Typography>

    <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
      <FormGroup>


        {AMENITIES_LIST.map((value) => {
          return (
            <FormControlLabel disableTypography sx={{ width: '100%' }} value={value.amenityCode} control={<Checkbox />} label={
              <Container disableGutters sx={{ display: 'flex', justifyContent: 'space-between' }}>
                {value.amenityName}<value.amenityIcon />
              </Container>}
            />
          );
        })}
      </FormGroup>
    </List>
    <Container  sx={{ display: 'flex', justifyContent: 'space-around' }}>
      <Button>Cancel</Button>
      <Button variant="outlined" size="medium">Continue</Button>
      </Container>

  </>
  );
}

export default connect(mapStateToProps)(Amenities)