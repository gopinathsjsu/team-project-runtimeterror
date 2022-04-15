import React, { useEffect, useState } from 'react';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import FormLabel from '@mui/material/FormLabel';
import Paper from '@mui/material/Paper';
import { Box, Container } from '@mui/material';
import AttachMoneyIcon from '@mui/icons-material/AttachMoney';
import Avatar from '@mui/material/Avatar';
import Button from '@mui/material/Button';
import Typography from '@mui/material/Typography';
import { getPricingStrategies, setPricingStrategy } from '../helpers/API'


export default function PricingStrategy() {
  const [strategies, setStrategies] = useState([])
  useEffect(() => {
    const fetchPricingStrategies = async () => {
      const { data } = await getPricingStrategies()
      setStrategies(data)
    }
    fetchPricingStrategies()
  }, [])

  const savePricingStrategy = () => {

  }

  return (
    <Paper elevation={6}>
      <Container component="main" maxWidth="xs">
        <Box sx={{
          padding: '1.6rem',
          width: '22rem',
          marginTop: 4,
          display: 'flex',
          flexDirection: 'column',
          alignItems: 'center',
          justifyContent: 'space-between'
        }}>
          <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
            <AttachMoneyIcon />
          </Avatar>
          <Typography component="h1" variant="h5">
            Pricing Strategy
          </Typography>
          <Container sx={{ marginTop: '2rem', minHeight: '16rem' }}>
            {strategies.length > 1 ? <FormControl>
              <RadioGroup
                aria-labelledby="demo-radio-buttons-group-label"
                name="radio-buttons-group"
                defaultValue={strategies.find(s => s.enabled).shortCode}
              >
                {strategies.map(strategy => {
                  return <FormControlLabel value={strategy.shortCode} control={<Radio />} label={strategy.strategyName} />
                })}
              </RadioGroup>
            </FormControl> : null}

          </Container>

          <Container sx={{ display: 'flex', justifyContent: 'space-around' }}>
            <Button onClick={() => { savePricingStrategy() }} variant="outlined" size="medium">Save</Button>
          </Container>

        </Box>
      </Container>
    </Paper>
  );
}