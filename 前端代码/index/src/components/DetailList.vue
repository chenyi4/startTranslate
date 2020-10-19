<template>
    <div>
        <div class="detail-list">ssssssssssssssss测试内容</div>
        <div class="cover-list">
            <div class="menus-list">
                <div class="line-one" v-for="(item, key) in lists" :key="key">{{item.name}}</div>
            </div>
        </div>
        <div>
            <div class="detail-top"></div>
            <div class="detail-left"></div>
            <div class="detail-bottom"></div>
            <div class="detail-right"></div>
        </div>
    </div>
</template>
<script>
    export default {
        name: 'DetailList',
        props: {
        },
        data() {
            return {
               lists: [
                   {
                       name: "2"
                   },
                   {
                       name: "1"
                   },
                   {
                       name: "3"
                   },
                   {
                       name: "目录4"
                   },
                   {
                       name: "目录5"
                   },
                   {
                       name: "目录6"
                   },
                   {
                       name: "目录7"
                   },
                   {
                       name: "目录8"
                   },
                   {
                       name: "目录9"
                   },
                   {
                       name: "目录10"
                   }
               ]
            }
        },
        created(){
            const self = this;
        }
    }

</script>
<style scoped lang="scss">
.detail-list{
    position: fixed;
    width: 100%;
    height: 100%;
    background: white;
    padding: 5px;
    // border: 5px solid #2b2257;
    box-sizing: border-box;
    filter: blur(2px);
}
.cover-list{
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.3);
    position: absolute;
    left: 0px;
    top: 0px;
    padding: 5px;
    box-sizing: border-box;
    .menus-list{
        width: 25%;
        max-height: 160px;
        overflow: hidden;
        position: absolute;
        left: 0px;
        top: 50%;
        margin-top: -155px;
        background: rgba(254, 254, 254, 0);
        .line-one{
            width: 100%;
            border-bottom: 1px solid white;
            color: white;
            line-height: 48px;
            padding-left: 50px;
            font-weight: bold;
            cursor: pointer;
            text-align: left;
            transition: color ease 0.3s;
            &:hover{
                color: #7064a9;
            }
        }
        &::before{
            content: '';
            width: 30px;
            height: 1px;
            background: #7064a9;
            position: absolute;
            right: 0px;
            top: 50%;
        }
    }
}
.detail-top,
.detail-left,
.detail-bottom,
.detail-right{
    width: 100%;
    height: 5px;
    background: #2b2257;
    position: absolute;
    top: 0px;
    left: 0px;
}
.detail-left{
    width: 5px;
    height: 100%;
}
.detail-bottom{
    top: auto;
    bottom: 0px;
}
.detail-right{
    left: auto;
    right: 0px;
    width: 5px;
    height: 100%;
}
</style>