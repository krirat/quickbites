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

--
-- Database: `ceidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `ingredient_id` int NOT NULL,
  `ingredient_name` varchar(255) DEFAULT NULL,
  `default_unit` varchar(255) DEFAULT NULL,
  `calories_per_unit` float DEFAULT NULL,
  `cost_per_unit` float DEFAULT NULL,
  `is_allergen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`ingredient_id`, `ingredient_name`, `default_unit`, `calories_per_unit`, `cost_per_unit`, `is_allergen`) VALUES
(1, 'spaetzle', 'g', NULL, NULL, 0),
(2, 'mountain lentils', 'g', NULL, NULL, 0),
(3, 'bouquet garni', 'pc', NULL, NULL, 0),
(4, 'broth', 'l', NULL, NULL, 0),
(5, 'Vienna sausages', 'pc', NULL, NULL, 0),
(6, 'onion', 'pc', NULL, NULL, 0),
(7, 'butter', 'tbsp', NULL, NULL, 0),
(8, 'smoked bacon', 'g', NULL, NULL, 0),
(9, 'flour', 'tbsp', NULL, NULL, 0),
(10, 'red wine vinegar', 'tbsp', NULL, NULL, 0),
(11, 'silken tofu', 'g', NULL, NULL, 0),
(12, 'udon noodles', 'g', NULL, NULL, 0),
(13, 'ground beef', 'g', NULL, NULL, 0),
(14, 'garlic', 'cloves', NULL, NULL, 0),
(15, 'scallions', 'sprigs', NULL, NULL, 0),
(16, 'gochujang', 'tbsp', NULL, NULL, 0),
(17, 'miso paste', 'tbsp', NULL, NULL, 0),
(18, 'soy sauce', 'tbsp', NULL, NULL, 0),
(19, 'wild rice', 'g', NULL, NULL, 0),
(20, 'sweet potato', 'pc', NULL, NULL, 0),
(21, 'brown mushrooms', 'g', NULL, NULL, 0),
(22, 'carrot', 'pc', NULL, NULL, 0),
(23, 'vegetable broth', 'ml', NULL, NULL, 0),
(24, 'coconut cream', 'ml', NULL, NULL, 0),
(25, 'Cajun seasoning', 'tsp', NULL, NULL, 0),
(26, 'orzo', 'g', NULL, NULL, 0),
(27, 'roasted red peppers', 'g', NULL, NULL, 0),
(28, 'cashews', 'g', NULL, NULL, 0),
(29, 'olive oil', 'tbsp', NULL, NULL, 0),
(30, 'lemon', 'pc', NULL, NULL, 0),
(31, 'spinach', 'g', NULL, NULL, 0),
(32, 'buckwheat flour', 'g', NULL, NULL, 0),
(33, 'almond butter', 'g', NULL, NULL, 0),
(34, 'maple syrup', 'ml', NULL, NULL, 0),
(35, 'coconut sugar', 'g', NULL, NULL, 0),
(36, 'ginger', 'tsp', NULL, NULL, 0),
(37, 'cinnamon', 'tsp', NULL, NULL, 0),
(38, 'spaghetti', 'g', NULL, NULL, 0),
(39, 'savoy cabbage', 'g', NULL, NULL, 0),
(40, 'chestnuts', 'g', NULL, NULL, 0),
(41, 'Pecorino cheese', 'g', NULL, NULL, 0),
(42, 'egg yolks', 'pc', NULL, NULL, 0),
(43, 'panko breadcrumbs', 'g', NULL, NULL, 0),
(44, 'fusilli', 'g', NULL, NULL, 0),
(45, 'red pointed peppers', 'pc', NULL, NULL, 0),
(46, 'Passata', 'g', NULL, NULL, 0),
(47, 'chili flakes', 'tbsp', NULL, NULL, 0),
(48, 'soba noodles', 'g', NULL, NULL, 0),
(49, 'creamy peanut butter', 'tbsp', NULL, NULL, 0),
(50, 'cucumber', 'pc', NULL, NULL, 0),
(51, 'red cabbage', 'g', NULL, NULL, 0),
(52, 'salmon fillets', 'pc', NULL, NULL, 0),
(53, 'mayonnaise', 'ml', NULL, NULL, 0),
(54, 'sweet chili sauce', 'ml', NULL, NULL, 0),
(55, 'Sriracha', 'ml', NULL, NULL, 0),
(56, 'rice', 'g', NULL, NULL, 0),
(57, 'avocado', 'pc', NULL, NULL, 0),
(58, 'halloumi', 'g', NULL, NULL, 0),
(59, 'Greek yogurt', 'g', NULL, NULL, 0),
(60, 'mini cucumbers', 'pc', NULL, NULL, 0),
(61, 'blue cheese', 'g', NULL, NULL, 0),
(62, 'cottage cheese', 'g', NULL, NULL, 0),
(63, 'pears', 'pc', NULL, NULL, 0),
(64, 'beef', 'g', NULL, NULL, 0),
(65, 'coconut milk', 'strip', NULL, NULL, 0),
(66, 'Rendang Powder', 'strip', NULL, NULL, 0),
(67, 'lemongrass', 'bar', NULL, NULL, 0),
(68, 'chilis', 'pc', NULL, NULL, 0),
(69, 'burger buns', 'pc', NULL, NULL, 0),
(70, 'cheese slices', 'pc', NULL, NULL, 0),
(71, 'pickles', 'g', NULL, NULL, 0),
(72, 'honey', 'tbsp', NULL, NULL, 0),
(73, 'sugar', 'g', NULL, NULL, 0),
(74, 'sour cream', 'g', NULL, NULL, 0),
(75, 'double cream', 'ml', NULL, NULL, 0),
(76, 'eggs', 'pc', NULL, NULL, 0),
(77, 'pancetta', 'slices', NULL, NULL, 0),
(78, 'Parmesan', 'package', NULL, NULL, 0),
(79, 'bread', 'slices', NULL, NULL, 0),
(80, 'egg', 'pc', NULL, NULL, 0),
(81, 'cherry tomatoes', 'pc', NULL, NULL, 0),
(82, 'Basmati Rice', 'g', NULL, NULL, 0),
(83, 'Fish Fillet', 'g', NULL, NULL, 0),
(84, 'saffron', 'tsp', NULL, NULL, 0),
(85, 'ghee', 'tbsp', NULL, NULL, 0),
(86, 'almonds', 'pc', NULL, NULL, 0),
(87, 'fish fillet', 'lb', NULL, NULL, 0),
(88, 'corn tortillas', 'sheets', NULL, NULL, 0),
(89, 'edamame bean', 'cup', NULL, NULL, 0),
(90, 'chicken legs', 'pc', NULL, NULL, 0),
(91, 'Tabasco', 'tbsp', NULL, NULL, 0),
(92, 'oil', 'ml', NULL, NULL, 0),
(93, 'garlic and herb rub', 'tbsp', NULL, NULL, 0),
(94, 'milk', 'ml', NULL, NULL, 0),
(95, 'chicken stock', 'ml', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `nutrition_id` int NOT NULL,
  `recipe_id` int NOT NULL,
  `protein` float DEFAULT NULL,
  `fat` float DEFAULT NULL,
  `carbs` float DEFAULT NULL,
  `calories` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nutrition`
--

INSERT INTO `nutrition` (`nutrition_id`, `recipe_id`, `protein`, `fat`, `carbs`, `calories`) VALUES
(1, 1, 37, 35, 91, 845),
(2, 2, 53, 40, 81, 885),
(3, 3, 10, 30, 46, 491),
(4, 4, 15, 20, 80, 600),
(5, 5, 2, 2, 9, 62),
(6, 6, 31, 35, 73, 720),
(7, 7, 12, 10, 85, 500),
(8, 8, 15, 18, 60, 450),
(9, 9, 44, 70, 100, 1212),
(10, 10, 54, 70, 124, 1306),
(11, 11, 8, 22, 30, 350),
(12, 12, 40, 45, 15, 700),
(13, 13, 45, 50, 40, 800),
(14, 14, 5, 20, 60, 450),
(15, 15, 35, 50, 70, 900),
(16, 16, 12, 20, 30, 350),
(17, 17, 30, 20, 75, 600),
(18, 18, 25, 15, 40, 400),
(19, 19, 40, 35, 30, 600),
(20, 20, 35, 25, 10, 500),
(21, 21, 20, 15, 50, 500),
(22, 22, 20, 15, 50, 500),
(23, 23, 20, 15, 50, 500),
(24, 24, 20, 15, 50, 500),
(25, 25, 20, 15, 50, 500),
(26, 26, 20, 15, 50, 500),
(27, 27, 20, 15, 50, 500),
(28, 28, 20, 15, 50, 500),
(29, 29, 20, 15, 50, 500),
(30, 30, 20, 15, 50, 500),
(31, 31, 20, 15, 50, 500),
(32, 32, 20, 15, 50, 500),
(33, 33, 20, 15, 50, 500),
(34, 34, 20, 15, 50, 500),
(35, 35, 20, 15, 50, 500);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

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

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`recipe_id`, `recipe_name`, `description`, `total_time_minutes`, `difficulty`, `instructions`, `base_servings`, `calories_per_serving`, `image_url`) VALUES
(1, 'German lentil stew with spaetzle (Linsen mit Spätzle)', 'Tender lentils cooked in a rich broth with aromatic soup vegetables and bacon, paired with fluffy spaetzle.', 40, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/wLOxv_9BTWfNrG8xNzWsAnruNSI=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step1_4x3.jpg\", \"instruction\": \"Peel and finely dice soup vegetables and the onion. Heat butter in a large pan. Sauté the onion cubes until translucent, then add remaining vegetables and bacon cubes and fry for approx. 5 min. Now sprinkle flour over it and stir carefully so that no lumps form.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/HhBSTuBf4Pzd75OlxjuJ72Lw0JE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step2_4x3.jpg\", \"instruction\": \"Strain lentils in a sieve, rinse with cold water, and add them to pan. Add meat broth and bay leaves. Bring mixture to a boil once, then let simmer over medium heat for approx. 30 min. Until the lentils are soft. Stir occasionally and add a little more broth if necessary.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/rClT2VBWwazGBdtVHbG1SSo8D1E=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3444_Step3_4x3.jpg\", \"instruction\": \"Prepare spaetzle according to package instructions in a pot of boiling water and then drain them. Heat sausages in water in a second pot. Season lentils with red wine vinegar, mustard, salt, pepper, and a little sugar and remove the bay leaves. Arrange Spätzle on plates, spoon the lentils over them, and serve with the sausages.\", \"step_number\": 3}]', 4, 845, 'https://images.services.kitchenstories.io/6GydQsJ3NT3cx3LxqJRqNK7AqwM=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3444_Final_4x3.jpg'),
(2, 'Creamy mapo tofu udon', 'A viral recipe combining silken tofu sauce with spicy mapo beef.', 20, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/0cB6bBOYNi6Y2RW5P4Wu9U0c1Nw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_1.jpg_.jpg\", \"instruction\": \"Peel and chop garlic finely. Cut scallions into fine rings and set some green parts aside for garnish. Heat oil in a pan and fry garlic and scallions until translucent. Then, add chili bean paste and fry for approx. 2 min more. Add ground beef and continue frying until thoroughly cooked for approx. 8 min. Deglaze with soy sauce and set aside.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/ZPThe1-MskmQG-Ean9J3NRmB_VA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_2.jpg\", \"instruction\": \"Boil water in a pot and cook udon noodles according to package instructions. Meanwhile, place silken tofu in a container, add a pinch of salt and miso. Then, blend until creamy.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/09kITmCXL5oNm9oEDgXQ8qzQVBk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon_step_3.jpg_.jpg\", \"instruction\": \"Once udon noodles are done, assemble the mapo tofu udon plate. Place udon noodles on a plate, pour creamy tofu over it and add spicy ground beef mix on top. Garnish with scallion rings and chili crisp before serving.\", \"step_number\": 3}]', 2, 885, 'https://images.services.kitchenstories.io/9LNazBIG59jKOYEuCPgUnoSsEcA=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3443_Mapo_tofu_udon.jpg_.jpg'),
(3, 'Cozy wild rice soup with sweet potato and mushrooms', 'A warming vegan soup with Cajun seasoning.', 20, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/uT165ISDYdZy5f5ZyE8WddUEqko=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step1_4x3.jpg\", \"instruction\": \"Cook wild rice according to package directions, drain and set aside. Dice onion and sweet potato. Chop garlic. Cube carrots. Slice celery sticks and mushrooms. Heat oil in a large pot and sauté onion, garlic, carrots, celery, and mushrooms for approx. 5 min. until lightly browned.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/l9sNeA-ujM_LWvHvyseIoZWIaaQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step2_4x3.jpg\", \"instruction\": \"Add the vegetable broth. Add the bay leaf and Cajun seasoning and stir well. Bring the soup to a boil, then let it simmer gently over medium heat for approx. 15 min. until the vegetables are soft. Add the sweet potatoes during the last approx. 5 min. of cooking time.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/vKxEqa-4oXVmxX2XSFiXc5-CEDU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3418_Step3_4x3.jpg\", \"instruction\": \"Thoroughly wash kale, remove thick stems and roughly cut leaves. Add coconut cream, kale and rice. Let soup simmer for approx. 5 min. more until kale is soft. Season soup to taste with salt and pepper and add some more Cajun seasoning if desired. Then, serve while hot.\", \"step_number\": 3}]', 2, 491, 'https://images.services.kitchenstories.io/3G89dV-Vx9w5G_y1lBdX4eFDMNk=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3418_Final_4x3.jpg'),
(4, 'Roasted Red Pepper Orzo', 'Creamy orzo with a blended roasted pepper and cashew sauce.', 15, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/aX3f1eJOgAwUNoxqnzzwfKuSUVw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-step-1.jpg\", \"instruction\": \"Preheat the oven to 220°C/420 °F. Cut onion into approx. 1.5 cm/0.6 in. wedges. Trim Brussels sprouts, remove wilted leaves, and cut into quarters. Cut pumpkin into approx. 1.5 cm/0.6 in. cubes. Coarsely chop the parsley. Drain chickpeas, rinse thoroughly, and set aside.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/RCACYxxvTpqRwvYvc4dWKHMoyew=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3037-photo-step-2-3x4-crop-tight.jpg\", \"instruction\": \"In a large bowl, mix harissa with some of the olive oil. Season with salt and pepper. Add the chopped vegetables and chickpea to the bowl. Mix well so they are coated in the harissa-oil mixture. Then place in a single layer on a baking sheet lined with parchment paper. Add unpeeled garlic cloves. Place in the oven and roast for approx. 20 min., turning the vegetables once halfway through. Remove from the oven when the vegetables are golden brown.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/WARdDW6AsyFxOQQECddlahikE_g=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3037-photo-step-3-4x3.jpg\", \"instruction\": \"Meanwhile, in a large pot without oil, toast the almonds over medium heat until golden brown. Then take them out, roughly chop, and put them aside. Then, in the same pot, bring water to a boil and cook orzo pasta according to package directions until al dente.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/nDaxjqDnAJuA4rlemRz5NVM3Ytc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-step-4.jpg\", \"instruction\": \"For the dressing, squeeze the insides of the roasted garlic cloves from the oven, when it\'s not too hot to handle, into the large bowl used in step 2. Add the remaining olive oil and mix well with a fork. Grate zest and juice lemon into the bowl. Add vinegar and maple syrup and mix well again. Season to taste with salt and pepper. Add oven vegetables, orzo pasta, toasted almonds, raisins, and parsley to the dressing. Mix until combined. Season again if necessary. Best served lukewarm.\", \"step_number\": 4}]', 2, 600, 'https://images.services.kitchenstories.io/z9JtgsJbQTmJVxKJAFQC1le7YyU=/750x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2785-photo-final-1_2.jpg'),
(5, 'Speculaas cookies', 'Holiday favorite spiced cookies.', 20, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/MF93eMjn0ynbYazkut-I4zFM8J8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step01.jpg\", \"instruction\": \"Preheat the oven to 180°C (350°F) so it reaches the right temperature for baking. In a medium bowl, combine the flour, baking soda, and salt, then mix them well so the dry ingredients are evenly distributed before adding them to the rest of the cookie dough ingredients.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/fJ0J7t1ELn2ir4W3afPzkAEJefk=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step02.jpg\", \"instruction\": \"In another bowl, beat the softened butter, brown sugar, and vanilla sugar together until the mixture becomes light, fluffy, and pale in color. Mixing well at this stage helps create a smooth texture and ensures the sugar is fully incorporated into the butter.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/WcvzlusDykzY-akRx9ntnCrYktw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step03.jpg\", \"instruction\": \"Add the eggs to the mixture one at a time, beating well after each addition until fully incorporated. This helps create a smooth, well-combined batter and ensures the eggs blend evenly with the other ingredients.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/YpbaTOzHdja8F760oYr3NDJDkHc=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step04.jpg\", \"instruction\": \"Add the flour mixture to the butter mixture and whisk gently until everything is well combined and forms a smooth dough. Then carefully fold in the chocolate drops, mixing just enough to distribute them evenly throughout the dough.\", \"step_number\": 4}, {\"step_id\": 5, \"image_url\": \"https://images.services.kitchenstories.io/4Z1Xud-5xT9xNIGRj0VAJefcMs8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/12_08_ChewyChocolateChipCookies_step05.jpg\", \"instruction\": \"Scoop dough onto a lined baking sheet, leaving enough space in between cookies. Flatten slightly with the back of the scoop. Bake in preheated oven for approx. 10 - 12 min. at 180°C/350°F until golden. Cookies should remain soft on the inside. Allow to cool for approx. 10 min. before serving.\", \"step_number\": 5}]', 30, 62, 'https://images.services.kitchenstories.io/FZtBo-KAliwTHJYiVq-RRuhu5yo=/828x0/filters:quality(85)/images.kitchenstories.io/recipeImages/ChewyChocolateChipCookies_Final.jpg'),
(6, 'Savoy cabbage carbonara with chestnut', 'A winter twist on carbonara.', 30, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/2KEO2sH5THNMQtNsCDN-Br0lE8k=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step1_4x3.jpg\", \"instruction\": \"Heat olive oil in a large pan. Add panko and toast until golden brown. Finely grate half the pecorino and mix with warm panko. Keep toasting until there is a crispy, golden brown pecorino crunch. Season with salt and pepper, remove from pan, and set aside. Wipe the pan clean.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/SN02__R6yIWIdCU1XgtfkSObtpw=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step2_4x3.jpg\", \"instruction\": \"Cook spaghetti according to package instructions until al dente. Once it\'s done, set aside some pasta water and drain the rest. Meanwhile, cut savoy cabbage into fine strips, roughly chop chestnuts, and finely chop peeled garlic.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/VFMTbTn3EI3hdUeiW0cWT0fP2sA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step3_4x3.jpg\", \"instruction\": \"In the same large pan, heat some more olive oil and sauté savoy cabbage for approx. 5 - 7 min. until it\'s soft and lightly browned. Add garlic, chopped chestnuts, and briefly sauté again. Season with salt and pepper.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/Ejc23IIf95MrPvX6MRNIBA64jYY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3397_Step4_4x3.jpg\", \"instruction\": \"Whisk egg yolks with remaining pecorino and pepper in a small bowl. Add cooked, still hot pasta to the pan. Then, add the egg mixture and pasta water to the still hot pasta. Mix quickly and evenly until you have a silky sauce. Add more pasta water if needed. Sprinkle pecorino crunch and chopped parsley on top and serve immediately.\", \"step_number\": 4}]', 4, 720, 'https://images.services.kitchenstories.io/ktPjKdxYAhrxGC1Nnz9FLYyDd20=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3397_Final_4x3.jpg'),
(7, 'Pasta arrabiata', 'Spicy tomato pasta with roasted peppers.', 25, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/XXdbnvH63ycV-9WndqunM32XDtQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-1.jpg\", \"instruction\": \"Season a pot of boiling water generously with salt. Add penne and cook until just shy of al dente, approx. 1 min. less than the package recommends. Drain, reserving approx. 1/4 cup (60ml) of pasta water.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/KnXuVbgnqXnZI5Vr7Nu0cWkj628=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-2.jpg\", \"instruction\": \"While the pasta cooks, mince the garlic. Add olive oil to a large frying pan and add minced garlic and chili flakes. Sauté for approx. 3 min. over medium heat, then add tomato paste and canned chopped tomatoes. Let simmer for approx. 5 min.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/7wE7u2VdQaM-Ecvng_kaTtw4F7g=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-step-3.jpg\", \"instruction\": \"Add reserved pasta water and cooked penne to the tomato sauce. Toss over medium heat until the pasta is coated in the sauce. Season with salt if needed. Serve immediately with freshly grated Pecorino cheese, a drizzle of olive oil, and parsley. Enjoy!\", \"step_number\": 3}]', 4, 500, 'https://images.services.kitchenstories.io/b4Y6pYC9k9Liz-BzgcMJsTJhL0M=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R1600-photo-final-1.jpg'),
(8, 'Cold noodle salad with peanut sauce', 'Refreshing soba noodles with crunchy veggies.', 20, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/kVmOSn-qNtfzd72cgiqWEp32B-E=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_0.jpg\", \"instruction\": \"Bring a pot of water to a boil over medium-high heat. In the meantime, slice the cucumber into thin strips. Thinly slice the scallions. Chop up the red cabbage. Slice the snow peas into bite-sized pieces. Cut the stems and leaves of the cilantro. Roughly chop the peanuts.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/to7qZb9kkSrSJctKztPWekqPxEk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_1.jpg\", \"instruction\": \"Once the water boils, season with salt and cook the soba noodles according to package instructions. Drain and rinse with cold water until the noodles are completely cooled.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/-Ny4i28zp5v8vctx67qi0odxDWc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2637-step-photo-_7.jpg\", \"instruction\": \"For the sauce, place the peanut butter, soy sauce, sesame oil, sugar and lemon juice in a large bowl. Mix well, then grate in the garlic with a fine grater. Mix again and thin out the sauce by adding cold water by the tablespoons until the desired consistency is reached. Add the noodles and all the vegetables and mix well. Garnish with peanuts, cilantro leaves and chilli oil if desired and serve. Enjoy!\", \"step_number\": 3}]', 2, 450, 'https://images.services.kitchenstories.io/6zdWp2pMtyYHQAjocQoKCu6LFRQ=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2637-final-photo-_2.jpg'),
(9, 'Bang bang salmon bowl', 'Salmon fillets with a creamy-spicy sauce.', 20, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/Q78ySCXBIrlKIWetlNEvvnc_kVU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step1_4x3.jpg\", \"instruction\": \"Preheat the oven to 200 °C (top/bottom heat). In a large bowl, mix mayonnaise, sweet chili sauce, and Sriracha, then set aside. Cut the salmon into bite-sized pieces, season in a bowl with paprika powder, garlic powder, salt, and pepper, and mix well.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/EJUZDlkQKx2Pr-n6C7QZL5Cmw0Y=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step2_4x3.jpg\", \"instruction\": \"Line a baking sheet with parchment paper. Spread the seasoned salmon on top, drizzle with oil, and bake in the oven for approx. 8 - 10 min. until cooked through and easily flaked. Meanwhile, cook the rice according to package instructions. At the same time, slice the red cabbage into very thin strips and peel and grate the carrots.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/H5dAFaVNCMCJO8VdTsTOqkUJQB4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3373_Step3_4x3.jpg\", \"instruction\": \"Halve avocado and remove the pit, then slice. Slice the cucumber as well. Cook the edamame for approx. 2 - 3 min. according to package instructions, drain, remove from the pods and salt everything. Carefully mix the salmon with half of the bang bang sauce. Spoon rice into bowls and top with the vegetables and salmon. Garnish with coriander, the remaining sauce and sesame seeds, season to taste and serve.\", \"step_number\": 3}]', 2, 1212, 'https://images.services.kitchenstories.io/Fvsa5KzTlElPrtKvapl825om1Fo=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3373_Final_4x3.jpg'),
(10, 'Halloumi tzatziki bowl with lemony orzo', 'Greek-inspired bowl with fresh flavors.', 30, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/j2RB69g0bK4rDkg406yN_ng8SgY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_1.jpg\", \"instruction\": \"Start the halloumi tzatziki bowl by preparing the orzo first. Finely mince garlic, zest half the lemon and halve red onion. Set one half aside and dice the other half. Heat some olive oil in a small pot and add diced onion and half of the garlic, frying for approx. 2 min. Then, add orzo and fry for approx. 2 min. more. Pour vegetable stock in, add pepper and oregano and let orzo simmer for approx. 10 - 15 min. stirring occasionally.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/licJXdgD3I_gJDGIuFz1oIF-ijg=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_2.jpg\", \"instruction\": \"While the orzo cooks, start making the tzatziki and grate half the cucumber into a bowl. To the same bowl, add greek yogurt, rest of finely minced garlic, olive oil, lemon juice, and salt. Mix until it’s creamy and well combined. For the rest of the bowl, slice remaining cucumber and halve cherry tomatoes. Cut the remaining onion half into thin rings.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/ZkTkzK2XYGc_2emRz3j6oLIdfz4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_3.jpg\", \"instruction\": \"Cut halloumi into approx. 1 cm/0.4 in. thin slices and fry in a pan until both sides are golden brown for approx. 6 min. in total. Check on the orzo and mix in spinach leaves and lemon zest approx. 2 min. before it is done. Then, remove from heat and let cool a bit.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/7i8zMJ7Z291LA0U8GXq6kL0oafc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl_step_4.jpg\", \"instruction\": \"Once the orzo cooled down, assemble the bowls. To a deep bowl add orzo, tomatoes, cucumber, red onion, olives, tzatziki, and halloumi. Sprinkle salt, pepper, and lemon juice. Serve with mint leaves on top.\", \"step_number\": 4}]', 2, 1306, 'https://images.services.kitchenstories.io/gLrf2KyIRJ34ppo5or_LOvgOquU=/828x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3372_Halloumi_tzatziki_bowl.jpg'),
(11, 'Blue cheese, pear, and rosemary tart', 'Savory tart with sweet pears and strong cheese.', 45, 'Hard', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/mW3l_9zFI_q_bVkxE-AU1TpFTmI=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step1_4x3.jpg\", \"instruction\": \"Combine golden syrup, balsamic vinegar, and water in a small pot. Warm over medium heat and stir until it\'s all well combined. Let the mixture cool. Meanwhile, wash strawberries, remove the stems, and slice them thin.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/kLChFiIMrbA-lcTqeKjMr_qxlOA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step2_4x3.jpg\", \"instruction\": \"Separate the eggs. Beat egg yolks with honey and vanilla extract in a bowl until creamy, using a hand mixer. Gradually add mascarpone and mix until smooth. In a separate bowl, whip heavy cream until stiff and gently fold it into the mascarpone mixture.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/2DUA40gbY6EQvgh6eF0EGra7ucA=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step3_4x3.jpg\", \"instruction\": \"Briefly dip ladyfingers one by one into the cooled syrup and cover the bottom of a glass dish with them. Spread half of the mascarpone cream over the ladyfingers and smooth it out. Spread half of the strawberry jam over the cream. Add another layer of syrup-dipped ladyfingers, spread with the remaining jam, and top with the remaining mascarpone cream.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/QEBgtLMtA_ON9mzI1RIqwBYaSLQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R3322_Step4_4x3.jpg\", \"instruction\": \"Top the Tiramisu with sliced strawberries. Cover and chill in the fridge, ideally overnight. Serve once it\'s chilled enough. Garnish with fresh mint if desired.\", \"step_number\": 4}]', 8, 350, 'https://images.services.kitchenstories.io/vwsS8hYVLFeClf3YQy44i84VH7k=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3322_Final_4x3.jpg'),
(12, 'Rendang ala Ujang', 'Rich Indonesian beef stew.', 60, 'Hard', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/lqGZNUkzKY3v9g7_vaWh6RwtYCY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-1a.jpg\", \"instruction\": \"Dice bacon into small cubes. Peel and finely dice onion. Peel and dice potatoes and carrots. Remove tops and ends and slice celery and leeks.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/v4AJz2GJXUQEVMru5-z7XjzMcv0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-2.jpg\", \"instruction\": \"Melt butter in a large pot over medium-high heat. Add onion and bacon and fry for approx. 2- 3 min. Add chicken drumsticks and fry for approx. 3 - 5 min. Season with salt and pepper.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/rs46_T3s_JJfjAua49LGBVX7vvY=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-3a.jpg\", \"instruction\": \"Add the diced vegetables, bay leaves, and vegetable broth to the pot. Bring to a boil, cover with lid and reduce heat to medium. Let simmer for approx.15 min.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/HSgvW6jnkykwtmPm1Kv_saHe9N4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-4.jpg\", \"instruction\": \"Remove chicken drumsticks from the pot. Set aside and allow to cool. In the meantime, add the egg noodles to the pot and cook, covered, for approx. 10 min.\", \"step_number\": 4}, {\"step_id\": 5, \"image_url\": \"https://images.services.kitchenstories.io/c4WqUPl6dHjDcBejo2J46YE1wkU=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R1129-step-photo-5.jpg\", \"instruction\": \"Once chicken drumsticks are cool enough to handle, remove the skin and discard. Remove the meat from the bone and shred or cut into bite-sized pieces. Add the chicken back into the pot. Season with salt and pepper to taste and serve the soup with a sprinkle of parsley.\", \"step_number\": 5}]', 2, 700, 'https://images.services.kitchenstories.io/ZcY1g48KYL8Z43jjvAyNMUGW-Tc=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R1129-final-photo-1.jpg'),
(13, 'Smash burger', 'Crispy homemade smash burgers.', 20, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/DmuMEXzSj1ykXzdDebZqJ4Fa8yQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_1.jpg\", \"instruction\": \"Peel and slice onion vertically. Wash the iceberg lettuce and finely shred. Drain the pickles. Mix mayonnaise, ketchup, and mustard in a small bowl. Halve the burger buns and toast to your liking. Cut parchment paper into 15 x 15 cm/6 x 6 in. squares for each patty.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/lJaoKoHOAzUButy7miX6hemTROk=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_2.jpg\", \"instruction\": \"Heat the cast iron pan over high heat, then lightly brush with vegetable oil. Divide the ground beef into equal portions and shape into loose balls. Place patties in the pan in batches, being careful not to overcrowd. Cover each with a sheet of parchment paper, and flatten with a spatula until they are approx. 1 cm thick. Season with salt and pepper and cook over high for approx. 2 min. until the edges are crispy and brown.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/WZS2RcGv8T6LiXuYQ6eVtyq-LPc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_step_3.jpg\", \"instruction\": \"Flip the patties, season with salt and pepper, and place a slice of cheese on each patty. Cook for another 1—2 min. Meanwhile, spread the sauce on both sides of the buns, then layer your lettuce on the bottom half. Next, stack the patties,onion, pickles, and the top of the bun. Serve immediately!\", \"step_number\": 3}]', 2, 800, 'https://images.services.kitchenstories.io/iCbnuVajG80ydVxZuQWGaSkBSsI=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2121_smash_burger_title.jpg'),
(14, 'Honey Cake', 'Multi-layered cake with sour cream frosting.', 60, 'Hard', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/gYGMeoScfb-DyXitT1TpGZFSPKA=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step01.jpg\", \"instruction\": \"Butter baking tins and dust with sugar. Make sure that it is evenly spread on the inside of the tins. Tap out excess sugar.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/icrwkOnOPKl8O6GhySF1t75YtQ8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step02.jpg\", \"instruction\": \"Preheat oven to 200°C/400°F. Roughly chop couverture chocolate. Melt butter in a saucepan over medium heat. Add the chopped chocolate and melt together.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/Kv7L_BtkGtKNMuYDv-zkufgufo0=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step03.jpg\", \"instruction\": \"In a large bowl, beat the sugar, eggs, egg yolks, and salt using a mixer or whisk until the mixture becomes smooth, pale, and slightly thick. Mixing well helps incorporate air and creates a light texture for the batter.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/vxSlRwRk0nauGO8H9GKF4CNuHNo=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step04.jpg\", \"instruction\": \"Next, slowly add the melted chocolate to the egg mixture and stir gently until everything is fully combined and a smooth, rich batter forms. Make sure the chocolate is well incorporated to create an even and silky mixture.\", \"step_number\": 4}, {\"step_id\": 5, \"image_url\": \"https://images.services.kitchenstories.io/fglznXhVJFzbBL4gq86WZ5IrFig=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step05.jpg\", \"instruction\": \"Add the flour to the mixture and gently stir until it is fully incorporated. Mix just enough to combine everything and create a smooth, thick batter.\", \"step_number\": 5}, {\"step_id\": 6, \"image_url\": \"https://images.services.kitchenstories.io/Toxa7KwGamtVcGfdnH0qIymiG7c=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step06.jpg\", \"instruction\": \"Now, divide the batter evenly among the buttered baking tins (approx. 4 cm high). Next, place the filled tins in the freezer for approx. 5 - 7 min.\", \"step_number\": 6}, {\"step_id\": 7, \"image_url\": \"https://images.services.kitchenstories.io/yRri79oEmhzNfrck5WCd2TTutMU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/04_01_WarmesSchokokuechleinMitFluessigemKern_step07.jpg\", \"instruction\": \"Bake cakes in a preheated oven at 200°C/400°F for approx. 8 - 10 min. Let stand for approx. 5 - 7 min. Carefully turn out the cakes, sprinkle with confectioner\'s sugar, and serve immediately. Whipped cream or ice cream go wonderfully with this treat.\", \"step_number\": 7}]', 12, 450, 'https://images.services.kitchenstories.io/l6WZqFEJwOPCx4Z7WkEsqGgfbqQ=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/MoltenChocolateCake_FINAL.jpg'),
(15, 'The Creamiest Carbonara', 'Rich carbonara with double cream.', 25, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/GpMk8nASnV2g6YnKK1rCXAM-EmQ=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-2.jpg\", \"instruction\": \"Preheat oven to 180°C/350°F (convection). Cook spaghetti in salted water according to package instructions. Heat some oil in a frying pan, then fry bacon cubes.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/ojuVGCSm4ESGiX2qEivzcyGXpkw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-3.jpg\", \"instruction\": \"Whisk eggs, heavy cream, and a part of the Parmesan cheese. Add fried bacon cubes. Season with salt and pepper. Add cooked spaghetti and mix.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/D5NXqGtixKFAWY4aRea6USd8ZDs=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/C103-photo-step-4.jpg\", \"instruction\": \"Grease the muffin tin. Twirl spaghetti strands around a fork and place into muffin cups. Sprinkle with the remaining Parmesan cheese, then bake at 180°C/350°F (convection) for approx. 15 – 20 min.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/4emnrQuwQhf45pEPvArfcS8bXMI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/carbonara-muffins.jpg\", \"instruction\": \"Remove the carbonara muffins from the oven and let them cool in the muffin tin for a few minutes. Then carefully lift them out, sprinkle with a little extra Parmesan or black pepper if you like, and serve warm.\", \"step_number\": 4}]', 3, 900, 'https://images.services.kitchenstories.io/PK5WpAQ2hQqS9CqS9z-qkKUjxoQ=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/C103-photo-final.jpg'),
(16, 'Quick healthy breakfast', 'Avocado toast with fried egg.', 10, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/bXqGPm_ckz2Kq6J3bJg998XvRi0=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step01.jpg\", \"instruction\": \"Finely dice the bell pepper into small pieces. Thinly slice the onion into half rings, and finely chop the chives to add fresh flavor and color to the dish.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/dLdPxrMHt6C7HU4L21ltbRWYaXU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step02.jpg\", \"instruction\": \"Using a box grater, roughly grate the cheese into small shreds. This helps it melt evenly and mix well with the other ingredients.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/T9pfScqa_8m8AQSRoMo2MgTsLUI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step03.jpg\", \"instruction\": \"In a large bowl, beat the eggs together with a few drops of Tabasco sauce until well combined. This adds a mild spicy kick and evenly distributes the flavor throughout the eggs.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/efRuVGgvVLnwtIm5qnJrkJxzdFw=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step04.jpg\", \"instruction\": \"Heat up butter in a frying pan and sauté onions over medium heat for approx. 1 - 2 minutes. Then, add the bell pepper, VIVA LA SPICE seasoning (if using), and continue to sauté for an additional 2 – 3 min.\", \"step_number\": 4}, {\"step_id\": 5, \"image_url\": \"https://images.services.kitchenstories.io/2dLZ62xIHbssDhF4J6S4tNiiesg=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step05.jpg\", \"instruction\": \"Add eggs to the pan and continue to sauté, stirring occasionally, for approx. 3 - 5 min. Then, add the cheese and stir until melted.\", \"step_number\": 5}, {\"step_id\": 6, \"image_url\": \"https://images.services.kitchenstories.io/EkL_LjtLY3R8sB7Iuyp3lntheGU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/RP04_21_04_BreakfastBurito_Step06.jpg\", \"instruction\": \"Place some of the eggs in the middle of the tortilla, taking care not to overfill. Sprinkle some chives on top. Fold tortilla in from the sides. Then, roll forward from bottom with thumbs until burrito is tightly rolled. Enjoy!\", \"step_number\": 6}]', 1, 350, 'https://images.services.kitchenstories.io/di54LYwOhI5dXmioNMsBy93iEy4=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/RP04_21_04_BreakfastBurito_TitlePicture.jpg'),
(17, 'Charred Fish on Saffron Rice', 'Aromatic rice dish with marinated fish.', 60, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/FL6sDPMh7cCUlheOiFvt07O1Fbc=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-1.jpg\", \"instruction\": \"Peel and finely dice scallion and garlic. Deseed chili and slice into thin rings. Trim the ends off bok choy heads and slice each lengthwise into strips.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/qZdYTUfUZlNmtlTeJw-TMgulgRs=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-2.jpg\", \"instruction\": \"For the sauce, mix rice wine, soy sauce, water, and raw sugar in a small bowl. Pat tofu dry, then dice into bite-sized pieces. Add to a bowl with cornstarch and salt, and toss to coat.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/Rsr8mJkDTpf5VBgHiZjX2Ej4Yug=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-3.jpg\", \"instruction\": \"Heat toasted sesame oil in a frying pan over medium heat. Add tofu and sear for approx. 3 - 5 min., or until crisp. Remove from the pan and drain on paper towels.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/OZD4ISI4_XjeRyZ41dQilmDqzLs=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2236-photo-step-4.jpg\", \"instruction\": \"Add bok choy, scallion, garlic, and chili to the same frying pan and sauté for approx. 2 - 3 min., then deglaze with sauce. Transfer crispy tofu back to the pan and toss to combine. Serve with cooked brown rice. Enjoy!\", \"step_number\": 4}]', 3, 600, 'https://images.services.kitchenstories.io/y4JjeVL7fn3ziaOE-ySsuGI8eYY=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R3057-photo-title-1-newforTK.jpg'),
(18, 'Not Your Average Fish Taco', 'Fish tacos with edamame and avocado.', 30, 'Easy', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/gL5hiiqBCjmK1ylHG9pqwl83hl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_1.jpg\", \"instruction\": \"Preheat the oven to 180°C/350°F top/bottom heat. Combine flour, baking powder, sugar and salt in a large mixing bowl and set aside. Whisk eggs and milk in a small measuring cup. Then stir in half of the melted butter. Gently stir the milk mixture into the dry ingredients, but only enough to just mix everything together; a few small lumps are okay. If the batter seems too thick, add a little more milk.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/xQSozAxQZ06H-S-ydcFmcJUP7G4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_2.jpg\", \"instruction\": \"Lay out the bacon strips on a baking tray lined with parchment paper. Brush the bacon with the maple syrup and season with pepper. Then bake in the preheated oven for approx. 15–20 min. until golden brown and crispy. Meanwhile, continue with the recipe. At the end of the baking time, remove the bacon from the tray and let it drain.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/7wutoPq-FX0WyeJISAsr58weJm4=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-step-photo-_3.jpg\", \"instruction\": \"Melt half of the remaining butter in a large frying pan. Pour batter into the pan in batches and cook approx. 10 cm/ 4 in.-sized pancakes. Adjust heat as needed; generally, the first batch requires higher heat than the following batches. Flip pancakes after approx. 2–3 min., when bubbles rise to the surface and the bottom browns. Let the other side cook for approx. 1–2 min. more or until lightly browned. Take the pancakes out of the pan, stack them on a plate, and set aside.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/L4XQgeTNIhkO7U5KwV_OMCXPf3Q=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2723-final-photo-_1.jpg\", \"instruction\": \"Cut chives into fine rings. Heat butter in a pan, whisk eggs with salt and pepper, and scramble them over low–medium heat. Stir in most of the cheese just before the eggs are done. Fold pancakes like tacos, fill with scrambled eggs, top with bacon and remaining cheese, garnish with chives and hot sauce, and serve immediately.\", \"step_number\": 4}]', 3, 400, 'https://images.services.kitchenstories.io/Q3Fe0myY_iiTAiPYHMIWAtQeG-g=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/extra_finals_0.jpg'),
(19, 'Fried chicken', 'Classic crispy fried chicken legs.', 45, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/DxeKRrLcCco07JULNhOz8B31P54=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step01.jpg\", \"instruction\": \"Preheat oven to 200°C/400°F. In a small bowl, mix together garlic powder, onion powder, salt, pepper, and paprika.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/ABrcCTIhWPaJSKGk9mKsUdrEnIE=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step03.jpg\", \"instruction\": \"Carefully cut chicken legs in half at the joint. Rub them generously with spice rub, setting any excess spice rub aside.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/zVnqCIODyC_rL6Sl5LHaquTKhU8=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step02.jpg\", \"instruction\": \"In a large bowl, whisk together egg, water, and Tabasco. In a separate large bowl, whisk together flour, baking powder, a pinch of salt, and the excess spice rub.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/YtuEFZ9m2xsyIh2NgotU52HA1JU=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step04.jpg\", \"instruction\": \"Dip chicken pieces in the egg mixture until well coated on all sides. Lightly shake to remove excess liquid. Then dredge chicken in flour mixture until a thick and even crust is formed. Repeat these steps for a thicker crust if desired.\", \"step_number\": 4}, {\"step_id\": 5, \"image_url\": \"https://images.services.kitchenstories.io/aChQFn6gq319Nce6YU4gCVbyigI=/640x0/filters:quality(80)/images.kitchenstories.io/recipeStepImages/25_09_FriedChicken_Step05.jpg\", \"instruction\": \"Heat oil in a deep pan over medium-high heat. Fry chicken in batches for 3 - 5 minutes until golden and crispy, then bake at 200°C (400°F) for 10 - 15 minutes until cooked through. Serve with lemon wedges and dipping sauces.\", \"step_number\": 5}]', 6, 600, 'https://images.services.kitchenstories.io/AI95bm2qcUaAmL-Fwn0HHyesUyI=/1200x0/filters:quality(85)/images.kitchenstories.io/recipeImages/25_09_FriedChicken_TitlePicture.jpg'),
(20, 'Succulent lemon and herb chicken', 'Pan-fried chicken with lemon sauce.', 35, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/MRT5v409KH5qQGC0NGIk7c16bjg=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-1.jpg\", \"instruction\": \"Finely dice ginger and garlic and add to a big bowl. Add coconut milk, chili paste, lime juice, brown sugar, and salt. Whisk in oil. Add shrimp, mix well, and let sit for at least 15 min. or up to 4 hrs.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/KUJMJ5jUlJzdX-jUYBYLTZLYNJE=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-2.jpg\", \"instruction\": \"Remove shrimp from marinade. Add marinade to a small pot and bring to a boil. Reduce heat to medium heat and let reduce. Mix from time to time while simmering until creamy. Sauce should be thick enough to cover the back of a spoon.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/WK7KwxKg9KlrtS6c6p4Glcl-TzQ=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-step-4.jpg\", \"instruction\": \"Grill shrimp on a very hot grill pan brushed vegetable oil over high heat. Serve with sauce, cilantro, and lime wedges. Enjoy!\", \"step_number\": 3}]', 2, 500, 'https://images.services.kitchenstories.io/FyW6jQTFYawJf1zO55gPrKpfkpE=/1200x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2045-photo-final-1.jpg'),
(21, 'Spaghetti Bolognese', 'A classic Italian pasta dish with a rich, meaty sauce.', 45, 'Medium', '[{\"step_id\": 1, \"image_url\": \"https://images.services.kitchenstories.io/wqvAi28OtHzLjtXX9AMhW2lJa2E=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-1.jpg\", \"instruction\": \"For the soffritto, peel and halve the onions and garlic. Peel and roughly chop the carrot. Roughly chop the celery. Add them to a food processor or blender and chop everything evenly until it is about as fine as the ground beef. Heat the olive oil in a large non-stick frying pan over low heat. Add the chopped vegetables and sauté for approx. 10-15 min. Stir regularly to make sure nothing burns.\", \"step_number\": 1}, {\"step_id\": 2, \"image_url\": \"https://images.services.kitchenstories.io/Wl9Ij0QASGZ9RMz8thg72ZEYIIo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-2.jpg\", \"instruction\": \"Then add the ground beef to the pan and fry for another approx. 10-15 min. While frying, break up the meat with a cooking spoon. Season with salt and pepper.\", \"step_number\": 2}, {\"step_id\": 3, \"image_url\": \"https://images.services.kitchenstories.io/t1yTaOY5AnDlledLnwv0ryIfRh4=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-3.jpg\", \"instruction\": \"Add the canned crushed tomatoes, tomato paste, salt, pepper and dried oregano. Simmer uncovered over medium heat for approx. 15-30 min. until the sauce has thickened.\", \"step_number\": 3}, {\"step_id\": 4, \"image_url\": \"https://images.services.kitchenstories.io/I0Ji7dQ7j6D1Ce0sHtSq-VaRWyo=/750x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-step-photo-5.jpg\", \"instruction\": \"In the meantime, cook the spaghetti in plenty of boiling salted water according to package instructions until al dente. Drain the pasta and serve with the Bolognese sauce and grated Parmesan cheese.\", \"step_number\": 4}]', 4, 500, 'https://images.services.kitchenstories.io/WmlcnmcFjLeDxrwIiV9zSGJkcl0=/640x0/filters:quality(80)/images.kitchenstories.io/wagtailOriginalImages/R150-final-photo-2.jpg'),
(22, 'Classic spaghetti carbonara', 'A creamy Italian pasta dish with eggs, cheese, pancetta, and black pepper.', 20, 'Medium', NULL, 4, 500, NULL),
(23, 'Banana bread', 'Moist and flavorful quick bread made with ripe bananas.', 25, 'Easy', NULL, 4, 500, NULL),
(24, 'Fluffy buttermilk pancakes', 'Light and fluffy pancakes made with buttermilk.', 15, 'Easy', NULL, 4, 500, NULL),
(25, 'Scalloped potatoes', 'INSERT DESCRIPTION HERE.', 15, 'Medium', NULL, 4, 500, NULL),
(26, 'Easy Italian lasagna', 'INSERT DESCRIPTION HERE.', 40, 'Medium', NULL, 4, 500, NULL),
(27, 'Saltimbocca', 'INSERT DESCRIPTION HERE.', 20, 'Medium', NULL, 4, 500, NULL),
(28, 'One-pot shrimp and tomato pasta', 'INSERT DESCRIPTION HERE.', 35, 'Easy', NULL, 4, 500, NULL),
(29, 'Basque burnt cheesecake', 'INSERT DESCRIPTION HERE.', 25, 'Medium', NULL, 4, 500, NULL),
(30, 'Classic French coq au vin', 'INSERT DESCRIPTION HERE.', 60, 'Hard', NULL, 4, 500, NULL),
(31, 'Creamy fish stew with mustard and dill', 'INSERT DESCRIPTION HERE.', 55, 'Medium', NULL, 4, 500, NULL),
(32, 'Sundubu jjigae', 'INSERT DESCRIPTION HERE.', 35, 'Medium', NULL, 4, 500, NULL),
(33, 'Lemony chickpea stew', 'INSERT DESCRIPTION HERE.', 25, 'Easy', NULL, 4, 500, NULL),
(34, 'Creamy coconut pumpkin stew', 'INSERT DESCRIPTION HERE.', 30, 'Medium', NULL, 4, 500, NULL),
(35, 'Vegan chili', 'INSERT DESCRIPTION HERE.', 35, 'Easy', NULL, 4, 500, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredient`
--

CREATE TABLE `recipe_ingredient` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_ingredient`
--

INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `quantity`, `unit`) VALUES
(1, 1, 500, 'g'),
(1, 2, 300, 'g'),
(1, 3, 1, 'pc'),
(1, 4, 1, 'l'),
(1, 5, 8, 'pc'),
(1, 6, 1, 'pc'),
(1, 7, 2, 'tbsp'),
(1, 8, 100, 'g'),
(1, 9, 1.5, 'tbsp'),
(1, 10, 2.5, 'tbsp'),
(2, 11, 400, 'g'),
(2, 12, 400, 'g'),
(2, 13, 400, 'g'),
(2, 14, 2, 'cloves'),
(2, 15, 2, 'sprigs'),
(2, 16, 1.5, 'tbsp'),
(2, 17, 1, 'tbsp'),
(2, 18, 1, 'tbsp'),
(3, 19, 100, 'g'),
(3, 20, 0.5, 'pc'),
(3, 21, 125, 'g'),
(3, 22, 1, 'pc'),
(3, 23, 700, 'ml'),
(3, 24, 200, 'ml'),
(3, 25, 0.5, 'tsp'),
(4, 14, 2, 'cloves'),
(4, 26, 300, 'g'),
(4, 27, 170, 'g'),
(4, 28, 100, 'g'),
(4, 29, 3, 'tbsp'),
(4, 30, 1, 'pc'),
(4, 31, 100, 'g'),
(5, 32, 125, 'g'),
(5, 33, 120, 'g'),
(5, 34, 80, 'ml'),
(5, 35, 70, 'g'),
(5, 36, 1, 'tsp'),
(5, 37, 1, 'tsp'),
(6, 38, 500, 'g'),
(6, 39, 200, 'g'),
(6, 40, 150, 'g'),
(6, 41, 80, 'g'),
(6, 42, 6, 'pc'),
(6, 43, 50, 'g'),
(7, 14, 3, 'cloves'),
(7, 44, 500, 'g'),
(7, 45, 2, 'pc'),
(7, 46, 500, 'g'),
(7, 47, 1, 'tbsp'),
(8, 18, 2, 'tbsp'),
(8, 48, 200, 'g'),
(8, 49, 3, 'tbsp'),
(8, 50, 0.5, 'pc'),
(8, 51, 100, 'g'),
(9, 52, 2, 'pc'),
(9, 53, 80, 'ml'),
(9, 54, 30, 'ml'),
(9, 55, 10, 'ml'),
(9, 56, 180, 'g'),
(9, 57, 1, 'pc'),
(10, 23, 500, 'ml'),
(10, 26, 200, 'g'),
(10, 58, 225, 'g'),
(10, 59, 500, 'g'),
(10, 60, 4, 'pc'),
(11, 7, 8, 'tbsp'),
(11, 9, 250, 'g'),
(11, 61, 150, 'g'),
(11, 62, 200, 'g'),
(11, 63, 2, 'pc'),
(12, 64, 500, 'g'),
(12, 65, 1, 'strip'),
(12, 66, 1, 'strip'),
(12, 67, 1, 'bar'),
(12, 68, 2, 'pc'),
(13, 13, 500, 'g'),
(13, 53, 3, 'tbsp'),
(13, 69, 2, 'pc'),
(13, 70, 4, 'pc'),
(13, 71, 20, 'g'),
(14, 7, 60, 'g'),
(14, 9, 640, 'g'),
(14, 72, 2, 'tbsp'),
(14, 73, 180, 'g'),
(14, 74, 800, 'g'),
(15, 38, 500, 'g'),
(15, 75, 300, 'ml'),
(15, 76, 3, 'pc'),
(15, 77, 8, 'slices'),
(15, 78, 0.5, 'package'),
(16, 57, 1, 'pc'),
(16, 79, 2, 'slices'),
(16, 80, 1, 'pc'),
(16, 81, 6, 'pc'),
(17, 82, 200, 'g'),
(17, 83, 200, 'g'),
(17, 84, 0.25, 'tsp'),
(17, 85, 2, 'tbsp'),
(17, 86, 12, 'pc'),
(18, 57, 0.5, 'head'),
(18, 87, 0.5, 'lb'),
(18, 88, 3, 'sheets'),
(18, 89, 1, 'cup'),
(19, 9, 200, 'g'),
(19, 76, 4, 'pc'),
(19, 90, 8, 'pc'),
(19, 91, 2, 'tbsp'),
(19, 92, 500, 'ml'),
(20, 30, 1, 'pc'),
(20, 90, 6, 'pc'),
(20, 93, 3, 'tbsp'),
(20, 94, 100, 'ml'),
(20, 95, 300, 'ml');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tag`
--

CREATE TABLE `recipe_tag` (
  `recipe_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_tag`
--

INSERT INTO `recipe_tag` (`recipe_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(19, 2),
(1, 3),
(2, 4),
(8, 4),
(2, 5),
(2, 6),
(4, 6),
(16, 6),
(3, 7),
(4, 7),
(8, 7),
(3, 8),
(3, 9),
(4, 10),
(6, 10),
(7, 10),
(15, 10),
(5, 11),
(11, 11),
(14, 11),
(5, 12),
(5, 13),
(6, 14),
(15, 14),
(6, 15),
(7, 16),
(12, 16),
(7, 17),
(10, 17),
(11, 17),
(8, 18),
(9, 19),
(17, 19),
(18, 19),
(9, 20),
(10, 20),
(9, 21),
(13, 21),
(17, 21),
(18, 21),
(20, 21),
(10, 22),
(11, 23),
(12, 24),
(12, 25),
(13, 25),
(13, 26),
(14, 27),
(14, 28),
(15, 29),
(16, 30),
(16, 31),
(17, 32),
(18, 33),
(19, 34),
(20, 34),
(19, 35),
(20, 36),
(21, 37),
(22, 37),
(23, 37),
(24, 37),
(25, 37),
(26, 37),
(27, 37),
(28, 37),
(29, 37),
(30, 37),
(31, 37),
(32, 37),
(33, 37),
(34, 37),
(35, 37);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tool`
--

CREATE TABLE `recipe_tool` (
  `recipe_id` int NOT NULL,
  `tool_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `recipe_tool`
--

INSERT INTO `recipe_tool` (`recipe_id`, `tool_id`) VALUES
(1, 1),
(2, 1),
(7, 1),
(15, 1),
(1, 2),
(2, 2),
(6, 2),
(7, 2),
(8, 2),
(10, 2),
(12, 2),
(17, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(1, 3),
(1, 4),
(3, 4),
(2, 5),
(12, 5),
(3, 6),
(4, 7),
(4, 8),
(15, 8),
(5, 9),
(8, 9),
(9, 9),
(11, 9),
(5, 10),
(9, 10),
(11, 10),
(14, 10),
(20, 10),
(6, 11),
(6, 12),
(8, 12),
(15, 12),
(9, 13),
(10, 14),
(16, 14),
(17, 14),
(18, 14),
(20, 14),
(10, 15),
(11, 16),
(13, 17),
(13, 18),
(14, 19),
(14, 20),
(19, 20),
(16, 21),
(19, 22),
(19, 23);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int NOT NULL,
  `tag_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(1, 'German'),
(2, 'Comfort Food'),
(3, 'Main Dish'),
(4, 'Asian'),
(5, 'Noodles'),
(6, 'Quick'),
(7, 'Vegan'),
(8, 'Soup'),
(9, 'Autumn'),
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
(23, 'Tart'),
(24, 'Indonesian'),
(25, 'Beef'),
(26, 'American'),
(27, 'Dessert'),
(28, 'Cake'),
(29, 'Indulgent'),
(30, 'Breakfast'),
(31, 'Healthy'),
(32, 'Rice'),
(33, 'Mexican'),
(34, 'Chicken'),
(35, 'Fried'),
(36, 'Easy'),
(37, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `tool`
--

CREATE TABLE `tool` (
  `tool_id` int NOT NULL,
  `tool_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tool`
--

INSERT INTO `tool` (`tool_id`, `tool_name`) VALUES
(1, 'frying pan'),
(2, 'pot'),
(3, 'sieve'),
(4, 'knife'),
(5, 'blender'),
(6, 'large pot'),
(7, 'food processor'),
(8, 'saucepan'),
(9, 'bowl'),
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`ingredient_id`);

--
-- Indexes for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD PRIMARY KEY (`nutrition_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`recipe_id`);

--
-- Indexes for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD PRIMARY KEY (`recipe_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `recipe_tag`
--
ALTER TABLE `recipe_tag`
  ADD PRIMARY KEY (`recipe_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `recipe_tool`
--
ALTER TABLE `recipe_tool`
  ADD PRIMARY KEY (`recipe_id`,`tool_id`),
  ADD KEY `tool_id` (`tool_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `tool`
--
ALTER TABLE `tool`
  ADD PRIMARY KEY (`tool_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `ingredient_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `nutrition`
--
ALTER TABLE `nutrition`
  MODIFY `nutrition_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `recipe_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tool`
--
ALTER TABLE `tool`
  MODIFY `tool_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nutrition`
--
ALTER TABLE `nutrition`
  ADD CONSTRAINT `nutrition_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

--
-- Constraints for table `recipe_ingredient`
--
ALTER TABLE `recipe_ingredient`
  ADD CONSTRAINT `recipe_ingredient_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`);

--
-- Constraints for table `recipe_tag`
--
ALTER TABLE `recipe_tag`
  ADD CONSTRAINT `recipe_tag_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_tag_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);

--
-- Constraints for table `recipe_tool`
--
ALTER TABLE `recipe_tool`
  ADD CONSTRAINT `recipe_tool_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`),
  ADD CONSTRAINT `recipe_tool_ibfk_2` FOREIGN KEY (`tool_id`) REFERENCES `tool` (`tool_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
