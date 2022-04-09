import React from 'react'
import Paper from '@mui/material/Paper';
import { Button } from '@mui/material';
import styles from './styles/Landing.module.css'
import Grid from '@mui/material/Grid';
import HotelsAuocomplete from './LandingSearch/HotelsAutocomplete';
import { Box, Typography } from '@mui/material';
import DateSelector from './LandingSearch/DateSelector';
import Travellers from './LandingSearch/Travellers';

export default function Landing() {
  return (
    <Paper className={styles.landingWrapper} elevation={6}>
      <Box sx={{
        padding: '1.6rem',
      }}>
        <Grid container justifyContent="center" spacing={2}>
          <Grid item xs={12} md={12} lg={12}>
            <Typography variant="h5" display="block" gutterBottom >
              Search Hotels
            </Typography>
          </Grid>
          <Grid item xs={12} md={4} lg={4}>
            <HotelsAuocomplete />
          </Grid>
          <Grid item xs={6} md={2} lg={2}>
            <DateSelector label={"Check-in"} />
          </Grid>
          <Grid item xs={6} md={2} lg={2}>
            <DateSelector label={"Check-out"} />
          </Grid>
          <Grid item xs={12} md={4} lg={4}>
            <Travellers />
          </Grid>
          <Grid item>
            <Button variant="outlined" size="large">
              Search
            </Button>
          </Grid>
        </Grid>
      </Box>
    </Paper>)
}