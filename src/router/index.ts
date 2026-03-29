// importing every view
// createRouter: you can create a new router
import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Buffet from '../views/Buffet.vue';
import AboutUs from '../views/AboutUs.vue';
import ProgramList from '../views/ProgramList.vue';
import DataFishing from '../views/DataFishing.vue';
import Rules from '../views/Rules.vue';
import Login from '../views/Login.vue';
import Register from '../views/Register.vue';
import Profile from '../views/Profile.vue';
import Password from '../views/Password.vue';

// creating router object
const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',        // URL
      name: 'home',     // internal name
      component: Home,  // assigning the home component to this URL,to be displayed
      meta: { bg: 'home-bg' }
    },
    {
      path: '/buffet',
      name: 'buffet',
      component: Buffet,
      meta: { bg: 'buffet-bg' }
    },
    {
      path: '/programList',
      name: 'programList',
      component: ProgramList,
      meta: { bg: 'programList-bg' }
    },
    {
      path: '/DataFishing',
      name: 'dataFishing',
      component: DataFishing,
      meta: { bg: 'dataFishing-bg' }
    },
    {
      path: '/rules',
      name: 'rules',
      component: Rules,
      meta: { bg: 'rules-bg' }
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
      meta: { bg: 'login-bg' }
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
      meta: { bg: 'register-bg' }
    },
    {
      path: '/profile',
      name: 'profile',
      component: Profile,
      meta: { bg: 'profile-bg' }
    },
    {
      path: '/password',
      name: 'password',
      component: Password,
      meta: { bg: 'password-bg' }
    },
  ],
});

// exporting router for other pages to use
export default router;