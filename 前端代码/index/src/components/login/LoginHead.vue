<template>
    <div class="login"> 
            <div class="person-icon" @click="gotoLogin">
                <div class="head"></div>
                <div class="buttom"></div>
            </div>
        </div>
</template>
<script>
export default {
  name: 'Home',
  props: {
    msg: String
  },
  methods:{
      gotoLogin(){
        this.$router.push({
            path: 'login',
        });
      }
  }
}

</script>