import { createI18n } from 'vue-i18n'
//import en from './languages/en.json'

export const i18n = createI18n({
  legacy: false,          
  locale: 'hu',            
  fallbackLocale: 'hu',
  messages: {
    //en: en as Record<string, string>
  }
})
