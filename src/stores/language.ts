import { defineStore } from 'pinia'
import translations from '../languages/language.json'

type Language = 'hu' | 'en'

interface Translations {
  [lang: string]: any 
}

export const useLanguageStore = defineStore('language', {
  state: () => ({
    currentLang: (localStorage.getItem('lang') as Language) || 'hu',
    translations: translations as Translations
  }),
  getters: {
    t: (state) => {
      return (path: string): string => {
        return path.split('.').reduce((obj: any, key: string) => {
          return obj && obj[key] ? obj[key] : key
        }, state.translations[state.currentLang])
      }
    }
  },
  actions: {
    setLanguage(lang: Language) {
      this.currentLang = lang
      localStorage.setItem('lang', lang)
    }
  }
})
