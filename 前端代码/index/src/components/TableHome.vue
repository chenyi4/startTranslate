<template>
  <div class="home">
       <!-- <img  src="./../assets/table.jpg"> -->
       <div class="center">
           <div class="center-box">
               <div class="line line-1">
                   <div class="pic"></div>
                   <div class="title">All About Eclipses for Coping with Them</div>
                   <div class="line"></div>
                   <div class="content">测试具体的内容修改部分Test Center</div>
               </div>
               <div class="line line-2"></div>
               <div class="line line-3"></div>
           </div>
       </div>
  </div>
</template>
<script>
export default {
  name: 'TableHome', //桌面显示
  props: {
    msg: String
  }
}
</script>
<style scoped lang="scss">
.home{
    width: 100%;
    background:white;
    position: relative;
    height: auto;
    img{
        width: 100%;
    }
    .center{
        width: 90%;
        min-width: 1000px;
        max-width: 1400px;
        padding-top: 52.7%;
        opacity: 1;
        position: absolute;
        top: 65px;
        left: 50%;
        transform: translateX(-50%);
        .center-box{
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0px;
            top: 0px;
            box-sizing: border-box;
            background: white;
            text-align: left;
            padding: 40px 30px;
            .line{
                width: 22%;
                height: 100%;
                display: inline-block;
                background: white;
                position: relative;
                vertical-align: top;
                &:after{
                    width: 1px;
                    height: 100%;
                    content: '';
                    position: absolute;
                    right: 0px;
                    top: 0px;
                    opacity: 0.5;
                    background: grey;
                }
            }
            .line-1{
                .pic{
                    width: calc(100% - 60px);
                    position: relative;
                    top: 50px;
                    padding-top: 90%;
                    opacity: 0.2;
                    background: blue;
                }
                .title{
                    width: 80%;
                    font-size: 17px;
                }
                .line{
                    width: 80%;
                    height: 5px;
                    background: lightcoral;
                }
                .content{
                    width: 80%;
                    height: auto;
                    height: 100px;
                    margin-top: 10px;
                }
            }
            .line-2{
                 width: 26%;
            }
            .line-3{
                width: 52%;
            }
        }
    }
}
</style>