<template>
    <div>
        <div class="detail-list"></div>
        <div class="cover-list">
            <div class="menus-list" ref="list">
                <div id="box1">
                    <div 
                        :class="{'line-one':true, 'line-change': key == ListChoose}" 
                        v-for="(item, key) in lists" :key="key"
                        @click="changeListMenu(key)"
                    >
                        {{item.name}}
                    </div>
                </div>
            </div>
            <div class="menus-list2" ref="list2">
                <div id="box2" v-if="secondShow">
                    <div :class="{'line-one':true, 'line-change': key == secondListChoose}" 
                    @click="changeSencodMenu(key)"
                    v-for="(item, key) in secondList" 
                    :key="key">{{item.name}}</div>
                </div>          
            </div>
            <div class="menus-list3" ref="list3">
                <div id="box3" v-if="threeShow">
                    <div :class="{'line-one':true, 'line-change': key == threeListChoose}" 
                    v-for="(item, key) in threeList" 
                    @click="selectThreeMenu(key)"
                    :key="key">
                        {{item.name}}
                    </div>
                </div>
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
    var obj1, obj2, obj3;
    // 组件框的高度 160  全部的高度 735 
    function set(dom, lists, itemHeight, boxHeight){
        var start = dom.offsetTop;
        var itemHeight = itemHeight;
        var length = lists.length;
        var topHeight = 0;
        this.setTimeout = null;
        this.box = dom.children[0];
        var onceLength = (itemHeight * length - (boxHeight/2))/boxHeight;
        this.value = 0;
        const self = this;
        
        var changeDom = dom.children[0];
        dom.onmousemove = function(e){
            self.box.style.transition = 'none';
            clearTimeout(self.setTimeout);
            topHeight = ((e.clientY - start) * onceLength );
            self.box.style.top = -topHeight + 'px';
        }
        dom.onmouseout = function(e){
            self.setTimeout = setTimeout(function(){
                self.box.style.transition = 'top linear 0.15s';
                topHeight = -itemHeight * self.value + (dom.offsetHeight/2) - itemHeight/2;
                self.box.style.top = topHeight + 'px';
                clearTimeout(self.setTimeout);
            }, 200);
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
                       name: "目录1",
                       childrens: [
                           {
                               name: "月运",
                               childrens: [
                                   {
                                       name: "2020年1月"
                                   },
                                   {
                                       name: "2020年2月"
                                   },
                                   {
                                       name: "9876543"
                                   },
                                   {
                                       name: "45678910"
                                   },
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "5678910"
                                   },
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "5678910"
                                   },
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "5678910"
                                   }
                               ]
                           },
                           {
                               name: "bbbb",
                               childrens: [
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "2345678"
                                   }
                               ]
                           },
                           {
                               name: "cccc"
                           },
                           {
                               name: "ddddd"
                           },
                           {
                               name: "eeeee"
                           },
                           {
                               name: "fffff",
                               childrens: [
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "2345678"
                                   },
                                   {
                                       name: "1234567"
                                   },
                                   {
                                       name: "2345678"
                                   }
                               ]
                           },
                           {
                               name: "ggggg"
                           }
                       ]
                   },
                   {
                       name: "2",
                       childrens: [
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           }
                       ]
                   },
                   {
                       name: "3",
                       childrens: [
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           },
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           },
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           },
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           },
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbb"
                           },
                           {
                               name: "aaaa"
                           },
                           {
                               name: "bbbbend"
                           }
                       ]
                   },
                   {
                       name: "4",
                       childrens: []
                   }
               ],
               ListChoose: 0, //第一个choose
               secondList: [], //
               secondShow: false,
               secondListChoose: null, //第二个choose
               threeList: [], //第三个列表
               threeShow: false,
               threeListChoose: null //第三个choose
            }
        },
        created(){
            const self = this;
            this.$nextTick(() => {
                obj1 = new set(this.$refs.list, self.lists,49, 160);
            });
        },
        methods:{
            changeListMenu(i){
                const self = this;
                this.ListChoose = i;
                obj1.value = i;

                this.secondShow = false;
                var time1 = setTimeout(() => {
                    self.secondList = self.lists[i].childrens||[];
                    self.secondShow = true;
                    self.secondListChoose = null;
                    obj2 = null;
                    clearTimeout(time1);
                });
                var time2 = setTimeout(() => {
                    obj2 = new set(this.$refs.list2, self.secondList, 49, 300);
                    obj2.value = null;
                    clearTimeout(time2);
                }, 100);
            },
            changeSencodMenu(i){
                const self = this;
                self.secondListChoose = i;
                obj2.value = i;

                this.threeShow = false;
                var time3 = setTimeout(() => {
                    self.threeList = self.secondList[i].childrens||[];
                    self.threeShow = true;
                    self.threeListChoose = null;
                    obj3 = null;
                    clearTimeout(time3);
                });

                var time4 = setTimeout(() => {
                    obj3 = new set(this.$refs.list3, self.threeList, 49, 300);
                    obj3.value = null;
                    clearTimeout(time4);
                }, 100);
            },
            selectThreeMenu(i){
                const self = this;
                self.threeListChoose = i;
                obj3.value = i;
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
    background: rgba(0,0,0,0.3);
    position: absolute;
    left: 0px;
    top: 0px;
    padding: 5px;
    box-sizing: border-box;
    .menus-list, .menus-list2, .menus-list3{
        width: calc(25% - 40px);
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
            // margin-top: -55px;
            z-index: 10;
        }
        // &::after{
        //     content: '';
        //     width: 100%;
        //     height: 100%;
        //     position: absolute;
        //     left: 0px;
        //     top: 0px;
        // }
        #box1{
            position: relative;
            // transition: top linear .1s;
            top: 0px;
        }
        .line-one{
            width: 100%;
            border-bottom: 1px solid rgba(255, 255, 255, 0.8);
            color: rgba(255, 255, 255, 0.5);
            line-height: 48px;
            padding-left: 50px;
            font-weight: bold;
            cursor: pointer;
            text-align: left;
            transition: all ease-in-out .21s 0s;
            &:hover{
                color: rgba(255, 255, 255, 1);
                transform: scale(1.06) rotateZ(3deg);
                border-bottom: 1px solid rgba(255, 255, 255, 1);
            }
        }
        .line-change{
            color: #7064a9;
            transform: scale(1.04);
            border-bottom: 1px solid rgba(255, 255, 255, 1);
            &:hover{
                color: #7064a9;
                transform: scale(1.06);
            }
        }
    }
    .menus-list2, .menus-list3{
        left: 25%;
        height: auto;
        max-height: 300px;
        margin-top: -76px;
        transform: translateY(-50%);
        &::before{
            z-index: 10;
        }
        #box2{
            position: relative;
        }
        .line-one{
            animation: line linear 1s 1;
            @for $i from 1 through 13{
                &:nth-of-type(#{$i}){
                    animation: line linear 0.2s 1 $i*0.1s;
                    animation-fill-mode: both;
                    transition: all ease-in-out 0.21s 0s;
                }
            }
            &:hover{
                animation-fill-mode: none;
                transition: all ease-in-out 0.21s 0s;
                opacity: 1;
                color: rgba(255, 255, 255, 1);
                transform: scale(1.06) rotateZ(3deg);
                border-bottom: 1px solid rgba(255, 255, 255, 1);
            }
        }
        .line-change{
            &:hover{
                color: #7064a9;
                transform: scale(1.06);
            }
        }
    }
    .menus-list3{
        left: 50%;
        height: auto;
        max-height: 300px;
        margin-top: -76px;
        transform: translateY(-50%);
        #box3{
            position: relative;
        }
    }
}
@keyframes line{
    0% {
      transform: rotateZ(4deg);
      top: -10px;
      opacity: 0.4;
  }
  100% {
      transform: rotateZ(0deg);
      top: -0px;
      opacity: 1;
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