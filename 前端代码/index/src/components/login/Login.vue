<template>
    <div class="login-box" >
        <div class="background-line"></div>
        <div class="true-login-box true-login-box-ed">
            <div class="show-box-2"></div>
            <div class="show-box-1">
                <div class="icon-relative">
                    <input class="name"/>
                    <div class="icon-show">
                        <img src="./../../assets/pics/user.png"/>
                    </div>
                </div>
                <div class="icon-relative">
                    <input class="password" type="password"/>
                    <div class="icon-show">
                        <img src="./../../assets/pics/password.png"/>
                    </div>
                </div>   
                <div class="submit" @click="login" id="circle1">登 录</div>
            </div>
            <div class="triggle-tran-1"></div>
            <div class="triggle-tran-2"></div>
            <div class="show-logo-box">
                <div class="circle2" id="cir2"></div>
                <div class="circle1" id="cir1"></div>
                <div class="circle3" id="cir3"></div>    
                <div class="circle4" id="cir4"></div>
                <div class="circle5" id="cir5"></div>
                <div class="circle6" id="cir6"></div>
                <div class="circle7" id="cir7"></div>
            </div>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" class="svg-filters">
            <defs>
                <filter id="filter-music">
                    <feTurbulence type="fractalNoise" baseFrequency="0.000001" numOctaves="1" result="warp" />
                    <feOffset dx="0" dy="-90" result="warpOffset" />
                    <feDisplacementMap xChannelSelector="R" yChannelSelector="G" scale="30" in="SourceGraphic" in2="warpOffset" />
                </filter>
            </defs>   
        </svg>
    </div>
</template>
<script>
import { TimelineLite, Power0} from 'gsap';
import { login } from '@/api/index';
// , TimelineLite
// TimelineLite
export default {
    name: 'loginModule',
        props: {
        },
        data() {
            return {
                tweenLine: null,
                isLoading: false
            }
        },
        methods: {
            login(){
                const self = this;
                login.loginPost({
                    username: 'chenyi',
                    password: '111111'
                });
                if(self.isLoading) return false;
                self.isLoading = true;
                
                var circle1 = document.getElementById('circle1');
                circle1.style.filter = 'url(#filter-music)';
                this.tweenLine.play();
                var timeline = setTimeout(function(){
                    circle1.style.filter = '';
                    self.tweenLine.pause();
                    self.isLoading = false;
                    clearTimeout(timeline);
                },1200);

            },
            setPage(){

                var turb = document.querySelectorAll('#filter-music feTurbulence')[0];
                var circle1 = document.getElementById('circle1');
                var turbVal = { val: 0.000001 };
                var turbValX = { val: 0.000001 };
                var tl = new TimelineLite({
                    paused: true,
                    onComplete: function(){
                        tl.reverse();
                    },
                    onReverseComplete: function(){
                        tl.restart();
                    },
                    onUpdate: function(){
                        turb.setAttribute('baseFrequency', turbVal.val + ' ' + turbValX.val);
                    }
                });
                tl.to(turbValX, 0.4, { val: 0.04, ease: Power0.easeNone}, 0);
                tl.to(turbVal, 0.1, { val: 0.2 , ease: Power0.easeNone }, 0);
                this.tweenLine = tl;

           }
        },
        created(){
            const self = this;
            setTimeout(function(){
                self.setPage();
               
            },300);
        }
}
</script>

<style scoped lang="scss">
$borderColor: #eeeeee;
$blueColor: #759bff;
.login-box{
    width: 100%;
    height: 100%;
    position: absolute;
    background: #f5f5f5;
    overflow: hidden;
    left: 0;
    top: 0;
    animation: mymove 1s 1 0.5s;
    .true-login-box{
        width: 400px;
        height: 380px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-left: -200px;
        margin-top: -190px;
        .show-box-1, .show-box-2{
            width: 100%;
            height: 60%;
            background: white;
            position: absolute;
            left: 0px;
            bottom: 0px;
            border-bottom: 1px solid $borderColor;
            border-left: 1px solid $borderColor;
            border-right: 1px solid $borderColor;
            border-bottom-left-radius: 10px;
            border-bottom-right-radius: 10px;
        }
        .show-box-2{
            bottom: -10px;
            width: calc(100% - 20px);
            left: 10px;
        }
        .show-box-1{
            box-shadow: 1px 8px 20px 0px rgba(0,0,0,0.3);
            .name,.password{
                width: 76%;
                border:  1px solid #eaeaea;
                position: relative;
                top: 25px;
                padding: 10px 10px;
                box-sizing: border-box;
                border-radius: 6px;
                padding-left: 40px;
                z-index: 10;
                margin-bottom: 15px;
                transition: border 0.6s ease;
                &:focus{
                   outline: none;
                   border: 1px solid $blueColor;
                }
            }
            .submit{
               width: 76%;
               color: white;
               background: $blueColor;
               border-radius: 4px;
               margin: 0 auto;
               margin-top: 20px;
               padding: 8px 0px;
               position: relative;
               top: 16px;
               cursor: pointer;
               outline: 90px solid transparent;
               transition: all ease 0.8s;
               &:hover{
                   background: black;
               }
            }
        }
        
        .triggle-tran-1, .triggle-tran-2{
            width: 0;
            height: 0;
            border-bottom: 150px solid white;
            border-right:401px solid transparent;
            position: absolute;
            top: 2px;
            left: 1px;
            &::after{
                content: '';
                width: 428px;
                height: 1px;
                background: $borderColor;
                position: absolute;
                left: -12px;
                top: 76px;
                transform: rotate(20.6deg);
                box-shadow: 0px 0px 20px 0.1px rgba(0,0,0,0.4);
            }
        }
        .triggle-tran-2{
            transform: rotateY(180deg);
            
            // transform: translateX(180deg);
        }
        .triggle-tran-1{
            top: 39px;
            left: 10px;
            border-right:389px solid transparent;
            &::after{
                display: none;
            }
        }
    }
   
    .show-logo-box{
        width: 100px;
        height: 100px;
        position: absolute;
        top: 35px;
        left: 50%;
        margin-left: -50px;
        // background: grey;
        .circle1, .circle2,.circle3,.circle4,.circle6,.circle7{
            width: 40px;
            height: 40px;
            background: black;
            border-radius: 40px;
            position: absolute;
            left: 45px;
            top: 20px;
            outline: 90px solid transparent;
        }
        .circle2{
            left: 54px;
            width: 42px;
            height: 42px;
            top: 19px;
            border-radius: 42px;
            background: $blueColor;
        }
        .circle3{
            width: 6px;
            height: 6px;
            background: black;
            border-radius: 6px;
            left: 24px;
            top: 20px;
        }
        .circle4{
            width: 2px;
            height: 2px;
            border-radius: 2px;
            left: 115px;
            top: 44px;
        }
        .circle5{
            width: 60px;
            height: 60px;
            border-radius: 60px;
            background-image: linear-gradient(rgba(0,0,0,1),#759bff);
            opacity: 0.5;
            left: 130px;
            top: 50px;
            position: absolute;
        }
        .circle6{
            width: 5px;
            height: 5px;
            border-radius: 5px;
            left: 140px;
            top: 90px;
        }
        .circle7{
            width: 3px;
            height: 3px;
            left: 122px;
            top: 102px;
            background: black;
        }
    }
    .icon-relative{
        position: relative;
        .icon-show{
            width: 25px;
            height: 25px;
            display: inline-block;
            // background: grey;
            position: absolute;
            top: 30px;
            left: 14%;
            z-index: 10;
            img{
                width: 80%;
                position: relative;
                top: 3px;
                filter:opacity(0.5);
            }
        }
    }
}

.background-line{
    width: 100%;
    padding-top: 100%;
    top: -55%;
    left: 8%;
    background-image: radial-gradient(rgba(0,0,0,0.3) 15%, rgba(0,0,0,0) 65%, rgba(0,0,0,0) 0%);
    position: absolute;
}
@keyframes mymove
{
    from { position: fixed;}
    to { position: absolute;}
}

</style>