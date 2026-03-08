import React from 'react';
import Tags from './Tags';


function IntroSection({ recipeId, recipeData }) {


    //Fallback to Chicken Alfredo if ID doesn't match
    // const currentRecipe = recipeData[recipeId] || {
    //     title: "Chicken Alfredo",
    //     difficulty: "Easy",
    //     prep: "45 minutes",
    //     cook: "0 minutes",
    //     tags: ["Has Lactose", "Beef", "Garlic"],
    //     img: "/assets/intro.png"
    // };

    const currentRecipe = recipeData.recipe
    const tags = recipeData.tags || [];
    console.log("IntroSection received recipeData:", recipeData);

    return (
        <div className="bg-[#ffd470] w-full p-8">
            <div className="flex justify-between items-center max-w-screen-lg mx-auto">
                {/*TODO: use relative position for white bg */}
                <div className=" m-6 bg-white shadow-lg aspect-square">
                    <img src={currentRecipe.img} alt="Intro" className="intro-image rotate-[9deg] object-cover" style={{ width: '500px', height: '500px' }} />
                </div>
                <div className="pl-8 flex flex-col">
                    <h1 className="font-semibold text-5xl p-4">{currentRecipe.recipe_name}</h1>
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
                        <Tags tags={tags} />
                    </div>
                </div>
            </div>
        </div >
    );
}

export default IntroSection;