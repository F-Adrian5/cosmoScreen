// importing express,db and exampleRoutes from libary and other files
import express from 'express';
import db from './db.ts';
import exampleRoutes from './routes/example.ts';

// creates an express application
const app = express();

// creates a port for 3000
const port = 3000;

// we read the json data -> it puts the data to req.data
app.use(express.json());

// connecting routes, every route that is in the 'exampleRoutes'
app.use(exampleRoutes);

// makes a GET type HTTP
// with a '/solution' route
// req: an object that contains and object with the query
// res: this is the response that the client will get
app.get('/solution', (req, res) => {

  // creates a query, with err: for error, and rows: for the data
  db.query('SELECT 1 + 1 AS solution', (err, rows) => {
    
    // if there was an error
    if (err) {

      // than it returns an error message and a status code
      return res.status(500).json({ error: err.message });
    }

    // makes the res to a json format
    res.json({ solution: rows[0].solution });
  });
});

// start the server at the port variable's location
app.listen(port, () => {

  // we log out that the server is running at this port
  console.log(`Server listening at http://localhost:${port}`);
});