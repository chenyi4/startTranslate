<template>
    <div class="login-box">
        <div class="background-line"></div>
        <div class="true-login-box">
            <div class="show-box-2"></div>
            <div class="show-box-1">
                <input class="name"/>
                <input class="password"/>
            </div>
            <div class="triggle-tran-1"></div>
            <div class="triggle-tran-2"></div>
            <div class="text-box">
                
            </div>
        </div>
    </div>
</template>
      
<script>
export default {
    name: 'loginModule',
        props: {
        },
        data() {
            return {

            }
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
                border:  1px solid $borderColor;
                position: relative;
                top: 12px;
                padding: 10px 10px;
                box-sizing: border-box;
                border-radius: 6px;
                padding-left: 30px;
                z-index: 10;
                margin-bottom: 15px;
                transition: border 0.6s ease;
                &:focus{
                   outline: none;
                   border: 1px solid $blueColor;
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
}
.background-line{
    width: 100%;
    padding-top: 100%;
    top: -55%;
    left: 8%;
   
    background-image: radial-gradient(rgba(0,0,0,0.3) 15%, rgba(0,0,0,0) 65%, rgba(0,0,0,0) 0%);
    position: absolute;
}
</style>