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
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<EmptySearchPage />} />
          <Route path="/listings" element={<ListingsPage />} />
        </Routes>
      </BrowserRouter>
    </React.Fragment>
    // <div className="App">
    //   <header className="App-header">
    //     <img src={logo} className="App-logo" alt="logo" />
    //     <p>
    //       Edit <code>src/App.js</code> and save to reload.
    //     </p>
    //     <a
    //       className="App-link"
    //       href="https://reactjs.org"
    //       target="_blank"
    //       rel="noopener noreferrer"
    //     >
    //       Learn React
    //     </a>
    //   </header>
    // </div>
  );
}

export default App;
