import React from 'react';


function IntroSection({ recipeId }) {
    // Temporary mock data to match your RecipeDetail.js logic
    const recipeData = {
        "1": {
            title: "Spaghetti Bolognese",
            difficulty: "Medium",
            prep: "15 mins",
            cook: "30 mins",
            tags: ["Italian", "Beef", "Pasta"],
            img: "https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg"
        },
        "2": {
            title: "Honey Orange Fizz",
            difficulty: "Easy",
            prep: "10 mins",
            cook: "0 mins",
            tags: ["Beverage", "Refreshing", "Citrus"],
            img: "https://images.unsplash.com/photo-1546171753-97d7676e4602"
        }
    };

    // Fallback to Chicken Alfredo if ID doesn't match
    const currentRecipe = recipeData[recipeId] || {
        title: "Chicken Alfredo",
        difficulty: "Easy",
        prep: "45 minutes",
        cook: "0 minutes",
        tags: ["Has Lactose", "Beef", "Garlic"],
        img: "/assets/intro.png"
    };

    return (
        <div className="bg-[#ffd470] w-full p-8">
            <div className="flex justify-between items-center max-w-screen-lg mx-auto">
                {/*TODO: use relative position for white bg */}
                <div className=" m-6 bg-white shadow-lg aspect-square">
                    <img src={currentRecipe.img} alt="Intro" className="intro-image rotate-[9deg] object-cover" style={{ width: '500px', height: '500px' }} />
                </div>
                <div className="pl-8 flex flex-col">
                    <h1 className="font-semibold text-5xl p-4">{currentRecipe.title}</h1>
                    <hr className='border-black border-2' />
                    <div className="flex justify-evenly bg-white p-4 m-2 rounded-lg">
                        <div>
                            <h2 className="font-bold">Difficulty</h2>
                            <p>{currentRecipe.difficulty}</p>
                        </div>
                        <div>
                            <h2 className="font-bold">Preparation</h2>
                            <p>{currentRecipe.prep}</p>
                        </div>
                        <div>
                            <h2 className="font-bold">Cooking</h2>
                            <p>{currentRecipe.cook}</p>
                        </div>
                    </div>
                    <div className="flex gap-4">
                        {currentRecipe.tags.map((tag, index) => (
                            <p key={index}>{tag}</p>
                        ))}
                    </div>
                </div>
            </div>
        </div >
    );
}

export default IntroSection;