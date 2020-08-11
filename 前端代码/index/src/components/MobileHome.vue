<template>
  <div class="home">
      <img  src="./../assets/mobile.jpg">
      <div class="box">
          <div class="line">202007</div>
          <div class="line">202007</div>
          <div class="line">202007</div>
          <div class="line">202007</div>
          <div class="line">202007</div>
          <div class="line">202007</div>
      </div>
  </div>
</template>

<script>
export default {
  name: 'MobileHome',
  props: {
    msg: String
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.home{
    width: 100%;
    background: #908cd6;
    box-sizing: border-box;
    position: relative;
    // padding: 20px 30px;
    img{
        width: 100%;
    }
    .box{
        width: 100%;
        background: #908cd6;
        position: absolute;
        top: 74px;
        opacity: 1;
        padding: 24px 0px;
        .line{
            width: 77%;
            position: relative;
            left: 11.5%;
            text-align: left;
            color: white;
            font-size: 27px;
            // padding: 8px 0px;
            padding-top: 12px;
            padding-bottom: 7px;
            border-bottom: 1px solid white;
        }
    }
}
</style>
