import Vue from 'vue';
import Vuex from 'vuex';
import moduleTest from './testList.js';
import allWords from './allWords.js';
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {

    },
    modules: {
      moduleTest: moduleTest,
      allWords: allWords
    },
    mutations: {
      increment (state) {
        state.count++
      }
    }
  });

  export default store;