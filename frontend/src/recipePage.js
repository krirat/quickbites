import { useState, useEffect } from 'react';
import { useParams, useNavigate } from 'react-router';
import IntroSection from "./components/introSection";
import RecipeDetail from "./components/RecipeDetail";
import RecipeHowto from "./components/RecipeHowto";

function RecipePage() {
    const { id } = useParams();
    const navigate = useNavigate(); // 2. Initialize the hook
    const [data, setData] = useState({})
    const [loading, setLoading] = useState(true);
    console.log("RecipePage received recipeId:", id);

    useEffect(() => {
        console.log("hi")
        const fetchData = async () => {
            try {
                //setSteps(MOCK_STEPS);
                console.log("Fetching recipe data for ID:", id);
                const response = await fetch(`http://localhost:5003/api/recipe/${id}`);
                if (!response.ok) throw new Error("Failed to fetch recipe data");
                const data = await response.json();
                setData(data);
                console.log("Fetched recipe data:", data);
            } catch (err) {
                console.log(err.message);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, [id]);

    return (
        <div className="recipe-page-container relative">
            {/* 3. The Back Button */}
            <button
                onClick={() => navigate(-1)}
                className="absolute top-4 left-4 z-10 bg-black text-white px-4 py-2 rounded-full hover:bg-gray-800 transition-colors shadow-lg"
            >
                ← Back to Menu
            </button>

            {loading ? (
                <p>Loading...</p>
            ) : (
                <>
                    <IntroSection recipeId={id} recipeData={data} />
                    <RecipeDetail recipeId={id} recipeData={data} />
                    <RecipeHowto recipeId={id} />
                </>
            )}
        </div>
    );
}

export default RecipePage;