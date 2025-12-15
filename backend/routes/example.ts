// import express libary
import express from 'express';

// creates a new router, it enables us to create new routes
const router = express.Router();

// creates a GET type HTTP request, the route is '/hello' 
// The request only runs if the user starts a request to '/hello'
// req: an object that contains and object with the query
// res: this is the response that the client will get
router.get('/hello', (req, res) => {

  // this will make resposne a json
  res.json({ message: 'Hello World!' });
});

// exporting the router object, so we can use it elsewhere
export default router;