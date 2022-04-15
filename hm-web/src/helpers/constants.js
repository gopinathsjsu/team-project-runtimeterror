import SwimmingPoolIcon from '@mui/icons-material/Pool';
import BreakfastIcon from '@mui/icons-material/FreeBreakfast';
import RestaurantIcon from '@mui/icons-material/Restaurant'
import FitnessIcon from '@mui/icons-material/FitnessCenter'
import ParkingIcon from '@mui/icons-material/LocalParking'

export const AMENITIES_LIST = [
  { amenityName: `Breakfast`, amenityCode: `CB`, amenityIcon: BreakfastIcon },
  { amenityName: `Parking`, amenityCode: `PK`, amenityIcon: ParkingIcon },
  { amenityName: `Fitness Room`, amenityCode: `FR`, amenityIcon: FitnessIcon },
  { amenityName: `All Meals Included`, amenityCode: `AM`, amenityIcon: RestaurantIcon },
  { amenityName: `Swimming Pool`, amenityCode: `SW`, amenityIcon: SwimmingPoolIcon },
]

export const currencyFormatter = new Intl.NumberFormat('en-US', {
  style: 'currency',
  currency: 'USD'
});

export const dateFormatter = (dateString) => {
  return new Date(dateString).toLocaleDateString()
}
