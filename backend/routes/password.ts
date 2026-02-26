import { Router } from "express";
import { query } from "../db.ts";

const router = Router();

// Send put request to /password
router.put("/password", async (req, res) => {

  // Get id and new password from request body
  const { id, new_password } = req.body;

  // Check required fields
  if (!id || !new_password) {
    return res.status(400).json({ message: "Hiányzó adatok" });
  }

  try {

    // Check if user exists
    const users: any[] = await query(
      "SELECT id, name, email FROM users WHERE id = ?",
      [id]
    );

    if (users.length === 0) {
      return res.status(404).json({ message: "Felhasználó nem található" });
    }

    // Update password
    const result: any = await query(
      "UPDATE users SET password = ? WHERE id = ?",
      [new_password, id]
    );

    // Modify error
    if (result.affectedRows === 0) {
      return res.status(500).json({ message: "Jelszó frissítése sikertelen" });
    }

    // Return updated user data
    return res.status(200).json({
      id: users[0].id,
      name: users[0].name,
      email: users[0].email,
    });

  } catch (err) {

    // Server error
    console.error("Jelszó módosítási hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

export default router;