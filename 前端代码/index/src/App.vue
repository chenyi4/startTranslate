<template>
  <div id="app">
    <!-- 路由视图显示 -->
    <transition :name="transitionName">
        <router-view></router-view>
    </transition>
     <!-- <div @click="changeRouter">测试路由跳转</div> -->
    <!-- 测试内容 -->
    
    <!-- <TableHome></TableHome>
    <MobileHome></MobileHome> -->
    <!-- +++ -->
    <!-- <DetailList></DetailList> -->
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
export default {
  name: 'App',
  components: {
      
  },
  data(){
    return {
      transitionName: 'change-frame',
      isSet: false
    }
  },
  created(){
     document.getElementById("loading").style.display = "none";
  },
  methods: {
    changeRouter(){
      const self = this;
      this.isSet = !this.isSet;
      
    }   
  },
  beforeRouteUpdate (to, from, next) {
      this.transitionName = "change-frame";
      next();
  },
  watch: {
    '$route' (to, from) {
        
    }
  },
  destroyed(){
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
