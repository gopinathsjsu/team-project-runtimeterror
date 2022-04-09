import EmptySearchPage from './listings/EmptySearchPage';
import TopBanner from './listings/TopBanner';
import './styles/App.css';
import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import ListingsPage from './listings/ListingsPage';

function App() {
  return (
    <React.Fragment>
      <TopBanner />
      <div className='applicationWrapper'>
        <BrowserRouter>
          <Routes>
            <Route path="/" element={<EmptySearchPage />} />
            <Route path="/listings" element={<ListingsPage />} />
          </Routes>
        </BrowserRouter>
      </div>
    </React.Fragment>
  );
}

export default App;
