import { useEffect, useState } from "react";
import { useParams } from 'react-router-dom';

const MOCK_STEPS = [
  {
    step_id: 1,
    step_number: 1,
    instruction: "For the soffritto, peel and halve the onions and garlic. Peel and roughly chop the carrot. Roughly chop the celery. Add them to a food processor or blender and chop everything evenly until it is about as fine as the ground beef. Heat the olive oil in a large non-stick frying pan over low heat. Add the chopped vegetables and sauté for approx. 10-15 min. Stir regularly to make sure nothing burns.",
    image_url: "https://images.services.kitchenstories.io/wqvAi28OtHzLjtXX9AMhW2lJa2E=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-1.jpg"
  },
  {
    step_id: 2,
    step_number: 2,
    instruction: "Then add the ground beef to the pan and fry for another approx. 10-15 min. While frying, break up the meat with a cooking spoon. Season with salt and pepper.",
    image_url: "https://images.services.kitchenstories.io/Wl9Ij0QASGZ9RMz8thg72ZEYIIo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-2.jpg"
  },
  {
    step_id: 3,
    step_number: 3,
    instruction: "Add the canned crushed tomatoes, tomato paste, salt, pepper and dried oregano. Simmer uncovered over medium heat for approx. 15-30 min. until the sauce has thickened.",
    image_url: "https://images.services.kitchenstories.io/t1yTaOY5AnDlledLnwv0ryIfRh4=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-3.jpg"
  },
  {
    step_id: 4,
    step_number: 4,
    instruction: "In the meantime, cook the spaghetti in plenty of boiling salted water according to package instructions until al dente. Drain the pasta and serve with the Bolognese sauce and grated Parmesan cheese.",
    image_url: "https://images.services.kitchenstories.io/I0Ji7dQ7j6D1Ce0sHtSq-VaRWyo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-5.jpg"
  }
];

const TORN_FRAME_PNG = "/tornpaper.png";

// Final dish image shown in the "Enjoy your meal!" section
const MOCK_FINAL_IMAGE = "https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg";

const styles = `
  @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Lora:wght@400;500&display=swap');

  *, *::before, *::after {
    box-sizing: border-box;
  }

  .recipe-howto-page {
    min-height: 100vh;
    padding: 60px 20px;
    font-family: 'Lora', serif;
    background-color: #FFD470;
  }

  /* Step row */
  .recipe-step-row {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 48px;
    max-width: 1200px;
    margin: 0 auto 90px auto;
  }

  .recipe-step-row.reverse {
    flex-direction: row-reverse;
  }

  .step-image-wrap {
    flex: 2;
    position: relative;
  }

  .torn-paper-container {
    position: relative;
    display: block;
    width: 100%;
    transform: rotate(-1.5deg);
    filter: drop-shadow(4px 8px 20px rgba(0, 0, 0, 0.28));
  }

  .recipe-step-row.reverse .torn-paper-container {
    transform: rotate(1.5deg);
  }

  .torn-bg {
    display: block;
    width: 100%;
    height: auto;
  }

  .step-photo {
    position: absolute;
    top: 25%;
    left: 15%;
    width: 75%;
    height: 50%;
    object-fit: cover;
    z-index: 2;
  }

  /* Text side */
  .step-text {
    flex: 1;
  }

  .step-label {
    font-family: 'Playfair Display', serif;
    font-size: 2.3rem;
    font-weight: 900;
    color: #1a1a1a;
    margin: 0 0 18px 0;
    line-height: 1.1;
  }

  .step-instruction {
    font-size: 1.05rem;
    line-height: 1.85;
    color: #1a1a1a;
    margin: 0;
  }

  /* Enjoy your meal section */
  .enjoy-section {
    max-width: 1200px;
    margin: 40px auto 60px auto;
    padding: 0 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .enjoy-label {
    font-family: 'Playfair Display', serif;
    font-size: 1.6rem;
    font-weight: 700;
    color: #1a1a1a;
    margin: 0 0 20px 0;
  }

  .enjoy-plaid-wrap {
    display: inline-block;
    position: relative;
    transform: rotate(-1deg);
    filter: drop-shadow(4px 8px 20px rgba(0,0,0,0.2));
  }

  .enjoy-plaid {
    padding: 24px;
    background-color: #C8964A;
    background-image:
      repeating-linear-gradient(
        0deg,
        transparent,
        transparent 20px,
        rgba(180, 100, 30, 0.5) 20px,
        rgba(180, 100, 30, 0.5) 24px,
        transparent 24px,
        transparent 44px,
        rgba(255, 220, 150, 0.4) 44px,
        rgba(255, 220, 150, 0.4) 48px
      ),
      repeating-linear-gradient(
        90deg,
        transparent,
        transparent 20px,
        rgba(180, 100, 30, 0.5) 20px,
        rgba(180, 100, 30, 0.5) 24px,
        transparent 24px,
        transparent 44px,
        rgba(255, 220, 150, 0.4) 44px,
        rgba(255, 220, 150, 0.4) 48px
      );
    border-radius: 4px;
  }

  .enjoy-photo {
    display: block;
    width: 320px;
    height: 240px;
    object-fit: cover;
    border-radius: 2px;
  }

  /* Responsive */
  @media (max-width: 680px) {
    .recipe-step-row,
    .recipe-step-row.reverse {
      flex-direction: column;
      gap: 28px;
    }
    .step-label {
      font-size: 1.8rem;
    }
    .enjoy-photo {
      width: 260px;
      height: 200px;
    }
  }
`;

function RecipeHowto() {
  const { id } = useParams();
  const [steps, setSteps] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchSteps = async () => {
      try {
        setSteps(MOCK_STEPS);

        /* // Real fetch — uncomment when backend is fixed:
        const response = await fetch(`http://localhost:5003/api/recipes/${id}/steps`);
        if (!response.ok) throw new Error("Failed to fetch steps");
        const data = await response.json();
        setSteps(data);
        */
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchSteps();
  }, [id]);

  if (loading) {
    return (
      <div className="recipe-howto-page">
        <h2 style={{ textAlign: "center", marginTop: 80 }}>Loading recipe steps...</h2>
      </div>
    );
  }

  if (error) {
    return (
      <div className="recipe-howto-page">
        <h2 style={{ textAlign: "center", marginTop: 80, color: "red" }}>Error: {error}</h2>
      </div>
    );
  }

  if (steps.length === 0) {
    return (
      <div className="recipe-howto-page">
        <h2 style={{ textAlign: "center", marginTop: 80 }}>No steps found.</h2>
      </div>
    );
  }

  return (
    <>
      <style>{styles}</style>
      <div className="recipe-howto-page">

        {steps.map((step, index) => {
          const isEven = index % 2 === 0;

          return (
            <div
              key={step.step_id}
              className={`recipe-step-row${!isEven ? " reverse" : ""}`}
            >
              {step.image_url && (
                <div className="step-image-wrap">
                  <div className="torn-paper-container">
                    <img
                      src={TORN_FRAME_PNG}
                      alt=""
                      className="torn-bg"
                      aria-hidden="true"
                    />
                    <img
                      src={step.image_url}
                      alt={`Step ${step.step_number}`}
                      className="step-photo"
                    />
                  </div>
                </div>
              )}

              <div className="step-text">
                <h2 className="step-label">
                  Step {step.step_number} / {steps.length}
                </h2>
                <p className="step-instruction">{step.instruction}</p>
              </div>
            </div>
          );
        })}

        {/* Enjoy your meal section */}
        <div className="enjoy-section">
          <p className="enjoy-label">Enjoy your meal!</p>
          <div className="enjoy-plaid-wrap">
            <div className="enjoy-plaid">
              <img
                src={MOCK_FINAL_IMAGE}
                alt="Enjoy your meal"
                className="enjoy-photo"
              />
            </div>
          </div>
        </div>

      </div>
    </>
  );
}

export default RecipeHowto;