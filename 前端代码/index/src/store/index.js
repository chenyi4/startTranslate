import Vue from 'vue';
import Vuex from 'vuex';
import moduleTest from './testList.js';
import allWords from './allWords.js';
import allArticles from './allArticles.js';
Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
    },
    modules: {
      moduleTest: moduleTest,
      allWords: allWords,
      allArticles: allArticles
    },
    mutations: {
      increment (state) {
        state.count++
      }
    }
  });

  export default store;