import { reactive } from "vue";
import hu from "./hu.json";
import en from "./en.json";

//define the language options
type Lang = "hu" | "en";

//store the languages in an object
const messages = { hu, en };

//current language
const state = reactive<{ lang: Lang }>({

  //checks the localstorage for set language if there isnt one the default is hu
  lang: (localStorage.getItem("lang") as Lang) || "hu"
});

//translation function
//key contains the key from the json file
function t(key: string): string {
  return key.split(".").reduce( //split and reduce the key
    (obj: any, k) => obj?.[k], //go through the split key items
    messages[state.lang] //the current language
  ) || key; //if it cant find it it will give back the key
}

//language switch function
function setLang(lang: Lang) {
  state.lang = lang; //sets it to the chosen language
  localStorage.setItem("lang", lang); //save it into the local storage
}

export default { t, setLang, state };
