import React from 'react';
import { Routes, Route } from 'react-router';
import { BrowserRouter } from "react-router";
import MainPage from './mainPage';
import FullRecipes from './components/FullRecipes';
import RecipePage from './recipePage';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<MainPage />} />
        <Route path="/recipes" element={<FullRecipes />} /> {/* Redirect to main page for now */}
        <Route path="/recipes/:id" element={<RecipePage />} /> {/* ✅ Was RecipePage */}
        <Route path="*" element={<h1>404 Not Found</h1>} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;