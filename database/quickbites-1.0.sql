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
  `calories_per_serving` float
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

INSERT INTO recipe (recipe_name, description, total_time_minutes, difficulty, instructions, base_servings, calories_per_serving)
VALUES ('Spaghetti Bolognese', 'Description here', 30, 'Easy', 'Step-by-step instructions', 4, 350.5);

ALTER TABLE `recipe_ingredient` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_tool` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_tag` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `nutrition` ADD FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe_ingredient` ADD FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`ingredient_id`);

ALTER TABLE `recipe_tool` ADD FOREIGN KEY (`tool_id`) REFERENCES `tool` (`tool_id`);

ALTER TABLE `recipe_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`);
