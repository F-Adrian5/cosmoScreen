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

    // !. means that the programmer knows that the value won't be null!
    movieList[i]!.screeningDay = randomDay;
  }
  
  // returning the random movieList
  return movieList;
}