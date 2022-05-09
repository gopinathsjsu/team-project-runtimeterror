import * as React from 'react';
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';


export default function Footer() {
  return (
    <Box
      component="footer"
      sx={{
        py: 2,
        backgroundColor: 'white',
      }}
    >
      <Container maxWidth="md">
        <Typography variant="caption" display="block" gutterBottom>
          CMPE-277 Team Project. RuntimeTerror
        </Typography>
      </Container>
    </Box>
  );
}