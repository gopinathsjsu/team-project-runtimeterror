import * as React from 'react';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import * as MaterialLink from '@mui/material/Link';
import { Link } from 'react-router-dom';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { Paper } from '@mui/material';
import Backdrop from '@mui/material/Backdrop';
import CircularProgress from '@mui/material/CircularProgress';
import Snackbar from '../Common/Snackbar';
import { loginUser } from '../helpers/API';
import { useNavigate } from "react-router-dom";
import Cookies from 'js-cookie'


export default function SignIn() {

  const [spinner, setSpinner] = React.useState(false)
  const [showSnackbar, setShowSnackbar] = React.useState(false)
  const [snackbarMessage, setSnackbarMessage] = React.useState()
  const [snackbarSev, setSnackbarSev] = React.useState("success")
  const navigate = useNavigate();
  const closeSnackbar = () => {
    setShowSnackbar(false)
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    let errorState = false
    const name = data.get('username')
    const password = data.get('password')
    if (!name || !password) {
      setSnackbarMessage("Please fill all inputs.")
      errorState = true
    }
    if (errorState) {
      setSnackbarSev("error")
      setShowSnackbar(true)
      return
    }
    setSpinner(true)
    try {
      const signInResponse = await loginUser(name, password)
      const { data: { accessToken, email, username, id, roles } } = signInResponse
      const cookieExpiration = { expires: 1 }
      Cookies.set('accessToken', accessToken, cookieExpiration)
      Cookies.set('email', email, cookieExpiration)
      Cookies.set('username', username, cookieExpiration)
      Cookies.set('userId', id, cookieExpiration)
      Cookies.set('roles', roles.join(','), cookieExpiration)
      setSpinner(false)
      setSnackbarMessage("Success. You will be redirected")
      setSnackbarSev("success")
      setShowSnackbar(true)
      setTimeout(() => {
        navigate(`/`)
      }, 1000)
    } catch (ex) {
      setSpinner(false)
      setSnackbarMessage("Something went wrong.")
      setSnackbarSev("error")
      setShowSnackbar(true)
    }
  };

  return (
    <Paper elevation={4}>
      <Container component="main" maxWidth="xs">
        <CssBaseline />
        <Box
          sx={{
            marginTop: 4,
            display: 'flex',
            flexDirection: 'column',
            alignItems: 'center',
          }}
        >
          <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
            <LockOutlinedIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            Sign in
          </Typography>
          <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 1 }}>
            <TextField
              margin="normal"
              required
              fullWidth
              id="username"
              label="User Name"
              name="username"
              autoComplete="username"
              autoFocus
            />
            <TextField
              margin="normal"
              required
              fullWidth
              name="password"
              label="Password"
              type="password"
              id="password"
              autoComplete="current-password"
            />
            <Button
              type="submit"
              fullWidth
              variant="contained"
              sx={{ mt: 3, mb: 2 }}
            >
              Sign In
            </Button>
            <Container sx={{ display: 'flex', justifyContent: 'center' }} fixed>
              <Link to="/signup">
                <MaterialLink.default variant="body2">
                  {"Don't have an account? Sign Up"}
                </MaterialLink.default>
              </Link>
            </Container>
          </Box>
        </Box>
      </Container>
      <Backdrop
        sx={{ color: '#fff', zIndex: (theme) => theme.zIndex.drawer + 1 }}
        open={spinner}
      >
        <CircularProgress color="inherit" />
      </Backdrop>
      <Snackbar message={snackbarMessage} open={showSnackbar} close={closeSnackbar} severity={snackbarSev} />
    </Paper>
  );
}