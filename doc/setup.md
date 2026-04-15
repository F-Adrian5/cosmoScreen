[README](../README.md) • [Futtatás](./run.md) • [Frontend](./frontend.md) • [Backend](./backend.md)

# <center> Telepítési Útmutató

## 0. Előfeltételek – szükséges szoftverek

Győződj meg róla, hogy az alábbi szoftverek telepítve vannak a számítógépedre:

- **Git** – [Git letöltése](https://git-scm.com/downloads)  
- **Node.js** – [Node.js letöltése](https://nodejs.org/)  
- **XAMPP** – [XAMPP letöltése](https://www.apachefriends.org/index.html)

---

## 1. Projekt mappa létrehozása

  1. Válassz egy tetszőleges helyet a számítógépeden a projekt számára.
  2. Nyiss egy terminált vagy Git Bash-t abban a mappában.

---

## 2. Projekt letöltése GitHub-ról

  A mappában egy terminál segítségével futtasd a következő parancsot:

  ```
  git clone https://github.com/F-Adrian5/cosmoScreen
  ```

## 3. Frontend telepítése és futtatása

### A projekt klónozása után a függőségek telepítése szükséges:

  1. Nyisd meg a terminált a projekt könyvtárában`(cosmoScreen)`.

  2. Telepítsd a szükséges node modulokat:

  ``` bash 
  npm install
  ```

  3. Indítsd el a frontend fejlesztői szervert: 

  ``` bash 
  npm run dev
  ```

## 4. Backend indítása

  1. Navigálj a backend mappába (`cosmoscreen/backend`)

  2. Indítsd el az Express.js szervert:

  ``` bash 
  npm run dev
  ```

## 5. Adatbázis telepítése és konfigurálása

  1. Indítsd el az XAMPP alkalmazást, és startold az Apache és MySQL modulokat.

  2. Nyisd meg a phpMyAdmin-t (a "MySQL Admin" gombra kattintva).

  3. Hozd létre az adatbázist:
      - Kattints a New gombra
      - Add meg a névnek: `cosmoscreen`
      - Állítsd be a karakterkészletet: `utf8_general_ci`
      - Kattints a Create gombra.

  4. Az adatbázis feltöltése:
      - Lépj az Import fülre.
      - Válaszd ki a `cosmoscreen.sql` fájlt. A fájlt a `cosmoscreen/backend/db`, mappában található. 
      - Kattints az Import gombra a feltöltéshez.