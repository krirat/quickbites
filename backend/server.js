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

// Start the server
app.listen(port, () => {
    console.log(`Server listening at http://localhost:${port}`);
});