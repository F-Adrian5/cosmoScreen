import { Router } from "express";
import { query } from "../db.ts";

const router = Router();

// Send put request to /profile
router.put("/profile", async (req, res) => {

  // Get id, name and email from the request body
  const { id, name, email } = req.body;

  // Checking required fields
  if (!name || !email ) {
    return res.status(400).json({ message: "Név és email megadása kötelező" });
  }

  try {

    // Check if anyone else is using this email
    const existingUsers: any[] = await query(
      "SELECT id FROM users WHERE email = ? AND id != ?",
      [email, id]
    );

    // If it is in use we return with an error
    if (existingUsers.length > 0) {
      return res.status(409).json({ message: "Ez az email már használatban van" });
    }

    // Update user data into database
    const result: any = await query(
      "UPDATE users SET name = ?, email = ? WHERE id = ?",
      [name, email, id]
    )

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Felhasználó nem található" });
    };


    // Return updated user data
    return res.status(200).json({
      id,
      name,
      email,
    });

  } catch (err) {

    // Modification error
    console.error("Módosítási hiba:", err);

    // Generic server error
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

export default router;
