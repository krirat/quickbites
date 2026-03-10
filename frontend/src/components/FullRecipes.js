import { useState, useEffect } from "react";
import { useNavigate, useSearchParams } from "react-router";
import SearchBar from "./searchBar";
import Tags from "./Tags";

// const recipes = [
//   {
//     id: 1,
//     title: "Beef Burger",
//     time: "20 min",
//     tags: [
//       { label: "Beef", color: "#C0651A" },
//       { label: "HCal", color: "#E07B39" },
//       { label: "A", color: "#4CAF50" },
//       { label: "B", color: "#7C3AED" },
//     ],
//     description: "A sandwich featuring a cooked patty of ground beef, seasoned and shaped, served between two halves of a sliced bun.",
//     image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&q=80",
//   },
//   {
//     id: 2,
//     title: "Steak with charred corn salsa and smoky butter",
//     time: "20 min",
//     tags: [{ label: "L", color: "#4DD0C4" }],
//     description: "Try our easy steak with charred corn salsa for two. Drizzled with smoky butter, this simple one-pan dinner is ready in just 20 minutes.",
//     image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=600&q=80",
//   },
//   {
//     id: 3,
//     title: "Hot Thai beef salad",
//     time: "20 min",
//     tags: [{ label: "Beef", color: "#C0651A" }],
//     description: "This quick and easy Thai beef salad recipe is tasty and substantial enough to satisfy as a main course.",
//     image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&q=80",
//   },
//   {
//     id: 4,
//     title: "Grilled Salmon with Lemon Butter",
//     time: "15 min",
//     tags: [{ label: "Fish", color: "#2196F3" }, { label: "L", color: "#4DD0C4" }],
//     description: "Perfectly grilled salmon fillet with a zesty lemon butter sauce, served with seasonal greens and roasted cherry tomatoes.",
//     image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80",
//   },
//   {
//     id: 5,
//     title: "Mushroom Risotto",
//     time: "35 min",
//     tags: [{ label: "V", color: "#4CAF50" }, { label: "A", color: "#9C27B0" }],
//     description: "Creamy Italian risotto packed with wild mushrooms, parmesan and fresh thyme. A comforting bowl of pure indulgence.",
//     image: "https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=600&q=80",
//   },
//   {
//     id: 6,
//     title: "Avocado Toast with Poached Eggs",
//     time: "10 min",
//     tags: [{ label: "V", color: "#4CAF50" }, { label: "B", color: "#7C3AED" }],
//     description: "Smashed avocado on sourdough toast topped with perfectly poached eggs, chilli flakes and a drizzle of olive oil.",
//     image: "https://images.unsplash.com/photo-1541519227354-08fa5d50c820?w=600&q=80",
//   },
//   {
//     id: 7,
//     title: "Spicy Chicken Tacos",
//     time: "25 min",
//     tags: [{ label: "Chk", color: "#FF9800" }, { label: "HCal", color: "#E07B39" }],
//     description: "Crispy spiced chicken strips in warm tortillas with fresh salsa, guacamole and a squeeze of lime.",
//     image: "https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=600&q=80",
//   },
//   {
//     id: 8,
//     title: "Caprese Salad",
//     time: "5 min",
//     tags: [{ label: "V", color: "#4CAF50" }, { label: "L", color: "#4DD0C4" }],
//     description: "Classic Italian salad with fresh buffalo mozzarella, ripe tomatoes, basil leaves and a balsamic glaze.",
//     image: "https://images.unsplash.com/photo-1608897013039-887f21d8c804?w=600&q=80",
//   },
//   {
//     id: 9,
//     title: "Pad Thai Noodles",
//     time: "30 min",
//     tags: [{ label: "A", color: "#4CAF50" }, { label: "HCal", color: "#E07B39" }],
//     description: "Authentic Thai stir-fried rice noodles with prawns, tofu, bean sprouts, and a tangy tamarind sauce topped with crushed peanuts.",
//     image: "https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600&q=80",
//   },
// ];

export default function RecipeCards() {
  const [selected, setSelected] = useState(1);
  const [hovered, setHovered] = useState(null);
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();

  const API_URL = "http://localhost:5003/api";
  const [tags, setTags] = useState([]);
  const [search, setSearch] = useState(searchParams.get("q") || '');
  const [ingredients, setIngredients] = useState([]);
  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    fetch(API_URL + "/tags")
      .then((response) => response.json())
      .then((data) => {
        const tagsWithSelection = data.map(tag => ({
          ...tag,
          selected: searchParams.get("tags") && searchParams.get("tags").split(',').includes(tag.tag_id.toString())
        }));
        setTags(tagsWithSelection);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
    fetch(API_URL + "/ingredients")
      .then((response) => response.json())
      .then((data) => {
        setIngredients(data);
      })
      .catch((error) => {
        console.error("Error fetching ingredients:", error);
      });
    fetch(API_URL + "/get-recipes")
      .then((response) => response.json())
      .then((data) => {
        const normalizedRecipes = data.map((recipe) => ({
          ...recipe,
          id: recipe.recipe_id ?? recipe.id,
          title: recipe.recipe_name ?? recipe.title ?? "",
          tags: (recipe.tag_id || []).map((tagId, index) => ({
            tag_id: Number(tagId),
            tag_name: recipe.tag_name?.[index] || ""
          })),
          ingredients: (recipe.ingredient_id || []).map((ingredientId, index) => ({
            ingredient_id: Number(ingredientId),
            ingredient_name: recipe.ingredient_name?.[index] || ""
          }))
        }));
        setRecipes(normalizedRecipes);
      })
      .catch((error) => {
        console.error("Error fetching recipes:", error);
      });

  }, [searchParams]);



  const toggleTag = (id) => {
    setTags((prev) =>
      prev.map((tag) => ({
        ...tag,
        selected: tag.tag_id === id ? !tag.selected : tag.selected
      }))
    );
  };

  const selectedTagIds = tags
    .filter((tag) => tag.selected)
    .map((tag) => Number(tag.tag_id));

  const selectedIngredientFilters = (searchParams.get("ingredients") || "")
    .split(",")
    .map((value) => value.trim())
    .filter(Boolean);

  const filteredRecipes = recipes.filter((recipe) => {
    const recipeName = (recipe.recipe_name || recipe.title || "").toLowerCase();
    const recipeDescription = (recipe.description || "").toLowerCase();
    const recipeIngredientNames = Array.isArray(recipe.ingredients)
      ? recipe.ingredients.map((ingredient) => String(ingredient.ingredient_name).toLowerCase())
      : [];
    const recipeTagIds = Array.isArray(recipe.tags)
      ? recipe.tags.map((tag) => Number(tag.tag_id))
      : [];
    const recipeIngredientIds = Array.isArray(recipe.ingredients)
      ? recipe.ingredients.map((ingredient) => Number(ingredient.ingredient_id))
      : [];

    const normalizedSearch = search.trim().toLowerCase();
    const matchesSearch = !normalizedSearch ||
      recipeName.includes(normalizedSearch) ||
      recipeDescription.includes(normalizedSearch) ||
      recipeIngredientNames.some((ingredient) => ingredient.includes(normalizedSearch));

    const matchesTags =
      selectedTagIds.length === 0 ||
      selectedTagIds.some((selectedTagId) => recipeTagIds.includes(selectedTagId));

    const matchesIngredients =
      selectedIngredientFilters.length === 0 ||
      selectedIngredientFilters.every((selectedIngredient) => {
        const selectedId = Number(selectedIngredient);
        if (!Number.isNaN(selectedId)) {
          return recipeIngredientIds.includes(selectedId);
        }

        const selectedName = selectedIngredient.toLowerCase();
        return recipeIngredientNames.some((ingredientName) => ingredientName.includes(selectedName));
      });

    return matchesSearch && matchesTags && matchesIngredients;
  });

  return (
    <>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500&display=swap');

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
          font-family: 'DM Sans', sans-serif;
          background: ##ffd470;
          min-height: 100vh;
        }

        .page {
          min-height: 100vh;
          background: #ffd470;
          padding: 48px 40px;
        }

        .back-btn {
          display: inline-flex;
          align-items: center;
          gap: 8px;
          background: none;
          border: 2px solid #1A1A1A;
          padding: 10px 22px;
          cursor: pointer;
          font-family: 'DM Sans', sans-serif;
          font-weight: 600;
          font-size: 14px;
          letter-spacing: 0.05em;
          margin-bottom: 32px;
          border-radius: 10px;
          transition: background 0.2s, color 0.2s;
        }

        .back-btn:hover {
          background: #1A1A1A;
          color: #F9C846;
        }

        .page-title {
          font-family: 'Playfair Display', serif;
          font-size: 42px;
          font-weight: 700;
          color: #1A1A1A;
          margin-bottom: 32px;
        }

        .grid {
          display: grid;
          grid-template-columns: repeat(3, 1fr);
          gap: 28px;
          max-width: 1100px;
          margin: 0 auto;
        }

        @media (max-width: 900px) {
          .grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 560px) {
          .grid { grid-template-columns: 1fr; }
          .page { padding: 32px 20px; }
        }

        .card {
          background: white;
          border-radius: 28px;
          overflow: hidden;
          display: flex;
          flex-direction: column;
          height: 560px;
          transition: transform 0.3s ease, box-shadow 0.3s ease;
          cursor: pointer;
          position: relative;
          box-shadow: 0 4px 24px rgba(0,0,0,0.08);
        }

        .card:hover {
          transform: translateY(-6px);
          box-shadow: 0 16px 48px rgba(0,0,0,0.14);
        }

        .card.selected {
          outline: 3px solid #ed963a;
          outline-offset: 0px;
        }

        .card-image-wrap {
          width: 100%;
          height: 240px;
          overflow: hidden;
          position: relative;
          flex-shrink: 0;
        }

        .card-image-wrap img {
          width: 100%;
          height: 100%;
          object-fit: cover;
          transition: transform 0.5s ease;
          display: block;
        }

        .card:hover .card-image-wrap img {
          transform: scale(1.05);
        }

        .card-body {
          padding: 20px 22px 0 22px;
          flex: 1;
          display: flex;
          flex-direction: column;
          overflow: hidden;
          min-height: 0;
        }

        .card-title {
          font-family: 'Playfair Display', serif;
          font-size: 22px;
          font-weight: 700;
          line-height: 1.25;
          color: #1A1A1A;
          margin-bottom: 10px;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
          overflow: hidden;
        }

        .card-meta {
          display: flex;
          align-items: center;
          gap: 10px;
          margin-bottom: 12px;
          flex-wrap: wrap;
        }

        .card-time {
          display: flex;
          align-items: center;
          gap: 5px;
          font-size: 14px;
          color: #333;
          font-weight: 500;
          white-space: nowrap;
        }

        .clock-icon {
          width: 18px;
          height: 18px;
          border: 2px solid #333;
          border-radius: 50%;
          position: relative;
          flex-shrink: 0;
        }
        .clock-icon::before {
          content: '';
          position: absolute;
          top: 50%;
          left: 50%;
          width: 5px;
          height: 1.5px;
          background: #333;
          transform-origin: left center;
          transform: translateY(-50%) rotate(-60deg);
        }
        .clock-icon::after {
          content: '';
          position: absolute;
          top: 50%;
          left: 50%;
          width: 4px;
          height: 1.5px;
          background: #333;
          transform-origin: left center;
          transform: translateY(-50%) rotate(60deg);
        }

        .tags-row {
          display: flex;
          align-items: center;
          gap: 5px;
          flex: 1;
        }

        .tag {
          width: 26px;
          height: 26px;
          border-radius: 50%;
          display: flex;
          align-items: center;
          justify-content: center;
          color: white;
          font-size: 10px;
          font-weight: 700;
          flex-shrink: 0;
          letter-spacing: 0;
        }

        .tag-bar {
          flex: 1;
          background: #E5E7EB;
          border-radius: 99px;
          min-width: 40px;
        }

        .card-desc {
          font-size: 13px;
          color: #555;
          line-height: 1.65;
          flex: 1;
          overflow: hidden;
          display: -webkit-box;
          -webkit-line-clamp: 4;
          -webkit-box-orient: vertical;
          margin-bottom: 0;
        }

        .card-footer {
          border-top: 1px solid #F0F0F0;
          padding: 14px 22px;
          text-align: center;
          flex-shrink: 0;
          margin-top: auto;
        }

        .view-btn {
          background: none;
          border: none;
          font-family: 'DM Sans', sans-serif;
          font-size: 12px;
          font-weight: 600;
          letter-spacing: 0.12em;
          text-transform: uppercase;
          color: #999;
          cursor: pointer;
          transition: color 0.2s;
          padding: 0;
        }

        .card:hover .view-btn {
          color: #333;
        }

        .card.selected .view-btn {
          color: #ed963a;
        }

        @keyframes fadeUp {
          from { opacity: 0; transform: translateY(30px); }
          to   { opacity: 1; transform: translateY(0); }
        }

        .card:nth-child(1) { animation: fadeUp 0.5s ease 0.00s both; }
        .card:nth-child(2) { animation: fadeUp 0.5s ease 0.07s both; }
        .card:nth-child(3) { animation: fadeUp 0.5s ease 0.14s both; }
        .card:nth-child(4) { animation: fadeUp 0.5s ease 0.21s both; }
        .card:nth-child(5) { animation: fadeUp 0.5s ease 0.28s both; }
        .card:nth-child(6) { animation: fadeUp 0.5s ease 0.35s both; }
        .card:nth-child(7) { animation: fadeUp 0.5s ease 0.42s both; }
        .card:nth-child(8) { animation: fadeUp 0.5s ease 0.49s both; }
        .card:nth-child(9) { animation: fadeUp 0.5s ease 0.56s both; }
      `}</style>

      <div className="page">

        {/* Back Button */}
        <button className="back-btn" onClick={() => navigate('/')}>
          ← Back
        </button>

        <h1 className="page-title">Full Recipes</h1>

        <div className="flex flex-col items-center gap-4 mb-8">
          <div className="flex flex-col items-start w-1/2 gap-4">
            <SearchBar recipe_tags={tags} onTagToggle={toggleTag} initialInput={search} onInput={setSearch} />
            <Tags tags={tags.filter((tag) => tag.selected)} />

          </div>
        </div>

        <div className="grid">
          {filteredRecipes.map((r) => (
            <div
              key={r.id}
              className={`card${selected === r.id ? " selected" : ""}`}
              onClick={() => { setSelected(r.id); navigate(`/recipes/${r.id}`); }}
              onMouseEnter={() => setHovered(r.id)}
              onMouseLeave={() => setHovered(null)}
            >
              <div className="card-image-wrap bg-gray-300">
                <img src={r.image_url} alt={r.recipe_name} />
              </div>

              <div className="card-body">
                <h2 className="card-title">{r.recipe_name}</h2>

                <div className="card-meta">
                  <div className="card-time">
                    <div className="clock-icon" />
                    {r.total_time_minutes} min
                  </div>
                  <div className="tags-row relative overflow-x-scroll [scrollbar-width:none] [&::-webkit-scrollbar]:hidden">
                    <div className="absolute tag-bar -z-10 w-full h-full" />
                    <Tags tags={r.tags} small={true} />
                  </div>
                </div>

                <p className="card-desc">{r.description}</p>
              </div>

              <div className="card-footer">
                <button className="view-btn">View Full Recipe</button>
              </div>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}