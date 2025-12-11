import express from 'express';
import db from './db.js';
import exampleRoutes from './routes/example.js';

const app = express();
const port = 3000;

// JSON body parsing
app.use(express.json());

// Route-ok
app.use('/api', exampleRoutes);

// Teszt route a DB-hez
app.get('/solution', (req, res) => {
  db.query('SELECT 1 + 1 AS solution', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ solution: rows[0].solution });
  });
});

// Szerver indítása
app.listen(port, () => {
  console.log(`Server listening at http://localhost:${port}`);
});