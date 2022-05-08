import React from 'react'
import topbanner from './styles/TopBanner.module.css';
import Paper from '@mui/material/Paper';
import { Link } from 'react-router-dom'
import Box from '@mui/material/Box';
import Container from '@mui/material/Container';
import Typography from '@mui/material/Typography';
import { Grid } from '@mui/material';
import PersonIcon from '@mui/icons-material/Person';
import { Avatar } from '@mui/material';
import useMediaQuery from '@mui/material/useMediaQuery';
import { useLocation } from 'react-router-dom';
import { useEffect } from 'react';
import Cookies from 'js-cookie'
import Menu from './UserMenu/Menu'
import logo from './Assets/awesome_possum.jpeg'

export default function TopBanner() {
    const [userName, setUserName] = React.useState()
    const matches = useMediaQuery('(min-width:600px)');
    const location = useLocation()
    useEffect(() => {
        const name = Cookies.get('username')
        if (name) {
            setUserName(name)
        }
    }, [location])
    return (
        <Paper elevation={2} className={topbanner.header}>
            <Box
                component="header"
                sx={{
                    py: 2,
                    backgroundColor: 'white',
                }}
            >
                <Container maxWidth="lg">
                    <Grid container sx={{ dispalay: 'flex', justifyContent: 'space-between' }}>
                        <Grid item>
                            <Container sx={{display: 'flex'}}>
                                <Avatar alt="Awesome Possum" src={logo} />
                                <Typography variant="h4" display="block" ml>
                                    <Link className={topbanner.link} to="/">Hotel</Link>
                                </Typography>
                            </Container>
                        </Grid>
                        {
                            userName && <Grid item>
                                <Box sx={{ display: 'flex', alignItems: 'center' }}>
                                    <Menu userName={userName} />
                                </Box>

                            </Grid>
                        }
                        {location.pathname === `/` && !userName &&
                            <Grid item>
                                <Link className={topbanner.singInLink} to="/login">
                                    <PersonIcon />
                                    {matches ? `Sign In` : ``}
                                </Link>
                            </Grid>
                        }
                    </Grid>
                </Container>
            </Box>
        </Paper>
    );
}
