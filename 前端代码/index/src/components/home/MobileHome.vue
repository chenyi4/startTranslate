<template>
  <div class="home">
      <!-- <img  src="./../assets/mobile.jpg"> -->
      <div :class="{'box':true, 'box-show': isShow}" >
          <div class="more" @click="changePath()">more</div>
          <div class="box-size">
                <div 
                 class="line" 
                 v-for="(item, key) in articles"
                 @click="changePath(item.chunk)"
                 :key="key">{{item.title}}</div>
          </div>
          <div class="square">
          </div>  
          <div class="textShow">
              <div class="left-name">Translate</div>
              <div class="right-name">翻译</div>
          </div>
      </div>
      <div :class="{'loading':true, 'loading-animation':isLoaingAnimation}" v-if="isLoading">
            <div class="demo5">
                <div class="inline-1"></div>
                <div class="inline-2"></div>
                <div class="inline-3"></div>
            </div>
      </div>
  </div>
</template>
<script>
//移动端取5条数据
import { panel } from '@/api/index';

export default {
  name: 'MobileHome',
  props: {
    msg: String
  },
  data() {
      return {
          isShow: true,
          articles: [],
          isLoaingAnimation: false,
          isLoading: true
      }
  },
  beforeRouteEnter (to, from, next) {
        next(vm => {
            
        });
  },
  created(){
      const self = this;
      self.getData();
  },
  methods: {
      getData(){
          const self = this;
          const back = panel.getHome({
               num:5,
               content:0
          });

          back.then((value) => {
             self.articles = value.data;
             self.isLoading = false;
             var time1 = setTimeout(function(){
                 self.isLoaingAnimation = false;
                 self.isShow = false;
                 clearTimeout(time1);
             },100);
          });    
        //从axios里面取数据


        //   var back = this.$store.dispatch('getNewArticle', {
        //       num: 6,
        //       content: false
        //   });
        //   back.then((value) => {
        //       self.articles = value;
        //       console.log(self.articles);
        //   });
      },
      changePath(value){
          if(value){
              this.$router.push({
                    path: 'article',
                    query: {
                        chunk: value,
                        isTranslate: '0'
                    }
              });
          }else{
              this.$router.push({
                    path: 'article',
              });
          }
      }
  }
}
</script>
<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.home{
    width: 100%;
    box-sizing: border-box;
    position: relative;
    display: none;
    img{
        width: 100%;
    }
    .box{
        width: 100%;
        // background: #908cd6;
        top: 34px;
        opacity: 1;
        transition: all ease 0.2s;
        .more{
            right: 10px;
            font-size: 23px;
            text-align: right;
            position: relative;
            color: white;
            font-weight: bold;
            margin-bottom: 3px;
            transition: all ease-in-out 0.4s 0.8s;
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
             @for $i from 0 through 20
            {
                &:nth-of-type(#{$i}){
                    transition: transform ease-in 0.5s 0.13s*$i, opacity ease 0.3s 0.14s*$i;
                }
            }
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
                transition: all ease 0.3s 1.2s;
            }
            .right-name{
                position: absolute;
                top: 20px;
                font-size: 20px;
                color: white;
                right: 5.5%;
                transition: all ease 0.3s 1.4s;
            }
        }
    }
    .box-show{
        opacity: 0;
        .line{
            background: red;
            transform: rotateX(360deg) translateX(-20px);
            opacity: 0;
        }
        .more{
            right: -300px;
        }
        .textShow{
            .left-name{
                left: -200px;
            }
            .right-name{
                right: -10%;
            }
        }
    }
}
@media screen and (max-width: 590px) {
    .home {
        display: block;
        margin-top: 40px;
        
    }
}
</style>
