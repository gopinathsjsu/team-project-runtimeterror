import React from 'react'
import Backdrop from '@mui/material/Backdrop';
import CircularProgress from '@mui/material/CircularProgress';
import Button from '@mui/material/Button';
import { searchRooms } from '../helpers/API'
import { isEmpty } from 'lodash'
import { connect } from 'react-redux';
import { roomSearchAction } from '../Actions/searchAction'

const mapStateToProps = state => ({
  ...state
})

const mapDispatchToProps = () => ({
  roomSearchAction
})

function SearchRooms(props) {
  const { hotel, roomSearchAction } = props
  const [open, setOpen] = React.useState(false);

  const handleSearch = async () => {
    if (isEmpty(hotel)) return
    const { result: { id } = {} } = hotel
    setOpen(true)
    try {
      const { data } = await searchRooms(id)
      roomSearchAction(data)
      setOpen(false)
    } catch (ex) {
      setOpen(false)
    }

  }
  return <><Button onClick={handleSearch} variant="outlined" size="large">Search</Button>
    <Backdrop
      sx={{ color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 }}
      open={open}
    >
      <CircularProgress color="inherit" />
    </Backdrop>
  </>
}

export default connect(mapStateToProps, mapDispatchToProps())(SearchRooms)