# QuickBites

QuickBites is a recipe website designed for users who want to cook meals quickly and easily. The website features recipes that can be prepared in under 60 minutes. Users can browse recipes, search for recipes by ingredients they already have, and discover meal ideas when they don’t know what to eat. The platform provides simple instructions, ingredient lists, tags, and cooking steps to help users prepare meals conveniently. Our platform also provides a calorie calculator for those who want to stay in good shape.

# Project Features:
Canva: https://www.canva.com/design/DAG721P9kE4/AM9n5osxIk3XYhvKs_IRMA/edit?utm_content=DAG721P9kE4&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton 

- Quick recipes that can be completed in under 60 minutes.
    - All recipes on the website will be limited to meals that can be prepared and cooked in under 60 minutes.
    - The recipes are simple and beginner-friendly.
    - The recipes instructions will be shown step-by-step, offering easy to understand instructions.
- Recipes suggestion with ingredients
    - Users can input ingredients they already have.
    - The website will then recommend recipes that match those ingredients, reducing food waste.
- Tags system (for students, vegans, allergy, etc.).
    - Recipes include tags such as student-friendly, contain meat and more.
    - Cuisine/regional filtering.
    - Tools required filtering (microwave, blender, etc).
    - The website automatically highlights ingredients that violate the user's restrictions (highlight milk if the user is lactose intorelant.)
    - The tags system will help users quickly filter and find recipes that meet their needs.
- Ingredients x servings
    - Each recipe will include a detailed ingredient list.
    - Users will be able to adjust the serving size, and the ingredient quantities will automatically update by the website.
- Calories calculator 
    - The website contains the estimated calorie count for each recipe.
    - Calories adjust automatically when the serving size is changed.
    - Nutrient breakdown. (low priority)
- Unit conversion
    - Built-in unit converter will help the user switch between measurement units (e.g. grams to oz, tablespoons to millilitres).
    - Cost for each ingredient (Low priority)
    - The website will show an estimated ingredients cost.

# Setup
```
cd ../database
docker-compose -f db-compose-dev.yml up
cd ../backend
node setup.js
```
new terminal then run ollama if needed
```
ollama run llama3.2
```
new terminal:
```
cd ./frontend
npm install
npm run dev
```

new terminal:
```
cd ../backend
npm install
node server.js
```