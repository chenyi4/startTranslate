import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router';
import DetailList from './components/DetailList.vue';
import './assets/all.scss';

Vue.use(VueRouter);

Vue.config.productionTip = false;
// const Foo = {template: DetailList};
const Bar = { template: '<div>bar</div>' };

const routes = [
  { path: '/foo', component: DetailList },
  { path: '/bar', component: Bar },
];

const router = new VueRouter({
    routes // short for `routes: routes`
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')


