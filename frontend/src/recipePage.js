import React from 'react';
import { useParams, useNavigate } from 'react-router'; // 1. Added useNavigate
import IntroSection from "./components/introSection";
import RecipeDetail from "./components/RecipeDetail";

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
            <RecipeDetail />
        </div>
    );
}

export default RecipePage;