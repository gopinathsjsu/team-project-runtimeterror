import * as React from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import { styled } from '@mui/material/styles';
import Cookies from 'js-cookie'
import { useNavigate } from 'react-router-dom';
import Button from '@mui/material/Button';
import Modal from '@mui/material/Modal';
import Amenities from './Amenities';
import Box from '@mui/material/Box';


const style = {
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  bgcolor: 'background.paper',
  boxShadow: 24,
  p: 4,
  minWidth: '18rem'
};
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


export default function Rooms(props) {
  const [open, setOpen] = React.useState(false);
  const accessToken = Cookies.get('accessToken')
  const navigate = useNavigate()
  const rows = []
  for (const room in props) {
    const { hotelId, room_type, price } = props[room]
    rows.push({
      hotelId, price,
      roomTypeName: room_type.name,
      roomTypeCode: room_type.shortCode,
      roomTypeId: room_type.id
    })
  }


  return (
    <>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 300 }} aria-label="customized table">
          <TableHead>
            <TableRow>
              <StyledTableCell>Room Type</StyledTableCell>
              <StyledTableCell align="right">Price</StyledTableCell>
              <StyledTableCell align="right"></StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rows.map((row) => (
              <StyledTableRow key={row.roomTypeId}>
                <StyledTableCell component="th" scope="row">
                  {row.roomTypeName}
                </StyledTableCell>
                <StyledTableCell align="right">{row.price}</StyledTableCell>
                <StyledTableCell align="right">{
                  accessToken ? <Button onClick={() => { setOpen(true) }} variant="outlined" size="large">Book</Button> :
                    <Button onClick={() => { navigate('/login') }} variant="outlined" size="large">Login</Button>
                }</StyledTableCell>
              </StyledTableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <Modal
        open={open}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      ><Box sx={style}>
          <Amenities />
        </Box>
      </Modal>
    </>
  );
}

