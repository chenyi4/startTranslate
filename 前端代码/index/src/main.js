import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router';
import DetailList from './components/transDetail/DetailList.vue';
import Login from './components/login/Login.vue';
import Home from './components/home/Home.vue';
import store from './store'
import './assets/all.scss';


const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter);    

Vue.config.productionTip = false;
// const Foo = {template: DetailList};
const Bar = { template: '<div>bar</div>' };

const routes = [
  { path: '/article', component: DetailList },
  { path: '/', component: Home },
  { path: '/login', component: Login}
];     

const router = new VueRouter({
    routes // short for `routes: routes`
});

new Vue({
  router,
  store: store,
  render: h => h(App),
}).$mount('#app')


