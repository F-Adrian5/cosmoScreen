import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import BuffetView from '../views/BuffetView.vue'
import AboutView from '../views/AboutView.vue'
import ProgramList from '../views/ProgramListView.vue'

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
      component: ProgramList,
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView,
    },
  ],
})

export default router
