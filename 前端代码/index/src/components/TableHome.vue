<template>
  <div class="home">
       <!-- <img  src="./../assets/table.jpg"> -->
       <div :class="{'center':true, 'center-change':isShow}">
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
                    <div class="triggle-box">
                            <div class="five-triggle">
                                <div class="trigglebottom"></div>
                                <div class="trigglebottom-left"></div>
                                <div class="trigglebottom-right"></div>
                                <div class="triggletop"></div>
                                <div class="triggletop-left"></div>
                                <div class="triggletop-right"></div>
                            </div>
                            <div class="triggle">
                                <div class="triggle-top"></div>
                                <div class="triggle-bottom"></div>
                                <div class="triggle-left"></div>
                            </div>
                            <div class="triggle2">
                                <div class="triggle-top"></div>
                                <div class="triggle-bottom"></div>
                                <div class="triggle-left"></div>
                            </div>
                    </div>
                    <div class="triggle3"></div>
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
  },
  data() {
      return {
          isShow: true
      }
  },
  created(){
      const self = this;
      setTimeout(()=>{
          self.isShow = false;
      }, 400);
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
        min-width: 650px;
        max-width: 1400px;
        padding-top: 52.7%;
        position: absolute;
        top: 65px;
        left: 50%;
        transform: translateX(-50%);
        transition: all ease 0.4s;
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
                overflow: hidden;
                vertical-align: top;
                top: 0px;
                opacity: 1;
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
                overflow: hidden;
            }
            .line-1{
                cursor: pointer;
                opacity: 1;
                transition: top ease 0.2s 0.25s,width ease 0.2s, opacity ease 0.8s;
                .pic{
                    width: calc(100% - 60px);
                    position: relative;
                    margin-top: 50px;
                    padding-top: 85%;
                    opacity: 0.2;
                    background: blue;
                    transition: all ease 0.2s 0.1s;
                }
                .title{
                    width: 80%;
                    margin-top: 3vw;
                    font-size: 17px;
                    transition: all ease 0.2s 0.15s;
                }
                .line{
                    width: 88%;
                    height: 2px;
                    margin-top: 2.6vw;
                    background: lightcoral;
                    transition: all ease 0.2s 0.3s, width ease 0.2s;
                }
                .content{
                    width: 80%;
                    height: auto;
                    height: 9vw;
                    overflow: hidden;
                    margin-top: 2vw;
                    font-size: 13px;
                    transition: all ease 0.2s 0.45s;
                }
                &:hover{
                    transform: scale(0.97);
                    .pic,.title,.line,.content{
                        transform: translateY(-10px);
                    }
                    .line{
                        width: 50%;
                    }

                }
            }
            .line-2{
                 width: 26%;
                 cursor: pointer;
                 opacity: 1;
                 transition: top ease 0.2s 0.55s,width ease 0.2s 0.3s, opacity ease 0.8s 0.3s;
                 .content{
                     width: 84%;
                     height: 65%;
                     position: relative;
                     left: 8%;
                     margin-top: 12%;
                     font-size: 17px;
                     overflow: hidden;
                     transition: all ease 0.3s;
                 }
                 .head{
                     width: 84%;
                     position: relative;
                     left: 8%;
                     margin-top: 18%;
                     transition: all ease 0.3s;
                     .pic{
                         width: 50px;
                         height: 50px;
                         position: relative;
                         left: 6px;
                         border-radius: 50px;
                         background: red;
                         display: inline-block;
                         transition: all ease 0.2s 0.2s;
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
                             transition: all ease 0.2s 0.3s;
                         }
                         .bottom{
                             font-size: 12px;
                             margin-top: 3px;
                             transition: all ease 0.2s 0.4s;
                         }
                     }
                 }
                 &:hover{
                     .content{
                         transform: scale(0.96);
                     }
                     .head{
                         transform: translateY(5px);
                         .pic{
                             transform: translateY(-7px);
                         }
                         .name{
                             .top{
                                 transform: translateY(-7px);
                             }
                             .bottom{
                                 transform: translateY(-7px);
                             }
                         }
                     }
                 }
            }
            .line-3{
                opacity: 1;
                transition: top ease 0.2s 0.75s, width ease 0.2s 0.5s, opacity ease 0.8s 0.5s;
                &:after{
                    display: none;
                }
                cursor: pointer;
                width: 52%;
                .pic{
                    width: 68%;
                    height: 62%;
                    position: relative;
                    left: 16%;
                    background: grey; 
                    transition: all ease 0.5s;                   
                }
                .title{
                    width: 68%;
                    font-size: 19px;
                    margin-top: 8%;
                    left: 20%;
                    height: auto;
                    overflow: hidden;
                    transition: transform ease 0.3s 0.15s;
                    position: relative;
                }
                .arrow{
                    width: 40px;
                    height: 40px;
                    position: relative;
                    left: calc(100% - 150px);
                    margin-top: 6px;
                    transition: all ease 0.35s 0.45s;
                    cursor: pointer;
                    transform: rotate(0deg);
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
                    transform: rotate(90deg) scale(0.7);
                    left: 15%;
                    top: -23px;
                    transition: all ease 0.3s;
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
                        top: 12px;
                    }
                    .triggletop-right,
                    .trigglebottom-left{
                        transform: rotate(-60deg);
                        left: -2px;
                        top: 12px;
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
                .triggle,.triggle2{
                    width: 100px;
                    height: 100px;
                    position: relative;
                    top: -64px;
                    transition: all ease 0.3s 0.2s;
                    left: 20%;
                    .triggle-top,
                    .triggle-bottom,
                    .triggle-left{
                        width: 30px;
                        height: 1px;
                        background:#a09fef;
                        position: absolute;
                        transform: rotate(33deg);
                        top: 25px;
                    }
                    .triggle-bottom{
                        transform: rotate(-33deg);
                        top: 41px;
                    }
                    .triggle-left{
                        transform: rotate(90deg);
                        top: 33px;
                        left: -12px;
                    }
                }
                .triggle2{
                    position: relative;
                    top: -165px;
                    transform: scale(0.6);
                    left: calc(20% - 19px);
                    .triggle-top,
                    .triggle-bottom,
                    .triggle-left{
                        height: 2px;
                    }
                }
                .triggle3{
                    width: 0;
                    height: 0;
                    border-top: 8px solid transparent;
                    border-left: 12px solid #924545;
                    border-bottom: 8px solid transparent;
                    position: absolute;
                    left: 28%;
                    bottom: 30px;
                }
                &:hover{
                    .pic{
                        transform: scale(.96);
                    }   
                    .arrow{
                         transform: translateY(-10px) translateX(-10px) rotate(90deg);
                    }
                    .title{
                        transform: scale(1.06) translateY(-10px);
                    }
                    .five-triggle{
                        transform: rotate(90deg) scale(0.72) rotateX(540deg) translateX(-10px) translateY(-20px);
                    }
                    .triggle{
                         transform: rotateY(180deg) scale(0.82) rotateX(170deg) translateY(40px);
                    }
                    .triggle2{
                         transform: rotateY(180deg) scale(0.52) rotateX(170deg) translateY(42px);
                    }
                }
            }
        }
    }
    .center-change{
        // opacity: 0.2;
        .center-box{
             .line{
                width: 0%;
                transition: all ease 0.5s 0.3s;
                opacity: 0;
                height: 0%;
                top: -100px;
            }
        }
    }
}

@media screen and (max-width:1088px) {
    .home{
        .center{
            .center-box{
                .line-1{
                    .pic{
                        margin-top: 30px;
                    }
                }
                .line-2{
                    .content{
                        margin-top: 14px;
                    }
                    .head{
                        margin-top: 29%;
                        .name{
                            width: calc(100% - 50px);
                            left: 25px;
                            top: 3px;
                            .top{
                                font-size: 17px;
                            }
                        }
                        .pic{
                            width: 40px;
                            height: 40px;
                        }
                    }
                }
                .line-3{
                    .triggle-box{
                        position: relative;
                        top: -8%;
                        left: -3%;
                        transform: scale(0.9);
                    }
                }
            }
        }
    }
}
@media screen and (max-width:925px) {
    .home{
        .center{
            .center-box{
                .line-1{
                    .title{
                        font-size: 15px;
                    }
                }
                .line-2{
                    .head{
                        .pic{
                            width: 35px;
                            height: 35px;
                        }
                        .name{
                            top: 0px;
                            .top{
                                font-size: 15px;
                            }
                        }
                    }
                }
                .line-3{
                    .title{
                        font-size: 16px;
                    }
                    .arrow{
                        transform: scale(0.75);
                        left: calc(100% - 120px);
                    }
                }
            }
        }
    }
}
@media screen and (max-width:850px) {
    .home{
        .center{
            .center-box{
                .line-3{
                    .triggle-box{
                        transform: scale(0.78);
                        left: -33px;
                        top: -52px;
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
                .line-3{
                    .triggle-box{
                        transform: scale(0.78);
                        left: -33px;
                        top: -62px;
                    } 
                }
            }
        }
    }
}
@media screen and (max-width:755px) {
    .home{
        .center{
            .center-box{
                .line-1{
                    .pic{
                        margin-top: 10px;
                        padding-top: 68%;
                    }
                    .title{
                        font-size: 15px;
                    }
                }
                .line-2{
                    .content{
                        margin-top: 7px;
                        font-size: 15px;
                    }
                    .head{
                        margin-top: 24%;
                        .name{
                            width: calc(100% - 50px);
                            left: 22px;
                            .top{
                                font-size: 13px;
                            }
                        }
                        .pic{
                            width: 30px;
                            height: 30px;
                        }
                    }
                }
                .line-3{
                    .title{
                        margin-top: 5%;
                        font-size: 15px;
                    }
                    .triggle-box{
                        transform: scale(0.78);
                        left: -33px;
                        top: -54px;
                    } 
                    .arrow{
                        margin-top: -3%;
                    }
                }
            }
        }
    }
}
@media screen and (max-width: 590px) {
    .home {
        display: none;
    }
}

</style>