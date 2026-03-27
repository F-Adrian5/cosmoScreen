// importing every view
// createRouter: you can create a new router
import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Buffet from '../views/Buffet.vue'
import AboutUs from '../views/AboutUs.vue'
import ProgramList from '../views/ProgramList.vue'
import DataFishing from '../views/DataFishing.vue'
import Rules from '../views/Rules.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Profile from '../views/Profile.vue'
import Password from '../views/Password.vue'

// creating router object
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',        // URL
      name: 'home',     // internal name
      component: Home,  // assigning the home component to this URL,to be displayed
    },
    {
      path: '/buffet',
      name: 'buffet',
      component: Buffet,
    },
    {
      path: '/programList',
      name: 'programList',
      component: ProgramList,
    },
    {
      path: '/DataFishing',
      name: 'dataFishing',
      component: DataFishing,
    },
    {
      path: '/rules',
      name: 'rules',
      component: Rules,
    },
    {
      path: '/about',
      name: 'about',
      component: AboutUs,
      meta: { bg: 'about-bg' }
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
    },
    {
      path: '/profile',
      name: 'profile',
      component: Profile,
    },
    {
      path: '/password',
      name: 'password',
      component: Password,
    },
  ],
})

// exporting router for other pages to use
export default router