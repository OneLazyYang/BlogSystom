import Vue from 'vue'
import VueRouter from 'vue-router'
import LoginView from '@/views/LoginView.vue'
import RegisterView from "@/views/RegisterView.vue"
import LayoutView from '@/views/Layout.vue'
import UserView from '@/views/UserView.vue'
import PostView from '@/views/PostView.vue'
import BlogView from '@/views/BlogView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: LoginView
  },
  {
    path: '/register',
    name: 'Register',
    component: RegisterView
  },
  {
    path: '/layout',
    name: 'Layout',
    component: LayoutView,
    children:[
      {
        path: '/user',
        name: 'user',
        component: UserView
      },
      {
        path: '/post',
        name: 'post',
        component: PostView
      },
      {
        path: '/blog',
        name: 'blog',
        component: BlogView
      },
    ]
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
