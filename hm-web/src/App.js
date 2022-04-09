import Landing from './Landing';
import TopBanner from './TopBanner';
import './styles/App.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Footer from './Footer';

function App() {
  return (
    <React.Fragment>
      <div className='applicationWrapper'>
        <TopBanner />
        <BrowserRouter>
          <div className='bodyContainer'>
            <Routes>
              <Route path="/" element={<Landing />} />
              <Route path="/listings" element={<Landing />} />
            </Routes>
          </div>
        </BrowserRouter>
        <Footer />
      </div>
    </React.Fragment>
  );
}

export default App;
