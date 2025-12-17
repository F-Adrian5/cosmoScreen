// Importing mysql from library 
import mysql from 'mysql';
import { promisify } from 'util';

// creating a database connection, with the data provided
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'cosmoscreen'
});

// trying to connect to the database
db.connect(err => {

  // if there is an error, we print it out and we exit the program
  if (err) {
    console.error('Database connection failed: ' + err.stack);
    process.exit(1);
  }
  console.log('Connected to database.');
});

// Promisify the query method
export const query = promisify(db.query).bind(db);

// exporting the db object so we can use it elsewhere
export default db;
