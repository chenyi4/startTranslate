import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router';
import DetailList from './components/DetailList.vue';
import Home from './components/home/Home.vue';
import './assets/all.scss';

Vue.use(VueRouter);

Vue.config.productionTip = false;
// const Foo = {template: DetailList};
const Bar = { template: '<div>bar</div>' };

const routes = [
  { path: '/article', component: DetailList },
  { path: '/', component: Home },
];

const router = new VueRouter({
    routes // short for `routes: routes`
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')


