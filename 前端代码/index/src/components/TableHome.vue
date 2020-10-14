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
                   <div class="arrow"></div>
                   <!-- 五边形 -->
                   <div class="five-triggle">
                        <div class="trigglebottom"></div>
                        <div class="trigglebottom-left"></div>
                        <div class="trigglebottom-right"></div>
                        <div class="triggletop"></div>
                        <div class="triggletop-left"></div>
                        <div class="triggletop-right"></div>
                    </div>

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
        min-width: 750px;
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
                .arrow{
                    width: 40px;
                    height: 40px;
                    position: relative;
                    left: calc(100% - 150px);
                    margin-top: 6px;
                    &::after{
                        content: '';
                        display: block;            
                        width: 16px;            
                        height: 16px;        
                        position: absolute;    
                        left: 62px;
                        top: 12px;
                        border-right: 2px solid #924545;            
                        border-top: 2px solid #924545;            
                        -webkit-transform: rotate(45deg); /*箭头方向可以自由切换角度*/            
                        transform: rotate(45deg);
                    }
                    &::before{
                        content: '';
                        display: block;
                        width: 82px;
                        height: 2px;
                        background-color: #924545;
                        position: absolute;
                        top: 20px;
                        left: 1px;
                    }
                }
                .five-triggle{
                    width: 52px;
                    height: 52px;
                    position: relative;
                    // transform: rotate(90deg) scale(0.9);
                    .trigglebottom,
                    .trigglebottom-left,
                    .trigglebottom-right,
                    .triggletop,
                    .triggletop-left,
                    .triggletop-right{
                        width: 30px;
                        height: 2px;
                        left: 20px;
                        background: #a09fef;
                        position: absolute;
                    }
                    .triggletop-left,
                    .trigglebottom-right{
                        transform: rotate(60deg);
                        left: 42px;
                        top: 12;
                    }
                    .triggletop-right,
                    .trigglebottom-left{
                        transform: rotate(-60deg);
                        left: -2;
                        top: 12;
                    }
                    .trigglebottom-left{
                        left: 43px;
                        top: 38px;
                    }
                    .trigglebottom-right{
                        left: -2px;
                        top: 38px;
                    }
                    .trigglebottom{
                        top: 50px;
                    }
                }
            }
        }
    }
}
@media screen and (max-width:800px) {
    .home{
        .center{
            .center-box{
                .line-1{
                    .pic{
                        margin-top: 15px;
                        padding-top: 75%;
                    }
                    .title{
                        font-size: 14px;
                    }
                    .content{
                        text-overflow: ellipsis;
                        display: -webkit-box;
                        -webkit-line-clamp: 5;
                        font-size: 1vh;
                        -webkit-box-orient: vertical;
                    }
                    .line{
                        margin-top: 12px;
                    }
                }
                .line-2{
                    .content{
                        margin-top: 7px;
                    }
                    .head{
                        margin-top: 22%;
                        .name{
                            width: calc(100% - 50px);
                            left: 25px;
                            .top{
                                font-size: 12px;
                            }
                        }
                        .pic{
                            width: 40px;
                            height: 40px;
                        }
                    }
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