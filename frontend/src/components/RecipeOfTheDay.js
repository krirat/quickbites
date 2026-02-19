import React from "react";

const styles = {
  container: {
    display: "flex",
    gap: "40px",
    padding: "60px",
    backgroundColor: "#efc66b",
    fontFamily: "Georgia, serif",
    overflow: "hidden"
  },

  header: {
    minWidth: "280px"
  },

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
    cursor: "pointer"
  },

  grid: {
    display: "flex",
    gap: "30px",
    overflowX: "auto",
    scrollBehavior: "smooth",
    paddingBottom: "10px"
  },

  card: {
    minWidth: "300px",
    backgroundColor: "#f3f3f3",
    borderRadius: "20px",
    overflow: "hidden",
    flexShrink: 0
  },

  image: {
    width: "100%",
    height: "260px",
    objectFit: "cover"
  },

  content: {
    padding: "25px",
    textAlign: "center"
  },

  tag: {
    backgroundColor: "#d98b1f",
    border: "none",
    padding: "8px 16px",
    borderRadius: "20px",
    color: "white",
    margin: "5px",
    cursor: "pointer"
  }
};

const Card = ({ image, title, desc, time, tags }) => (
  <div style={styles.card}>
    <img src={image} alt={title} style={styles.image} />
    <div style={styles.content}>
      <h2>{title}</h2>
      <p>{desc}</p>
      <p>⏱ {time}</p>
      <div>
        {tags.map((tag, index) => (
          <button key={index} style={styles.tag}>
            {tag}
          </button>
        ))}
      </div>
    </div>
  </div>
);

const RecipeOfTheDay = () => {
  return (
    <div style={styles.container}>
      <div style={styles.header}>
        <h1 style={styles.title}>
          Recipe of <br /> the day
        </h1>
        <button style={styles.button}>VIEW FULL RECIPE</button>
      </div>

      <div
        style={styles.grid}
        className="scroll-container"
      >
        <Card
          image="https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg"
          title="Spaghetti Bolognese"
          desc="A thick, rich Bolognese with great depth of flavour."
          time="45 min"
          tags={["italian", "Beef", "cheese", "pasta"]}
        />

        
        <Card
          image="https://images.unsplash.com/photo-1546171753-97d7676e4602"
          title="Honey and Orange Fizz Mocktail"
          desc="A refreshing drink with citrus flavor"
          time="40 min"
          tags={["Beverages"]}
        />

        <Card
          image="https://images.unsplash.com/photo-1546171753-97d7676e4602"
          title="Honey and Orange Fizz Mocktail"
          desc="A refreshing drink with citrus flavor"
          time="40 min"
          tags={["Beverages"]}
        />
        
        <Card
          image="https://images.unsplash.com/photo-1546171753-97d7676e4602"
          title="Honey and Orange Fizz Mocktail"
          desc="A refreshing drink with citrus flavor"
          time="40 min"
          tags={["Beverages"]}
        />

        <Card
          image="https://images.unsplash.com/photo-1546171753-97d7676e4602"
          title="Honey and Orange Fizz Mocktail"
          desc="A refreshing drink with citrus flavor"
          time="40 min"
          tags={["Beverages"]}
        />
      </div>
    </div>
  );
};

export default RecipeOfTheDay;
