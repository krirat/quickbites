// server.js

const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
const port = 5003;

// Middleware setup
app.use(cors()); // Allow cross-origin requests from React frontend
app.use(express.json()); // Enable reading JSON data from request body

// --- MySQL Connection Setup ---
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root', // CHANGE THIS to your MySQL username
    password: 'CEiAdmin0', // CHANGE THIS to your MySQL password
    database: 'ceidb' // Ensure this matches your database name
});

db.connect(err => {
    if (err) {
        console.error('Error connecting to MySQL:', err);
        return;
    }
    console.log('Connected to MySQL Database.');
});

// Get all ingredients from the database
app.get('/api/ingredients', (req, res) => {
    // TRAP CHECK: Double check if your table is 'ingredient' or 'ingredients'
    const sql = "SELECT * FROM ingredient"; 
    
    db.query(sql, (err, results) => {
        if (err) {
            console.error("❌ SQL ERROR:", err.message); 
            // Safety Net: Return an empty array so .map() doesn't crash the frontend
            return res.status(500).json([]); 
        }
        res.json(results);
    });
});

app.get('/api/recipe/:id', (req, res) => {
    const recipeId = Number.parseInt(req.params.id, 10);

    if (!Number.isInteger(recipeId) || recipeId <= 0) {
        return res.status(400).json({ error: 'Invalid recipe id' });
    }

    const recipeSql = 'SELECT * FROM recipe WHERE recipe_id = ?';

    db.query(recipeSql, [recipeId], (recipeErr, recipeResults) => {
        if (recipeErr) {
            console.error('❌ SQL ERROR (recipe):', recipeErr.message);
            return res.status(500).json({ error: 'Database error while fetching recipe' });
        }

        if (recipeResults.length === 0) {
            return res.status(404).json({ error: 'Recipe not found' });
        }

        const ingredientsSql = `
            SELECT ri.recipe_id, ri.ingredient_id, ri.quantity, ri.unit, i.*
            FROM recipe_ingredient ri
            INNER JOIN ingredient i ON ri.ingredient_id = i.ingredient_id
            WHERE ri.recipe_id = ?
        `;

        db.query(ingredientsSql, [recipeId], (ingredientsErr, ingredientResults) => {
            if (ingredientsErr) {
                console.error('❌ SQL ERROR (ingredients):', ingredientsErr.message);
                return res.status(500).json({ error: 'Database error while fetching ingredients' });
            }

            const toolsSql = `
                SELECT t.*
                FROM tool t
                INNER JOIN recipe_tool rt ON rt.tool_id = t.tool_id
                WHERE rt.recipe_id = ?
            `;

            db.query(toolsSql, [recipeId], (toolsErr, toolResults) => {
                if (toolsErr) {
                    console.error('❌ SQL ERROR (tools):', toolsErr.message);
                    return res.status(500).json({ error: 'Database error while fetching tools' });
                }

                const tagsSql = `
                    SELECT tg.*
                    FROM tag tg
                    INNER JOIN recipe_tag rtag ON rtag.tag_id = tg.tag_id
                    WHERE rtag.recipe_id = ?
                `;

                db.query(tagsSql, [recipeId], (tagsErr, tagResults) => {
                    if (tagsErr) {
                        console.error('❌ SQL ERROR (tags):', tagsErr.message);
                        return res.status(500).json({ error: 'Database error while fetching tags' });
                    }

                    const nutritionSql = 'SELECT * FROM nutrition WHERE recipe_id = ?';

                    db.query(nutritionSql, [recipeId], (nutritionErr, nutritionResults) => {
                        if (nutritionErr) {
                            console.error('❌ SQL ERROR (nutrition):', nutritionErr.message);
                            return res.status(500).json({ error: 'Database error while fetching nutrition' });
                        }

                        return res.json({
                            recipe: recipeResults[0],
                            ingredients: ingredientResults,
                            tools: toolResults,
                            tags: tagResults,
                            nutrition: nutritionResults
                        });
                    });
                });
            });
        });
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});