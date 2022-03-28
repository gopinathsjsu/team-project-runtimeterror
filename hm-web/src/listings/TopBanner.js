import topbanner from '../styles/TopBanner.module.css';

export default function TopBanner() {
    return (
        <header className={topbanner.header}>
            <h1 className={topbanner.h1}>
                <a className={topbanner.link} href="/">Hotels</a>
            </h1>
        </header>
    );
}
