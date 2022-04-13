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
import { Container } from '@mui/material';



const AMENITIES_LIST = [{ amenityName: `Breakfast`, amenityCode: `CB`, amenityIcon: BreakfastIcon },
{ amenityName: `Parking`, amenityCode: `PR`, amenityIcon: ParkingIcon },
{ amenityName: `Fitness Room`, amenityCode: `FR`, amenityIcon: FitnessIcon },
{ amenityName: `All Meals Included`, amenityCode: `AM`, amenityIcon: RestaurantIcon },
{ amenityName: `Swimming Pool`, amenityCode: `SW`, amenityIcon: SwimmingPoolIcon },
]


const mapStateToProps = state => ({
  ...state
})


function Amenities(props) {
  const handleCheck = (event, checked) => {

  }

  return (<>
    <Typography id="modal-modal-title" variant="h6" component="h2">
      Amenities (optional)
    </Typography>

    <List sx={{ width: '100%', maxWidth: 360, bgcolor: 'background.paper' }}>
      <FormGroup>


        {AMENITIES_LIST.map((value) => {
          const labelId = `checkbox-list-label-${value.amenityCode}`;
          return (
            <FormControlLabel onChange={handleCheck} control={<Checkbox />} label={<Container disableGutters sx={{display: 'flex', width: '100%'}}><value.amenityIcon />{value.amenityName}  </Container>} />
          );
        })}
      </FormGroup>
    </List>
  </>
  );
}

export default connect(mapStateToProps)(Amenities)