import React, { useState } from 'react';
import { useParams } from 'react-router'; // 1. Import this to read the URL
import './RecipeDetail.css';

const RecipeDetail = () => {
  const { id } = useParams(); // 2. Grab the ID from the URL (e.g., "1" or "2")
  const [servings, setServings] = useState(2);
  const [isMetric, setIsMetric] = useState(true);

  // 3. Mock Database (The "Whole Family" of Recipes)
  const recipeDatabase = {
    "1": {
      name: "Spaghetti Bolognese",
      ingredients: [
        { name: 'spaghetti', amount: 500, unit: 'g', ratio: 0.035, imperialUnit: 'oz' },
        { name: 'ground beef', amount: 500, unit: 'g', ratio: 0.0022, imperialUnit: 'lb' }
      ],
      utensils: "pot (large), cooking spoon, colander",
      nutrition: { cal: 952, fat: 37, protein: 42, carb: 114 }
    },
    "2": {
      name: "Honey Orange Fizz",
      ingredients: [
        { name: 'Honey', amount: 2, unit: 'tbsp', ratio: 1, imperialUnit: 'tbsp' },
        { name: 'Orange Juice', amount: 200, unit: 'ml', ratio: 3.38, imperialUnit: 'oz' }
      ],
      utensils: "Shaker, glass, stirrer",
      nutrition: { cal: 120, fat: 0, protein: 1, carb: 30 }
    }
  };

  // 4. Select the recipe based on the ID, or fallback to Spaghetti if not found
  const recipe = recipeDatabase[id] || recipeDatabase["1"];

  const getDisplayAmount = (baseAmount, ratio) => {
    const scaled = (baseAmount / 2) * servings;
    if (!isMetric && ratio !== 1) return (scaled * ratio).toFixed(1);
    return Math.round(scaled);
  };

  return (
    <div className="recipe-detail-container">
      <div className="ingredients-section">
        <div className="ingredients-header">
          <h2>Ingredients for {recipe.name}</h2> {/* Now the title is dynamic! */}
          <div className="toggle-group">
            <span>Metric</span>
            <label className="switch">
              <input type="checkbox" checked={!isMetric} onChange={() => setIsMetric(!isMetric)} />
              <span className="slider round"></span>
            </label>
            <span>Imperial</span>
          </div>
        </div>

        <div className="servings-control">
          <button onClick={() => setServings(Math.max(1, servings - 1))}>-</button>
          <span className="serving-number">{servings}</span>
          <button onClick={() => setServings(servings + 1)}>+</button>
          <span className="serving-text">Serving</span>
        </div>

        <ul className="ingredient-list">
          {recipe.ingredients.map((ing, index) => (
            <li key={index}>
              <span className="ing-name">• {ing.name}</span>
              <span className="ing-amount">
                {getDisplayAmount(ing.amount, ing.ratio)} {isMetric ? ing.unit : ing.imperialUnit}
              </span>
            </li>
          ))}
        </ul>
      </div>

      <div className="info-sidebar">
        <div className="utensils-box">
          <h3>Utensils</h3>
          <p>{recipe.utensils}</p>
        </div>

        <div className="nutrition-card">
          <div className="nutrition-row"><span>Cal</span> <strong>{getDisplayAmount(recipe.nutrition.cal, 1)}</strong></div>
          <div className="nutrition-row"><span>Fat</span> <strong>{getDisplayAmount(recipe.nutrition.fat, 1)} g</strong></div>
          <div className="nutrition-row"><span>Protein</span> <strong>{getDisplayAmount(recipe.nutrition.protein, 1)} g</strong></div>
          <div className="nutrition-row"><span>Carb</span> <strong>{getDisplayAmount(recipe.nutrition.carb, 1)} g</strong></div>
        </div>
      </div>
    </div>
  );
};

export default RecipeDetail;