// importing styles
import './assets/styles/main.css'
import './assets/styles/footer.css'
import './assets/styles/programList.css'
import './assets/styles/navbar.css'
import './assets/styles/login.css'
import './assets/styles/buffet.css'
import './assets/styles/aboutUs.css'
import './assets/fonts/bespokeStencil/bespoke-stencil.css'
import './assets/fonts/nippo/nippo.css'

// import vue and pinia
import { createApp } from 'vue'
import { createPinia } from 'pinia'

// bootstrap
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'

// root components
import App from './App.vue'
import router from './router'

// fontawesome
import '@fortawesome/fontawesome-free/css/all.min.css'

// languages
import language from '@/languages/language'

// create app
const app = createApp(App)


// connecting pinia to the app
app.use(createPinia())

// connecting router to the app
app.use(router)

// connecting i18n to ta app
app.config.globalProperties.$t = language.t;
app.config.globalProperties.$setLang = language.setLang;
app.config.globalProperties.$lang = language.state;

// mounting the application
app.mount('#app')