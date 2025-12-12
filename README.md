# <center> CosmoScreen

> *„Ahol minden képkocka egy új világ!”*

---

## Projekt áttekintés
A **CosmoScreen** egy modern, elegáns **mozis weboldal**, amely bemutatja az aktuális előadásokat, kezeli a műsorokat, és lehetőséget biztosít az online jegyvásárlásra.  
Célja, hogy a moziélményt digitálisan is elérhetővé tegye a látogatók számára.

`Bővebb leírás a dokumentációban található!`

---

## Frontend
- **Keretrendszer:** [Vue.js](https://vuejs.org/)
- **Állapotkezelés:** [Pinia](https://pinia.vuejs.org/)
- **HTTP kliens:** [Axios](https://axios-http.com/)
- **Design rendszer:** [Bootstrap](https://getbootstrap.com/)

---

## Backend
- **Nyelv:** Express.js  
- **Adatbázis:** MySQL + phpMyAdmin

---

## Csapat

| Szerep | Név |
|--------|-----|
| **Projektvezető** | **Fodor Adrián László** |
| **Tagok** | **Kriván Balázs, Fodor Adrián László** |

---

## Eszközök és technológiák

| Kategória | Eszköz |
|------------|--------|
| Frontend | Vue.js, Pinia, Axios |
| Design | Bootstrap, FontAwesome (svg-core, svg-icons, vue-fontawesome) |
| Backend | Express.js |
| Adatbázis | MySQL + phpMyAdmin |
| Verziókezelés | Git / GitHub |

---

# CosmoScreen Projekt Telepítési Útmutató

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

A mappában futtasd a következő parancsot:

```
git clone https://github.com/F-Adrian5/cosmoScreen
```

## 3. Frontend telepítése és futtatása

1. Nyisd meg a terminált a projekt könyvtárában`(cosmoScreen)`.

2. Ha nincs `package.json` a projekt mappában, futtasd: `npm init -y`. Egyébként ugorj a következő lépésre.

3. Telepítsd a szükséges node modulokat: `npm install`

4. Indítsd el a frontend fejlesztői szervert: `npm run dev`

## 4. Backend indítása

1. Navigálj a backend mappába (`cosmoscreen/backend`)

2. Indítsd el az Express.js szervert: `node index.js`

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

---

## Általános futtatási útmutató



---

## Betűtipusok
  - [Forrás](https://www.fontshare.com/)
  - **bespoke-stencil**: [bespoke-stencil] (https://www.fontshare.com/fonts/bespoke-stencil)
  - **nippo**: [Nippo](https://www.fontshare.com/fonts/nippo)

---
## Hivatkozások:
  - **GitHub**: [CosmoScreen](https://github.com/F-Adrian5/cosmoScreen)
  - **Trello**: [Projekt Trello](https://trello.com/b/ADnGrOpg/cosmoscreen)