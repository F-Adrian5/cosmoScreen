import { Router } from 'express';
import db from '../db.ts';

/**
 * It will create a route, easily
 * @param url string
 * @param query string
 * @returns router object
*/
export function createRoute(url: string, query: string) {
  const router = Router();

  // creates a GET type HTTP request, the route will be the 'url' param 
  // The request only runs if the user starts a request to the 'url'
  // req: an object that contains and object with the query
  // res: this is the response that the client will get
  router.get(url, (req, res) => {
    db.query(query, (err, results) => {
      if (err) {
        return res.status(500).json({ error: 'Server error' });
      }
      res.json(results);
    });
  });

  return router;
}