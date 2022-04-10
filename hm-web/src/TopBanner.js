import topbanner from './styles/TopBanner.module.css';
import Paper from '@mui/material/Paper';

export default function TopBanner() {
    return (
        <Paper elevation={2} className={topbanner.header}>
            <h1>
                <a className={topbanner.link} href="/">Hotels</a>
            </h1>
        </Paper>
    );
}
