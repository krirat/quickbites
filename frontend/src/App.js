import React from 'react';
import MainPage from './mainPage'; // Change checkboxes
import RecipeOfTheDay from "./component/RecipeOfTheDay"; // Recommendation Page

function App() {
  return (
    <div className="App">
      {/* Recommendation Components */}
      <RecipeOfTheDay /> 
      
      <hr /> {/* Optional line to separate your sections */}

      {/* Check Boxes Components */}
      <MainPage />
    </div>
  );
}

export default App;