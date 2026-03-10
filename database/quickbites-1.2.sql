-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: Mar 10, 2026 at 09:17 AM
-- Server version: 8.0.44
-- PHP Version: 8.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Database: `ceidb`
-- --------------------------------------------------------

-- --------------------------------------------------------
-- Table structure for table `ingredient`
-- --------------------------------------------------------

CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL,
  `default_unit` varchar(255) DEFAULT NULL,
  `calories_per_unit` float DEFAULT NULL,
  `cost_per_unit` float DEFAULT NULL,
  `is_allergen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------
-- Table structure for table `nutrition`
-- --------------------------------------------------------

CREATE TABLE `nutrition` (
  `nutrition_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `protein` float DEFAULT NULL,
  `fat` float DEFAULT NULL,
  `carbs` float DEFAULT NULL,
  `calories` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `nutrition` (`nutrition_id`, `recipe_id`, `protein`, `fat`, `carbs`, `calories`) VALUES
(1,  1,  37, 35,  91,  845),
(2,  2,  53, 40,  81,  885),
(3,  3,  10, 30,  46,  491),
(4,  4,  37, 53, 166, 1239),
(5,  5,   2,  8,  18,  149),
(6,  6,  31, 35,  73,  720),
(7,  7,  16, 17,  80,  550),
(8,  8,  27, 18,  98,  607),
(9,  9,  44, 70, 100, 1212),
(10, 10, 54, 70, 124, 1306),
(11, 11,  8, 50,  46,  674),
(12, 12, 27, 19,  40,  440),
(13, 13, 63, 97,  38, 1278),
(14, 14,  8, 37,  46,  533),
(15, 15, 12, 12,   8,  187),
(16, 16, 26, 25,  27,  445),
(17, 17, 26,  7,  83,  513),
(18, 18, 18, 30,  35,  487),
(19, 19, 50, 67,  26,  903),
(20, 20, 24, 13,   8,  241),
(21, 21, 42, 37, 114,  952);

-- --------------------------------------------------------
-- Table structure for table `recipe`
-- --------------------------------------------------------

CREATE TABLE `recipe` (
  `recipe_id` int NOT NULL,
  `recipe_name` varchar(255) DEFAULT NULL,
  `description` text,
  `total_time_minutes` int DEFAULT NULL,
  `difficulty` varchar(255) DEFAULT NULL,
  `instructions` json DEFAULT NULL,
  `base_servings` int DEFAULT NULL,
  `calories_per_serving` float DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `recipe` (`recipe_id`, `recipe_name`, `description`, `total_time_minutes`, `difficulty`, `instructions`, `base_servings`, `calories_per_serving`, `image_url`) VALUES
(1, 'German lentil stew with spaetzle (Linsen mit Spätzle)', 'Lentils with spaetzle is a classic Swabian comfort dish made with lentils, vegetables, bacon, spaetzle, and sausages. Add vinegar at the end for better flavor and digestion. Let the lentils rest for 10 minutes so the spices blend. It tastes even better the next day, and paprika or nutmeg can add extra flavor.', 40, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/wLOxv_9BTWfNrG8xNzWsAnruNSI=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step1_4x3.jpg", "instruction": "Peel and finely dice soup vegetables and the onion. Heat butter in a large pan. Sauté the onion cubes until translucent, then add remaining vegetables and bacon cubes and fry for approx. 5 min. Now sprinkle flour over it and stir carefully so that no lumps form.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/HhBSTuBf4Pzd75OlxjuJ72Lw0JE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step2_4x3.jpg", "instruction": "Strain lentils in a sieve, rinse with cold water, and add them to pan. Add meat broth and bay leaves. Bring mixture to a boil once, then let simmer over medium heat for approx. 30 min. Until the lentils are soft. Stir occasionally and add a little more broth if necessary.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/rClT2VBWwazGBdtVHbG1SSo8D1E=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step3_4x3.jpg", "instruction": "Prepare spaetzle according to package instructions in a pot of boiling water and then drain them. Heat sausages in water in a second pot. Season lentils with red wine vinegar, mustard, salt, pepper, and a little sugar and remove the bay leaves. Arrange Spätzle on plates, spoon the lentils over them, and serve with the sausages.", "step_number": 3}]', 4, 845, 'https://images.services.kitchenstories.io/6GydQsJ3NT3cx3LxqJRqNK7AqwM=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3444_Final_4x3.jpg'),
(2, 'Creamy mapo tofu udon', 'Creamy mapo tofu udon is a viral dish that''s quick and easy to make in about 20 minutes. Smooth blended tofu creates a creamy sauce for udon noodles, topped with flavorful fried ground meat. You can use beef, pork, chicken, or a vegan alternative, and season it with chili bean paste like doubanjiang or gochujang for a rich, spicy flavor.', 20, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/0cB6bBOYNi6Y2RW5P4Wu9U0c1Nw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_1.jpg_.jpg", "instruction": "Peel and chop garlic finely. Cut scallions into fine rings and set some green parts aside for garnish. Heat oil in a pan and fry garlic and scallions until translucent. Then, add chili bean paste and fry for approx. 2 min more. Add ground beef and continue frying until thoroughly cooked for approx. 8 min. Deglaze with soy sauce and set aside.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/ZPThe1-MskmQG-Ean9J3NRmB_VA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_2.jpg", "instruction": "Boil water in a pot and cook udon noodles according to package instructions. Meanwhile, place silken tofu in a container, add a pinch of salt and miso. Then, blend until creamy.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/09kITmCXL5oNm9oEDgXQ8qzQVBk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_3.jpg_.jpg", "instruction": "Once udon noodles are done, assemble the mapo tofu udon plate. Place udon noodles on a plate, pour creamy tofu over it and add spicy ground beef mix on top. Garnish with scallion rings and chili crisp before serving.", "step_number": 3}]', 2, 885, 'https://images.services.kitchenstories.io/9LNazBIG59jKOYEuCPgUnoSsEcA=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon.jpg_.jpg'),
(3, 'Cozy wild rice soup with sweet potato and mushrooms', 'This cozy wild rice soup is versatile and flavorful with balanced seasoning. If you don''t have Cajun seasoning, use paprika, oregano, thyme, and a pinch of cayenne. Creole seasoning also works well. For a milder taste, use smoked paprika and oregano, and add chili flakes if you want some heat.', 20, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/uT165ISDYdZy5f5ZyE8WddUEqko=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step1_4x3.jpg", "instruction": "Cook wild rice according to package directions, drain and set aside. Dice onion and sweet potato. Chop garlic. Cube carrots. Slice celery sticks and mushrooms. Heat oil in a large pot and sauté onion, garlic, carrots, celery, and mushrooms for approx. 5 min. until lightly browned.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/l9sNeA-ujM_LWvHvyseIoZWIaaQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step2_4x3.jpg", "instruction": "Add the vegetable broth. Add the bay leaf and Cajun seasoning and stir well. Bring the soup to a boil, then let it simmer gently over medium heat for approx. 15 min. until the vegetables are soft. Add the sweet potatoes during the last approx. 5 min. of cooking time.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/vKxEqa-4oXVmxX2XSFiXc5-CEDU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step3_4x3.jpg", "instruction": "Thoroughly wash kale, remove thick stems and roughly cut leaves. Add coconut cream, kale and rice. Let soup simmer for approx. 5 min. more until kale is soft. Season soup to taste with salt and pepper and add some more Cajun seasoning if desired. Then, serve while hot.", "step_number": 3}]', 2, 491, 'https://images.services.kitchenstories.io/3G89dV-Vx9w5G_y1lBdX4eFDMNk=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3418_Final_4x3.jpg'),
(4, 'Orzo salad with harissa-roasted pumpkin and Brussels sprouts', 'This vegan orzo salad with roasted vegetables is colorful, flavorful, and full of different textures. Orzo is small pasta shaped like rice and is usually vegan because it''s made from durum wheat semolina without eggs. The salad tastes best slightly warm but can also be prepared ahead of time like a regular pasta salad.', 40, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/aX3f1eJOgAwUNoxqnzzwfKuSUVw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-step-1.jpg", "instruction": "Preheat the oven to 220°C/420 °F. Cut onion into approx. 1.5 cm/0.6 in. wedges. Trim Brussels sprouts, remove wilted leaves, and cut into quarters. Cut pumpkin into approx. 1.5 cm/0.6 in. cubes. Coarsely chop the parsley. Drain chickpeas, rinse thoroughly, and set aside.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/RCACYxxvTpqRwvYvc4dWKHMoyew=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3037-photo-step-2-3x4-crop-tight.jpg", "instruction": "In a large bowl, mix harissa with some of the olive oil. Season with salt and pepper. Add the chopped vegetables and chickpea to the bowl. Mix well so they are coated in the harissa-oil mixture. Then place in a single layer on a baking sheet lined with parchment paper. Add unpeeled garlic cloves. Place in the oven and roast for approx. 20 min., turning the vegetables once halfway through. Remove from the oven when the vegetables are golden brown.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/WARdDW6AsyFxOQQECddlahikE_g=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3037-photo-step-3-4x3.jpg", "instruction": "Meanwhile, in a large pot without oil, toast the almonds over medium heat until golden brown. Then take them out, roughly chop, and put them aside. Then, in the same pot, bring water to a boil and cook orzo pasta according to package directions until al dente.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/nDaxjqDnAJuA4rlemRz5NVM3Ytc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-step-4.jpg", "instruction": "For the dressing, squeeze the insides of the roasted garlic cloves from the oven, when it''s not too hot to handle, into the large bowl used in step 2. Add the remaining olive oil and mix well with a fork. Grate zest and juice lemon into the bowl. Add vinegar and maple syrup and mix well again. Season to taste with salt and pepper. Add oven vegetables, orzo pasta, toasted almonds, raisins, and parsley to the dressing. Mix until combined. Season again if necessary. Best served lukewarm.", "step_number": 4}]', 2, 600, 'https://images.services.kitchenstories.io/z9JtgsJbQTmJVxKJAFQC1le7YyU=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-final-1_2.jpg'),
(5, 'Chewy chocolate chip cookies', 'Chewy chocolate chip cookies are soft, rich, and filled with sweet chocolate chips. They have a golden outside and a soft, chewy center, making them a classic and comforting treat perfect for any time.', 30, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/MF93eMjn0ynbYazkut-I4zFM8J8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step01.jpg", "instruction": "Preheat the oven to 180°C (350°F) so it reaches the right temperature for baking. In a medium bowl, combine the flour, baking soda, and salt, then mix them well so the dry ingredients are evenly distributed before adding them to the rest of the cookie dough ingredients.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/fJ0J7t1ELn2ir4W3afPzkAEJefk=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step02.jpg", "instruction": "In another bowl, beat the softened butter, brown sugar, and vanilla sugar together until the mixture becomes light, fluffy, and pale in color. Mixing well at this stage helps create a smooth texture and ensures the sugar is fully incorporated into the butter.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/WcvzlusDykzY-akRx9ntnCrYktw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step03.jpg", "instruction": "Add the eggs to the mixture one at a time, beating well after each addition until fully incorporated. This helps create a smooth, well-combined batter and ensures the eggs blend evenly with the other ingredients.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/YpbaTOzHdja8F760oYr3NDJDkHc=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step04.jpg", "instruction": "Add the flour mixture to the butter mixture and whisk gently until everything is well combined and forms a smooth dough. Then carefully fold in the chocolate drops, mixing just enough to distribute them evenly throughout the dough.", "step_number": 4}, {"step_id": 5, "image_url": "https://images.services.kitchenstories.io/4Z1Xud-5xT9xNIGRj0VAJefcMs8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step05.jpg", "instruction": "Scoop dough onto a lined baking sheet, leaving enough space in between cookies. Flatten slightly with the back of the scoop. Bake in preheated oven for approx. 10 - 12 min. at 180°C/350°F until golden. Cookies should remain soft on the inside. Allow to cool for approx. 10 min. before serving.", "step_number": 5}]', 30, 62, 'https://images.services.kitchenstories.io/FZtBo-KAliwTHJYiVq-RRuhu5yo=/828x0/filters:quality(85)/images.kitchenstories.io/recipeImages/ChewyChocolateChipCookies_Final.jpg'),
(6, 'Savoy cabbage carbonara with chestnut', 'This carbonara recipe shows how versatile the classic dish can be. It combines earthy savoy cabbage, sweet chestnuts, and rich Pecorino cheese for a deeper flavor. Remember the key carbonara rule: remove the pan from heat before mixing the eggs to keep the sauce creamy and smooth. The crispy Pecorino topping adds a salty crunch that makes this version even more special.', 40, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/2KEO2sH5THNMQtNsCDN-Br0lE8k=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step1_4x3.jpg", "instruction": "Heat olive oil in a large pan. Add panko and toast until golden brown. Finely grate half the pecorino and mix with warm panko. Keep toasting until there is a crispy, golden brown pecorino crunch. Season with salt and pepper, remove from pan, and set aside. Wipe the pan clean.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/SN02__R6yIWIdCU1XgtfkSObtpw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step2_4x3.jpg", "instruction": "Cook spaghetti according to package instructions until al dente. Once it''s done, set aside some pasta water and drain the rest. Meanwhile, cut savoy cabbage into fine strips, roughly chop chestnuts, and finely chop peeled garlic.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/VFMTbTn3EI3hdUeiW0cWT0fP2sA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step3_4x3.jpg", "instruction": "In the same large pan, heat some more olive oil and sauté savoy cabbage for approx. 5 - 7 min. until it''s soft and lightly browned. Add garlic, chopped chestnuts, and briefly sauté again. Season with salt and pepper.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/Ejc23IIf95MrPvX6MRNIBA64jYY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step4_4x3.jpg", "instruction": "Whisk egg yolks with remaining pecorino and pepper in a small bowl. Add cooked, still hot pasta to the pan. Then, add the egg mixture and pasta water to the still hot pasta. Mix quickly and evenly until you have a silky sauce. Add more pasta water if needed. Sprinkle pecorino crunch and chopped parsley on top and serve immediately.", "step_number": 4}]', 4, 720, 'https://images.services.kitchenstories.io/ktPjKdxYAhrxGC1Nnz9FLYyDd20=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3397_Final_4x3.jpg'),
(7, 'Pasta arrabiata', 'Arrabbiata is a classic Italian tomato sauce known for its spicy kick. Made with garlic, chili, and rich tomatoes, it has a bold and slightly "angry" flavor. Use good-quality ingredients for the best taste, adjust the chili flakes to control the heat, and garnish with parsley or basil for a touch of freshness.', 20, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/XXdbnvH63ycV-9WndqunM32XDtQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-1.jpg", "instruction": "Season a pot of boiling water generously with salt. Add penne and cook until just shy of al dente, approx. 1 min. less than the package recommends. Drain, reserving approx. 1/4 cup (60ml) of pasta water.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/KnXuVbgnqXnZI5Vr7Nu0cWkj628=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-2.jpg", "instruction": "While the pasta cooks, mince the garlic. Add olive oil to a large frying pan and add minced garlic and chili flakes. Sauté for approx. 3 min. over medium heat, then add tomato paste and canned chopped tomatoes. Let simmer for approx. 5 min.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/7wE7u2VdQaM-Ecvng_kaTtw4F7g=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-3.jpg", "instruction": "Add reserved pasta water and cooked penne to the tomato sauce. Toss over medium heat until the pasta is coated in the sauce. Season with salt if needed. Serve immediately with freshly grated Pecorino cheese, a drizzle of olive oil, and parsley. Enjoy!", "step_number": 3}]', 4, 500, 'https://images.services.kitchenstories.io/b4Y6pYC9k9Liz-BzgcMJsTJhL0M=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-final-1.jpg'),
(8, 'Cold noodle salad with peanut sauce', 'This soba noodle salad is a refreshing dish perfect for hot days. It''s served cold with a spicy peanut sauce, cucumber, red cabbage, and snap peas. You can add other raw vegetables and adjust the spice to your taste. A squeeze of lemon or chili crisp adds extra flavor, and the salad can be stored in the fridge for up to 3 days.', 20, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/kVmOSn-qNtfzd72cgiqWEp32B-E=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_0.jpg", "instruction": "Bring a pot of water to a boil over medium-high heat. In the meantime, slice the cucumber into thin strips. Thinly slice the scallions. Chop up the red cabbage. Slice the snow peas into bite-sized pieces. Cut the stems and leaves of the cilantro. Roughly chop the peanuts.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/to7qZb9kkSrSJctKztPWekqPxEk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_1.jpg", "instruction": "Once the water boils, season with salt and cook the soba noodles according to package instructions. Drain and rinse with cold water until the noodles are completely cooled.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/-Ny4i28zp5v8vctx67qi0odxDWc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_7.jpg", "instruction": "For the sauce, place the peanut butter, soy sauce, sesame oil, sugar and lemon juice in a large bowl. Mix well, then grate in the garlic with a fine grater. Mix again and thin out the sauce by adding cold water by the tablespoons until the desired consistency is reached. Add the noodles and all the vegetables and mix well. Garnish with peanuts, cilantro leaves and chilli oil if desired and serve. Enjoy!", "step_number": 3}]', 2, 450, 'https://images.services.kitchenstories.io/6zdWp2pMtyYHQAjocQoKCu6LFRQ=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2637-final-photo-_2.jpg'),
(9, 'Bang bang salmon bowl', 'After a long day, you''re craving something quick and healthy-ish that still feels like a hug in a bowl? This bang bang salmon has you covered! The creamy-spicy sauce is all yours to play with - just add a little extra Sriracha if you want more of a fiery kick.', 30, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/Q78ySCXBIrlKIWetlNEvvnc_kVU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step1_4x3.jpg", "instruction": "Preheat the oven to 200 °C (top/bottom heat). In a large bowl, mix mayonnaise, sweet chili sauce, and Sriracha, then set aside. Cut the salmon into bite-sized pieces, season in a bowl with paprika powder, garlic powder, salt, and pepper, and mix well.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/EJUZDlkQKx2Pr-n6C7QZL5Cmw0Y=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step2_4x3.jpg", "instruction": "Line a baking sheet with parchment paper. Spread the seasoned salmon on top, drizzle with oil, and bake in the oven for approx. 8 - 10 min. until cooked through and easily flaked. Meanwhile, cook the rice according to package instructions. At the same time, slice the red cabbage into very thin strips and peel and grate the carrots.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/H5dAFaVNCMCJO8VdTsTOqkUJQB4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step3_4x3.jpg", "instruction": "Halve avocado and remove the pit, then slice. Slice the cucumber as well. Cook the edamame for approx. 2 - 3 min. according to package instructions, drain, remove from the pods and salt everything. Carefully mix the salmon with half of the bang bang sauce. Spoon rice into bowls and top with the vegetables and salmon. Garnish with coriander, the remaining sauce and sesame seeds, season to taste and serve.", "step_number": 3}]', 2, 1212, 'https://images.services.kitchenstories.io/Fvsa5KzTlElPrtKvapl825om1Fo=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3373_Final_4x3.jpg'),
(10, 'Halloumi tzatziki bowl with lemony orzo', 'This fresh Greek-inspired bowl with tzatziki, halloumi, and lemony orzo brings the taste of summer to your table. The orzo is mixed with lemon and spinach for a light, refreshing base, topped with grilled halloumi and a juicy tomato-cucumber salad.', 30, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/j2RB69g0bK4rDkg406yN_ng8SgY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_1.jpg", "instruction": "Start the halloumi tzatziki bowl by preparing the orzo first. Finely mince garlic, zest half the lemon and halve red onion. Set one half aside and dice the other half. Heat some olive oil in a small pot and add diced onion and half of the garlic, frying for approx. 2 min. Then, add orzo and fry for approx. 2 min. more. Pour vegetable stock in, add pepper and oregano and let orzo simmer for approx. 10 - 15 min. stirring occasionally.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/licJXdgD3I_gJDGIuFz1oIF-ijg=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_2.jpg", "instruction": "While the orzo cooks, start making the tzatziki and grate half the cucumber into a bowl. To the same bowl, add greek yogurt, rest of finely minced garlic, olive oil, lemon juice, and salt. Mix until it''s creamy and well combined. For the rest of the bowl, slice remaining cucumber and halve cherry tomatoes. Cut the remaining onion half into thin rings.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/ZkTkzK2XYGc_2emRz3j6oLIdfz4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_3.jpg", "instruction": "Cut halloumi into approx. 1 cm/0.4 in. thin slices and fry in a pan until both sides are golden brown for approx. 6 min. in total. Check on the orzo and mix in spinach leaves and lemon zest approx. 2 min. before it is done. Then, remove from heat and let cool a bit.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/7i8zMJ7Z291LA0U8GXq6kL0oafc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_4.jpg", "instruction": "Once the orzo cooled down, assemble the bowls. To a deep bowl add orzo, tomatoes, cucumber, red onion, olives, tzatziki, and halloumi. Sprinkle salt, pepper, and lemon juice. Serve with mint leaves on top.", "step_number": 4}]', 2, 1306, 'https://images.services.kitchenstories.io/gLrf2KyIRJ34ppo5or_LOvgOquU=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl.jpg'),
(11, 'Summery strawberry tiramisu', 'This strawberry tiramisu is a fresh and summery twist on the classic dessert. It features creamy whipped mascarpone, layers of strawberries, and ladyfingers soaked in a fruity syrup made with balsamic vinegar, golden syrup, and water.', 25, 'Hard', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/mW3l_9zFI_q_bVkxE-AU1TpFTmI=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step1_4x3.jpg", "instruction": "Combine golden syrup, balsamic vinegar, and water in a small pot. Warm over medium heat and stir until it''s all well combined. Let the mixture cool. Meanwhile, wash strawberries, remove the stems, and slice them thin.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/kLChFiIMrbA-lcTqeKjMr_qxlOA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step2_4x3.jpg", "instruction": "Separate the eggs. Beat egg yolks with honey and vanilla extract in a bowl until creamy, using a hand mixer. Gradually add mascarpone and mix until smooth. In a separate bowl, whip heavy cream until stiff and gently fold it into the mascarpone mixture.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/2DUA40gbY6EQvgh6eF0EGra7ucA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step3_4x3.jpg", "instruction": "Briefly dip ladyfingers one by one into the cooled syrup and cover the bottom of a glass dish with them. Spread half of the mascarpone cream over the ladyfingers and smooth it out. Spread half of the strawberry jam over the cream. Add another layer of syrup-dipped ladyfingers, spread with the remaining jam, and top with the remaining mascarpone cream.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/QEBgtLMtA_ON9mzI1RIqwBYaSLQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step4_4x3.jpg", "instruction": "Top the Tiramisu with sliced strawberries. Cover and chill in the fridge, ideally overnight. Serve once it''s chilled enough. Garnish with fresh mint if desired.", "step_number": 4}]', 8, 350, 'https://images.services.kitchenstories.io/vwsS8hYVLFeClf3YQy44i84VH7k=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3322_Final_4x3.jpg'),
(12, 'Chicken noodle soup', 'This comforting chicken noodle soup is nostalgic, soothing, and full of flavor. Made with broth, chicken drumsticks, bacon, leek, root vegetables, and tender noodles, it''s a hearty meal that can be ready in under an hour.', 50, 'Hard', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/lqGZNUkzKY3v9g7_vaWh6RwtYCY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-1a.jpg", "instruction": "Dice bacon into small cubes. Peel and finely dice onion. Peel and dice potatoes and carrots. Remove tops and ends and slice celery and leeks.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/v4AJz2GJXUQEVMru5-z7XjzMcv0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-2.jpg", "instruction": "Melt butter in a large pot over medium-high heat. Add onion and bacon and fry for approx. 2- 3 min. Add chicken drumsticks and fry for approx. 3 - 5 min. Season with salt and pepper.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/rs46_T3s_JJfjAua49LGBVX7vvY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-3a.jpg", "instruction": "Add the diced vegetables, bay leaves, and vegetable broth to the pot. Bring to a boil, cover with lid and reduce heat to medium. Let simmer for approx.15 min.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/HSgvW6jnkykwtmPm1Kv_saHe9N4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-4.jpg", "instruction": "Remove chicken drumsticks from the pot. Set aside and allow to cool. In the meantime, add the egg noodles to the pot and cook, covered, for approx. 10 min.", "step_number": 4}, {"step_id": 5, "image_url": "https://images.services.kitchenstories.io/c4WqUPl6dHjDcBejo2J46YE1wkU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-5.jpg", "instruction": "Once chicken drumsticks are cool enough to handle, remove the skin and discard. Remove the meat from the bone and shred or cut into bite-sized pieces. Add the chicken back into the pot. Season with salt and pepper to taste and serve the soup with a sprinkle of parsley.", "step_number": 5}]', 2, 700, 'https://images.services.kitchenstories.io/ZcY1g48KYL8Z43jjvAyNMUGW-Tc=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R1129-final-photo-1.jpg'),
(13, 'Smash burger', 'This recipe shows how easy it is to make a USA-style smash burger at home. Cook the patties in a very hot cast iron pan to get a crispy crust and juicy center. Top with classic ingredients or customize with bacon, caramelized onions, or cheeses like blue or brie.', 20, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/DmuMEXzSj1ykXzdDebZqJ4Fa8yQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_1.jpg", "instruction": "Peel and slice onion vertically. Wash the iceberg lettuce and finely shred. Drain the pickles. Mix mayonnaise, ketchup, and mustard in a small bowl. Halve the burger buns and toast to your liking. Cut parchment paper into 15 x 15 cm/6 x 6 in. squares for each patty.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/lJaoKoHOAzUButy7miX6hemTROk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_2.jpg", "instruction": "Heat the cast iron pan over high heat, then lightly brush with vegetable oil. Divide the ground beef into equal portions and shape into loose balls. Place patties in the pan in batches, being careful not to overcrowd. Cover each with a sheet of parchment paper, and flatten with a spatula until they are approx. 1 cm thick. Season with salt and pepper and cook over high for approx. 2 min. until the edges are crispy and brown.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/WZS2RcGv8T6LiXuYQ6eVtyq-LPc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_3.jpg", "instruction": "Flip the patties, season with salt and pepper, and place a slice of cheese on each patty. Cook for another 1—2 min. Meanwhile, spread the sauce on both sides of the buns, then layer your lettuce on the bottom half. Next, stack the patties, onion, pickles, and the top of the bun. Serve immediately!", "step_number": 3}]', 2, 800, 'https://images.services.kitchenstories.io/iCbnuVajG80ydVxZuQWGaSkBSsI=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_title.jpg'),
(14, 'Molten chocolate cake', 'Molten chocolate cake is a rich and indulgent dessert with a soft outer layer and a warm, gooey chocolate center. When baked just right, the cake opens to reveal a flowing chocolate filling, making it a perfect treat for chocolate lovers.', 45, 'Hard', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/gYGMeoScfb-DyXitT1TpGZFSPKA=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step01.jpg", "instruction": "Butter baking tins and dust with sugar. Make sure that it is evenly spread on the inside of the tins. Tap out excess sugar.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/icrwkOnOPKl8O6GhySF1t75YtQ8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step02.jpg", "instruction": "Preheat oven to 200°C/400°F. Roughly chop couverture chocolate. Melt butter in a saucepan over medium heat. Add the chopped chocolate and melt together.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/Kv7L_BtkGtKNMuYDv-zkufgufo0=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step03.jpg", "instruction": "In a large bowl, beat the sugar, eggs, egg yolks, and salt using a mixer or whisk until the mixture becomes smooth, pale, and slightly thick.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/vxSlRwRk0nauGO8H9GKF4CNuHNo=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step04.jpg", "instruction": "Slowly add the melted chocolate to the egg mixture and stir gently until fully combined and a smooth, rich batter forms.", "step_number": 4}, {"step_id": 5, "image_url": "https://images.services.kitchenstories.io/fglznXhVJFzbBL4gq86WZ5IrFig=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step05.jpg", "instruction": "Add the flour to the mixture and gently stir until fully incorporated.", "step_number": 5}, {"step_id": 6, "image_url": "https://images.services.kitchenstories.io/Toxa7KwGamtVcGfdnH0qIymiG7c=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step06.jpg", "instruction": "Divide the batter evenly among the buttered baking tins. Place the filled tins in the freezer for approx. 5 - 7 min.", "step_number": 6}, {"step_id": 7, "image_url": "https://images.services.kitchenstories.io/yRri79oEmhzNfrck5WCd2TTutMU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step07.jpg", "instruction": "Bake cakes in a preheated oven at 200°C/400°F for approx. 8 - 10 min. Let stand for approx. 5 - 7 min. Carefully turn out the cakes, sprinkle with confectioner''s sugar, and serve immediately.", "step_number": 7}]', 12, 450, 'https://images.services.kitchenstories.io/l6WZqFEJwOPCx4Z7WkEsqGgfbqQ=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/MoltenChocolateCake_FINAL.jpg'),
(15, 'Carbonara muffins', 'Carbonara muffins are a creative twist on the classic Italian pasta dish. They combine eggs, cheese, pasta, and crispy bacon baked into savory muffins that are creamy inside and slightly crispy on the outside.', 35, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/GpMk8nASnV2g6YnKK1rCXAM-EmQ=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-2.jpg", "instruction": "Preheat oven to 180°C/350°F (convection). Cook spaghetti in salted water according to package instructions. Heat some oil in a frying pan, then fry bacon cubes.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/ojuVGCSm4ESGiX2qEivzcyGXpkw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-3.jpg", "instruction": "Whisk eggs, heavy cream, and a part of the Parmesan cheese. Add fried bacon cubes. Season with salt and pepper. Add cooked spaghetti and mix.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/D5NXqGtixKFAWY4aRea6USd8ZDs=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-4.jpg", "instruction": "Grease the muffin tin. Twirl spaghetti strands around a fork and place into muffin cups. Sprinkle with the remaining Parmesan cheese, then bake at 180°C/350°F (convection) for approx. 15 – 20 min.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/4emnrQuwQhf45pEPvArfcS8bXMI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/carbonara-muffins.jpg", "instruction": "Remove the carbonara muffins from the oven and let them cool in the muffin tin for a few minutes. Then carefully lift them out, sprinkle with a little extra Parmesan or black pepper if you like, and serve warm.", "step_number": 4}]', 3, 900, 'https://images.services.kitchenstories.io/PK5WpAQ2hQqS9CqS9z-qkKUjxoQ=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/C103-photo-final.jpg'),
(16, 'Breakfast burrito', 'A breakfast burrito is a hearty and satisfying morning meal filled with scrambled eggs, cheese, and savory bacon, all wrapped in a warm flour tortilla. It''s flavorful, filling, and perfect for a quick breakfast on busy mornings.', 25, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/bXqGPm_ckz2Kq6J3bJg998XvRi0=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step01.jpg", "instruction": "Finely dice the bell pepper into small pieces. Thinly slice the onion into half rings, and finely chop the chives to add fresh flavor and color to the dish.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/dLdPxrMHt6C7HU4L21ltbRWYaXU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step02.jpg", "instruction": "Using a box grater, roughly grate the cheese into small shreds. This helps it melt evenly and mix well with the other ingredients.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/T9pfScqa_8m8AQSRoMo2MgTsLUI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step03.jpg", "instruction": "In a large bowl, beat the eggs together with a few drops of Tabasco sauce until well combined.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/efRuVGgvVLnwtIm5qnJrkJxzdFw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step04.jpg", "instruction": "Heat up butter in a frying pan and sauté onions over medium heat for approx. 1 - 2 minutes. Then, add the bell pepper and continue to sauté for an additional 2 – 3 min.", "step_number": 4}, {"step_id": 5, "image_url": "https://images.services.kitchenstories.io/2dLZ62xIHbssDhF4J6S4tNiiesg=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step05.jpg", "instruction": "Add eggs to the pan and continue to sauté, stirring occasionally, for approx. 3 - 5 min. Then, add the cheese and stir until melted.", "step_number": 5}, {"step_id": 6, "image_url": "https://images.services.kitchenstories.io/EkL_LjtLY3R8sB7Iuyp3lntheGU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step06.jpg", "instruction": "Place some of the eggs in the middle of the tortilla, taking care not to overfill. Sprinkle some chives on top. Fold tortilla in from the sides. Then, roll forward from bottom with thumbs until burrito is tightly rolled. Enjoy!", "step_number": 6}]', 1, 350, 'https://images.services.kitchenstories.io/di54LYwOhI5dXmioNMsBy93iEy4=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/RP04_21_04_BreakfastBurito_TitlePicture.jpg'),
(17, 'Bok choy and crispy tofu stir fry', 'This vegan weeknight dinner is quick and easy, ready in just 20 minutes. It''s a light and refreshing meal for warm days and is packed with healthy carbs and protein.', 20, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/FL6sDPMh7cCUlheOiFvt07O1Fbc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-1.jpg", "instruction": "Peel and finely dice scallion and garlic. Deseed chili and slice into thin rings. Trim the ends off bok choy heads and slice each lengthwise into strips.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/qZdYTUfUZlNmtlTeJw-TMgulgRs=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-2.jpg", "instruction": "For the sauce, mix rice wine, soy sauce, water, and raw sugar in a small bowl. Pat tofu dry, then dice into bite-sized pieces. Add to a bowl with starch and salt, and toss to coat.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/Rsr8mJkDTpf5VBgHiZjX2Ej4Yug=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-3.jpg", "instruction": "Heat sesame oil in a frying pan over medium heat. Add tofu and sear for approx. 3 - 5 min., or until crisp. Remove from the pan and drain on paper towels.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/OZD4ISI4_XjeRyZ41dQilmDqzLs=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-4.jpg", "instruction": "Add bok choy, scallion, garlic, and chili to the same frying pan and sauté for approx. 2 - 3 min., then deglaze with sauce. Transfer crispy tofu back to the pan and toss to combine. Serve with cooked brown rice. Enjoy!", "step_number": 4}]', 3, 600, 'https://images.services.kitchenstories.io/y4JjeVL7fn3ziaOE-ySsuGI8eYY=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3057-photo-title-1-newforTK.jpg'),
(18, 'Pancake tacos with candied bacon and scrambled eggs', 'This fun breakfast recipe turns pancakes into soft, fluffy taco shells. Fill them with your favorite breakfast ingredients to create a tasty and creative way to start the day.', 30, 'Easy', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/gL5hiiqBCjmK1ylHG9pqwl83hl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_1.jpg", "instruction": "Preheat the oven to 180°C/350°F top/bottom heat. Combine flour, baking powder, sugar and salt in a large mixing bowl and set aside. Whisk eggs and milk in a small measuring cup. Then stir in half of the melted butter. Gently stir the milk mixture into the dry ingredients.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/xQSozAxQZ06H-S-ydcFmcJUP7G4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_2.jpg", "instruction": "Lay out the bacon strips on a baking tray lined with parchment paper. Brush the bacon with the maple syrup and season with pepper. Then bake in the preheated oven for approx. 15–20 min. until golden brown and crispy.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/7wutoPq-FX0WyeJISAsr58weJm4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_3.jpg", "instruction": "Melt half of the remaining butter in a large frying pan. Pour batter into the pan in batches and cook approx. 10 cm/ 4 in.-sized pancakes. Flip pancakes after approx. 2–3 min., when bubbles rise to the surface and the bottom browns.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/L4XQgeTNIhkO7U5KwV_OMCXPf3Q=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-final-photo-_1.jpg", "instruction": "Cut chives into fine rings. Heat butter in a pan, whisk eggs with salt and pepper, and scramble them over low–medium heat. Stir in most of the cheese just before the eggs are done. Fold pancakes like tacos, fill with scrambled eggs, top with bacon and remaining cheese, garnish with chives and hot sauce, and serve immediately.", "step_number": 4}]', 3, 400, 'https://images.services.kitchenstories.io/Q3Fe0myY_iiTAiPYHMIWAtQeG-g=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/extra_finals_0.jpg'),
(19, 'Fried chicken', 'Fried chicken is a crispy and flavorful dish made by coating chicken in seasoned flour and frying it until golden brown. It has a crunchy outside and juicy, tender meat inside, making it a classic comfort food loved around the world.', 35, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/DxeKRrLcCco07JULNhOz8B31P54=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step01.jpg", "instruction": "Preheat oven to 200°C/400°F. In a small bowl, mix together garlic powder, onion powder, salt, pepper, and paprika.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/ABrcCTIhWPaJSKGk9mKsUdrEnIE=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step03.jpg", "instruction": "Carefully cut chicken legs in half at the joint. Rub them generously with spice rub, setting any excess spice rub aside.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/zVnqCIODyC_rL6Sl5LHaquTKhU8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step02.jpg", "instruction": "In a large bowl, whisk together egg, water, and Tabasco. In a separate large bowl, whisk together flour, baking powder, a pinch of salt, and the excess spice rub.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/YtuEFZ9m2xsyIh2NgotU52HA1JU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step04.jpg", "instruction": "Dip chicken pieces in the egg mixture until well coated. Lightly shake to remove excess liquid. Dredge chicken in flour mixture until a thick and even crust is formed.", "step_number": 4}, {"step_id": 5, "image_url": "https://images.services.kitchenstories.io/aChQFn6gq319Nce6YU4gCVbyigI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step05.jpg", "instruction": "Heat oil in a deep pan over medium-high heat. Fry chicken in batches for 3 - 5 minutes until golden and crispy, then bake at 200°C (400°F) for 10 - 15 minutes until cooked through. Serve with lemon wedges and dipping sauces.", "step_number": 5}]', 6, 600, 'https://images.services.kitchenstories.io/AI95bm2qcUaAmL-Fwn0HHyesUyI=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/25_09_FriedChicken_TitlePicture.jpg'),
(20, 'Spicy coconut-marinated grilled shrimp', 'Spicy coconut-marinated grilled shrimp are juicy, flavorful, and slightly smoky. The shrimp are marinated in a creamy coconut mixture with spices and then grilled until tender, creating a delicious balance of spicy, savory, and lightly sweet flavors.', 30, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/MRT5v409KH5qQGC0NGIk7c16bjg=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-1.jpg", "instruction": "Finely dice ginger and garlic and add to a big bowl. Add coconut milk, chili paste, lime juice, brown sugar, and salt. Whisk in oil. Add shrimp, mix well, and let sit for at least 15 min. or up to 4 hrs.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/KUJMJ5jUlJzdX-jUYBYLTZLYNJE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-2.jpg", "instruction": "Remove shrimp from marinade. Add marinade to a small pot and bring to a boil. Reduce heat to medium and let reduce, stirring occasionally, until creamy and thick enough to coat the back of a spoon.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/WK7KwxKg9KlrtS6c6p4Glcl-TzQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-4.jpg", "instruction": "Grill shrimp on a very hot grill pan brushed with vegetable oil over high heat. Serve with sauce, cilantro, and lime wedges. Enjoy!", "step_number": 3}]', 2, 500, 'https://images.services.kitchenstories.io/FyW6jQTFYawJf1zO55gPrKpfkpE=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-final-1.jpg'),
(21, 'Spaghetti Bolognese', 'Spaghetti Bolognese is one of the dishes from my childhood that stands out the most. Rich, saucy and incredibly flavorful. Hardly any other pasta dish is as well-known as this one.', 45, 'Medium', '[{"step_id": 1, "image_url": "https://images.services.kitchenstories.io/wqvAi28OtHzLjtXX9AMhW2lJa2E=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-1.jpg", "instruction": "For the soffritto, peel and halve the onions and garlic. Peel and roughly chop the carrot. Roughly chop the celery. Add them to a food processor or blender and chop everything evenly until it is about as fine as the ground beef. Heat the olive oil in a large non-stick frying pan over low heat. Add the chopped vegetables and sauté for approx. 10-15 min. Stir regularly to make sure nothing burns.", "step_number": 1}, {"step_id": 2, "image_url": "https://images.services.kitchenstories.io/Wl9Ij0QASGZ9RMz8thg72ZEYIIo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-2.jpg", "instruction": "Then add the ground beef to the pan and fry for another approx. 10-15 min. While frying, break up the meat with a cooking spoon. Season with salt and pepper.", "step_number": 2}, {"step_id": 3, "image_url": "https://images.services.kitchenstories.io/t1yTaOY5AnDlledLnwv0ryIfRh4=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-3.jpg", "instruction": "Add the canned crushed tomatoes, tomato paste, salt, pepper and dried oregano. Simmer uncovered over medium heat for approx. 15-30 min. until the sauce has thickened.", "step_number": 3}, {"step_id": 4, "image_url": "https://images.services.kitchenstories.io/I0Ji7dQ7j6D1Ce0sHp-VaRWyo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-5.jpg", "instruction": "In the meantime, cook the spaghetti in plenty of boiling salted water according to package instructions until al dente. Drain the pasta and serve with the Bolognese sauce and grated Parmesan cheese.", "step_number": 4}]', 4, 500, 'https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg');

-- --------------------------------------------------------
-- Table structure for table `ingredient`
-- --------------------------------------------------------

INSERT INTO `ingredient` (`ingredient_id`, `ingredient_name`, `default_unit`, `calories_per_unit`, `cost_per_unit`, `is_allergen`) VALUES
-- Recipe 1
(1,   'spaetzle',             'g',      NULL, NULL, 0),
(2,   'mountain lentils',     'g',      NULL, NULL, 0),
(3,   'bouquet garni',        'pc',     NULL, NULL, 0),
(4,   'broth',                'l',      NULL, NULL, 0),
(5,   'Vienna sausages',      'pc',     NULL, NULL, 0),
(6,   'onion',                'pc',     NULL, NULL, 0),
(7,   'butter',               'tbsp',   NULL, NULL, 0),
(8,   'smoked bacon',         'g',      NULL, NULL, 0),
(9,   'flour',                'tbsp',   NULL, NULL, 0),
(10,  'red wine vinegar',     'tbsp',   NULL, NULL, 0),
-- Recipe 2
(11,  'silken tofu',          'g',      NULL, NULL, 0),
(12,  'udon noodles',         'g',      NULL, NULL, 0),
(13,  'ground beef',          'g',      NULL, NULL, 0),
(14,  'garlic',               'cloves', NULL, NULL, 0),
(15,  'scallions',            'sprigs', NULL, NULL, 0),
(16,  'gochujang',            'tbsp',   NULL, NULL, 0),
(17,  'miso paste',           'tbsp',   NULL, NULL, 0),
(18,  'soy sauce',            'tbsp',   NULL, NULL, 0),
-- Recipe 3
(19,  'wild rice',            'g',      NULL, NULL, 0),
(20,  'sweet potato',         'pc',     NULL, NULL, 0),
(21,  'brown mushrooms',      'g',      NULL, NULL, 0),
(22,  'carrot',               'pc',     NULL, NULL, 0),
(23,  'vegetable broth',      'ml',     NULL, NULL, 0),
(24,  'coconut cream',        'ml',     NULL, NULL, 0),
(25,  'Cajun seasoning',      'tsp',    NULL, NULL, 0),
-- Recipe 4
(26,  'orzo',                 'g',      NULL, NULL, 0),
(29,  'olive oil',            'tbsp',   NULL, NULL, 0),
(30,  'lemon',                'pc',     NULL, NULL, 0),
(31,  'spinach',              'g',      NULL, NULL, 0),
(34,  'maple syrup',          'ml',     NULL, NULL, 0),
(36,  'ginger',               'tsp',    NULL, NULL, 0),
-- Recipe 6
(38,  'spaghetti',            'g',      NULL, NULL, 0),
(39,  'savoy cabbage',        'g',      NULL, NULL, 0),
(40,  'chestnuts',            'g',      NULL, NULL, 0),
(41,  'Pecorino cheese',      'g',      NULL, NULL, 0),
(42,  'egg yolks',            'pc',     NULL, NULL, 0),
(43,  'panko breadcrumbs',    'g',      NULL, NULL, 0),
-- Recipe 7
(44,  'penne',                'g',      NULL, NULL, 0),
(47,  'chili flakes',         'tbsp',   NULL, NULL, 0),
-- Recipe 8
(48,  'soba noodles',         'g',      NULL, NULL, 0),
(49,  'creamy peanut butter', 'tbsp',   NULL, NULL, 0),
(50,  'cucumber',             'pc',     NULL, NULL, 0),
(51,  'red cabbage',          'g',      NULL, NULL, 0),
-- Recipe 9
(52,  'salmon fillets',       'pc',     NULL, NULL, 0),
(53,  'mayonnaise',           'ml',     NULL, NULL, 0),
(54,  'sweet chili sauce',    'ml',     NULL, NULL, 0),
(55,  'Sriracha',             'ml',     NULL, NULL, 0),
(56,  'rice',                 'g',      NULL, NULL, 0),
(57,  'avocado',              'pc',     NULL, NULL, 0),
-- Recipe 10
(58,  'halloumi',             'g',      NULL, NULL, 0),
(59,  'Greek yogurt',         'g',      NULL, NULL, 0),
(60,  'mini cucumbers',       'pc',     NULL, NULL, 0),
-- Misc
(68,  'chilis',               'pc',     NULL, NULL, 0),
(69,  'burger buns',          'pc',     NULL, NULL, 0),
(70,  'cheese slices',        'pc',     NULL, NULL, 0),
(71,  'pickles',              'g',      NULL, NULL, 0),
(72,  'honey',                'tbsp',   NULL, NULL, 0),
(73,  'sugar',                'g',      NULL, NULL, 0),
(75,  'double cream',         'ml',     NULL, NULL, 0),
(76,  'eggs',                 'pc',     NULL, NULL, 0),
(77,  'pancetta',             'slices', NULL, NULL, 0),
(78,  'Parmesan',             'g',      NULL, NULL, 0),
(80,  'egg',                  'pc',     NULL, NULL, 0),
(81,  'cherry tomatoes',      'pc',     NULL, NULL, 0),
(82,  'brown rice',           'g',      NULL, NULL, 0),
(86,  'almonds',              'g',      NULL, NULL, 0),
(88,  'corn tortillas',       'pc',     NULL, NULL, 0),
(89,  'edamame beans',        'g',      NULL, NULL, 0),
(90,  'chicken legs',         'pc',     NULL, NULL, 0),
(91,  'Tabasco',              'tbsp',   NULL, NULL, 0),
(92,  'oil',                  'ml',     NULL, NULL, 0),
(94,  'milk',                 'ml',     NULL, NULL, 0),
(96,  'mustard',              'tbsp',   NULL, NULL, 0),
(97,  'bay leaves',           'pc',     NULL, NULL, 0),
(98,  'soup vegetables',      'g',      NULL, NULL, 0),
(99,  'chili crisp',          'tbsp',   NULL, NULL, 0),
(100, 'celery',               'sticks', NULL, NULL, 0),
(101, 'kale',                 'g',      NULL, NULL, 0),
(102, 'pumpkin',              'g',      NULL, NULL, 0),
(103, 'Brussels sprouts',     'g',      NULL, NULL, 0),
(104, 'chickpeas',            'g',      NULL, NULL, 0),
(105, 'harissa',              'tbsp',   NULL, NULL, 0),
(106, 'parsley',              'g',      NULL, NULL, 0),
(107, 'brown sugar',          'g',      NULL, NULL, 0),
(108, 'vanilla sugar',        'g',      NULL, NULL, 0),
(109, 'baking soda',          'tsp',    NULL, NULL, 0),
(110, 'chocolate chips',      'g',      NULL, NULL, 0),
(111, 'sesame oil',           'tbsp',   NULL, NULL, 0),
(112, 'snow peas',            'g',      NULL, NULL, 0),
(113, 'cilantro',             'g',      NULL, NULL, 0),
(114, 'peanuts',              'g',      NULL, NULL, 0),
(115, 'paprika powder',       'tsp',    NULL, NULL, 0),
(116, 'garlic powder',        'tsp',    NULL, NULL, 0),
(117, 'sesame seeds',         'tsp',    NULL, NULL, 0),
(118, 'red onion',            'pc',     NULL, NULL, 0),
(119, 'olives',               'g',      NULL, NULL, 0),
(120, 'oregano',              'tsp',    NULL, NULL, 0),
(121, 'mint',                 'g',      NULL, NULL, 0),
(122, 'ladyfingers',          'pc',     NULL, NULL, 0),
(123, 'mascarpone',           'g',      NULL, NULL, 0),
(124, 'vanilla extract',      'tsp',    NULL, NULL, 0),
(125, 'strawberries',         'g',      NULL, NULL, 0),
(126, 'golden syrup',         'tbsp',   NULL, NULL, 0),
(127, 'balsamic vinegar',     'tbsp',   NULL, NULL, 0),
(128, 'strawberry jam',       'g',      NULL, NULL, 0),
(129, 'chicken drumsticks',   'pc',     NULL, NULL, 0),
(130, 'potatoes',             'g',      NULL, NULL, 0),
(131, 'leeks',                'pc',     NULL, NULL, 0),
(132, 'egg noodles',          'g',      NULL, NULL, 0),
(133, 'lettuce',              'g',      NULL, NULL, 0),
(134, 'ketchup',              'tbsp',   NULL, NULL, 0),
(135, 'chocolate',            'g',      NULL, NULL, 0),
(136, 'confectioners sugar',  'g',      NULL, NULL, 0),
(137, 'tortillas',            'pc',     NULL, NULL, 0),
(138, 'bell pepper',          'pc',     NULL, NULL, 0),
(139, 'chives',               'g',      NULL, NULL, 0),
(140, 'bok choy',             'pc',     NULL, NULL, 0),
(141, 'rice wine',            'tbsp',   NULL, NULL, 0),
(142, 'cornstarch',           'tbsp',   NULL, NULL, 0),
(143, 'shrimp',               'g',      NULL, NULL, 0),
(144, 'lime',                 'pc',     NULL, NULL, 0),
(145, 'chili paste',          'tbsp',   NULL, NULL, 0),
(147, 'tomato paste',         'tbsp',   NULL, NULL, 0),
(148, 'canned tomatoes',      'g',      NULL, NULL, 0),
(149, 'vinegar',              'tbsp',   NULL, NULL, 0),
(150, 'raisins',              'g',      NULL, NULL, 0),
(151, 'baking powder',        'tsp',    NULL, NULL, 0),
(152, 'bacon strips',         'slices', NULL, NULL, 0),
(153, 'onion powder',         'tsp',    NULL, NULL, 0),
(154, 'coconut milk',         'ml',     NULL, NULL, 0),
(155, 'water',                'ml',     NULL, NULL, 0),
(156, 'cheddar cheese',       'g',      NULL, NULL, 0),
(157, 'iceberg lettuce',      'g',      NULL, NULL, 0),
(158, 'bacon cubes',          'g',      NULL, NULL, 0),
(159, 'unsalted butter',      'g',      NULL, NULL, 0),
(160, 'bittersweet chocolate','g',      NULL, NULL, 0),
(161, 'all-purpose flour',    'g',      NULL, NULL, 0),
(162, 'flour tortillas',      'pc',     NULL, NULL, 0),
(163, 'snap peas',            'g',      NULL, NULL, 0),
(164, 'roasted peanuts',      'tbsp',   NULL, NULL, 0),
(165, 'baby spinach',         'g',      NULL, NULL, 0),
(166, 'Kalamata olives',      'g',      NULL, NULL, 0),
(167, 'heavy cream',          'ml',     NULL, NULL, 0),
(168, 'starch',               'tbsp',   NULL, NULL, 0),
(169, 'sea salt',             'tsp',    NULL, NULL, 0),
(170, 'lemon juice',          'tbsp',   NULL, NULL, 0),
(171, 'lime juice',           'tbsp',   NULL, NULL, 0);

-- --------------------------------------------------------
-- Table structure for table `recipe_ingredient`
-- --------------------------------------------------------

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `quantity`, `unit`) VALUES
-- -------------------------------------------------------
-- Recipe 1: German lentil stew with spaetzle
-- -------------------------------------------------------
(1, 1,    125,    'g'),        -- spaetzle
(1, 2,    75,     'g'),        -- mountain lentils
(1, 3,    0.25,   'pc'),       -- bouquet garni
(1, 4,    0.25,   'l'),        -- broth
(1, 5,    2,      'pc'),       -- Vienna sausages
(1, 6,    0.25,   'pc'),       -- onion
(1, 7,    0.5,    'tbsp'),     -- butter
(1, 8,    25,     'g'),        -- smoked bacon (diced)
(1, 9,    0.375,  'tbsp'),     -- flour
(1, 97,   0.5,    'pc'),       -- bay leaves
(1, 10,   0.625,  'tbsp'),     -- red wine vinegar
(1, 96,   0.125,  'tbsp'),     -- mustard

-- -------------------------------------------------------
-- Recipe 2: Creamy mapo tofu udon
-- -------------------------------------------------------
(2, 11,   200,    'g'),        -- silken tofu
(2, 12,   200,    'g'),        -- udon noodles
(2, 14,   1,      'cloves'),   -- garlic
(2, 15,   1,      'sprigs'),   -- scallions
(2, 16,   0.75,   'tbsp'),     -- gochujang
(2, 13,   200,    'g'),        -- ground beef
(2, 17,   0.5,    'tbsp'),     -- miso paste
(2, 18,   0.5,    'tbsp'),     -- soy sauce
(2, 92,   NULL,   NULL),       -- vegetable oil (for frying)
(2, 99,   NULL,   NULL),       -- chili crisp (for garnish)

-- -------------------------------------------------------
-- Recipe 3: Cozy wild rice soup with sweet potato and mushrooms
-- -------------------------------------------------------
(3, 19,   50,     'g'),        -- wild rice
(3, 20,   0.25,   'pc'),       -- sweet potato
(3, 21,   62.5,   'g'),        -- brown mushrooms
(3, 22,   0.5,    'pc'),       -- carrots
(3, 100,  0.5,    'stalks'),   -- celery
(3, 6,    0.25,   'pc'),       -- onion
(3, 14,   0.5,    'cloves'),   -- garlic
(3, 23,   350,    'ml'),       -- vegetable broth
(3, 97,   0.25,   'pc'),       -- bay leaf
(3, 25,   0.25,   'tsp'),      -- Cajun seasoning
(3, 24,   100,    'ml'),       -- coconut cream
(3, 101,  20,     'g'),        -- baby kale
(3, 29,   0.5,    'tbsp'),     -- olive oil

-- -------------------------------------------------------
-- Recipe 4: Orzo salad with harissa-roasted pumpkin and Brussels sprouts
-- -------------------------------------------------------
(4, 26,   60,     'g'),        -- orzo
(4, 118,  0.5,    'pc'),       -- red onion
(4, 103,  150,    'g'),        -- Brussels sprouts
(4, 102,  125,    'g'),        -- Hokkaido pumpkin
(4, 106,  10,     'g'),        -- parsley
(4, 30,   0.25,   'pc'),       -- lemon
(4, 104,  200,    'g'),        -- canned chickpeas
(4, 29,   2.5,    'tbsp'),     -- olive oil
(4, 105,  1,      'tsp'),      -- harissa
(4, 14,   1,      'cloves'),   -- garlic
(4, 86,   25,     'g'),        -- almonds
(4, 10,   0.75,   'tbsp'),     -- red wine vinegar
(4, 34,   1,      'tbsp'),     -- maple syrup
(4, 150,  15,     'g'),        -- raisins

-- -------------------------------------------------------
-- Recipe 5: Chewy chocolate chip cookies
-- -------------------------------------------------------
(5, 9,    15,     'g'),        -- flour
(5, 159,  8.75,   'g'),        -- unsalted butter (soft)
(5, 107,  7.5,    'g'),        -- brown sugar
(5, 110,  12.5,   'g'),        -- chocolate chips
(5, 108,  0.5,    'g'),        -- vanilla sugar
(5, 76,   0.125,  'pc'),       -- eggs
(5, 109,  0.125,  'tsp'),      -- baking soda

-- -------------------------------------------------------
-- Recipe 6: Savoy cabbage carbonara with chestnut
-- -------------------------------------------------------
(6, 38,   125,    'g'),        -- spaghetti
(6, 39,   50,     'g'),        -- savoy cabbage
(6, 40,   37.5,   'g'),        -- chestnuts (cooked and peeled)
(6, 41,   20,     'g'),        -- Pecorino cheese
(6, 43,   12.5,   'g'),        -- panko breadcrumbs
(6, 42,   1.5,    'pc'),       -- egg yolks
(6, 14,   0.25,   'cloves'),   -- garlic
(6, 29,   0.75,   'tbsp'),     -- olive oil
(6, 106,  NULL,   NULL),       -- parsley (for serving)

-- -------------------------------------------------------
-- Recipe 7: Pasta arrabiata
-- -------------------------------------------------------
(7, 44,   100,    'g'),        -- penne
(7, 14,   0.75,   'cloves'),   -- garlic
(7, 29,   1,      'tbsp'),     -- olive oil
(7, 47,   0.25,   'tbsp'),     -- chili flakes
(7, 147,  0.25,   'tbsp'),     -- tomato paste
(7, 148,  150,    'g'),        -- canned crushed tomatoes
(7, 41,   NULL,   NULL),       -- Pecorino cheese (for serving)
(7, 106,  NULL,   NULL),       -- parsley (for serving)

-- -------------------------------------------------------
-- Recipe 8: Cold noodle salad with peanut sauce
-- -------------------------------------------------------
(8, 48,   100,    'g'),        -- soba noodles
(8, 50,   0.25,   'pc'),       -- cucumber
(8, 15,   1,      'sprigs'),   -- scallions
(8, 51,   50,     'g'),        -- red cabbage
(8, 163,  50,     'g'),        -- snap peas
(8, 113,  5,      'g'),        -- cilantro
(8, 164,  1.5,    'tbsp'),     -- roasted peanuts
(8, 49,   1.5,    'tbsp'),     -- creamy peanut butter
(8, 18,   1,      'tbsp'),     -- soy sauce
(8, 111,  1,      'tbsp'),     -- toasted sesame oil
(8, 73,   0.5,    'tsp'),      -- sugar
(8, 170,  1,      'tbsp'),     -- lemon juice
(8, 14,   0.5,    'cloves'),   -- garlic
(8, 155,  2.5,    'tbsp'),     -- water (cold)

-- -------------------------------------------------------
-- Recipe 9: Bang bang salmon bowl
-- -------------------------------------------------------
(9, 52,   1,      'pc'),       -- salmon fillets
(9, 53,   40,     'ml'),       -- mayonnaise
(9, 54,   15,     'ml'),       -- sweet chili sauce
(9, 55,   5,      'ml'),       -- Sriracha
(9, 115,  0.25,   'tsp'),      -- sweet paprika powder
(9, 116,  0.25,   'tsp'),      -- garlic powder
(9, 29,   7.5,    'ml'),       -- olive oil
(9, 56,   90,     'g'),        -- rice
(9, 51,   25,     'g'),        -- red cabbage
(9, 22,   25,     'g'),        -- carrots
(9, 50,   0.125,  'pc'),       -- cucumber
(9, 89,   40,     'g'),        -- edamame beans
(9, 57,   0.5,    'pc'),       -- avocado
(9, 117,  0.25,   'tbsp'),     -- black sesame seeds

-- -------------------------------------------------------
-- Recipe 10: Halloumi tzatziki bowl with lemony orzo
-- -------------------------------------------------------
(10, 26,  100,    'g'),        -- orzo
(10, 29,  2,      'tbsp'),     -- olive oil
(10, 14,  1,      'cloves'),   -- garlic
(10, 118, 0.5,    'pc'),       -- red onion
(10, 120, 0.5,    'tsp'),      -- dried oregano
(10, 23,  250,    'ml'),       -- vegetable broth
(10, 30,  0.25,   'pc'),       -- lemon
(10, 60,  2,      'pc'),       -- mini cucumbers
(10, 59,  250,    'g'),        -- full-fat Greek yogurt
(10, 81,  25,     'g'),        -- cherry tomatoes
(10, 58,  112.5,  'g'),        -- halloumi
(10, 165, 20,     'g'),        -- baby spinach
(10, 166, 30,     'g'),        -- jarred pitted Kalamata olives
(10, 121, 2.5,    'g'),        -- mint

-- -------------------------------------------------------
-- Recipe 11: Summery strawberry tiramisu
-- -------------------------------------------------------
(11, 125, 18.75,  'g'),        -- strawberries
(11, 126, 10,     'ml'),       -- golden syrup
(11, 127, 2.5,    'ml'),       -- balsamic vinegar
(11, 155, 15,     'ml'),       -- water
(11, 76,  0.25,   'pc'),       -- eggs
(11, 123, 93.75,  'g'),        -- mascarpone cheese
(11, 167, 15,     'ml'),       -- heavy cream
(11, 72,  5,      'ml'),       -- honey
(11, 124, 0.125,  'tsp'),      -- vanilla extract
(11, 122, 3,      'pc'),       -- ladyfingers
(11, 128, 10,     'g'),        -- strawberry jam
(11, 121, NULL,   NULL),       -- mint (optional)

-- -------------------------------------------------------
-- Recipe 12: Chicken noodle soup
-- -------------------------------------------------------
(12, 129, 100,    'g'),        -- chicken drumsticks
(12, 132, 33.33,  'g'),        -- egg noodles
(12, 8,   16.67,  'g'),        -- bacon
(12, 6,   0.125,  'pc'),       -- onion
(12, 130, 33.33,  'g'),        -- potatoes
(12, 22,  41.67,  'g'),        -- carrots
(12, 100, 33.33,  'g'),        -- celery
(12, 131, 0.125,  'pc'),       -- leek
(12, 7,   0.125,  'tbsp'),     -- butter
(12, 97,  0.33,   'pc'),       -- bay leaves
(12, 23,  333.33, 'ml'),       -- vegetable broth
(12, 106, NULL,   NULL),       -- parsley (for serving)

-- -------------------------------------------------------
-- Recipe 13: Smash burger
-- -------------------------------------------------------
(13, 13,  250,    'g'),        -- ground beef
(13, 118, 0.5,    'pc'),       -- red onion
(13, 157, 0.25,   'head'),     -- iceberg lettuce
(13, 71,  10,     'g'),        -- pickles (sliced)
(13, 53,  1.5,    'tbsp'),     -- mayonnaise
(13, 134, 0.5,    'tbsp'),     -- ketchup
(13, 96,  0.5,    'tbsp'),     -- mustard
(13, 69,  1,      'pc'),       -- burger buns
(13, 70,  2,      'pc'),       -- melting cheese slices
(13, 92,  NULL,   NULL),       -- oil (for frying)

-- -------------------------------------------------------
-- Recipe 14: Molten chocolate cake
-- -------------------------------------------------------
(14, 160, 33.33,  'g'),        -- bittersweet couverture chocolate
(14, 159, 33.33,  'g'),        -- unsalted butter
(14, 73,  16.67,  'g'),        -- sugar
(14, 76,  0.25,   'pc'),       -- eggs
(14, 42,  0.5,    'pc'),       -- egg yolks
(14, 9,   10,     'g'),        -- flour
(14, 136, NULL,   NULL),       -- confectioner's sugar (for garnish)

-- -------------------------------------------------------
-- Recipe 15: Carbonara muffins
-- -------------------------------------------------------
(15, 38,  35,     'g'),        -- spaghetti
(15, 158, 12.5,   'g'),        -- bacon cubes
(15, 76,  0.33,   'pc'),       -- eggs
(15, 167, 10,     'ml'),       -- heavy cream
(15, 78,  14,     'g'),        -- grated Parmesan cheese
(15, 92,  NULL,   NULL),       -- oil for frying / greasing

-- -------------------------------------------------------
-- Recipe 16: Breakfast burrito
-- -------------------------------------------------------
(16, 138, 0.25,   'pc'),       -- red bell pepper
(16, 118, 0.5,    'pc'),       -- red onion
(16, 139, 5,      'g'),        -- chives
(16, 156, 10,     'g'),        -- cheddar cheese
(16, 76,  2.5,    'pc'),       -- eggs
(16, 7,   0.5,    'tbsp'),     -- butter
(16, 162, 1,      'pc'),       -- flour tortillas
(16, 91,  NULL,   NULL),       -- Tabasco

-- -------------------------------------------------------
-- Recipe 17: Bok choy and crispy tofu stir fry
-- -------------------------------------------------------
(17, 11,  100,    'g'),        -- tofu
(17, 140, 2,      'heads'),    -- bok choy
(17, 15,  0.5,    'sprigs'),   -- scallion
(17, 14,  1.5,    'cloves'),   -- garlic
(17, 68,  0.5,    'pc'),       -- chili
(17, 141, 1,      'tbsp'),     -- rice wine
(17, 18,  1,      'tbsp'),     -- soy sauce
(17, 155, 1,      'tbsp'),     -- water
(17, 73,  0.5,    'tbsp'),     -- raw sugar
(17, 168, 1,      'tbsp'),     -- starch
(17, 111, 1.5,    'tbsp'),     -- sesame oil
(17, 169, 0.25,   'tsp'),      -- sea salt
(17, 82,  NULL,   NULL),       -- brown rice (for serving)

-- -------------------------------------------------------
-- Recipe 18: Pancake tacos with candied bacon and scrambled eggs
-- -------------------------------------------------------
(18, 9,   36.67,  'g'),        -- flour
(18, 151, 0.33,   'tsp'),      -- baking powder
(18, 73,  0.125,  'tsp'),      -- sugar
(18, 76,  1,      'pc'),       -- eggs
(18, 94,  56.67,  'ml'),       -- milk
(18, 7,   0.67,   'tbsp'),     -- butter (melted)
(18, 152, 1,      'strips'),   -- bacon
(18, 34,  0.125,  'tbsp'),     -- maple syrup
(18, 139, 0.875,  'g'),        -- chives
(18, 156, 13.33,  'g'),        -- shredded cheddar cheese

-- -------------------------------------------------------
-- Recipe 19: Fried chicken
-- -------------------------------------------------------
(19, 90,  1.33,   'pc'),       -- chicken legs (whole)
(19, 161, 33.33,  'g'),        -- all-purpose flour
(19, 116, 0.33,   'tbsp'),     -- garlic powder
(19, 153, 0.33,   'tbsp'),     -- onion powder
(19, 115, 0.33,   'tbsp'),     -- paprika
(19, 76,  0.67,   'pc'),       -- eggs
(19, 155, 10,     'ml'),       -- water
(19, 91,  0.33,   'tbsp'),     -- Tabasco
(19, 151, 0.125,  'tbsp'),     -- baking powder
(19, 92,  NULL,   NULL),       -- vegetable oil for deep frying

-- -------------------------------------------------------
-- Recipe 20: Spicy coconut-marinated grilled shrimp
-- -------------------------------------------------------
(20, 143, 1000,   'g'),        -- shrimp
(20, 36,  50,     'g'),        -- ginger
(20, 14,  5,      'cloves'),   -- garlic
(20, 154, 180,    'ml'),       -- coconut milk
(20, 145, 60,     'g'),        -- chili paste
(20, 171, 2,      'tbsp'),     -- lime juice
(20, 107, 2,      'tbsp'),     -- brown sugar
(20, 92,  2,      'tbsp'),     -- vegetable oil
(20, 113, 3,      'sprigs'),   -- cilantro
(20, 144, NULL,   NULL),       -- lime (for serving)

-- -------------------------------------------------------
-- Recipe 21: Spaghetti Bolognese
-- -------------------------------------------------------
(21, 38,  125,    'g'),        -- spaghetti
(21, 13,  125,    'g'),        -- ground beef
(21, 6,   0.25,   'pc'),       -- onion
(21, 14,  0.5,    'cloves'),   -- garlic
(21, 22,  0.25,   'pc'),       -- carrot
(21, 100, 0.25,   'stalks'),   -- celery
(21, 29,  10,     'ml'),       -- olive oil
(21, 148, 200,    'g'),        -- canned crushed tomatoes
(21, 147, 0.25,   'tbsp'),     -- tomato paste
(21, 120, 0.25,   'tbsp'),     -- dried oregano
(21, 78,  NULL,   NULL);       -- Parmesan cheese (for serving)

-- --------------------------------------------------------
-- Table structure for table `tag`
-- --------------------------------------------------------

CREATE TABLE `tag` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1,  'German'),
(2,  'Comfort Food'),
(3,  'Main Dish'),
(4,  'Asian'),
(5,  'Noodles'),
(6,  'Quick'),
(7,  'Vegan'),
(8,  'Soup'),
(9,  'Autumn'),
(10, 'Pasta'),
(11, 'Baking'),
(12, 'Cookies'),
(13, 'Holiday'),
(14, 'Italian'),
(15, 'Winter'),
(16, 'Spicy'),
(17, 'Vegetarian'),
(18, 'Salad'),
(19, 'Fish'),
(20, 'Bowl'),
(21, 'Dinner'),
(22, 'Greek'),
(23, 'Dessert'),
(24, 'Chicken'),
(25, 'Meat'),
(26, 'American'),
(27, 'Chocolate'),
(28, 'Cake'),
(29, 'Snack'),
(30, 'Breakfast'),
(31, 'Mexican'),
(32, 'Stir Fry'),
(33, 'Brunch'),
(34, 'Protein'),
(35, 'Crispy'),
(36, 'Seafood'),
(37, 'Classic');

-- --------------------------------------------------------
-- Table structure for table `recipe_tag`
-- --------------------------------------------------------

CREATE TABLE `recipe_tag` (
  `recipe_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `recipe_tag` (`recipe_id`, `tag_id`) VALUES
(1,  1),  -- German lentil stew → German
(1,  2),  -- German lentil stew → Comfort Food
(1,  3),  -- German lentil stew → Main Dish
(2,  4),  -- Mapo tofu udon → Asian
(2,  5),  -- Mapo tofu udon → Noodles
(2,  6),  -- Mapo tofu udon → Quick
(3,  7),  -- Wild rice soup → Vegan
(3,  8),  -- Wild rice soup → Soup
(3,  9),  -- Wild rice soup → Autumn
(4,  6),  -- Orzo salad → Quick
(4,  7),  -- Orzo salad → Vegan
(4,  10), -- Orzo salad → Pasta
(5,  11), -- Chocolate chip cookies → Baking
(5,  12), -- Chocolate chip cookies → Cookies
(5,  13), -- Chocolate chip cookies → Holiday
(6,  10), -- Savoy carbonara → Pasta
(6,  14), -- Savoy carbonara → Italian
(6,  15), -- Savoy carbonara → Winter
(7,  10), -- Pasta arrabiata → Pasta
(7,  16), -- Pasta arrabiata → Spicy
(7,  17), -- Pasta arrabiata → Vegetarian
(8,  4),  -- Cold noodle salad → Asian
(8,  7),  -- Cold noodle salad → Vegan
(8,  18), -- Cold noodle salad → Salad
(9,  19), -- Bang bang salmon → Fish
(9,  20), -- Bang bang salmon → Bowl
(9,  21), -- Bang bang salmon → Dinner
(10, 17), -- Halloumi tzatziki bowl → Vegetarian
(10, 20), -- Halloumi tzatziki bowl → Bowl
(10, 22), -- Halloumi tzatziki bowl → Greek
(11, 11), -- Strawberry tiramisu → Baking
(11, 17), -- Strawberry tiramisu → Vegetarian
(11, 23), -- Strawberry tiramisu → Dessert
(12, 16), -- Chicken noodle soup → Spicy (removed — better: Comfort Food already on 1; keep original mapping)
(12, 24), -- Chicken noodle soup → Chicken
(12, 25), -- Chicken noodle soup → Meat
(13, 21), -- Smash burger → Dinner
(13, 25), -- Smash burger → Meat
(13, 26), -- Smash burger → American
(14, 11), -- Molten chocolate cake → Baking
(14, 27), -- Molten chocolate cake → Chocolate
(14, 28), -- Molten chocolate cake → Cake
(15, 10), -- Carbonara muffins → Pasta
(15, 14), -- Carbonara muffins → Italian
(15, 29), -- Carbonara muffins → Snack
(16, 6),  -- Breakfast burrito → Quick
(16, 30), -- Breakfast burrito → Breakfast
(16, 31), -- Breakfast burrito → Mexican
(17, 19), -- Bok choy tofu stir fry → Fish (was in original; swap to Vegan)
(17, 21), -- Bok choy tofu stir fry → Dinner
(17, 32), -- Bok choy tofu stir fry → Stir Fry
(18, 19), -- Pancake tacos → Fish (original mapping kept)
(18, 21), -- Pancake tacos → Dinner
(18, 33), -- Pancake tacos → Brunch
(19, 2),  -- Fried chicken → Comfort Food
(19, 34), -- Fried chicken → Protein
(19, 35), -- Fried chicken → Crispy
(20, 21), -- Grilled shrimp → Dinner
(20, 34), -- Grilled shrimp → Protein
(20, 36), -- Grilled shrimp → Seafood
(21, 14), -- Spaghetti Bolognese → Italian (original had no Italian tag — fixed)
(21, 37); -- Spaghetti Bolognese → Classic

-- --------------------------------------------------------
-- Table structure for table `tool`
-- --------------------------------------------------------

CREATE TABLE `tool` (
  `tool_id` int NOT NULL,
  `tool_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tool` (`tool_id`, `tool_name`) VALUES
(1,  'frying pan'),
(2,  'pot'),
(3,  'sieve'),
(4,  'knife'),
(5,  'blender'),
(6,  'large pot'),
(7,  'food processor'),
(8,  'saucepan'),
(9,  'bowl'),
(10, 'oven'),
(11, 'large pan'),
(12, 'whisk'),
(13, 'baking sheet'),
(14, 'pan'),
(15, 'grater'),
(16, 'pie plate'),
(17, 'cast iron pan'),
(18, 'spatula'),
(19, 'mixer'),
(20, 'bowls'),
(21, 'toaster'),
(22, 'deep frying pan'),
(23, 'tongs');

-- --------------------------------------------------------
-- Table structure for table `recipe_tool`
-- --------------------------------------------------------

CREATE TABLE `recipe_tool` (
  `recipe_id` int NOT NULL,
  `tool_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `recipe_tool` (`recipe_id`, `tool_id`) VALUES
(1,  1),  -- German lentil stew: frying pan
(1,  2),  -- German lentil stew: pot
(1,  3),  -- German lentil stew: sieve
(1,  4),  -- German lentil stew: knife
(2,  1),  -- Mapo tofu udon: frying pan
(2,  2),  -- Mapo tofu udon: pot
(2,  5),  -- Mapo tofu udon: blender
(3,  4),  -- Wild rice soup: knife
(3,  6),  -- Wild rice soup: large pot
(4,  9),  -- Orzo salad: bowl
(4,  10), -- Orzo salad: oven
(4,  13), -- Orzo salad: baking sheet
(5,  9),  -- Cookies: bowl
(5,  10), -- Cookies: oven
(5,  13), -- Cookies: baking sheet
(6,  2),  -- Savoy carbonara: pot
(6,  11), -- Savoy carbonara: large pan
(6,  12), -- Savoy carbonara: whisk
(7,  1),  -- Pasta arrabiata: frying pan
(7,  2),  -- Pasta arrabiata: pot
(8,  2),  -- Cold noodle salad: pot
(8,  9),  -- Cold noodle salad: bowl
(9,  9),  -- Bang bang salmon: bowl
(9,  10), -- Bang bang salmon: oven
(9,  13), -- Bang bang salmon: baking sheet
(10, 14), -- Halloumi tzatziki: pan
(10, 15), -- Halloumi tzatziki: grater
(11, 9),  -- Strawberry tiramisu: bowl
(11, 16), -- Strawberry tiramisu: pie plate
(12, 2),  -- Chicken noodle soup: pot
(12, 6),  -- Chicken noodle soup: large pot
(13, 17), -- Smash burger: cast iron pan
(13, 18), -- Smash burger: spatula
(14, 9),  -- Molten chocolate cake: bowl
(14, 10), -- Molten chocolate cake: oven
(14, 19), -- Molten chocolate cake: mixer
(15, 1),  -- Carbonara muffins: frying pan
(15, 10), -- Carbonara muffins: oven
(15, 12), -- Carbonara muffins: whisk
(16, 14), -- Breakfast burrito: pan
(17, 2),  -- Bok choy tofu stir fry: pot
(17, 14), -- Bok choy tofu stir fry: pan
(18, 14), -- Pancake tacos: pan
(19, 9),  -- Fried chicken: bowl
(19, 20), -- Fried chicken: bowls
(19, 22), -- Fried chicken: deep frying pan
(19, 23), -- Fried chicken: tongs
(20, 8),  -- Grilled shrimp: saucepan
(20, 14), -- Grilled shrimp: pan
(21, 2),  -- Spaghetti Bolognese: pot
(21, 7),  -- Spaghetti Bolognese: food processor
(21, 11); -- Spaghetti Bolognese: large pan

-- --------------------------------------------------------
-- Indexes
-- --------------------------------------------------------

ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredient_id`);

ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`nutrition_id`, `recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`);

ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`, `ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

ALTER TABLE `recipe_tag`
  ADD PRIMARY KEY (`recipe_id`, `tag_id`),
  ADD KEY `tag_id` (`tag_id`);

ALTER TABLE `recipe_tool`
  ADD PRIMARY KEY (`recipe_id`, `tool_id`),
  ADD KEY `tool_id` (`tool_id`);

ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

ALTER TABLE `tool`
  ADD PRIMARY KEY (`tool_id`);

-- --------------------------------------------------------
-- AUTO_INCREMENT
-- --------------------------------------------------------

ALTER TABLE `ingredient`
  MODIFY `ingredient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

ALTER TABLE `nutrition`
  MODIFY `nutrition_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `recipe`
  MODIFY `recipe_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `tag`
  MODIFY `tag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

ALTER TABLE `tool`
  MODIFY `tool_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

-- --------------------------------------------------------
-- Foreign Key Constraints
-- --------------------------------------------------------

ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`);

ALTER TABLE `recipe_tag`
  ADD CONSTRAINT `recipe_tag_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);

ALTER TABLE `recipe_tool`
  ADD CONSTRAINT `recipe_tool_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_tool_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `tool` (`tool_id`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;