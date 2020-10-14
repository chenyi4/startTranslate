<template>
  <div class="home">
      <!-- <img  src="./../assets/mobile.jpg"> -->
      <div class="box">
          <div class="more">more</div>
          <div class="box-size">
            <div class="line">202007</div>
            <div class="line">202007</div>
            <div class="line">202007</div>
            <div class="line">202007</div>
            <div class="line">202007</div>
            <div class="line">202007</div>
          </div>
          <div class="square">
          </div>  
          <div class="textShow">
              <div class="left-name">Translate</div>
              <div class="right-name">翻译</div>
          </div>
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
    background: #624b5d;
    box-sizing: border-box;
    position: relative;
    display: none;
    // padding: 20px 30px;
    img{
        width: 100%;
    }
    .box{
        width: 100%;
        // background: #908cd6;
        top: 34px;
        opacity: 1;
        .more{
            right: 10px;
            font-size: 23px;
            text-align: right;
            position: relative;
            color: white;
            font-weight: bold;
            margin-bottom: 3px;
        }
        .box-size{
            background: #908cd6;
            padding: 24px 0px;
        }
        .line{
            width: 77%;
            position: relative;
            left: 11.5%;
            text-align: left;
            color: white;
            box-sizing: border-box;
            padding-left: 33px;
            font-size: 6.5vw;
            padding-top: 3.2vw;
            padding-bottom: 1.7vw;
            border-bottom: 1px solid white;
            &:after{
                content: '';
                position: absolute;
                width: 13px;
                height: 13px;
                background: white;
                top: 18px;
                left: 2px;
                border-radius: 13px;
            }
        }
        .square{
            width: 0;
            height: 55px;
            border-top: 113px solid transparent;
            border-right: 100vw solid #908cd6;
            border-left: 0px solid transparent;
            transform: rotate(180deg);
            position: relative;
            top: -1px;
        }
        .textShow{
            width: 100%;
            height: 168px;
            position: absolute;
            bottom: 0px;
            left: 0px;
            .left-name{
                position: absolute;
                top: 20px;
                font-size: 22px;
                color: white;
                left: 7.5%;
            }
            .right-name{
                position: absolute;
                top: 20px;
                font-size: 20px;
                color: white;
                right: 5.5%;
            }
        }
    }
}
@media screen and (max-width: 590px) {
    .home {
        display: block;
    }
}
</style>
