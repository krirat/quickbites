import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router";

const styles = {
  container: {
    display: "flex",
    gap: "40px",
    padding: "60px",
    backgroundColor: "#ffd470",
    fontFamily: "Georgia, serif",
    overflow: "hidden"
  },
  header: { minWidth: "280px" },
  title: {
    fontSize: "60px",
    fontWeight: "900",
    lineHeight: "1.1",
    margin: "0 0 20px 0"
  },
  button: {
    backgroundColor: "black",
    color: "white",
    padding: "14px 22px",
    border: "none",
    cursor: "pointer",
    transition: "0.2s"
  },
  grid: {
    display: "flex",
    gap: "30px",
    overflowX: "auto",
    scrollBehavior: "smooth",
    paddingBottom: "10px"
  },
  card: {
    minWidth: "240px",
    maxWidth: "240px",
    backgroundColor: "#f3f3f3",
    borderRadius: "20px",
    overflow: "hidden",
    flexShrink: 0,
    cursor: "pointer"
  },
  image: { width: "100%", height: "160px", objectFit: "cover" },
  content: { padding: "15px", textAlign: "center" },
  tag: {
    backgroundColor: "#d98b1f",
    border: "none",
    padding: "6px 12px",
    borderRadius: "20px",
    color: "white",
    margin: "3px",
    cursor: "pointer",
    fontSize: "12px"
  }
};

const Card = ({ image, title, desc, time, tags, onClick }) => (
  <div style={styles.card} onClick={onClick}>
    <img src={image} alt={title} style={styles.image} />
    <div style={styles.content}>
      <h2 style={{ fontSize: "16px", margin: "0 0 8px 0" }}>{title}</h2>
      <p style={{
        fontSize: "13px",
        margin: "0 0 6px 0",
        overflow: "hidden",
        display: "-webkit-box",
        WebkitLineClamp: 2,
        WebkitBoxOrient: "vertical"
      }}>
        {desc}
      </p>
      <p style={{ fontSize: "13px", margin: "0 0 8px 0" }}>⏱ {time} min</p>
      <div>
        {tags.slice(0, 3).map((tag, i) => (
          <button key={i} style={styles.tag}>{tag}</button>
        ))}
      </div>
    </div>
  </div>
);

const RecipeOfTheDay = () => {
  const navigate = useNavigate();
  const [recipes, setRecipes] = useState([]);

  useEffect(() => {
    fetch("http://localhost:5003/api/get-recipes")
      .then(res => res.json())
      .then(data => {
        const shuffled = [...data].sort(() => Math.random() - 0.5);
        setRecipes(shuffled.slice(0, 4));
      })
      .catch(err => console.error("Failed to fetch recipes:", err));
  }, []);

  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h1 style={styles.title}>
          Recipe of <br /> the day
        </h1>
        <button style={styles.button} onClick={() => navigate("/recipes")}>
          VIEW FULL RECIPE
        </button>
      </div>

      <div style={styles.grid} className="scroll-container">
        {recipes.map(recipe => (
          <Card
            key={recipe.recipe_id}
            image={recipe.image_url}
            title={recipe.recipe_name}
            desc={recipe.description}
            time={recipe.total_time_minutes}
            tags={recipe.tag_name.filter(Boolean)}
            onClick={() => navigate(`/recipes/${recipe.recipe_id}`)}
          />
        ))}
      </div>
    </div>
  );
};

export default RecipeOfTheDay;