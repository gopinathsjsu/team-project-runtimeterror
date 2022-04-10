import Landing from './Landing';
import TopBanner from './TopBanner';
import './styles/App.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Footer from './Footer';
import SignIn from './Login/SingIn';
import SignUp from './Login/SignUp';

function App() {
  return (
    <React.Fragment>
      <div className='applicationWrapper'>
        <BrowserRouter>
        <TopBanner />
          <div className='bodyContainer'>
            <Routes>
              <Route path="/" element={<Landing />} />
              <Route path="/login" element={<SignIn />} />
              <Route path="/signup" element={<SignUp />} />
            </Routes>
          </div>
        </BrowserRouter>
        <Footer />
      </div>
    </React.Fragment>
  );
}

export default App;
