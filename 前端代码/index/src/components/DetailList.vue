<template>
    <div>
        <div class="detail-list"></div>
        <div class="cover-list">
            <div class="circle-box" @click="isShowAll = !isShowAll;">
                <!-- 点击展开,和关闭 -->
                <div :class="{'show-over':isShowAll}">
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>

                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>
                    <div class="line"></div>

                    <div class="circle"></div>
                </div>
            </div>
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
                    :key="key">
                        {{item.name}}
                    </div>
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
            <input class="search-box" placeholder="查询/" v-model="searchValue" @input="searchList"/>
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
    function set(dom, lists, itemHeight, boxHeight){
        var documentHeight = window.innerHeight;
        this.start = documentHeight/2 - dom.offsetHeight/2 - 62;
        var itemHeight = itemHeight;
        this.length = lists.length;
        this.topHeight = 0;
        this.setTimeout = null;
        this.box = dom.children[0];
        this.onceLength = (itemHeight * this.length - (boxHeight/2))/boxHeight;
        this.value = 0;
        const self = this;
        
        var changeDom = dom.children[0];
        dom.onmousemove = function(e){
            self.box.style.transition = 'none';
            self.topHeight = ((e.clientY - self.start) * self.onceLength);
            self.box.style.top = -self.topHeight + 'px';
            clearTimeout(self.setTimeout);
        }
        dom.onmouseout = function(e){
            self.setTimeout = setTimeout(function(){
                self.box.style.transition = 'top linear 0.15s';
                self.topHeight = -itemHeight * self.value + (dom.offsetHeight/2) - itemHeight/2;
                self.box.style.top = self.topHeight + 'px';
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
                       name: "1234",
                       childrens: [
                           {
                               name: "aa",
                               childrens: [
                                   {
                                       name: "test1",
                                       chunk: '123' //查询数据的凭证
                                   },
                                   {
                                       name: "test2",
                                       chunk: '123'
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
                                   },
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
                                   },
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
                                   },
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
                                       name: "5678910结束"
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
                               name: "ggggg 结束"
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
                               name: "bbbb结束"
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
                               name: "bbbb 结束"
                           }
                       ]
                   },
                   {
                       name: "4",
                       childrens: []
                   },
                   {
                       name: "5",
                       childrens: [
                           {
                               name: "测试1"
                           },
                           {
                               name: "测试2"
                           },
                           {
                               name: "测试3"
                           },
                           {
                               name: "测试4 结束"
                           }
                       ]
                   }
               ],
               ListChoose: 0, //第一个choose
               secondList: [], //
               secondShow: false,
               secondListChoose: null, //第二个choose
               threeList: [], //第三个列表
               threeShow: false,
               threeListChoose: null, //第三个choose
               isShowAll: false,
               searchValue: ''
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
                    self.threeList = [];
                    self.threeListChoose = null;
                    self.threeShow = false;
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
            },
            searchList(){
                // 查询数据列表
                // 缺少了抖动的判断
                console.log(this.searchValue);
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
    .circle-box{
        width: 60px;
        height: 60px;
        position: absolute;
        left: 20px;
        top: 20px;
        border-radius: 60px;
        transition: all linear 0.12s;
        transform: scale(0.78);
        cursor: pointer;
        .circle{
            width: 100%;
            height: 10px;
            position: absolute;
            left: 0px;
            top: 27px;
            transform: rotate(0deg);
            transition: all ease 1s;
            &::before{
                content: '';
                width: 6px;
                height: 6px;
                position: absolute;
                background: #2b2257;
                left: 27px;
                border-radius: 10px;
                top: 0px;
                transition: all linear 1s 0.1s, left ease 0.1s 0s;
            }
        }
        &:hover, .show-over{
            .circle{
               transform: rotate(360deg);
               &::before{
                  left: -2px;
                  background: white;
               }
            }
            .line{
                &:nth-of-type(1),
                &:nth-of-type(2),
                &:nth-of-type(3)
                {
                    transform: rotate(90deg);
                    left: 2px;
                    top: 28px;
                }
                &:nth-of-type(1){ //7
                    //0.75 + 0.125
                }
                &:nth-of-type(2){ //3
                    transform: rotate(90deg);
                    left: 57px;
                    top: 28px;
                }
                &:nth-of-type(3){ //5
                    top: auto;
                    transform: rotate(0deg);
                    left: 30px;
                    bottom: 0px;
                    //0.5 + 0.125
                }
                &:nth-of-type(4){
                    transform: rotate(-45deg);
                    left: 10px;
                    top: 8px;
                    //0.875 + 0.125
                }
                &:nth-of-type(5){ //2
                    transform: rotate(45deg);
                    left: 48px;
                    top: 8px;
                }
                &:nth-of-type(6){ //6
                    transform: rotate(45deg);
                    left: 10px;
                    top: 47px;
                    //0.625 + 0.125 
                }
                &:nth-of-type(7){ //4
                    transform: rotate(-45deg);
                    left: 48px;
                    top: 47px;
                }
                &:nth-of-type(8){
                    top: 0px;
                    transform: rotate(0deg);
                }
            }
        }
        .line{
            width: 2px;
            height: 5px;
            background: white;
            position: absolute;
            top: 0px;
            left: 30px;
            transition: all ease 0.125s;
                &:nth-of-type(1),
                &:nth-of-type(2),
                &:nth-of-type(3)
                {
                    transform: rotate(90deg) scaleY(1);
                    left: 2px;
                    top: 28px;
                }
                &:nth-of-type(4){ //0
                    transform: rotate(45deg) scaleY(1);
                    left: 15px;
                    top: 12px;
                    transition: all ease 0.3s 0s;
                }
                &:nth-of-type(8){ //1
                    transform: rotate(90deg) scaleY(0.8);
                    top: 7px;
                    transition: all ease 0.3s 0.125s;
                }
                &:nth-of-type(5){ //2
                    transform: rotate(135deg) scaleY(1);
                    left: 44px;
                    top: 13px;
                    transition: all ease 0.3s 0.25s;
                }
                &:nth-of-type(2){ //3
                    transform: rotate(0deg) scaleY(1);
                    left: 49px;
                    transition: all ease 0.3s 0.375s;
                }
                &:nth-of-type(7){ //4
                    transform: rotate(45deg) scaleY(1);
                    left: 43px;
                    top: 43px;
                    transition: all ease 0.3s 0.5s;
                }
                &:nth-of-type(3){//5
                    transform: rotate(90deg) scaleY(1);
                    top: auto;
                    bottom: 7px;
                    left: 30px;
                    transition: all ease 0.3s 0.625s;
                }
                &:nth-of-type(6){ //6
                    transform: rotate(-45deg) scaleY(1);
                    left: 15px;
                    top: 43px;
                    transition: all ease 0.3s 0.75s;
                }
                &:nth-of-type(1){ //7
                    transform: rotate(0deg) scaleY(1);
                    left: 8px;
                    transition: all ease 0.3s 0.875s;
                }
            
        }
    }

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
            top: 0px;
        }
    }
    .menus-listed{
        height: 100%;
        top: 0px;
        &:nth-of-type(1){
            height: calc(100% - 100px);
            top: 80px;
        }
    }
    .search-box{
        width: calc(100% - 40px);
        position: absolute;
        border: 1px dashed white;
        border-radius: 7px;
        bottom: 15px;
        left: 20px;
        background: none;
        font-size: 20px;
        color: white;
        padding: 5px 15px;
        box-sizing: border-box;
        outline: none;
        &::placeholder{
            color: white;
            font-size: 20px;
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