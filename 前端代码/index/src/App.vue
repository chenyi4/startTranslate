<template>
  <div id="app">
    <!-- <img alt="Vue logo" src="./assets/logo.png"> -->
    <MobileHome></MobileHome>
    <!-- <HelloWorld msg="Welcome to Your Vue.js App"/> -->
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import MobileHome from './components/MobileHome.vue';
import { panel } from '@/api/index'

const back = panel.save({
   type: "all",
  });

back.then((value) => {
  console.log(value);
});
export default {
  name: 'App',
  components: {
    HelloWorld,
    MobileHome
  }
}
</script>

<style lang="scss">
body{
  padding: 0px;
  margin: 0px;
  background: #624b5d;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  
}
</style>
