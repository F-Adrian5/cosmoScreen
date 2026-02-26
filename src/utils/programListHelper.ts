import type { Movie } from "@/types/Movie";

/**
 * This function takes the movies and assigns a random day to each movie
 * @param {Movie} movieList, takes the movies as a type
 * @param {string[]} days, takes the days
 * @returns {Movie} 
 */
export function createScreeningDays(movieList: Movie[], days: string[]) {
  
  // creating the random days and assigning them to the movies
  for (let i = 0; i < movieList.length; i++) {
    let randomValue = Math.floor(Math.random() * 7); // 0-6 M-S
    let randomDay = days[randomValue];

    // kiszelektál egy random napot -> egy forral át kell menni
    // a mondjuk hétfőn és ott idő rendi sorrendbe rakni,
    // Ha 2 film ütközik akkor az egyiket kivesszük és átrakjuk egy
    // másik listába, mikor végig mentünk az összes napon akkor
    // megnézzük melyik filmeket nem tudtunk elhelyezni és átmegyünk 
    // azon a listán és (valahogy) megpróbáljuk beilleszteni 
    // (megnézzük hogy az adott napban valamelyik film bele illeszthető e)
    // ha igen beleillesszük, ha nem akkor megyünk tövább
    // --------------------------------------------------------
    // Mi lesz ha 2 filmet is be tudunk illeszteni? -> akkor félretesszük
    // öket és majd a végén megnézzük hogy melyik hova a legjobb fit.
    // Ha van olyan film amit nem tudunk sehova sem elhelyezni akkor azt
    // csak a consolra kiirjuk, hogy tudja a fejlesztő
    // -> !Minimum 5 film legyen egy nap, ne legyen az 
    // hogy 1 nap 40 film van és a többinél meg alig
    // -------------------------------------------------------
    // Napok feltöltése: elsőnek minden napot feltöltök a minimum filmmel
    // - utánna meg amennyi film marad azt helyesen feltöltöm
    // ------------------A legnagyobb logikai gubanc-----------
    // most: Először random → majd javítgatjuk
    // helyes: Először szabály → azon belül random
    // optimalizálás fontossága: Egyenletes napi eloszlás? Időütközésmentesség?
    // -------------Konkrét logikai problémák a kommented alapján---------
    // > Ha kevés a film, ez matematikailag lehetetlen lehet.
    // - Meg kell nézni hogy az összes film amit vetitünk azt ha a napokkal
    //   elosztom akkor az több e mint 5, ha nem akkor a filmeket osztom
    //   a napokkal és ha mondjuk 3.85 jön ki akkor a minimum 3 legyen,
    //   a maradék meg random megy be, néha 4 néha 3 film lesz.
    // > 
    /* 2. Utólagos beillesztés komplexitása
       3. „Ha nem tudjuk elhelyezni, kiírjuk console-ra”
            Logikailag az azt jelenti:
            → az algoritmus nem garantál megoldást
            Ez productionben veszélyes lehet.

            9️⃣ Összegzés
          
        A gondolkodásod jó irány:
          
        ✔ külön lista ütközőknek
        ✔ több körös beillesztés
        ✔ fallback kezelés
        ✔ minimum constraint
          
        De:
          
        ⚠️ a random → majd javítjuk modell instabil
        ⚠️ minimum constraint jelenleg nem garantált
        ⚠️ több jó fit kezelése kombinatorikusan robbanhat
        ⚠️ könnyen nagyon komplex és nehezen debugolható lesz


    */

    // !. means that the programmer knows that the value won't be null!
    movieList[i]!.screeningDay = randomDay;
  }

  // returning the random movieList
  return movieList;
}



//--------------------------------------------

// NOT WORKING, semi good
// export function createScreeningDays(movieList: Movie[],days: string[]) {
//   const shuffledDays = shuffleArray(days);
//   for (let i = 0; i < movieList.length; i++) {

//     let currentMovie = movieList[i];
//     let dayFound = false;

//     // végigmegyünk az összes napon
//     for (let d = 0; d < shuffledDays.length; d++) {

//       let currentDay = shuffledDays[d];
//       let conflictFound = false;

//       // megnézzük az összes többi filmet
//       for (let j = 0; j < movieList.length; j++) {

//         let otherMovie = movieList[j];

//         // ne önmagát hasonlítsa
//         if (i === j) continue;

//         // csak akkor érdekes ha:
//         // - ugyanaz a terem
//         // - már kapott napot
//         if (
//           otherMovie?.room_id === currentMovie?.room_id &&
//           otherMovie?.screeningDay === currentDay
//         ) {

//           // idő ütközés ellenőrzés
//           if (timesOverlap(currentMovie!, otherMovie!)) {
//             conflictFound = true;
//             break;
//           }
//         }
//       }

//       // ha nem találtunk konfliktust, jó ez a nap
//       if (!conflictFound) {
//         currentMovie!.screeningDay = currentDay;
//         dayFound = true;
//         break;
//       }
//     }

//     if (!dayFound) {
//       console.log("Nem találtunk megfelelő napot:", currentMovie?.movie_title);
//     }
//   }

//   return movieList;
// }

// function shuffleArray<T>(array: T[]): T[] {
//   return [...array].sort(() => Math.random() - 0.5);
// }

// function timesOverlap(a: Movie, b: Movie): boolean {

//   const aStart = convertToMinutes(a.start);
//   const aEnd = convertToMinutes(a.end);

//   const bStart = convertToMinutes(b.start);
//   const bEnd = convertToMinutes(b.end);

//   if (aStart < bEnd && bStart < aEnd) {
//     return true;
//   }

//   return false;
// }

// function convertToMinutes(time: string): number {
//   let parts = time.split(':');
//   let hours = Number(parts[0]);
//   let minutes = Number(parts[1]);

//   return hours * 60 + minutes;
// }