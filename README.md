# <center> CosmoScreen Adminisztratív felülete (C# - WPF)

> *„Ahol minden képkocka egy új világ!”*

---

## Projekt áttekintés
A **CosmoScreen WPF** a weboldal adminisztratív felülete, amely lehetővé teszi az adatok kezelését és karbantartását.

---

## Funkciók
- **CRUD műveletek**: Adatok megtekintése, módosítása, felvétele és törlése a következő táblákon:
  - Felhasználók
  - Büfé
  - Filmek
  - Színészek
- **Installer**: A későbbiekben elérhető lesz, amivel egyszerűen telepíthető a szoftver. A letöltés és telepítés csak adminisztrátorok számára engedélyezett.

---

## Csapat

| Szerep | Név |
|--------|-----|
| **Projektvezető** | Fodor Adrián László |
| **Tagok** | Kriván Balázs, Fodor Adrián László |

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