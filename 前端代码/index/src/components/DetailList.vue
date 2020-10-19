<template>
    <div>
        <div class="detail-list">ssssssssssssssss测试内容</div>
        <div class="cover-list"></div>
    </div>
</template>
<script>
    export default {
        name: 'DetailList',
        props: {
        },
        data() {
            return {
               
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
    border: 5px solid #2b2257;
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
   
}
</style>