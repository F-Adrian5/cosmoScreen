import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import BuffetView from '../views/BuffetView.vue'
import AboutView from '../views/AboutView.vue'
import ProgramListView from '../views/ProgramListView.vue'
import DataFishingView from '../views/DataFishingView.vue'
import RulesView from '../views/RulesView.vue'
import LoginView from '../views/LoginView.vue'
import RegisterView from '../views/RegisterView.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/buffet',
      name: 'buffet',
      component: BuffetView,
    },
    {
      path: '/programList',
      name: 'programList',
      component: ProgramListView,
    },
    {
      path: '/DataFishing',
      name: 'dataFishing',
      component: DataFishingView,
    },
    {
      path: '/rules',
      name: 'rules',
      component: RulesView,
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView,
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView,
    },
  ],
})

export default router
