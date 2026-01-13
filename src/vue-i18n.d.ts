import { ComponentCustomProperties } from 'vue';
import language from '@/languages/language';

declare module '@vue/runtime-core' { // needed to avoid errors
  interface ComponentCustomProperties {
    $t: typeof language.t;
    $setLang: typeof language.setLang;
    $lang: typeof language.state;
  }
}
