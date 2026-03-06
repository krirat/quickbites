import React from 'react';
import { Routes, Route } from 'react-router';
import { BrowserRouter } from "react-router";
import MainPage from './mainPage';
import FullRecipes from './components/FullRecipes';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/recipes/:id" element={<FullRecipes />} /> {/* ✅ Was RecipePage */}
        <Route path="*" element={<h1>404 Not Found</h1>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;