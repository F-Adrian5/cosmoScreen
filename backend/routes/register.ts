import { Router } from "express";
import { query } from "../db.ts";

const router = Router();

// Send post request to /register
router.post("/register", async (req, res) => {

  // Get name, email and password from the request body
  const { name, email, password } = req.body;

  // Checking required fields
  if (!name || !email || !password) {
    return res.status(400).json({ message: "Név, email és jelszó megadása kötelező" });
  };

  try {

    // Check if email already exists
    const existingUsers: any[] = await query(
      "SELECT id FROM users WHERE email = ?",
      [email]
    );

    // If it does exist we return with an error
    if (existingUsers.length > 0) {
      return res.status(409).json({ message: "Ez az email már regisztrálva van" });
    };

    // Insert new user into database
    const result: any = await query(
      "INSERT INTO users (name, email, password) VALUES (?, ?, ?)",
      [name, email, password]
    );

    // Return newly created user data
    return res.status(201).json({
      id: result.insertId,
      name,
      email,
    });

  } catch (err) {

    // Registration error
    console.error("Register hiba:", err);

    // Generic server error
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

export default router;