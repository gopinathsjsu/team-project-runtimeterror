import Landing from './Landing';
import TopBanner from './TopBanner';
import './styles/App.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Footer from './Footer';
import SignIn from './Login/SingIn';
import SignUp from './Login/SignUp';
import ManageAccount from './Login/ManageAccount'
import Booking from './Booking/Booking'
import Confirmation from './Booking/Confirmation'
import BookingDetails from './Booking/BookingDetails'
import BookingHistory from './Booking/BookingHistory'

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
              <Route path="/manage-account" element={<ManageAccount />} />
              <Route path="/mybookings" element={<BookingHistory />} />
              <Route path="/book" element={<Booking />} />
              <Route path="/confirm" element={<Confirmation />} />
              <Route path="/booking/:bookingId" element={<BookingDetails />} />
            </Routes>
          </div>
        </BrowserRouter>
        <Footer />
      </div>
    </React.Fragment>
  );
}

export default App;
