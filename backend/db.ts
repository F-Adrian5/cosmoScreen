import mysql from "mysql2/promise";

export const port = 3000;

export const db = mysql.createPool({
  host: "localhost",
  database: "cosmoscreen",
  user: "root" 
});