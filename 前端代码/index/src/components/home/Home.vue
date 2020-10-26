<template>
    <div>
        <TableHome></TableHome>
        <MobileHome></MobileHome>
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
          
      }
  },
  created(){
      const self = this;
      
  },
  components: {
      MobileHome,
      TableHome
  }
}
</script>

<style scoped lang="scss">

</style>