import React from 'react';
import { useParams, useNavigate } from 'react-router'; 
import IntroSection from "./components/introSection";
import RecipeDetail from "./components/RecipeDetail";
import RecipeHowto from "./components/RecipeHowto";

function RecipePage() {
    const { id } = useParams();
    const navigate = useNavigate(); // 2. Initialize the hook

    return (
        <div className="recipe-page-container relative">
            {/* 3. The Back Button */}
            <button 
                onClick={() => navigate('/')} 
                className="absolute top-4 left-4 z-10 bg-black text-white px-4 py-2 rounded-full hover:bg-gray-800 transition-colors shadow-lg"
            >
                ← Back to Menu
            </button>

            <IntroSection recipeId={id} />
            <RecipeDetail recipeId={id} />
            <RecipeHowto   recipeId={id}/>
        </div>
    );
}

export default RecipePage;