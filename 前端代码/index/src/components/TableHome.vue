<template>
  <div class="home">
       <!-- <img  src="./../assets/table.jpg"> -->
       <div class="center">
           <div class="center-box">
               <div class="line line-1">
                   <div class="pic"></div>
                   <div>
                       <div class="title">All About Eclipses for Coping with Them</div>
                       <div class="line"></div>
                       <div class="content">All About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with Them</div>
                   </div>
               </div>
               <div class="line line-2">
                   <div class="content">
                       All About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with Them
                       All About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with ThemAll About Eclipses for Coping with Them
                   </div>
                   <div class="head">
                       <div class="pic"></div>
                       <div class="name">
                           <div class="top">Susam millerk</div>
                           <div class="bottom">ludom</div>
                       </div>
                   </div>
               </div>
               <div class="line line-3">
                   <div class="pic"></div>
                   <div class="title"> All About Eclipses for Coping with ThemAll About Eclipses for Coping</div>
               </div>
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
    max-width: 1200px;
    margin: 0 auto;
    img{
        width: 100%;
    }
    .center{
        width: 90%;
        min-width: 1000px;
        max-width: 1400px;
        padding-top: 52.7%;
        opacity: 0.8;
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
                    margin-top: 50px;
                    padding-top: 85%;
                    opacity: 0.2;
                    background: blue;
                }
                .title{
                    width: 80%;
                    margin-top: 3vw;
                    font-size: 17px;
                }
                .line{
                    width: 88%;
                    height: 2px;
                    margin-top: 2.6vw;
                    background: lightcoral;
                }
                .content{
                    width: 80%;
                    height: auto;
                    height: 9vw;
                    overflow: hidden;
                    margin-top: 2vw;
                    font-size: 13px;
                }
            }
            .line-2{
                 width: 26%;
                 .content{
                     width: 84%;
                     height: 65%;
                     position: relative;
                     left: 8%;
                     margin-top: 12%;
                     font-size: 17px;
                     overflow: hidden;
                 }
                 .head{
                     width: 84%;
                     position: relative;
                     left: 8%;
                     margin-top: 18%;
                     .pic{
                         width: 50px;
                         height: 50px;
                         position: relative;
                         left: 6px;
                         border-radius: 50px;
                         background: red;
                         display: inline-block;
                     }
                     .name{
                         display: inline-block;
                         width: 150px;
                         left: calc(100% - 160px);
                         position: relative;
                         vertical-align: top;
                         top: 6px;
                         .top{
                             font-size: 17px;
                         }
                         .bottom{
                             font-size: 12px;
                             margin-top: 3px;
                         }
                     }
                 }
            }
            .line-3{
                 &:after{
                     display: none;
                 }
                width: 52%;
                .pic{
                    width: 68%;
                    height: 62%;
                    position: relative;
                    left: 16%;
                    background: grey;                    
                }
                .title{
                    width: 68%;
                    font-size: 19px;
                    margin-top: 8%;
                    left: 20%;
                    height: auto;
                    overflow: hidden;
                    position: relative;
                }
            }
        }
    }
}
@media screen and (max-width: 500px) {
    .home {
        display: none;
    }
}
</style>