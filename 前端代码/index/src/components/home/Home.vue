<template>
    <div>
        <LoginHead></LoginHead>
        <component :is="componentName"></component>
    </div>
</template>
<script>
import LoginHead from '@/components/login/LoginHead.vue';
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
 
  components: {
      MobileHome,
      TableHome,
      LoginHead
  }
}
</script>

<style scoped lang="scss">

</style>