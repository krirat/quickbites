import { useState } from "react";
import SearchBar from "./searchBar";
import Tags from "./Tags";

const recipes = [
  {
    id: 1,
    title: "Beef Burger",
    time: "20 min",
    tags: [
      { label: "Beef", color: "#C0651A" },
      { label: "HCal", color: "#E07B39" },
      { label: "A", color: "#4CAF50" },
      { label: "B", color: "#7C3AED" },
    ],
    description: "A sandwich featuring a cooked patty of ground beef, seasoned and shaped, served between two halves of a sliced bun.",
    image: "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&q=80",
  },
  {
    id: 2,
    title: "Steak with charred corn salsa and smoky butter",
    time: "20 min",
    tags: [{ label: "L", color: "#4DD0C4" }],
    description: "Try our easy steak with charred corn salsa for two. Drizzled with smoky butter, this simple one-pan dinner is ready in just 20 minutes.",
    image: "https://images.unsplash.com/photo-1544025162-d76694265947?w=600&q=80",
  },
  {
    id: 3,
    title: "Hot Thai beef salad",
    time: "20 min",
    tags: [{ label: "Beef", color: "#C0651A" }],
    description: "This quick and easy Thai beef salad recipe is tasty and substantial enough to satisfy as a main course.",
    image: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=600&q=80",
  },
  {
    id: 4,
    title: "Grilled Salmon with Lemon Butter",
    time: "15 min",
    tags: [{ label: "Fish", color: "#2196F3" }, { label: "L", color: "#4DD0C4" }],
    description: "Perfectly grilled salmon fillet with a zesty lemon butter sauce, served with seasonal greens and roasted cherry tomatoes.",
    image: "https://images.unsplash.com/photo-1467003909585-2f8a72700288?w=600&q=80",
  },
  {
    id: 5,
    title: "Mushroom Risotto",
    time: "35 min",
    tags: [{ label: "V", color: "#4CAF50" }, { label: "A", color: "#9C27B0" }],
    description: "Creamy Italian risotto packed with wild mushrooms, parmesan and fresh thyme. A comforting bowl of pure indulgence.",
    image: "https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=600&q=80",
  },
  {
    id: 6,
    title: "Avocado Toast with Poached Eggs",
    time: "10 min",
    tags: [{ label: "V", color: "#4CAF50" }, { label: "B", color: "#7C3AED" }],
    description: "Smashed avocado on sourdough toast topped with perfectly poached eggs, chilli flakes and a drizzle of olive oil.",
    image: "https://images.unsplash.com/photo-1541519227354-08fa5d50c820?w=600&q=80",
  },
  {
    id: 7,
    title: "Spicy Chicken Tacos",
    time: "25 min",
    tags: [{ label: "Chk", color: "#FF9800" }, { label: "HCal", color: "#E07B39" }],
    description: "Crispy spiced chicken strips in warm tortillas with fresh salsa, guacamole and a squeeze of lime.",
    image: "https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=600&q=80",
  },
  {
    id: 8,
    title: "Caprese Salad",
    time: "5 min",
    tags: [{ label: "V", color: "#4CAF50" }, { label: "L", color: "#4DD0C4" }],
    description: "Classic Italian salad with fresh buffalo mozzarella, ripe tomatoes, basil leaves and a balsamic glaze.",
    image: "https://images.unsplash.com/photo-1608897013039-887f21d8c804?w=600&q=80",
  },
  {
    id: 9,
    title: "Pad Thai Noodles",
    time: "30 min",
    tags: [{ label: "A", color: "#4CAF50" }, { label: "HCal", color: "#E07B39" }],
    description: "Authentic Thai stir-fried rice noodles with prawns, tofu, bean sprouts, and a tangy tamarind sauce topped with crushed peanuts.",
    image: "https://images.unsplash.com/photo-1559314809-0d155014e29e?w=600&q=80",
  },
];

export default function RecipeCards() {
  const [selected, setSelected] = useState(1);
  const [hovered, setHovered] = useState(null);

  return (
    <>
      <style>{`
        @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500&display=swap');

        * { box-sizing: border-box; margin: 0; padding: 0; }

        body {
          font-family: 'DM Sans', sans-serif;
          background: #F9C846;
          min-height: 100vh;
        }

        .page {
          min-height: 100vh;
          background: #F9C846;
          padding: 48px 40px;
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
          height: 8px;
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
        <h1 className="page-title">Full Recipes</h1>
        <div className="flex flex-col items-center gap-4 mb-8">
          <SearchBar data_source="http://localhost:5003/api/recipes" />
          <Tags tags={["Italian", "Beef"]} />
        </div>
        <div className="grid">
          {recipes.map((r) => (
            <div
              key={r.id}
              className={`card${selected === r.id ? " selected" : ""}`}
              onClick={() => setSelected(r.id)}
              onMouseEnter={() => setHovered(r.id)}
              onMouseLeave={() => setHovered(null)}
            >
              <div className="card-image-wrap">
                <img src={r.image} alt={r.title} />
              </div>

              <div className="card-body">
                <h2 className="card-title">{r.title}</h2>

                <div className="card-meta">
                  <div className="card-time">
                    <div className="clock-icon" />
                    {r.time}
                  </div>
                  <div className="tags-row">
                    {r.tags.map((tag, i) => (
                      <div
                        key={i}
                        className="tag"
                        style={{ background: tag.color }}
                        title={tag.label}
                      >
                        {tag.label.length <= 2 ? tag.label : tag.label.slice(0, 1)}
                      </div>
                    ))}
                    <div className="tag-bar" />
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