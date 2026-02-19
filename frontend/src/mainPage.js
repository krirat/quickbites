import React, { useState, useEffect } from 'react';
import './MainPage.css';

function MainPage() {
    const [ingredientsList, setIngredientsList] = useState([]); 
    const [selectedIngredients, setSelectedIngredients] = useState([]); 
    const [filteredRecipes, setFilteredRecipes] = useState([]); 

    // Fetch ingredients from your local Express server
    useEffect(() => {
        fetch('http://localhost:5003/api/ingredients')
            .then(res => res.json())
            .then(data => setIngredientsList(data))
            .catch(err => console.error("Failed to load ingredients:", err));
    }, []);

    const handleIngredientChange = (ingredientId) => {
        setSelectedIngredients(prev => 
            prev.includes(ingredientId) 
                ? prev.filter(id => id !== ingredientId) 
                : [...prev, ingredientId]
        );
    };

    const handleSearch = () => {
        if (selectedIngredients.length === 0) {
            alert("Please select at least one ingredient!");
            return;
        }

        const ids = selectedIngredients.join(',');
        fetch(`http://localhost:5003/api/recipes/filter?ingredients=${ids}`)
            .then(res => res.json())
            .then(data => {
                setFilteredRecipes(data);
                window.scrollTo({ top: 600, behavior: 'smooth' });
            })
            .catch(err => console.error("Search failed:", err));
    };

    return (
        <div className="main-container">
            <div className="kitchen-card">
                <h1>What's in your kitchen?</h1>
                
                {/* SearchBar has been removed */}

                <div className="ingredient-grid">
                    {ingredientsList.map(ing => (
                        <label key={ing.ingredient_id} className="checkbox-container">
                            <input 
                                type="checkbox" 
                                checked={selectedIngredients.includes(ing.ingredient_id)}
                                onChange={() => handleIngredientChange(ing.ingredient_id)} 
                            />
                            <span className="ingredient-name">{ing.ingredient_name}</span>
                        </label>
                    ))}
                </div>

                <button className="search-btn" onClick={handleSearch}>
                    Search
                </button>
            </div>

            <section className="results-section">
                {filteredRecipes.length > 0 ? (
                    <div className="recipe-list">
                        {filteredRecipes.map(recipe => (
                            <div key={recipe.recipe_id} className="recipe-card">
                                <h3>{recipe.recipe_name}</h3>
                                <p>{recipe.description}</p>
                                <button className="view-recipe-btn">View Full Recipe</button>
                            </div>
                        ))}
                    </div>
                ) : (
                    <p className="no-results">Select ingredients and hit Search to find dinner!</p>
                )}
            </section>
        </div>
    );
}

export default MainPage;