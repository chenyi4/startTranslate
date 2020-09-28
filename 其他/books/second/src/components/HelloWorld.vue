<template>
  <div class="hello">
      <div>
          <input/>
      </div>
      <div class="box">
          <div class="col" v-for="(item, num) in 122" :key="num" :style="returnTrans(num)">11111111111</div>
      </div>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  mounted(){
     
  },
  methods: {
    returnTrans(i){
      var num = -(i + 1) / 3;
      if(i < 60){
        num = (Math.random(10) > 0.5)?num:-num;
      }
      
      var back = 'transform:rotate('+num+'deg);';
      if(num < 0){
      }else{
         back =  back + 'text-align:right;';
      }
      return back
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
  background-color: rgba(0,0,0,0.7);
  color: white;
  transform: rotate(0deg) !important;
  text-align: left !important;
  border-color: black;
  z-index: 8;
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
}
</style>
