import Vue from 'vue';
import Vuex from 'vuex';
import moduleTest from './testList.js';
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {

    },
    modules: {
      moduleTest: moduleTest
    },
    mutations: {
      increment (state) {
        state.count++
      }
    }
  });

  export default store;