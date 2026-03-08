import React from 'react';

function IntroSection({ recipeId }) {
  const difficultyToStars = (difficulty) => {
    switch (difficulty.toLowerCase()) {
      case 'easy': return 1;
      case 'medium': return 2;
      case 'hard': return 3;
      case 'expert': return 4;
      default: return 1;
    }
  };

  const recipeData = {
    "1": {
      title: "Spaghetti Bolognese",
      difficulty: "Easy",
      prep: "25 min",
      cook: "30 min",
      bake: "0 min",
      tags: ["Has Lactose", "Beef", "Garlic"],
      img: "https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg"
    },
    "2": {
      title: "Honey Orange Fizz",
      difficulty: "Medium",
      prep: "10 min",
      cook: "0 min",
      bake: "0 min",
      tags: ["Beverage", "Refreshing", "Citrus"],
      img: "https://images.unsplash.com/photo-1546171753-97d7676e4602"
    }
  };

  const currentRecipe = recipeData[recipeId] || {
    title: "Chicken Alfredo",
    difficulty: "Easy",
    prep: "45 min",
    cook: "30 min",
    bake: "0 min",
    tags: ["Has Lactose", "Beef", "Garlic"],
    img: "/assets/intro.png"
  };

  const tagColors = [
    "bg-blue-200 text-blue-800",
    "bg-red-200 text-red-800",
    "bg-green-200 text-green-800",
    "bg-purple-200 text-purple-800",
    "bg-orange-200 text-orange-800",
  ];

  const parseMinutes = (str) => parseInt(str) || 0;
  const totalMinutes =
    parseMinutes(currentRecipe.prep) +
    parseMinutes(currentRecipe.cook) +
    parseMinutes(currentRecipe.bake);
  const totalCookTime = `${totalMinutes} min`;

  const Stars = ({ difficulty, max = 4 }) => {
    const filled = difficultyToStars(difficulty);
    return (
      <div className="flex gap-1 my-2 items-center">
        {Array.from({ length: max }).map((_, i) => (
          <svg
            key={i}
            xmlns="http://www.w3.org/2000/svg"
            className="w-6 h-6"
            viewBox="0 0 24 24"
            fill={i < filled ? "#f5a623" : "none"}
            stroke="#f5a623"
            strokeWidth="1.5"
          >
            <polygon points="12,2 15.09,8.26 22,9.27 17,14.14 18.18,21.02 12,17.77 5.82,21.02 7,14.14 2,9.27 8.91,8.26" />
          </svg>
        ))}
        <span className="ml-2 text-sm font-semibold text-gray-600">{currentRecipe.difficulty}</span>
      </div>
    );
  };

  return (
    <div className="bg-[#ffd470] w-full py-16 flex items-center justify-center">
      <div className="flex items-center w-full px-16 gap-12 justify-between">

        {/* Polaroid photo frame */}
        <div className="relative flex-shrink-0" style={{ width: '220px', height: '250px' }}>
          <div
            className="absolute inset-0 bg-white shadow-xl"
            style={{ transform: 'rotate(-4deg)', borderRadius: '2px' }}
          />
          <img
            src={currentRecipe.img}
            alt={currentRecipe.title}
            className="absolute"
            style={{
              top: '16px',
              left: '16px',
              width: 'calc(100% - 32px)',
              height: 'calc(100% - 56px)',
              objectFit: 'cover',
              borderRadius: '1px'
            }}
          />
        </div>

        {/* Right side info */}
        <div className="flex flex-col flex-1 pl-8">
          <h1 className="font-bold text-5xl leading-tight mb-3" style={{ fontFamily: 'Georgia, serif' }}>
            {currentRecipe.title}
          </h1>

          {/* Stars + time badge */}
          <div className="flex items-center gap-4">
            <Stars difficulty={currentRecipe.difficulty} />
            <div className="flex items-center gap-1 bg-white rounded-full px-3 py-1 text-sm font-semibold shadow-sm">
              <svg xmlns="http://www.w3.org/2000/svg" className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth="2">
                <circle cx="12" cy="12" r="10" /><path d="M12 6v6l4 2" />
              </svg>
              {totalMinutes} MIN
            </div>
          </div>

          <hr className="border-black border-t-2 my-3" />

          {/* Info cards */}
          <div className="flex gap-3 mb-4">
            {[
              { label: "Difficulty", value: currentRecipe.difficulty },
              { label: "Preparation", value: currentRecipe.prep },
              { label: "Total Time", value: totalCookTime },
            ].map(({ label, value }) => (
              <div key={label} className="bg-white rounded-xl px-5 py-3 shadow-sm flex-1 text-center">
                <p className="text-xs text-gray-500 mb-1">{label}</p>
                <p className="font-bold text-sm">{value}</p>
              </div>
            ))}
          </div>

          {/* Tag pills */}
          <div className="flex gap-2 flex-wrap">
            {currentRecipe.tags.map((tag, index) => (
              <span
                key={index}
                className={`text-xs font-semibold px-3 py-1 rounded-full ${tagColors[index % tagColors.length]}`}
              >
                {tag}
              </span>
            ))}
          </div>
        </div>

      </div>
    </div>
  );
}

export default IntroSection;