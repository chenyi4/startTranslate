<template>
    <div>
        <div @click="gotoLogin" class="login">login</div>
        <component :is="componentName"></component>
        <!-- <TableHome></TableHome>
        <MobileHome></MobileHome> -->
    </div>
</template>
<script>

import MobileHome from './MobileHome.vue';
import TableHome from './TableHome.vue';

export default {
  name: 'Home',
  props: {
    msg: String
  },
  data() {
      return {
          componentName: 'TableHome'
      }
  },
  created(){
      const self = this;
      if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
          self.componentName = 'MobileHome';
      }else{
          self.componentName = 'TableHome';
      }
  },
  methods:{
      gotoLogin(){
           this.$router.push({
                path: 'login',
           });
      }
  },
  components: {
      MobileHome,
      TableHome
  }
}
</script>

<style scoped lang="scss">

</style>