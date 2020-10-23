<template>
  <div id="app">
    <!-- 路由视图显示 -->
    <transition :name="transitionName">
        <router-view></router-view> 
    </transition>
     <div @click="changeRouter">测试路由跳转</div>
    <!-- 测试内容 -->
    
    <!-- <TableHome></TableHome>
    <MobileHome></MobileHome> -->
    <!-- +++ -->
    <!-- <DetailList></DetailList> -->
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import MobileHome from './components/MobileHome.vue';
import TableHome from './components/TableHome.vue';

import DetailList from './components/DetailList.vue';
import { panel } from '@/api/index';

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
    MobileHome,
    TableHome,
    DetailList
  },
  data(){
    return {
      transitionName: 'change-frame',
      isSet: false
    }
  },
  methods: {
    changeRouter(){
      const self = this;
      this.isSet = !this.isSet;
      this.$router.push({
          path: self.isSet?'foo':'/'
      });
    }   
  },
  beforeRouteUpdate (to, from, next) {
      this.transitionName = "change-frame";
      next();
  },
  watch: {
    '$route' (to, from) {

    }
  }
}
</script>
<style lang="scss">
body{
  padding: 0px;
  margin: 0px;
  background: white
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  // margin-top: 60px;
  
}
@media screen and (max-width: 590px) {
  body{
    background: #624b5d;
  }
}


</style>
