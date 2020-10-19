<template>
    <div>
        <div class="detail-list">ssssssssssssssss测试内容</div>
        <div class="cover-list">
            <div class="menus-list" ref="list">
                <div id="box1">
                    <div :class="{'line-one':true, 'line-change': key == ListChoose}" v-for="(item, key) in lists" :key="key">{{item.name}}</div>
                </div>
            </div>
        </div>
        <!-- <div>
            <div class="detail-top"></div>
            <div class="detail-left"></div>
            <div class="detail-bottom"></div>
            <div class="detail-right"></div>
        </div>  -->
    </div>
</template>
<script>

    function set(dom, lists, func){
        var start = dom.offsetTop+80;
        var itemHeight = 49;
        var exchange = 0;
        var allNumber = 0;
        var length = lists.length;
        
        var changeDom = dom.children[0];
        dom.onmousemove = function(e){
            if(allNumber == 0){
                exchange = e.clientY - start;
                var number = Math.ceil(exchange/15);
                if(allNumber != number){
                    allNumber = number;
                }
                if(allNumber < -(length-2) || allNumber > 1 || Math.abs(exchange)< 9){
                    return false;
                }
                changeDom.style.top = ((49*allNumber) + 'px');
                func(-allNumber);
            }else{
                // console.log(exchange);
                console.log(e.clientY - start);
            }
        }
    }

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
                       name: "目录10111"
                   }
               ],
               ListChoose: 1
            }
        },
        created(){
            const self = this;
            this.$nextTick(() => {
                console.log('测试内容');
                set(this.$refs.list, self.lists, self.changeListMenu);
            });
        },
        methods:{
            changeListMenu(i){
                this.ListChoose = i+1;
            }
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
    // background: rgba(0,0,0,0.3);
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
        &::before{
            content: '';
            width: 30px;
            height: 1px;
            background: #7064a9;
            position: absolute;
            right: 0px;
            top: 50%;
        }
        #box1{
            position: relative;
            transition: top ease-out 0.35s;
        }
        .line-one{
            width: 100%;
            border-bottom: 1px solid white;
            color: rgba(0,0,0,0.8);
            line-height: 48px;
            padding-left: 50px;
            font-weight: bold;
            cursor: pointer;
            text-align: left;
            transition: color ease 0.02s;
        }
        .line-change{
            color: #7064a9;
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