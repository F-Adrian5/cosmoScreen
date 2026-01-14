// importing express, cors, db and exampleRoutes from libary and other files
import express from 'express';
import db from './db.ts';
import makeAllRoutes from './routes/makeAllRoutes.ts';
import login from './routes/login.ts';
import register from './routes/register.ts';
import cors from 'cors'

// creates an express application
const app = express();

// creates a port for 3000
const port = 3000;

// connectinc cors and setting it to only allow the 5173 port
app.use(cors({
  origin: [
    'http://localhost:5173'
  ]
}))

// we read the json data -> it puts the data to req.data
app.use(express.json());

// connecting all the routes
app.use(makeAllRoutes);

app.use(login);

app.use(register);

// start the server at the port variable's location
app.listen(port, () => {

  // we log out that the server is running at this port
  console.log(`Server listening at http://localhost:${port}`);
});