import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router';
import { scaleAndConvertIngredient } from '../utils/unitConversion';
import './RecipeDetail.css';

const RecipeDetail = () => {
  const { id } = useParams();
  const [recipeData, setRecipeData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [servings, setServings] = useState(1);
  const [isMetric, setIsMetric] = useState(true);

  useEffect(() => {
    const fetchRecipeDetail = async () => {
      setLoading(true);
      setError('');

      try {
        const response = await fetch(`http://localhost:5003/api/recipe/${id}`);
        if (!response.ok) {
          throw new Error('Failed to fetch recipe details');
        }

        const data = await response.json();
        setRecipeData(data);

        const baseServings = data?.recipe?.base_servings;
        if (baseServings && Number(baseServings) > 0) {
          setServings(Number(baseServings));
        }
      } catch (err) {
        setError(err.message || 'Unable to load recipe details');
      } finally {
        setLoading(false);
      }
    };

    fetchRecipeDetail();
  }, [id]);

  const recipe = recipeData?.recipe;
  const ingredients = recipeData?.ingredients || [];
  const tools = recipeData?.tools || [];
  const nutrition = recipeData?.nutrition?.[0] || {};
  const baseServings = recipe?.base_servings || 1;

  if (loading) {
    return <div className="recipe-detail-container"><p>Loading recipe details...</p></div>;
  }

  if (error) {
    return <div className="recipe-detail-container"><p>{error}</p></div>;
  }

  if (!recipe) {
    return <div className="recipe-detail-container"><p>Recipe not found.</p></div>;
  }

  return (
    <div className="recipe-detail-container">
      <div className="ingredients-section">
        <div className="ingredients-header">
          <h2>Ingredients for {recipe.recipe_name}</h2>
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
          {ingredients.map((ing) => {
            const converted = scaleAndConvertIngredient(
              ing.quantity,
              ing.unit,
              baseServings,
              servings,
              isMetric ? 'metric' : 'imperial'
            );

            return (
              <li key={ing.ingredient_id}>
                <span className="ing-name">• {ing.ingredient_name}  </span>
                <span className="ing-amount">
                  {converted.quantity} {converted.unit}
                </span>
              </li>
            );
          })}
        </ul>
      </div>

      <div className="info-sidebar">
        <div className="utensils-box">
          <h3>Utensils</h3>
          <p>{tools.map((tool) => tool.tool_name).join(', ') || 'N/A'}</p>
        </div>

        <div className="nutrition-card">
          <div className="nutrition-row"><span>Cal</span> <strong>{recipe.calories_per_serving}</strong></div>
          <div className="nutrition-row"><span>Fat</span> <strong>{nutrition.fat} g</strong></div>
          <div className="nutrition-row"><span>Protein</span> <strong>{nutrition.protein} g</strong></div>
          <div className="nutrition-row"><span>Carb</span> <strong>{nutrition.carbs} g</strong></div>
        </div>
      </div>
    </div>
  );
};

export default RecipeDetail;