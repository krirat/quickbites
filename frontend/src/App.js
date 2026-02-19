import React from 'react';
import { Routes, Route } from 'react-router';
import { BrowserRouter } from "react-router";
import MainPage from './mainPage'; // Change checkboxes

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
