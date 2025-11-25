# 🎭 CosmoScreen

> *„Ahol minden képkocka egy új világ!”*

---

## 🌌 Projekt áttekintés
A **CosmoScreen** egy modern, elegáns **mozis weboldal**, amely bemutatja az aktuális előadásokat, kezeli a műsorokat, és lehetőséget biztosít az online jegyvásárlásra.  
Célja, hogy a moziélményt digitálisan is elérhetővé tegye a látogatók számára.

---

## 🎬 Főbb funkciók

- 👤 **Felhasználói fiókok kezelése**
  - Regisztráció, bejelentkezés, kijelentkezés  
  - Profiladatok módosítása
  - Admin jogosultságok (felhasználók kezelése)

- 🎥 **Filmkatalógus**
  - Filmek adatlapja (leírás, műfaj, korhatár, szereplők, előzetes...)  
  - Filmek keresése és szűrése (műfaj, korhatár, vetítési időpont...)  
  - Gyorstalpaló 

- 🗓️ **Vetítési naptár**
  - Általános vetítési kalendárium  
  - Időpontok és helyszínek megjelenítése  
  - Szűrési lehetőségek  

- 🎟️ **Jegyfoglalás és vásárlás**
  - Online jegyfoglalás  
  - Vizuális ülőhelyválasztás  
  - Kosárkezelés, fizetési felület 

- 🧑‍💼 **Admin felület (C#)**
  - Filmek, szereplők kezelése  
  - Vetítési időpontok és tartalom frissítése
  - Felhasználói adatok szerkesztése

- 🍿 **Büfé kínálat**
  - Aktuális árlista és termékkínálat megtekintése  

- 🌟 **Moziélmény bemutató**
  - 4DX, ScreenX, VIP szekciók ismertetése  

- 🌐 **Többnyelvű támogatás**
  - Magyar / Angol nyelvváltás  

- 🔍 **Keresőfunkciók**
  - Filmnév alapján 

- 📱 **Reszponzív felület**
  - Mobil, tablet és asztali megjelenés támogatása  

---

## 🖥️ Frontend
- **Keretrendszer:** [Vue.js](https://vuejs.org/)
- **Állapotkezelés:** [Pinia](https://pinia.vuejs.org/)
- **HTTP kliens:** [Axios](https://axios-http.com/)

---

## 🎨 Design
- **Design rendszer:** [Bootstrap](https://getbootstrap.com/)

---

## ⚙️ Backend
- **Nyelv:** PHP  
- **Adatbázis:** MySQL + phpMyAdmin

---

## 🗂️ Architektúra
- Moduláris Vue komponensek az előadások, műsoridők és jegyfoglalások kezelésére  
- Laravel REST API az előadások, foglalások és felhasználói adatok számára  
- Axios a biztonságos és hatékony kommunikációért a frontend és a backend között  
- Pinia a globális állapot (pl. felhasználói munkamenet, jegykosár) kezelésére  

---

## 👥 Csapat

| Szerep | Név |
|--------|-----|
| 👑 **Projektvezető** | **Fodor Adrián László** |
| 💻 **Tagok** | **Kriván Balázs, Fodor Adrián László** |

---

## 🗃️ Eszközök és technológiák

| Kategória | Eszköz |
|------------|--------|
| Frontend | Vue.js, Pinia, Axios |
| Design | Bootstrap, FontAwesome (svg-core, svg-icons, vue-fontawesome) |
| Backend | PHP |
| Adatbázis | MySQL + phpMyAdmin |
| Verziókezelés | Git / GitHub |

`npm install @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/free-regular-svg-icons @fortawesome/free-brands-svg-icons @fortawesome/vue-fontawesome`

## 📎 Hivatkozások:
  - **GitHub**: [CosmoScreen](https://github.com/F-Adrian5/cosmoScreen)
  - **Trello**: [Projekt Trello](https://trello.com/b/ADnGrOpg/cosmoscreen)