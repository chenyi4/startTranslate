import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router';
import './assets/all.scss';

Vue.use(VueRouter);

Vue.config.productionTip = false;
const Foo = {template: `<div class="foo">
                          <div class="test-demo">测试内容</div>
                          foo
                        </div>`};
const Bar = { template: '<div>bar</div>' };

const routes = [
  { path: '/foo', component: Foo },
  { path: '/bar', component: Bar }
];

const router = new VueRouter({
    routes // short for `routes: routes`
});

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')


