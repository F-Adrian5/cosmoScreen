import { ComponentCustomProperties } from 'vue';
import language from '@/languages/language';

declare module '@vue/runtime-core' { //needed to avoid errors
  interface ComponentCustomProperties {
    $t: typeof language.t; //set the type of the translation function to the same as language.t
    $setLang: typeof language.setLang; //set the type of the language switch function to the same as language.setLang  
    $lang: typeof language.state; //set the type of $lang to the same as language.state
  }
}
