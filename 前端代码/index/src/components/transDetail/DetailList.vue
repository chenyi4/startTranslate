<template>
    <div>
        <div class="detail-list"></div>
        <div :class="{'cover-list':true, 'isOverAll': isOverAll, 'cover-list-show': isShowOverBlock}">
            <div :class="{'circle-box':true, 'show-over':isShowAll }" @click="changeShow">
                    <!-- 点击展开,和关闭 -->
                    <div>
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
                    v-for="(item, key) in lists[ListChoose].childrens" 
                    :key="key">
                        {{item.name}}
                    </div>
                </div>                
            </div>
            <div class="menus-list3" ref="list3">
                <div id="box3" v-if="threeShow">
                    <div :class="{'line-one':true, 'line-change': key == threeListChoose}" 
                    v-for="(item, key) in lists[ListChoose].childrens[secondListChoose].childrens" 
                    @click="selectThreeMenu(key)"
                    :key="key">
                        {{item.name}}
                    </div>
                </div>
            </div>     
            <div class="mobile-list">
                <div class="mobile-list-box">
                    <div class="file-item" v-for="(item, keys) in lists" :key="keys">
                        <div class="title">{{item.name}}</div>
                        <div class="list-all" v-for="(file, oneKey) in item.childrens" :key="oneKey">
                            <div class="title">{{file.name}}</div>
                            <div class="item" v-for="(items, key) in file.childrens" :key="key"  @click="selectThreeMenu(key, keys, oneKey)">{{items.name}}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="none-message" v-if="lists.length == 0">暂无数据</div>
            <div class="back-detail" @click="isShowOverBlock = false;"></div>
            <input class="search-box" placeholder="查询 /" v-model="searchValue" @input="searchList"/>
        </div>
        <div :class="{'text-detail':true, 'isVague': isShowOverBlock || isLoading}">
            <div class="text-all-box" ref="textBox">
                <div class="text-detail-all">
                    <div class="title" v-if="text.name">{{(text.name).replace(".txt", "")}}</div>
                    <div class="title-date">{{getDetailDay(text.createtime)}}</div>
                    <div class="detail-text" v-html="text.content"></div>
                </div>
            </div>
            <div class="call-back" @click="changePath"></div>
            <div :class="{'translate':true, 'translateed':isTranslate}" @click="changeTranslate">译</div>
            <div class="text-place" @click="showBlock">
                <span v-if="!ListChoose && lists.length == 0">具体列表</span>
                <span v-if="lists.length >0 && ListChoose >=0">{{lists[ListChoose].name}} >> </span> 
                <span v-if="secondListChoose">{{lists[ListChoose]['childrens'][secondListChoose].name}}</span>
                <!-- <span v-if="threeListChoose && secondListChoose">{{lists[ListChoose]['childrens'][secondListChoose]['childrens'][threeListChoose].name}}</span> -->
            </div>
        </div>
        <div>
            <div class="detail-top"></div>    
            <div class="detail-left"></div>
            <div class="detail-bottom"></div>
            <div class="detail-right"></div>
        </div>
        <div :class="{'loading':true, 'loading-animation':isLoaingAnimation}" v-if="isLoading">
            <div class="demo5">
                <div class="inline-1"></div>
                <div class="inline-2"></div>
                <div class="inline-3"></div>
            </div>
        </div>
    </div>   
</template>
<script>
    import { panel } from '@/api/index';
    var obj1, obj2, obj3;
    function set(dom, lists, itemHeight, boxHeight){
        this.dom = dom;
        this.documentHeight = window.innerHeight;
        this.start = this.documentHeight/2 - this.dom.offsetHeight/2 - 62;
        this.itemHeight = itemHeight;
        this.length = lists.length;
        this.topHeight = 0;
        this.setTimeout = null;
        this.box = dom.children[0];
        this.onceLength = (itemHeight * this.length - (boxHeight/2))/boxHeight;
        this.onceLength = this.onceLength > 0?this.onceLength:0.2;
        this.value = 0;
        const self = this;
        
        var changeDom = dom.children[0];
        dom.onmousemove = function(e){
            self.box.style.transition = 'none';
            self.topHeight = ((e.clientY - self.start) * self.onceLength);
            self.box.style.top = -self.topHeight + 'px';
            clearTimeout(self.setTimeout);
        }
        dom.onmouseout = function(){
               self.setHeightTop();
        }
        
        this.setHeightTop = function(){
            const self = this;
            self.setTimeout = setTimeout(function(){
                self.box = self.dom.children[0];
                self.topHeight = -self.itemHeight * self.value + (self.dom.offsetHeight/2) - self.itemHeight/2;
                if(self.box){
                    self.box.style.transition = 'top linear 0.15s';
                    self.box.style.top = self.topHeight + 'px';
                }
                clearTimeout(self.setTimeout);
            }, 300);
        }
    }

    export default {
        name: 'DetailList',
        props: {
        },
        data() {
            return {
               orgList: null,
               lists: [],
               ListChoose: 0, //第一个choose
               secondShow: false,
               secondListChoose: null, //第二个choose
               threeShow: false,
               threeListChoose: null, //第三个choose
               isShowAll: false,
               searchValue: '',
               isOverAll: false,
               chunk: null,
               isShowOverBlock: true,
               text:　{
                   
               },
               searchClear: null,
               isLoading: false,
               isLoaingAnimation: false,
               isTranslate: false,
               orgArtcle: ''
            }
        }, 
        destroyed(){
            
        },
        mounted(){
            this.handleScroll();
        },   
        created(){
            const self = this;
            this.$nextTick(() => {
                self.getStoreData();
                if(self.chunk){
                    self.getArticleDetail({chunk: self.chunk});
                }
            });
        },
        beforeRouteEnter (to, from, next) {
            var chunk = to.query.chunk;
            
            next(vm => {
                if(chunk){
                    vm.isShowOverBlock = false;
                    vm.chunk = chunk;
                }else{
                    vm.isShowOverBlock = true;
                }
            });
        },
        methods:{
            handleScroll(){
                const self = this;
                this.$refs.textBox.addEventListener('scroll', function(e){
                     self.$router.push({
                        path: 'article',
                        query: {...self.$router.currentRoute.query, top: e.target.scrollTop},
                    });  
                }, true);

                if(this.$router.currentRoute.query.top){
                    setTimeout(function(){
                        document.getElementsByClassName('text-all-box')[0].scrollTop = Number(self.$router.currentRoute.query.top);
                    }, 500);
                }
            },
            getStoreData(){
                const self = this;
                const requestValue = panel.getAllArticles(); //获取全部的数据
                requestValue.then((value) => {
                    self.lists = self.orgList = JSON.parse(JSON.stringify(value.data));
                    var allLength = 0;
                    for(var item in self.lists){
                        if(self.lists[item].childrens.length > allLength){
                            allLength = self.lists[item].childrens.length;
                        }
                    }
                    setTimeout(function(){
                        obj1 = new set(self.$refs.list, self.lists, 49, 220);
                    },100);
                });
            },
            changeListMenu(i){
                const self = this;
                this.ListChoose = i;
                obj1.value = i;
                var secondList;

                this.secondShow = false;
                var time1 = setTimeout(() => {
                    secondList = self.lists[i].childrens||[];
                    self.secondShow = true;
                    self.secondListChoose = null;
                    self.threeListChoose = null;
                    self.threeShow = false;
                    clearTimeout(time1);
                });

                var time2 = setTimeout(() => {
                    obj2 = new set(this.$refs.list2, secondList, 49, 300);
                    obj2.value = null;
                    clearTimeout(time2);
                }, 100);
            },
            changeSencodMenu(i){
                const self = this;
                self.secondListChoose = i;
                obj2.value = i;
                this.threeShow = false;
                var threeList;
                var time3 = setTimeout(() => {
                    threeList = self.lists[self.ListChoose].childrens[self.secondListChoose].childrens||[];
                    self.threeShow = true;
                    self.threeListChoose = null;
                    clearTimeout(time3);
                });

                var time4 = setTimeout(() => {
                    obj3 = new set(this.$refs.list3, threeList, 49, 300);
                    obj3.value = null;
                    clearTimeout(time4);
                }, 100);
            },
            selectThreeMenu(i, firstClick, secondClick){
                const self = this;
                if(firstClick != undefined){
                    self.ListChoose = firstClick;
                }
                if(secondClick != undefined){
                    self.secondListChoose = secondClick;
                }

                self.threeListChoose = i;
                if(obj3){
                    obj3.value = i;
                }

                var chunk = this.lists[self.ListChoose].childrens[self.secondListChoose].childrens[self.threeListChoose];
                var backValue = this.getArticleDetail({...chunk, chunk: chunk.textid}); 
                if(chunk.textid){
                    self.$router.push({
                        path: 'article',
                        query: {...self.$router.currentRoute.query,
                            chunk: Number(chunk.textid)
                        }
                    });  
                }
            },
            getArticleDetail(chunk){
                var self = this;
                //获取数据 文章详情
                
                if(obj3){
                    obj3.setHeightTop();
                }
                
                const requestValue = panel.getArticleDetail({
                    textid: chunk.chunk
                });//获取当前数据

                self.isLoading = true;
                self.isShowOverBlock = false;
                requestValue.then((value) => {
                            self.isLoaingAnimation = true;
                            var timeOut = setTimeout(function(){ //这个不是模拟，这个是为了显示的时候有个过度
                                self.isLoaingAnimation = false
                                clearTimeout(timeOut);
                                self.isLoading = false;
                                    if(value){
                                        self.text = JSON.parse(JSON.stringify(value.data));
                                        self.setDetailText();
                                    }else{
                                        self.text = {
                                            title: "暂无数据"
                                        };
                                    }
                            }, 300);
                    });
            },
            setDetailText(){
                const self = this;
                //替换所有的.为换行
                self.text.content = self.text.content.replace(/\./g,'.<br/>');
                self.text.content = self.text.content.replace(/\(http.+\)/g,'');
                self.text.content = self.text.content.replace(/\s\s\s\s\s\s\s\s\s/g,'++++');
                self.text.content = self.text.content.replace(/(\++\+)/g, '<br/>');
                self.orgArtcle = self.text.content;
                if(this.$route.query.isTranslate == '1'){
                    this.isTranslate = false;
                    this.changeTranslate();
                }else{
                    this.isTranslate = true;
                    this.changeTranslate();
                }
            },
            changeTranslate(){
                const self = this;
                this.isTranslate = !this.isTranslate;
                if(this.isTranslate){
                    var arr = self.text.content.split('<br/>');

                    var newText = '';
                    var newArr = (this.getTranslate(self.text.content)).split('<br/>');

                    arr.forEach((item, key) => {
                        newText = newText + item;
                        newText = newText +`<div class="translate-text">`+ newArr[key]+`</div>`;
                        newText = newText +`<br/>`;
                        // newText = newText +`<textarea class="textarea"></textarea><br/>`;
                    });
                    
                    self.text.content = newText;
                    self.changeRouter(true);
                }else{
                    self.text.content = self.orgArtcle;
                    self.changeRouter(false);
                }
            },
            changeRouter(isSetTranslate){
                try{
                    const self = this;
                    var chunk = this.$route.query.chunk;
                    if(isSetTranslate){
                        this.$router.push({
                            path: 'article',
                            query: {
                                ...self.$router.currentRoute.query,
                                chunk: chunk,
                                isTranslate: '1'
                            }
                        });
                    }else{
                        this.$router.push({
                            path: 'article',
                            query: {
                                ...self.$router.currentRoute.query,
                                chunk: chunk,
                                isTranslate: '0'
                            }
                        });
                    }
                }catch(err){
                }
            },
            getTranslate(value){
                var textswords = value.split(" ");
                var trans = value;
                var allWord = this.$store.state.allWords.allWords;
                allWord.forEach((item) => {
                    var reg = eval("/"+item[0]+"/gi");
                    trans = trans.replace(reg, '**'+(item[1]+'**'));
                });
                return trans;
            },
            searchList(){
                const self = this;
                clearTimeout(self.searchClear);
                let newList = [
                   
                ];
                var lists = JSON.parse(JSON.stringify(self.orgList));
                self.searchClear = setTimeout(function(){
                    lists.forEach((item) => {
                        if(item.name.indexOf(self.searchValue) >= 0){
                            newList.push(item);
                        }else{
                            var obj = { childrens: [], name: item.name};
                            item.childrens.forEach((children) => {
                                if(children.name.indexOf(self.searchValue) >= 0){
                                    obj.childrens.push(children);
                                }
                            });
                            if(obj.childrens.length > 0){
                                newList.push(obj);
                            }else{
                               var obj = {
                                    name: item.name,
                                    childrens: []
                               };
                               item.childrens.forEach((one) => {
                                   var child = {
                                       name: one.name,
                                       childrens: []
                                   }
                                   if(one.childrens){
                                        one.childrens.forEach((itemOne) => {
                                            if(itemOne.name.indexOf(self.searchValue) >= 0){
                                                child.childrens.push(itemOne);
                                            }
                                        });
                                        if(child.childrens.length > 0){
                                            obj.childrens.push(child);
                                        }
                                   }
                               });
                               if(obj.childrens.length > 0){
                                    newList.push(obj);
                                }
                            }
                        }
                    });
                    
                    if(self.searchValue){
                        self.lists = newList;
                        self.ListChoose = 0;
                        self.secondListChoose = 0;
                        self.threeListChoose = 0;
                        
                        //如果不存在obj2，就创建一个新的obj2
                        if(self.lists.length > 0){
                            obj1.value = 0;
                            obj1.setHeightTop();
                            self.secondShow = true;
                            self.threeShow = true;

                            var secondList = self.lists[0].childrens||[];
                           //如果存在obj2
                            obj2 = new set(self.$refs.list2, secondList, 49, 300);
                            obj2.value = 0;
                            obj2.setHeightTop();
                            
                            //如果不存在obj3，就创建一个obj3
                            var threeList = self.lists[0].childrens[0].childrens||[];
                            obj3 = new set(self.$refs.list3, threeList, 49, 300);
                            obj3.value = 0;
                            obj3.setHeightTop();

                        }else{
                            self.secondShow = false;
                            self.threeShow = false;
                        }
                        //模块上下的切换高度，不能设置到顶部

                    }else{
                        self.lists = self.orgList;

                        obj3.value = 0;
                        obj3.setHeightTop();

                        obj2.value = 0;
                        obj2.setHeightTop();
                    }
                    clearTimeout(self.searchClear);
                }, 600);
                // 查询数据列表
                // 缺少了抖动的判断
            },
            changeShow(){
                this.isShowAll = !this.isShowAll;
            },
            showBlock(){
                const self = this;
                this.isShowOverBlock = true;
                setTimeout(function(){
                    obj1 = new set(self.$refs.list, self.lists, 49, 220);
                },100);
            },
            changePath(){
                 this.$router.push({
                    path: '/'
                });
            },
            getDetailDay(value){
               var date = new Date( value* 1000);
               var Y = date.getFullYear() + '-';
                var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
                var D = date.getDate() + '';
                var h = date.getHours() + ':';
                var m = date.getMinutes() + ':';
                var s = date.getSeconds();
                return Y + M + D;
              
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
    left: 0px;
    top: 0px;
    // border: 5px solid #2b2257;
    box-sizing: border-box;
}
.cover-list{
    width: 100%;
    height: 100%;
    background: rgba(0,0,0,0.3);
    position: absolute;
    left: 0px;
    top: 0px;
    padding: 5px;
    display: none;
    z-index: 100;
    box-sizing: border-box;
    .circle-box{
        width: 60px;
        height: 60px;
        position: absolute;
        left: 12px;
        top: 12px;
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
                opacity: 0.4;
                left: 27px;
                border-radius: 10px;
                top: 0px;
                transition: all linear 1s 0.1s, left ease 0.1s 0s;
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
    .circle-box:hover, .show-over{
            .circle{
               transform: rotate(360deg);
               &::before{
                  left: -2px;
                  background: white;
                  opacity: 1;
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
            &:hover{
                
            }
     }
    .show-over:hover{
        .circle{
            transform: rotate(0deg);
        }
    }
    .menus-list, .menus-list2, .menus-list3{
        max-height: 300px;
        margin-top: -76px;
        transform: translateY(-50%);
        overflow: hidden;
        position: absolute;
        left: 0px;
        top: 50%;
        width: calc(25% - 20px);
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
    .search-box{
        width: calc(100% - 40px);
        position: absolute;
        border: 1px dashed white;
        border-radius: 7px;
        bottom: 15px;
        left: 20px;
        background: none;
        font-size: 18px;
        color: white;
        padding: 7px 15px;
        box-sizing: border-box;
        padding-top: 8px;
        outline: none;
        &::placeholder{
            color: rgba(255, 255, 255, 0.5);
            font-size: 18px;
        }
    }
    .mobile-list{
        display: none;
    }
    .back-detail{
        position: absolute;
        right: 18px;
        top: 16px;
        width: 30px;
        height: 30px;
        border-radius: 30px;
        border: 2px solid #7064a9;
        box-shadow: 10px 10px 30px rgba(255,255,255, 0.16) inset;
        cursor: pointer;
        &::before{
            content: '';
            width: 7px;
            height: 7px;
            position: absolute;
            left: 12px;
            top: 11px;
            border: 2px solid #7064a9;
            border-bottom: none;
            border-right: none;
            transform: rotate(-45deg);
        }
    }
    .none-message{
        color: white;
        text-align: center;
        position: relative;
        top: calc(50% - 50px);
        letter-spacing: 10px;
    }
    
}
.cover-list-show{
    display: block;
    background: rgba(5,5,5,0.45);
   
}

.text-detail{
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0px;
    top: 0px;
    background: white;
    padding:5px;
    box-sizing: border-box;
    overflow: hidden;
    .text-all-box{
        width: calc(100% - 3px);
        height: calc(100% - 54px);
        color: #966a6b;
        overflow: hidden;
        overflow-y: auto;
        position: relative;
        top: 4px;
        &::-webkit-scrollbar{
            width: 3px;
            height: 100%;
        }
        &::-webkit-scrollbar-thumb{
            background: #966a6b;
            border-radius: 100px;
        }
        .text-detail-all{
            width: 100%;
            height: auto;
            
            .title{
                width: 100%;
                font-size: 18px;
                text-align: right;
                padding-top: 20px;
                padding-right: 16px;
                font-weight: 550;
                box-sizing: border-box;
                letter-spacing: 4px;
            }
            .title-date{
                font-size: 14px;
                margin-top: 16px;
                padding-right: 19px;
                text-align: right;
            }
            .detail-text{
                width: 100%;
                padding: 0px 25px;
                box-sizing: border-box;
                margin-top: 80px;
                font-size: 16px;
                line-height: 26px;
                padding-bottom: 160px;
                text-align: left;
            }
        }
    }
    .translate{
        width: 25px;
        height: 25px;
        position: absolute;
        bottom: 45px;
        right: 20px;
        border: 2px solid #7064a9;
        color: #7064a9;
        line-height: 25px;
        font-weight: bold;
        text-align: center;
        cursor: pointer;
        transition: all ease 0.3s;
        &::after{
            width: 34.5px;
            height: 2px;
            background: #7064a9;
            content: '';
            position: absolute;
            left: -5px;
            top: 11px;
            transform: rotate(45deg);
            transition: all ease 0.3s;
        }
        
    }
    
    .translate:hover, .translateed{
        color: grey;
        border: 2px solid grey;
        &::after{
            transform: rotate(45deg) scale(0);
        }
    }
    .text-place{
        text-align: right;
        color: #966a6b;
        font-size: 14px;
        position: absolute;
        bottom: 12px;
        right: 18px;
        cursor: pointer;
    }
    .call-back{
        position: absolute;
        right: 45px;
        top: 28px;
        display: none;
        transform: scale(0.8);
        &::before{
            content: '';
            width: 35px;
            height: 8px;
            background: #958fb1;
            position: absolute;
            top: 0px;
            left: 0px;
        }
        &::after{
            position: absolute;
            width: 18px;
            height: 18px;
            border: 8px solid #7064a9;
            content: '';
            transform: rotate(45deg);
            border-top: 0px;
            border-right: 0px;
            top: -9px;
        }
    }
}
.isVague{
    filter: blur(1.6px);
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
@media screen and (max-width: 590px) {
    .detail-top,
    .detail-left,
    .detail-bottom,
    .detail-right{
        background: #8f8bd5;
    }
    .text-detail{
        .text-all-box{
            &::-webkit-scrollbar-thumb{
                background: #958fb1;
            }
            .text-detail-all{
                color: #706ba7;
                .title{
                    width: calc(100% - 60px);
                    text-align: left;
                    padding-right: 0px;
                    padding-top: 8px;
                    padding-left: 12px;
                    letter-spacing: 0px;
                    font-size: 22px;
                }
                .title-date{
                    text-align: left;
                    padding-right: 0px;
                    padding-inline-start: 12px;
                    margin-top: 20px;
                }
                .detail-text{
                    margin-top: 40px;
                    padding-left: 16px;
                    padding-right: 16px;
                    text-align: left;
                    font-size: 14px;
                    line-height: 35px;
                }
            }
        }
        .text-place{
            color: #706ba7;
            text-align: left;
            left: 16px;
            width: calc(100% - 100px);
        }
        .translate{
            border-width: 4px;
            width: 35px;
            height: 35px;
            line-height: 35px;
            font-size: 23px;
            bottom: 10px;
            right: 10px;
            &::after{
                width: 56px;
                top: 17px;
                left: -10px;
            }
            &:hover{
                border: 4px solid #706ba7;
                color:#706ba7;
                &::after{
                   transform: rotate(45deg) scale(1);
                }
            }
        }
        .call-back{
            display: block;
        }
    }
    .cover-list{
        background: rgba(255,255, 255, 1);
        width: calc(100% - 10px);
        left: 5px;
        height: calc(100% - 10px);
        top: 5px;
        .circle-box{
            display: none;
        }
        .menus-list,
        .menus-list2,
        .menus-list3{
            display: none;
        }
        .search-box{
            border-color: #8f8bd5;
            color: #8f8bd5;
            font-size: 16px;
            padding-top: 6px;
        }
        .mobile-list{
            width: calc(100%);
            display: block;
            height: calc(100% - 80px);
            position: relative;
            text-align: left;
            .mobile-list-box{
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                overflow-y: auto;
            }
            .file-item{
                margin-bottom: 10px;
                .title{
                    color: black;
                    font-size: 16px;
                    text-align: left;
                    font-weight: bold;
                    box-sizing: border-box;
                    margin-left: 14px;
                    padding-top: 12px;
                    padding-bottom: 8px;
                    padding-right: 50px;
                    display: inline-block;
                    border-bottom: 1px solid #8f8bd573;
                }
                .list-all{
                    .title{
                        width: 100%;
                        font-size: 14px;
                        border: none;
                        color:  #8f8bd573;
                    }
                    .item{
                        display: inline-block;
                        color: #0000008f;
                        font-size: 14px;
                        margin-bottom: 8px;
                        margin-left: 14px;
                        margin-right: 10px;
                        padding-left: 5px;
                        position: relative;
                        &::after{
                            content: '';
                            position: absolute;
                            width: 1px;
                            height: 70%;
                            left: 0px;
                            top: 18%;
                            background:#0000008f;
                            transform: rotate(20deg);
                        }
                    }
                }
            }
        }
    }
    
}

</style>