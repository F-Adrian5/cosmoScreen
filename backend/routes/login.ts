import { Router } from "express";
import { query } from "../db.ts";

const router = Router();

router.post("/login", async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: "Email és jelszó megadása kötelező" });
  }

  try {
    const rows: any[] = await query(
      "SELECT id, name, email, password, admin FROM users WHERE email = ?",
      [email]
    );

    if (!rows || rows.length === 0) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    }

    const user = rows[0];

    if (password !== user.password) {
      return res.status(401).json({ message: "Hibás email vagy jelszó" });
    }

    return res.json({
      id: user.id,
      name: user.name,
      email: user.email,
      admin: user.admin,
    });

  } catch (err) {
    console.error("Login hiba:", err);
    return res.status(500).json({ message: "Szerver hiba" });
  }
});

export default router;
