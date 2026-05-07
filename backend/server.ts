import express from 'express';
import cors from 'cors';
import { port, db } from "./db.ts";

// creating an express application, using cors and middleware
const app = express();
app.use(cors())
app.use(express.json());

// default view
app.get("/", (req,res) => {
  res.status(200).send("The connection to the database was successful!");
})

// get actors
app.get("/getActors", async(req,res) => {
  try {

    const response = await db.query(
      `SELECT id, 
              name, 
              info_link 
        FROM actors`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get actors", error: true });
  }
})

// get buffet
app.get("/getBuffet", async(req,res) => {
  try {

    const response = await db.query(`
      SELECT id, 
             name, 
             type, 
             price, 
             description, 
             img 
        FROM buffet`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get buffet", error: true });
  }
})

// get buffet types
app.get("/getBuffetTypes", async(req,res) => {
  try {
    
    const response = await db.query(`
      SELECT DISTINCT type 
        FROM buffet`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get buffet types", error: true });
  }
})

// get genres
app.get("/getGenres", async(req,res) => {
  try {
    
    const response = await db.query(`
      SELECT DISTINCT genre 
        FROM movies`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get genres", error: true });
  }
})

// get movies
app.get("/getMovies", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id, 
              title, 
              genre, 
              runtime, 
              director, 
              production, 
              age_restriction, 
              poster, 
              description, 
              release_date 
       FROM movies`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get movies", error: true });
  }
})

// get actor in movie
app.get("/getActorInMovie", async(req,res) => {
  try {
    
    const response = await db.query(`
      SELECT actors.name, 
             actors.id AS "actor_id", 
             actors.info_link, 
             movies.id AS "movie_id" 
      FROM actor_in_movie 
      JOIN movies 
      ON movies.id = movie_id 
      JOIN actors 
      ON actors.id = actor_id`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get actors in movie", error: true });
  }
})

// get movie screening
app.get("/getMovieScreening", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id,
              movie_id,
              room_id,
              language 
        FROM movie_screening`);

    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get movie screening", error: true });
  }
})

// get reservation
app.get("/getReservation", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id,
              user_id,
              total_amount,
              screening_id,
              reservation_date,
              ticket_id,
              seat_id 
        FROM reservation`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get reservation", error: true });
  }
})

// get rooms
app.get("/getRooms", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id,
              capacity 
        FROM rooms`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get rooms", error: true });
  }
})

// get seats
app.get("/getSeats", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id, 
              room_id, 
              seat_row, 
              seat_column 
        FROM seats`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get seats", error: true });
  }
})

// get tickets
app.get("/getTickets", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id,
              type,
              price 
        FROM tickets`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get tickets", error: true });
  }
})

// get users
app.get("/getUsers", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT id,
              name,
              email,
              password,
              admin 
        FROM users`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get users", error: true });
  }
})

// get programs
app.get("/getPrograms", async(req,res) => {
  try {
    
    const response = await db.query(
      `SELECT movie_screening.id AS "screening_id", 
              movie_id AS "movie_id", 
              movies.title AS "movie_title", 
              movies.poster, 
              movies.runtime, 
              movies.genre, 
              movies.showing_in, 
              room_id, 
              language 
        FROM movie_screening 
        JOIN movies 
        ON movie_id = movies.id`);
        
    res.status(200).json(response[0]);
  } catch (error) {

    console.log(error);
    res.status(500).json({ message: "Failed to get programs", error: true });
  }
})

// login
app.post("/login", async (req, res) => {

  // get email and password from the request body
  const { email, password } = req.body;

  // checking email and password
  if (!email || !password) {
    return res.status(400).json({ message: "Email és jelszó megadása kötelező" });
  };

  try {

    // get user by email
    const [rows]: any = await db.query(
      `SELECT id, 
              name, 
              email, 
              password, 
              admin 
        FROM users 
        WHERE email = ?`,
      [email]
    );

    // if there is no match we return with an error
    if (!rows || rows.length === 0) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    };

    // select user
    const user = rows[0];

    // check if the provided password matches with the stored password
    if (password !== user.password) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    };

    // return users data
    return res.json({
      id: user.id,
      name: user.name,
      email: user.email,
      admin: user.admin,
    });

  } catch (err) {

    // login error
    console.log("Login hiba:", err);

    // server error
    return res.status(500).json({ message: "Szerver hiba" });
  };
});

// password
app.put("/password", async (req, res) => {

  // get id and new password from request body
  const { id, new_password } = req.body;

  // check required fields
  if (!id || !new_password) {
    return res.status(400).json({ message: "Hiányzó adatok" });
  };

  try {

    // check if user exists
    const [users]: any = await db.query(
      `SELECT id,
              name,
              email,
              admin
        FROM users 
        WHERE id = ?`,
      [id]
    );

    if (users.length === 0) {
      return res.status(404).json({ message: "Felhasználó nem található" });
    };

    // update password
    const [result]: any = await db.query(
      `UPDATE users 
       SET password = ? 
       WHERE id = ?`,
      [new_password, id]
    );

    // if the modification was unsuccessful
    if (result.affectedRows === 0) {
      return res.status(500).json({ message: "Jelszó frissítése sikertelen" });
    };

    // return updated user data
    return res.status(200).json({
      id: users[0].id,
      name: users[0].name,
      email: users[0].email,
      admin: users[0].admin,
    });

  } catch (err) {

    // server error
    console.log("Jelszó módosítási hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  };
});

// profile
app.put("/profile", async (req, res) => {

  // get id, name and email from the request body
  const { id, name, email } = req.body;

  // checking required fields
  if (!name || !email ) {
    return res.status(400).json({ message: "Név és email megadása kötelező" });
  };

  try {

    // check if anyone else is using this email
    const [existingUsers]: any = await db.query(
      `SELECT id 
        FROM users 
        WHERE email = ? AND id != ?`,
      [email, id]
    );

    // if it is in use we return with an error
    if (existingUsers.length > 0) {
      return res.status(409).json({ message: "Ez az email már használatban van" });
    };

    // update user data
    const [result]: any = await db.query(
      `UPDATE users 
       SET name = ?, 
           email = ? 
       WHERE id = ?`,
      [name, email, id]
    );

    // modification error
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Felhasználó nem található" });
    };

    // return updated user data
    return res.status(200).json({
      id,
      name,
      email,
    });

  } catch (err) {

    // server error
    console.log("Módosítási hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  };
});

// register
app.post("/register", async (req, res) => {

  // get name, email and password from the request body
  const { name, email, password } = req.body;

  // checking required fields
  if (!name || !email || !password) {
    return res.status(400).json({ message: "Név, email és jelszó megadása kötelező" });
  };

  try {

    // check if email already exists
    const [existingUsers]: any = await db.query(
      `SELECT id 
        FROM users 
       WHERE email = ?`,
      [email]
    );

    // if it does exist we return with an error
    if (existingUsers.length > 0) {
      return res.status(409).json({ message: "Ez az email már regisztrálva van" });
    };

    // insert new user into database
    const [result]: any = await db.query(
      `INSERT INTO users (name, email, password) 
       VALUES (?, ?, ?)`,
      [name, email, password]
    );

    // return newly created user data
    return res.status(201).json({
      id: result.insertId,
      name,
      email,
    });

  } catch (err) {

    // server error
    console.log("Register hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

// reservation
app.post("/reservation", async (req, res) => {
  const { user_id, screening_id, reservation_date, pairs } = req.body;

  if (!user_id || !screening_id || !reservation_date || !pairs?.length) {
    return res.status(400).json({ message: "Hiányzó adatok" });
  }

  try {
    for (const pair of pairs) {

      await db.query(
        `INSERT INTO reservation (user_id, screening_id, seat_id, ticket_id, total_amount, reservation_date)
         VALUES (?, ?, ?, ?, ?, ?)`,
        [user_id, screening_id, pair.seat_id, pair.ticket_id, pair.total_amount, reservation_date]
      );
    }

    return res.status(201).json({ message: "Foglalás sikeres!" });
  } catch (err) {
    console.log("Foglalási hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

// get reservations
app.get("/getReservations", async (req, res) => {
  try {

    const [rows] = await db.query(
      `SELECT id,
              user_id,
              screening_id,
              seat_id,
              ticket_id,
              total_amount,
              reservation_date
        FROM reservation`
    );

    return res.status(200).json(rows);
  } catch (err) {
    console.log("Foglalás lekérési hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

// start the server at the port variable's location
app.listen(port, () => {

  // we log out that the server is running at this port
  console.log(`Server listening at http://localhost:${port}`);
});