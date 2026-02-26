import React from 'react';
import { Routes, Route } from 'react-router';
import { BrowserRouter } from "react-router";
import MainPage from './mainPage'; // Change checkboxes
import RecipePage from './recipePage'; // Recipe Page

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/recipes/:id" element={<RecipePage />} />
        <Route path="*" element={<h1>404 Not Found</h1>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;