SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+07:00";

CREATE TABLE `recipe` (
  `recipe_id` int PRIMARY KEY AUTO_INCREMENT,
  `recipe_name` varchar(255),
  `description` text,
  `total_time_minutes` int,
  `difficulty` varchar(255),
  `instructions` text,
  `base_servings` int,
  `calories_per_serving` float,
  `finshed_dish_image_url` varchar(255),
  `step1_images` text,
  `step2_images` text,
  `step3_images` text,
  `step4_images` text,
  `step5_images` text,
  `step6_images` text,
  `step7_images` text,
  `step8_images` text
);

CREATE TABLE `nutrition` (
  `nutrition_id` int AUTO_INCREMENT,
  `recipe_id` int,
  `protein` float,
  `fat` float,
  `carbs` float,
  `calories` float,
  PRIMARY KEY (`nutrition_id`, `recipe_id`)
);

CREATE TABLE `recipe_tool` (
  `recipe_id` int,
  `tool_id` int,
  PRIMARY KEY (`recipe_id`, `tool_id`)
);

CREATE TABLE `tool` (
  `tool_id` int PRIMARY KEY AUTO_INCREMENT,
  `tool_name` varchar(255)
);

CREATE TABLE `recipe_tag` (
  `recipe_id` int,
  `tag_id` int,
  PRIMARY KEY (`recipe_id`, `tag_id`)
);

CREATE TABLE `tag` (
  `tag_id` int PRIMARY KEY AUTO_INCREMENT,
  `tag_name` varchar(255)
);

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int,
  `ingredient_id` int,
  `quantity` float,
  `unit` varchar(255),
  PRIMARY KEY (`recipe_id`, `ingredient_id`)
);

CREATE TABLE `ingredient` (
  `ingredient_id` int PRIMARY KEY AUTO_INCREMENT,
  `ingredient_name` varchar(255),
  `default_unit` varchar(255),
  `calories_per_unit` float,
  `cost_per_unit` float,
  `is_allergen` bool
);

ALTER TABLE `recipe_ingredient` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_tool` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_tag` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `nutrition` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_ingredient` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`);

ALTER TABLE `recipe_tool` ADD FOREIGN KEY (`tool_id`) REFERENCES `tool` (`tool_id`);

ALTER TABLE `recipe_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);

-- Data insertions

-- RECIPES
INSERT INTO recipe (recipe_name, description, total_time_minutes, difficulty, instructions, base_servings, calories_per_serving, finshed_dish_image_url, step1_images, step2_images, step3_images, step4_images, step5_images, step6_images, step7_images, step8_images) VALUES
('German lentil stew with spaetzle (Linsen mit Spätzle)', 'Tender lentils cooked in a rich broth with aromatic soup vegetables and bacon, paired with fluffy spaetzle.', 40, 'Medium', '1. Dice onion and bacon. Sauté in butter. Add flour. 2. Add lentils and broth. Simmer 30 min. 3. Cook spaetzle. Heat sausages. Season lentils with vinegar.', 4, 845.0),
('Creamy mapo tofu udon', 'A viral recipe combining silken tofu sauce with spicy mapo beef.', 20, 'Easy', '1. Fry garlic, scallions, gochujang, and beef. 2. Cook udon. Blend tofu with miso. 3. Assemble noodles, tofu sauce, and beef.', 2, 885.0),
('Cozy wild rice soup with sweet potato and mushrooms', 'A warming vegan soup with Cajun seasoning.', 20, 'Easy', '1. Cook wild rice. Sauté veggies. 2. Add broth and spices. Simmer 15 min. 3. Add coconut cream and kale.', 2, 491.0),
('Roasted Red Pepper Orzo', 'Creamy orzo with a blended roasted pepper and cashew sauce.', 15, 'Easy', '1. Blend peppers, cashews, garlic, oil, and lemon juice. 2. Sauté onion and peppers. 3. Cook orzo. Mix with sauce and spinach.', 2, 600.0),
('Speculaas cookies', 'Holiday favorite spiced cookies.', 20, 'Medium', '1. Mix dry ingredients. 2. Mix wet ingredients. 3. Combine, shape, and bake.', 30, 62.0),
('Savoy cabbage carbonara with chestnut', 'A winter twist on carbonara.', 30, 'Medium', '1. Toast panko. 2. Cook pasta. Sauté cabbage and chestnuts. 3. Mix yolks and cheese. Combine with pasta and water.', 4, 720.0),
('Pasta arrabiata', 'Spicy tomato pasta with roasted peppers.', 25, 'Easy', '1. Sauté peppers, onion, and garlic. 2. Add passata and chili. 3. Mix with cooked pasta.', 4, 500.0),
('Cold noodle salad with peanut sauce', 'Refreshing soba noodles with crunchy veggies.', 20, 'Easy', '1. Cook soba noodles. Chop veggies. 2. Whisk peanut sauce ingredients. 3. Toss everything together.', 2, 450.0),
('Bang bang salmon bowl', 'Salmon fillets with a creamy-spicy sauce.', 20, 'Medium', '1. Mix sauce. Season salmon. 2. Bake salmon 10 min. Cook rice. 3. Assemble with veggies and sauce.', 2, 1212.0),
('Halloumi tzatziki bowl with lemony orzo', 'Greek-inspired bowl with fresh flavors.', 30, 'Medium', '1. Cook orzo in broth. 2. Make tzatziki. 3. Fry halloumi. 4. Assemble bowl.', 2, 1306.0),
('Blue cheese, pear, and rosemary tart', 'Savory tart with sweet pears and strong cheese.', 45, 'Hard', '1. Make dough and chill. 2. Mix cheeses. 3. Sauté pears. 4. Assemble and bake 20 min.', 8, 350.0),
('Rendang ala Ujang', 'Rich Indonesian beef stew.', 60, 'Hard', '1. Boil beef. 2. Puree aromatics. 3. Stir fry paste, add beef and coconut milk. Simmer.', 2, 700.0),
('Smash burger', 'Crispy homemade smash burgers.', 20, 'Medium', '1. Prep sauce and veggies. 2. Smash beef patties in hot pan. 3. Add cheese and assemble.', 2, 800.0),
('Honey Cake', 'Multi-layered cake with sour cream frosting.', 60, 'Hard', '1. Melt butter and honey, mix with eggs/sugar. 2. Add flour to make dough. Bake thin layers. 3. Frost with sour cream mix.', 12, 450.0),
('The Creamiest Carbonara', 'Rich carbonara with double cream.', 25, 'Medium', '1. Cook pasta. 2. Fry pancetta. 3. Whisk eggs and cream. 4. Toss pasta with meat and egg mix.', 3, 900.0),
('Quick healthy breakfast', 'Avocado toast with fried egg.', 10, 'Easy', '1. Toast bread. 2. Mash avocado. Fry egg. 3. Assemble.', 1, 350.0),
('Charred Fish on Saffron Rice', 'Aromatic rice dish with marinated fish.', 60, 'Medium', '1. Cook rice with spices. 2. Make saffron syrup. 3. Marinate and fry fish. 4. Serve together.', 3, 600.0),
('Not Your Average Fish Taco', 'Fish tacos with edamame and avocado.', 30, 'Easy', '1. Season fish. Warm tortillas. 2. Sauté edamame. Pan-fry fish. 3. Assemble tacos.', 3, 400.0),
('Fried chicken', 'Classic crispy fried chicken legs.', 45, 'Medium', '1. Season chicken. 2. Dip in egg then flour. 3. Fry until golden.', 6, 600.0),
('Succulent lemon and herb chicken', 'Pan-fried chicken with lemon sauce.', 35, 'Medium', '1. Boil then marinate chicken. 2. Fry chicken. 3. Make sauce in pan with milk/stock.', 2, 500.0),


('Spaghetti Bolognese', 'A classic Italian pasta dish with a rich, meaty sauce.', 45, 'Medium', 'HOW TO HERE', 4, 500.0),


('Classic spaghetti carbonara', 'A creamy Italian pasta dish with eggs, cheese, pancetta, and black pepper.', 20, 'Medium', 'HOW TO HERE', 4, 500.0),


('Banana bread', 'Moist and flavorful quick bread made with ripe bananas.', 25, 'Easy', 'HOW TO HERE', 4, 500.0),


('Fluffy buttermilk pancakes', 'Light and fluffy pancakes made with buttermilk.', 15, 'Easy', 'HOW TO HERE', 4, 500.0),


('Scalloped potatoes', 'INSERT DESCRIPTION HERE.', 15, 'Medium', 'HOW TO HERE', 4, 500.0),


('Easy Italian lasagna', 'INSERT DESCRIPTION HERE.', 40, 'Medium', 'HOW TO HERE', 4, 500.0),


('Saltimbocca', 'INSERT DESCRIPTION HERE.', 20, 'Medium', 'HOW TO HERE', 4, 500.0),


('One-pot shrimp and tomato pasta', 'INSERT DESCRIPTION HERE.', 35, 'Easy', 'HOW TO HERE', 4, 500.0),


('Basque burnt cheesecake', 'INSERT DESCRIPTION HERE.', 25, 'Medium', 'HOW TO HERE', 4, 500.0),


('Classic French coq au vin', 'INSERT DESCRIPTION HERE.', 60, 'Hard', 'HOW TO HERE', 4, 500.0),


('Creamy fish stew with mustard and dill', 'INSERT DESCRIPTION HERE.', 55, 'Medium', 'HOW TO HERE', 4, 500.0),


('Sundubu jjigae', 'This comforting Korean classic is a spicy stew that can be loaded with various vegetables and meats, and is crowned with a super soft silken tofu (sundubu) that soaks up the red stew and adds a nice creamy texture.', 35, 'Easy', '1. Peel and mince garlic. Chop zucchini and potato into bite-size pieces. Rinse and trim the bottom of the mushrooms. Thinly slice scallions and reserve half for garnish. 2. Place a heavy-bottomed pot over medium-high heat. Add vegetable oil and toasted sesame oil. Once hot, add potatoes and stir-fry for approx. 5 min. Add garlic, zucchini, gochujang, and kimchi. Cook for approx. 5 min., or until the gochujang starts to stick to the bottom of the pot. 3. Add soy sauce and water. Stir to combine and bring to a boil. Reduce heat and let simmer until potatoes are cooked through, approx. 10 min. 4. Add silken tofu (and any brine) and break up gently with a spatula or leave whole. Add mushrooms and let cook for approx. 3 min. Remove from heat, top with reserved scallions, and serve with cooked short grain rice.', 2, 350.0, 'https://images.services.kitchenstories.io/yXC0cAso15OB0bhWCM4kE8foj34=/1920x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2468-photo-final-1.jpg', 'https://images.services.kitchenstories.io/8CId71uU9BOFEz82E9tLJYyvqH4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2468-photo-step-1.jpg', 'https://images.services.kitchenstories.io/4bkM3t-kpW-Np5BUghTqMdZ9cz0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2468-photo-step-2.jpg', 'https://images.services.kitchenstories.io/HeagG_ZDDnOn0yaM9WZWVs_j7JQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2468-photo-step-3.jpg', 'https://images.services.kitchenstories.io/-ABvLh309bRFD_mI9CjzFtVHF3w=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2468-photo-step-4.jpg', NULL, NULL, NULL, NULL),


('Lemony chickpea stew', 'This recipe screams early spring! If you also cannot wait for the grey, cold, wet winter to be over, this bright and fresh chickpea stew is a perfect start to spring. You can serve it with chili oil if desired, or add more veggies.', 25, 'Easy', '1. Take frozen spinach out and set it aside to defrost. Zest, halve, and juice lemon. Finely chop onion, and grate garlic. Chop dill. Drain and rinse chickpeas. 2. Heat olive oil in a pot over medium-high heat. Add onion and garlic, fry for approx. 2 min. Add chickpeas, vegetable broth, and half of the feta cheese, and cook for approx. 10 min. Season with salt and pepper. 3. Turn the heat down to low. With an immersion blender, purée about half of the chickpeas and feta. Bring heat back up to high, and add spinach, lemon zest, and juice. Cook for another approx. 2–4 min. until slightly thickened. Add dill and season again to taste. Serve with remaining feta, more dill, and lemon zest if desired.', 4, 470.0, 'https://images.services.kitchenstories.io/i8PjanpPV_P_mFUluoU7HR8BJy8=/1920x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2878_photo_final_1_3x2.jpg', 'https://images.services.kitchenstories.io/M3Mca-RNJIYVSVC-nqQPlhpkB5A=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2878_photo_step_1.jpg', 'https://images.services.kitchenstories.io/54wEFRxt0jt-0YkjI5FAoabAd5g=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2878_photo_step_2.jpg', 'https://images.services.kitchenstories.io/H2w5ZxnsLl6AgfW_VZcmNkAIDfg=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2878_photo_step_3.jpg', NULL, NULL, NULL, NULL, NULL),


('Creamy coconut pumpkin stew', 'Filling, fragrant and comforting, here’s a recipe that’s like a hug. Plus it’s full of goodness too, with lentils, pumpkin and spinach. You can adjust the consistency by adding more broth of liquid; so it’s either more like a curry to be eaten with rice or more like a stew that’s best mopped up with bread.', 30, 'Easy', '1. Halve the Hokkaido pumpkin, remove the seeds, and cut into bite-sized pieces. Peel onions, ginger, and dice finely. 2. Heat coconut oil in a large pot over medium heat. Add pumpkin and sauté for approx. 5 min. Next, add onions, garlic and ginger and sauté for another approx. 2 min. Add curry paste and beluga lentils and sauté again for approx. 2 – 3 min, until fragrant. 3.Add vegetable broth, coconut milk and canned tomatoes to the pot. Cover with a lid and let simmer for approx. 20 min., until the lentils are cooked through. Stir occasionally. 4. At the end of the cooking time, add the spinach and gently stir into the curry. Add more water, if needed to achieve the desired consistency. Season to taste with salt, pepper and the juice of a lime. Serve and enjoy!', 4, 697.0, 'https://images.services.kitchenstories.io/YLwbjK2xehgT3PmS0LTmGYtVI1E=/1920x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2549-photo-final-1.jpg', 'https://images.services.kitchenstories.io/GsRpkBlj7S1rtBhL5wHPvcn8ehA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2549-photo-step-1.jpg', 'https://images.services.kitchenstories.io/I8SrZbxOfk38y7YwtQykTFOLFvE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2549-photo-step-2.jpg', 'https://images.services.kitchenstories.io/xUAehUp9ygtlJw_sGJAAMrGVN0Y=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2549-photo-step-3.jpg', 'https://images.services.kitchenstories.io/-Boxgl-bibYoqXcZRO4zipgk9W0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2549-photo-step-4.jpg', NULL, NULL, NULL, NULL),


('Vegan chili', 'This is the spicy wake up call you have been waiting for. Also known as chili sin carne, this warm pot of spicy, vegan excellence is a protein powerhouse, and your new favorite meal prep dish. Combine these rich Tex-Mex flavors with lentils, beans, sweet corn, and more. The best part: longer it sits, the more flavorful it gets, so be sure to make extra for leftovers! Try it with freshly sliced avocados and a handful of tortilla chips for dipping!', 35, 'Easy', '1. Peel and chop onions and garlic. Finely dice peppers. Heat oil in a large pot and sauté the onions and garlic until translucent. 2. Stir in the tomato paste. Then, add the vegetable stock and crushed tomatoes. 3. Add the drained corn, kidney beans, brown lentils, diced pepper and the spices (cumin, oregano, chili powder, sweet paprika powder). Season with salt, and pepper. Simmer while covered over medium heat for approx. 20 min., stirring occasionally. 4. Adjust the seasoning to your liking and serve with vegan yogurt.', 4, 351.0, 'https://images.services.kitchenstories.io/2l2E3SQqWc2fuGEmjlOp-M2B1XU=/1920x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/c69-final-photo-1.jpg', 'https://images.services.kitchenstories.io/h7iRaKvkdhdDny5YLKE1pBgPNhE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/c69-chili_sin_carne_-step-1.jpg', 'https://images.services.kitchenstories.io/iROpMjpWnFXCkJAi14NLmmIPCrw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/c69-chili_sin_carne_step-2.jpg', 'https://images.services.kitchenstories.io/2_vOHrkT0XWgFpCIE9KjKgz4DLk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/c69-chili_sin_carne_step-photo-3.jpg', 'https://images.services.kitchenstories.io/omfiQDmbyPTBt2It96awu0hdnPI=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/c69-chili_sin_carne-step-4.jpg', NULL, NULL, NULL, NULL);

-- INGREDIENTS
INSERT INTO ingredient (ingredient_name, default_unit, calories_per_unit, cost_per_unit, is_allergen) VALUES
('spaetzle', 'g', NULL, NULL, FALSE),
('mountain lentils', 'g', NULL, NULL, FALSE),
('bouquet garni', 'pc', NULL, NULL, FALSE),
('broth', 'l', NULL, NULL, FALSE),
('Vienna sausages', 'pc', NULL, NULL, FALSE),
('onion', 'pc', NULL, NULL, FALSE),
('butter', 'tbsp', NULL, NULL, FALSE),
('smoked bacon', 'g', NULL, NULL, FALSE),
('flour', 'tbsp', NULL, NULL, FALSE),
('red wine vinegar', 'tbsp', NULL, NULL, FALSE),
('silken tofu', 'g', NULL, NULL, FALSE),
('udon noodles', 'g', NULL, NULL, FALSE),
('ground beef', 'g', NULL, NULL, FALSE),
('garlic', 'cloves', NULL, NULL, FALSE),
('scallions', 'sprigs', NULL, NULL, FALSE),
('gochujang', 'tbsp', NULL, NULL, FALSE),
('miso paste', 'tbsp', NULL, NULL, FALSE),
('soy sauce', 'tbsp', NULL, NULL, FALSE),
('wild rice', 'g', NULL, NULL, FALSE),
('sweet potato', 'pc', NULL, NULL, FALSE),
('brown mushrooms', 'g', NULL, NULL, FALSE),
('carrot', 'pc', NULL, NULL, FALSE),
('vegetable broth', 'ml', NULL, NULL, FALSE),
('coconut cream', 'ml', NULL, NULL, FALSE),
('Cajun seasoning', 'tsp', NULL, NULL, FALSE),
('orzo', 'g', NULL, NULL, FALSE),
('roasted red peppers', 'g', NULL, NULL, FALSE),
('cashews', 'g', NULL, NULL, FALSE),
('olive oil', 'tbsp', NULL, NULL, FALSE),
('lemon', 'pc', NULL, NULL, FALSE),
('spinach', 'g', NULL, NULL, FALSE),
('buckwheat flour', 'g', NULL, NULL, FALSE),
('almond butter', 'g', NULL, NULL, FALSE),
('maple syrup', 'ml', NULL, NULL, FALSE),
('coconut sugar', 'g', NULL, NULL, FALSE),
('ginger', 'tsp', NULL, NULL, FALSE),
('cinnamon', 'tsp', NULL, NULL, FALSE),
('spaghetti', 'g', NULL, NULL, FALSE),
('savoy cabbage', 'g', NULL, NULL, FALSE),
('chestnuts', 'g', NULL, NULL, FALSE),
('Pecorino cheese', 'g', NULL, NULL, FALSE),
('egg yolks', 'pc', NULL, NULL, FALSE),
('panko breadcrumbs', 'g', NULL, NULL, FALSE),
('fusilli', 'g', NULL, NULL, FALSE),
('red pointed peppers', 'pc', NULL, NULL, FALSE),
('Passata', 'g', NULL, NULL, FALSE),
('chili flakes', 'tbsp', NULL, NULL, FALSE),
('soba noodles', 'g', NULL, NULL, FALSE),
('creamy peanut butter', 'tbsp', NULL, NULL, FALSE),
('cucumber', 'pc', NULL, NULL, FALSE),
('red cabbage', 'g', NULL, NULL, FALSE),
('salmon fillets', 'pc', NULL, NULL, FALSE),
('mayonnaise', 'ml', NULL, NULL, FALSE),
('sweet chili sauce', 'ml', NULL, NULL, FALSE),
('Sriracha', 'ml', NULL, NULL, FALSE),
('rice', 'g', NULL, NULL, FALSE),
('avocado', 'pc', NULL, NULL, FALSE),
('halloumi', 'g', NULL, NULL, FALSE),
('Greek yogurt', 'g', NULL, NULL, FALSE),
('mini cucumbers', 'pc', NULL, NULL, FALSE),
('blue cheese', 'g', NULL, NULL, FALSE),
('cottage cheese', 'g', NULL, NULL, FALSE),
('pears', 'pc', NULL, NULL, FALSE),
('beef', 'g', NULL, NULL, FALSE),
('coconut milk', 'strip', NULL, NULL, FALSE),
('Rendang Powder', 'strip', NULL, NULL, FALSE),
('lemongrass', 'bar', NULL, NULL, FALSE),
('chilis', 'pc', NULL, NULL, FALSE),
('burger buns', 'pc', NULL, NULL, FALSE),
('cheese slices', 'pc', NULL, NULL, FALSE),
('pickles', 'g', NULL, NULL, FALSE),
('honey', 'tbsp', NULL, NULL, FALSE),
('sugar', 'g', NULL, NULL, FALSE),
('sour cream', 'g', NULL, NULL, FALSE),
('double cream', 'ml', NULL, NULL, FALSE),
('eggs', 'pc', NULL, NULL, FALSE),
('pancetta', 'slices', NULL, NULL, FALSE),
('Parmesan', 'package', NULL, NULL, FALSE),
('bread', 'slices', NULL, NULL, FALSE),
('egg', 'pc', NULL, NULL, FALSE),
('cherry tomatoes', 'pc', NULL, NULL, FALSE),
('Basmati Rice', 'g', NULL, NULL, FALSE),
('Fish Fillet', 'g', NULL, NULL, FALSE),
('saffron', 'tsp', NULL, NULL, FALSE),
('ghee', 'tbsp', NULL, NULL, FALSE),
('almonds', 'pc', NULL, NULL, FALSE),
('fish fillet', 'lb', NULL, NULL, FALSE),
('corn tortillas', 'sheets', NULL, NULL, FALSE),
('edamame bean', 'cup', NULL, NULL, FALSE),
('chicken legs', 'pc', NULL, NULL, FALSE),
('Tabasco', 'tbsp', NULL, NULL, FALSE),
('oil', 'ml', NULL, NULL, FALSE),
('garlic and herb rub', 'tbsp', NULL, NULL, FALSE),
('milk', 'ml', NULL, NULL, FALSE),
('chicken stock', 'ml', NULL, NULL, FALSE);

-- RECIPE_INGREDIENTS
INSERT INTO recipe_ingredient (recipe_id, ingredient_id, quantity, unit) VALUES
(1, 1, 500.0, 'g'), (1, 2, 300.0, 'g'), (1, 3, 1.0, 'pc'), (1, 4, 1.0, 'l'), (1, 5, 8.0, 'pc'),
(1, 6, 1.0, 'pc'), (1, 7, 2.0, 'tbsp'), (1, 8, 100.0, 'g'), (1, 9, 1.5, 'tbsp'), (1, 10, 2.5, 'tbsp'),
(2, 11, 400.0, 'g'), (2, 12, 400.0, 'g'), (2, 13, 400.0, 'g'), (2, 14, 2.0, 'cloves'), (2, 15, 2.0, 'sprigs'),
(2, 16, 1.5, 'tbsp'), (2, 17, 1.0, 'tbsp'), (2, 18, 1.0, 'tbsp'), (3, 19, 100.0, 'g'), (3, 20, 0.5, 'pc'),
(3, 21, 125.0, 'g'), (3, 22, 1.0, 'pc'), (3, 23, 700.0, 'ml'), (3, 24, 200.0, 'ml'), (3, 25, 0.5, 'tsp'),
(4, 26, 300.0, 'g'), (4, 27, 170.0, 'g'), (4, 28, 100.0, 'g'), (4, 14, 2.0, 'cloves'), (4, 29, 3.0, 'tbsp'),
(4, 30, 1.0, 'pc'), (4, 31, 100.0, 'g'), (5, 32, 125.0, 'g'), (5, 33, 120.0, 'g'), (5, 34, 80.0, 'ml'),
(5, 35, 70.0, 'g'), (5, 36, 1.0, 'tsp'), (5, 37, 1.0, 'tsp'), (6, 38, 500.0, 'g'), (6, 39, 200.0, 'g'),
(6, 40, 150.0, 'g'), (6, 41, 80.0, 'g'), (6, 42, 6.0, 'pc'), (6, 43, 50.0, 'g'), (7, 44, 500.0, 'g'),
(7, 45, 2.0, 'pc'), (7, 46, 500.0, 'g'), (7, 47, 1.0, 'tbsp'), (7, 14, 3.0, 'cloves'), (8, 48, 200.0, 'g'),
(8, 49, 3.0, 'tbsp'), (8, 18, 2.0, 'tbsp'), (8, 50, 0.5, 'pc'), (8, 51, 100.0, 'g'), (9, 52, 2.0, 'pc'),
(9, 53, 80.0, 'ml'), (9, 54, 30.0, 'ml'), (9, 55, 10.0, 'ml'), (9, 56, 180.0, 'g'), (9, 57, 1.0, 'pc'),
(10, 26, 200.0, 'g'), (10, 58, 225.0, 'g'), (10, 59, 500.0, 'g'), (10, 60, 4.0, 'pc'), (10, 23, 500.0, 'ml'),
(11, 9, 250.0, 'g'), (11, 7, 8.0, 'tbsp'), (11, 61, 150.0, 'g'), (11, 62, 200.0, 'g'), (11, 63, 2.0, 'pc'),
(12, 64, 500.0, 'g'), (12, 65, 1.0, 'strip'), (12, 66, 1.0, 'strip'), (12, 67, 1.0, 'bar'), (12, 68, 2.0, 'pc'),
(13, 13, 500.0, 'g'), (13, 69, 2.0, 'pc'), (13, 70, 4.0, 'pc'), (13, 53, 3.0, 'tbsp'), (13, 71, 20.0, 'g'),
(14, 9, 640.0, 'g'), (14, 72, 2.0, 'tbsp'), (14, 73, 180.0, 'g'), (14, 74, 800.0, 'g'), (14, 7, 60.0, 'g'),
(15, 38, 500.0, 'g'), (15, 75, 300.0, 'ml'), (15, 76, 3.0, 'pc'), (15, 77, 8.0, 'slices'), (15, 78, 0.5, 'package'),
(16, 79, 2.0, 'slices'), (16, 57, 1.0, 'pc'), (16, 80, 1.0, 'pc'), (16, 81, 6.0, 'pc'), (17, 82, 200.0, 'g'),
(17, 83, 200.0, 'g'), (17, 84, 0.25, 'tsp'), (17, 85, 2.0, 'tbsp'), (17, 86, 12.0, 'pc'), (18, 87, 0.5, 'lb'),
(18, 88, 3.0, 'sheets'), (18, 89, 1.0, 'cup'), (18, 57, 0.5, 'head'), (19, 90, 8.0, 'pc'), (19, 9, 200.0, 'g'),
(19, 76, 4.0, 'pc'), (19, 91, 2.0, 'tbsp'), (19, 92, 500.0, 'ml'), (20, 90, 6.0, 'pc'), (20, 30, 1.0, 'pc'),
(20, 93, 3.0, 'tbsp'), (20, 94, 100.0, 'ml'), (20, 95, 300.0, 'ml');

-- TOOLS
INSERT INTO tool (tool_name) VALUES
('frying pan'), ('pot'), ('sieve'), ('knife'), ('blender'),
('large pot'), ('food processor'), ('saucepan'), ('bowl'), ('oven'),
('large pan'), ('whisk'), ('baking sheet'), ('pan'), ('grater'),
('pie plate'), ('cast iron pan'), ('spatula'), ('mixer'), ('bowls'),
('toaster'), ('deep frying pan'), ('tongs');

-- RECIPE_TOOLS
INSERT INTO recipe_tool (recipe_id, tool_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (2, 1), (2, 2), (2, 5), (3, 6), (3, 4), (4, 7),
(4, 8), (5, 9), (5, 10), (6, 11), (6, 2), (6, 12), (7, 1), (7, 2), (8, 2), (8, 9),
(8, 12), (9, 10), (9, 13), (9, 9), (10, 14), (10, 2), (10, 15), (11, 16), (11, 10), (11, 9),
(12, 2), (12, 5), (13, 17), (13, 18), (14, 10), (14, 19), (14, 20), (15, 8), (15, 1), (15, 12),
(16, 21), (16, 14), (17, 2), (17, 14), (18, 14), (19, 22), (19, 20), (19, 23), (20, 14), (20, 10),
(21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 2), (32, 2), (33, 2), (34, 2), (35, 2);

-- TAGS
INSERT INTO tag (tag_name) VALUES
('German'), ('Comfort Food'), ('Main Dish'), ('Asian'), ('Noodles'),
('Quick'), ('Vegan'), ('Soup'), ('Autumn'), ('Pasta'),
('Baking'), ('Cookies'), ('Holiday'), ('Italian'), ('Winter'),
('Spicy'), ('Vegetarian'), ('Salad'), ('Fish'), ('Bowl'),
('Dinner'), ('Greek'), ('Tart'), ('Indonesian'), ('Beef'),
('American'), ('Dessert'), ('Cake'), ('Indulgent'), ('Breakfast'),
('Healthy'), ('Rice'), ('Mexican'), ('Chicken'), ('Fried'),
('Easy'), ('General');

-- RECIPE_TAGS
INSERT INTO recipe_tag (recipe_id, tag_id) VALUES
(1, 1), (1, 2), (1, 3), (2, 4), (2, 5), (2, 6), (3, 7), (3, 8), (3, 9), (4, 10),
(4, 7), (4, 6), (5, 11), (5, 12), (5, 13), (6, 10), (6, 14), (6, 15), (7, 10), (7, 16),
(7, 17), (8, 18), (8, 4), (8, 7), (9, 19), (9, 20), (9, 21), (10, 22), (10, 17), (10, 20),
(11, 11), (11, 23), (11, 17), (12, 24), (12, 25), (12, 16), (13, 26), (13, 25), (13, 21), (14, 27),
(14, 28), (14, 11), (15, 10), (15, 14), (15, 29), (16, 30), (16, 6), (16, 31), (17, 19), (17, 32),
(17, 21), (18, 33), (18, 19), (18, 21), (19, 34), (19, 35), (19, 2), (20, 34), (20, 21), (20, 36),
(21, 37), (22, 37), (23, 37), (24, 37), (25, 37), (26, 37), (27, 37), (28, 37), (29, 37), (30, 37),
(31, 37), (32, 37), (33, 37), (34, 37), (35, 37);

-- NUTRITION
INSERT INTO nutrition (recipe_id, protein, fat, carbs, calories) VALUES
(1.0, 37.0, 35.0, 91.0, 845.0),
(2.0, 53.0, 40.0, 81.0, 885.0),
(3.0, 10.0, 30.0, 46.0, 491.0),
(4.0, 15.0, 20.0, 80.0, 600.0),
(5.0, 2.0, 2.0, 9.0, 62.0),
(6.0, 31.0, 35.0, 73.0, 720.0),
(7.0, 12.0, 10.0, 85.0, 500.0),
(8.0, 15.0, 18.0, 60.0, 450.0),
(9.0, 44.0, 70.0, 100.0, 1212.0),
(10.0, 54.0, 70.0, 124.0, 1306.0),
(11.0, 8.0, 22.0, 30.0, 350.0),
(12.0, 40.0, 45.0, 15.0, 700.0),
(13.0, 45.0, 50.0, 40.0, 800.0),
(14.0, 5.0, 20.0, 60.0, 450.0),
(15.0, 35.0, 50.0, 70.0, 900.0),
(16.0, 12.0, 20.0, 30.0, 350.0),
(17.0, 30.0, 20.0, 75.0, 600.0),
(18.0, 25.0, 15.0, 40.0, 400.0),
(19.0, 40.0, 35.0, 30.0, 600.0),
(20.0, 35.0, 25.0, 10.0, 500.0),
(21.0, 20.0, 15.0, 50.0, 500.0),
(22.0, 20.0, 15.0, 50.0, 500.0),
(23.0, 20.0, 15.0, 50.0, 500.0),
(24.0, 20.0, 15.0, 50.0, 500.0),
(25.0, 20.0, 15.0, 50.0, 500.0),
(26.0, 20.0, 15.0, 50.0, 500.0),
(27.0, 20.0, 15.0, 50.0, 500.0),
(28.0, 20.0, 15.0, 50.0, 500.0),
(29.0, 20.0, 15.0, 50.0, 500.0),
(30.0, 20.0, 15.0, 50.0, 500.0),
(31.0, 20.0, 15.0, 50.0, 500.0),
(32.0, 20.0, 15.0, 50.0, 500.0),
(33.0, 20.0, 15.0, 50.0, 500.0),
(34.0, 20.0, 15.0, 50.0, 500.0),
(35.0, 20.0, 15.0, 50.0, 500.0);