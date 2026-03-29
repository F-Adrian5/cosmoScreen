import { Router } from "express";
import { query } from "../db.ts";

const router = Router();

// Send post request to /login
router.post("/login", async (req, res) => {

  // Get email and password from the request body
  const { email, password } = req.body;

  //Checking email and password
  if (!email || !password) {
    return res.status(400).json({ message: "Email és jelszó megadása kötelező" });
  };

  try {

    // Get user by email
    const rows: any[] = await query(
      "SELECT id, name, email, password, admin FROM users WHERE email = ?",
      [email]
    );

    // If there is no match we return with an error
    if (!rows || rows.length === 0) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    };

    // Select user
    const user = rows[0];

    //Check if the provided password matches with the stored password
    if (password !== user.password) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    };

    // Return users data
    return res.json({
      id: user.id,
      name: user.name,
      email: user.email,
      admin: user.admin,
    });

  } catch (err) {

    // Login error
    console.error("Login hiba:", err);

    // Generic server error
    return res.status(500).json({ message: "Szerver hiba" });
  };
});

export default router;