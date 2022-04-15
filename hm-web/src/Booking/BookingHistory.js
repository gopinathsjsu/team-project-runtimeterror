import * as React from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import { styled } from '@mui/material/styles';
import { Link, useNavigate } from 'react-router-dom';
import Button from '@mui/material/Button';
import Modal from '@mui/material/Modal';
import Amenities from './Amenities';
import { Box, Typography } from '@mui/material';
import styles from '../styles/booking.module.css'
import { getMyBooking } from '../helpers/API'
import { currencyFormatter, dateFormatter } from '../helpers/constants';
import { get } from 'lodash';

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: theme.palette.common.black,
    color: theme.palette.common.white,
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  },
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  '&:nth-of-type(odd)': {
    backgroundColor: theme.palette.action.hover,
  },
  // hide last border
  '&:last-child td, &:last-child th': {
    border: 0,
  },
}));

export default function BookingHistory() {
  const [bookings, setBookings] = React.useState([])
  React.useEffect(() => {
    const fetchMyBookings = async () => {
      const { data } = await getMyBooking()
      setBookings(data)
    }
    fetchMyBookings()
  }, [])

  return (<Paper className={styles.bookingWrapper} elevation={6}>
    <Box sx={{
      padding: '1.6rem',
    }}>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 300 }} aria-label="customized table">
          <TableHead>
            <TableRow>
              <StyledTableCell>Hotel</StyledTableCell>
              <StyledTableCell align="right">Check In</StyledTableCell>
              <StyledTableCell align="right">Check Out</StyledTableCell>
              <StyledTableCell align="right">Price</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {bookings.map((row) => (
              <StyledTableRow key={row.id}>
                <StyledTableCell component="th" scope="row">
                  <Link to={`/booking/${row.id}`} >{get(row, `rooms[0].room.hotel.hotelName`)}</Link>
                </StyledTableCell>
                <StyledTableCell align="right">{dateFormatter(row.checkInDate)}</StyledTableCell>
                <StyledTableCell align="right">{dateFormatter(row.checkOutDate)}</StyledTableCell>
                <StyledTableCell align="right">{currencyFormatter.format(row.totalPrice)}</StyledTableCell>
              </StyledTableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Box>
  </Paper>
  );
}