# <center> CosmoScreen Adminisztratív felülete (C# - WPF)

> *„Ahol minden képkocka egy új világ!”*

---

## Projekt áttekintés
A **CosmoScreen WPF** a weboldal Adminisztratív felülete, amely lehetővé teszi az adatok megtekintését, feltöltését, módosítását és törlését.

---

## Funkciók
- **CRUD műveletek**: Adatok megtekintése, módosítása, felvétele és törlése a következő táblákon:
  - Felhasználók
  - Büfé
  - Filmek
  - Színészek
- **Installer**: Elérhető, a telepítési útmutató a "Projekt telepítése és elindítása" cím alatt található! A bejelentkezés csak is Adminisztrátorok számára engedélyezett.

---

## Csapat

| Szerep | Név |
|--------|-----|
| **Projektvezető** | Fodor Adrián László |
| **Projekt tag** | Kriván Balázs |

---

## Projekt telepítése és elindítása

### Adatbázis beállítása

1. Indítsa el a **XAMPP** alkalmazást.
2. A vezérlőpulton indítsa el az alábbi szolgáltatásokat:
   - Apache
   - MySQL
3. Nyissa meg a **phpMyAdmin** felületet.
4. Hozzon létre egy új adatbázist az alábbi adatokkal:
   - **Adatbázis neve:** cosmoscreen
   - **Kódolás:** utf8_general_ci
5. Az adatbázis létrehozása után importálja a mellékelt **cosmoscreen.sql** fájlt.

---

### A program telepítése

1. Csomagolja ki a kapott **ZIP** fájlt.
2. Nyissa meg a kicsomagolt **cosmoscreen** mappát.
3. Nyissa meg a következő mappákat:
4. A **Debug** mappában indítsa el a **setup.exe** fájlt.
5. A telepítő ablakban minden lépésnél kattintson a **Next** gombra.
6. A telepítés végén kattintson a **Close** gombra.

---

### A program indítása

1. A telepítés után keresse meg az asztalon a **cosmoscreen.exe** fájlt.
2. A program indításához kattintson rá **dupla kattintással**.

---

### ⚠️ A felület használatára Adminisztrátori jogosultságra van szüksége!