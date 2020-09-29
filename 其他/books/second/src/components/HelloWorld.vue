<template>
  <div :class="{'hello':true, 'hello-over': !showLoading}">
      <div>
          <input v-model="innerText"/>
          <div class="submit" @click="submitThing">提交</div>
      </div>
      <div class="box">
          <div class="col" v-for="(item, num) in lists" 
          :key="num" 
          @click="getDetail(num)"
          :style="returnTrans(num)">
            {{item.name}}
          </div>
      </div>
      <div class="buttom-text" v-if="lists.length > 0">文字左右排列，有助于眼球转动，保护视力</div>
      <div :class="{'loading':true, 'loading-ed': showLoading}">
           <div id="demo-1">
               <div class="box">
                   <div class="in-line"></div>
                   <div class="in-line"></div>
                   <div class="in-line"></div>
                   <div class="in-line"></div>
                   <div class="in-line"></div>
               </div>
           </div>
      </div>
      <div class="no-detail" v-if="lists.length == 0">暂无数据</div>
  </div>
</template>
<script> //如果是pdf 就打开pdf, 如果是txt文本，就直接读出来显示
import { panel } from '@/api/index'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  mounted(){
     
  },
  data(){
        return {
           showLoading: true,
           lists: [
             
           ],
           innerText: ''
        }
  },
  methods: {
    returnTrans(i){
      var num = -(i + 1) / 3;
      if(i < 60){
        if(this.lists.length < 15){

        }else{
          num = (Math.random(10) > 0.5)?num:-num;
        }
      }
      
      var back = 'transform:rotate('+num+'deg);background-color:rgba(46, 204, '+113+', '+(0.2+i/130)+');';
      
      if(num < 0){
      }else{
         back =  back + 'text-align:right;';
      }
      return back;
    },
    submitThing(){
      //查看提交花了多少时间
       const self = this;
       this.showLoading = false;
       const back = panel.getAll({
          value: self.innerText,
       });
       back.then((value) => {
          self.lists = value.all||[];
          self.showLoading = true;
       });
    },
    getDetail(num){
      const self = this;
      var allLists = self.lists[num];
      var back = panel.getDetail(allLists);
      back.then((value) => {
          window.open("http://"+value.href);
      });
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style >
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.hello{
  text-align: left;
  overflow-x: hidden;
  height: auto;
  overflow-y: -webkit-paged-y;
  left: 0px;
  top: 0px;
  position: absolute;
  width: 100%;
}
.hello-over{
  overflow: hidden;
  height: 100%;
  
}
.hello input{
      margin-left: 10px;
      margin-top: 10px;
      width: 522px;
      height: 28px;
      border: 1px solid #8bc34a !important;
      padding: 0px 10px;
}
.hello .box{
  width: calc(100% - 16px);
  position: relative;
  left: 12px;
  font-size: 0px;
  margin-top: 80px;
}
.hello .box .col{
    width: calc(30.33% - 50px);
    margin-left: calc(1.5% + 25px);
    margin-right: calc(1.5% + 25px);
    height: 32px;
    color: rgb(44, 62, 80);
    border: 1px dashed grey;
    display: inline-block;
    box-sizing: border-box;
    margin-bottom: 10px;
    flex: 1;
    font-size: 14px;
    line-height: 32px;
    text-align: left;
    background-color: rgba(46, 204, 113, 0.2);
    border: 1px solid #8bc34a;
    transform: rotate(-4deg);
    cursor: pointer;
    transition: all ease 0.3s;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    z-index: 8;
}

.hello .box .col:nth-child(3n+2){
  top: 132px;
  position: relative;
  transform: rotate(4deg);
}
.hello .box .col:nth-child(3n+3){
  top: 262px;
  position: relative;
  transform: rotate(-6deg);
}

.hello .box .col:hover{
  background-color: rgba(0,0,0,0.7) !important;
  color: white;
  transform: rotate(0deg) !important;
  /* text-align: left !important; */
  border-color: black !important;
  z-index: 12 !important;
}

.hello .submit{
    width: 184px;
    display: inline-block;
    height: 32px;
    background-color: rgb(22, 160, 133);
    background-clip: border-box;
    color: rgb(236, 240, 241);
    border-radius: 0px;
    text-align: center;
    font-size: medium;
    margin-left: 20px;
    position: relative;
    top: -2px;
    line-height: 32px;
    cursor: pointer;
    transition: all ease 0.05s;
}

.hello .submit:hover{
    background: #baeed0;
    color: #607d8b;
}
@media screen and (max-width: 1000px) {
     .hello .box .col{
        width: calc(47% - 50px);
        left: 0px;
     }
}

@media screen and (max-width: 600px) {
  .hello .box{
    width: 100%;
    left: 0px;
    margin-top: 20px;
  }
  .hello .box .col{
    width: calc(100% - 50px);
    left: 0px;
  }
  .hello .box .col:nth-child(3n+2),.hello .box .col:nth-child(3n+3){
    top: 0px;
  }
  .hello input{
    width: 90%;
    left: 5%;
    height: 40px;
    line-height: 40px;
  }
  .hello .submit{
    margin-top: 15px;
    width: 90%;
    margin-left: 0px;
    left: 5%;
  }
}

.hello .loading{
   width: 100%;
   height: 100%;
   position: absolute;
   left: 0px;
   top: 0px;
   background: rgba(255, 255, 255, 0.5);
   transition: all ease 2.5s;
   opacity: 1;
   display: block;
   z-index: 20;
}
.hello .loading-ed{
   opacity: 0;
   display: none;
}
.buttom-text{
  color: #607d8b;
  font-size: 12px;
  cursor: pointer;
  position: relative;
  top: 300px;
  padding-right: 20px;
  text-align: right;
}
.no-detail{
  text-align: center;
  color: #607d8b;
}
#demo-1 .box{
    width: 100px;
    height: 16px;
    position: absolute;
    top: 50%;
    margin-top: -15px;
    left: 50%;
    margin-left: -50px;
    text-align: center;
}
    
#demo-1 .box  .in-line{
    width: 6px;
    height: 100%;
    display: inline-block;
    background:rgb(22, 160, 133);
    margin-left: 3px;
    margin-right: 3px;
    animation: stretchdelay 0.8s infinite ease-in-out;
}
#demo-1 .box  .in-line:nth-child(1){
    animation-delay: -0.7s;
}
#demo-1 .box  .in-line:nth-child(2){
    animation-delay: -0.5s;
}
#demo-1 .box  .in-line:nth-child(3){
    animation-delay: -0.3s;
}
#demo-1 .box  .in-line:nth-child(4){
    animation-delay: -0.1s;
}
#demo-1 .box  .in-line:nth-child(5){
    animation-delay: -0s;
}

@keyframes stretchdelay {
  0%, 40%, 100% {
    transform: scaleY(0.4);
  }  20% {
    transform: scaleY(1.0);
  }
}
</style>
