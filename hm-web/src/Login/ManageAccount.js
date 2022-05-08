import * as React from 'react';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import CssBaseline from '@mui/material/CssBaseline';
import TextField from '@mui/material/TextField';
import { Link } from 'react-router-dom';
import * as MaterialLink from '@mui/material/Link';
import Box from '@mui/material/Box';
import ManageAccountIcon from '@mui/icons-material/ManageAccounts';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { Paper } from '@mui/material';
import { Grid } from '@mui/material';
import Backdrop from '@mui/material/Backdrop';
import CircularProgress from '@mui/material/CircularProgress';
import Snackbar from '../Common/Snackbar';
import { updateAccount } from '../helpers/API';
import { useNavigate } from "react-router-dom";
import Cookies from 'js-cookie';

export default function SignUp() {
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
    let errorState = false
    const data = new FormData(event.currentTarget);
    const name = data.get('username')
    const email = data.get('email')
    let password = data.get('password')
    const confirmPassword = data.get('confirmPassword')

    if (name.includes(' ')) {
      setSnackbarMessage("Username cannot have space in it.")
      errorState = true
    }
    else if (password.length && password.length < 8) {
      setSnackbarMessage("Password should be at least 8 characters.")
      errorState = true
    }


    else if (password !== confirmPassword) {
      setSnackbarMessage("Passwords do not match.")
      errorState = true
    }
    if (errorState) {
      setSnackbarSev("error")
      setShowSnackbar(true)
      return
    }

    setSpinner(true)
    try {
      if (password === "") {
        password = null
      }
      await updateAccount(name, email, password)
      Cookies.set('username', name, { expires: 1 })
      Cookies.set('email', email, { expires: 1 })
      setSpinner(false)
      setSnackbarMessage("Account has been updated")
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

  const defaultName = Cookies.get('username')
  const defaultEmail = Cookies.get('email')

  return (
    <Paper elevation={4}>
      <Container component="main" maxWidth="md">
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
            <ManageAccountIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            Manage Account
          </Typography>
          <Box component="form" onSubmit={handleSubmit} noValidate sx={{ mt: 1 }}>
            <Grid container justifyContent="center" columnSpacing={2} >
              <Grid item xs={12} md={6} lg={6}>
                <TextField
                  margin="normal"
                  fullWidth
                  required
                  id="username"
                  label="User Name"
                  name="username"
                  autoComplete="name"
                  autoFocus
                  defaultValue={defaultName}
                />
              </Grid>
              <Grid item xs={12} md={6} lg={6}>
                <TextField
                  margin="normal"
                  required
                  fullWidth
                  id="email"
                  label="Email Address"
                  name="email"
                  autoComplete="email"
                  autoFocus
                  defaultValue={defaultEmail}
                />
              </Grid>
              <Grid item xs={12} md={6} lg={6}>
                <TextField
                  margin="normal"
                  required
                  fullWidth
                  name="password"
                  label="New Password"
                  type="password"
                  id="password"
                  autoComplete="new-password"
                />
              </Grid>
              <Grid item xs={12} md={6} lg={6}>
                <TextField
                  margin="normal"
                  required
                  fullWidth
                  name="confirmPassword"
                  label="Confirm Password"
                  type="password"
                  id="password"
                  autoComplete="new-password"
                />
              </Grid>
              <Grid item xs={6} md={6} lg={6}>
                <Button
                  type="submit"
                  fullWidth
                  variant="contained"
                  sx={{ mt: 3, mb: 2 }}
                >
                  Update Account
                </Button>
              </Grid></Grid>
            <Container sx={{ display: 'flex', justifyContent: 'center' }} fixed>
              <Link to="/">
                <MaterialLink.default variant="body2">
                  {"Cancel"}
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