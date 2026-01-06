// importing styles
import './assets/styles/main.css'
import './assets/styles/footer.css'
import './assets/styles/programList.css'
import './assets/styles/navbar.css'
import './assets/styles/login.css'
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
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// fontawesome icons
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'

// i18n
import { i18n } from './i18n';

// adding icons to the global libary
library.add(fas, far, fab)

// create app
const app = createApp(App)

app.component('font-awesome-icon', FontAwesomeIcon)

// connecting pinia to the app
app.use(createPinia())

// connecting router to the app
app.use(router)

// connecting i18n to ta app
app.use(i18n);

// mounting the application
app.mount('#app')