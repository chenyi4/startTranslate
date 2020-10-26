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
            <div class="mobile-list">
                <div class="mobile-list-box">
                    <div class="file-item" v-for="(item, keys) in 12" :key="keys">
                        <div class="title">目录1</div>
                        <div class="list-all">
                            <div class="title">susan miller</div>
                            <div class="item" v-for="(item, key) in 12" :key="key">测试{{item}}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="back-detail" @click="isShowOverBlock = false;"></div>
            <input class="search-box" placeholder="查询 /" v-model="searchValue" @input="searchList"/>
        </div>
        <div :class="{'text-detail':true, 'isVague': isShowOverBlock}">
            <div class="text-all-box">
                <div class="text-detail-all">
                    <div class="title">{{text.title}}</div>
                    <div class="title-date">{{text.data}}</div>
                    <div class="detail-text">{{text.content}}</div>
                </div>
            </div>
            <div class="call-back"></div>
            <div class="translate">译</div>
            <div class="text-place" @click="showBlock">位置 》 位置2 》 具体位置</div>
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

        this.dom = dom;
        this.documentHeight = window.innerHeight;
        this.start = this.documentHeight/2 - this.dom.offsetHeight/2 - 62;
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
        this.updata = function(){
            this.start = documentHeight/2 - dom.offsetHeight/2 - 62;
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
               searchValue: '',
               isOverAll: false,
               isShowOverBlock: false,
               text:　{
                    title: `Everything you need know about`,
                    data: '2020/10/26',
                    content: `
                        Dear Reader:
        
                        I finally can reveal the secret I have been harboring for months!

                        I have a beautiful newly designed app to replace my present app, still with the same trademarked name, 
                        “Daily Horoscope Astrology Zone + More by Susan Miller®”. In a way the title is a misnomer, because my app comes 
                        chock full of information, some of which I will tell you about here. I am thrilled to finally show you the new design on the
                        Apple App Store (http://apple.co/2gcVDnn)

                        My app will appear in the Google Play Store. They have it and approved it, so it should appear this week or next week. 
                        We believe it will be the same link, with the new app replacing the former one here: (http://bit.ly/2y7pHaT)

                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/#ixzz6YwQfi0ce

                        YOUR HOROSCOPE BY SUSAN MILLER
                        Your chart is a curious one at the moment. You have a lot going on at home—possible improvements, responsibilities to take care of at your home,
                        and you may even need to make decisions about how best to help one of your parents, your child, or other family member. At the same time, 
                        you seem to have a pressing desire to flee town and enjoy time off. Somehow, you will have to reconcile these two opposite urges—stay home 
                        and concentrate, or go away and forget for a while—and I think I can help. Even though your home life will win out because your home looks to be
                        the more pressing of the two, you still might be able to sneak out of town for a luxurious little weekend, so let’s have a look at all that is going on.

                        What is causing a so strong an emphasis on your home life? Mars entered your fourth house of home on June 27 and is set to stay six months, until
                        January 6, 2021. The more typical visit of Mars to a sign and sector of the chart is six weeks, so having Mars, a high-energy planet in your home and family sector,
                        is unusual and will allow you to accomplish much. Mars was called the timekeeper of the zodiac by ancient astrologers, meaning that Mars decides where your 
                        attention will be focused, determined by the sector Mars visits. This year, you will be focused on your home and other property you now rent, own, or want to sell.
                        Additionally, you may also be concerned with the happiness and well-being of a family member, most likely a parent or other relative you would think of as a parent. 
                        This area of the chart would cover other family members, too.

                        Mars always brings noise with him when he enters any house of the horoscope, so here we see that you may have workmen making repairs, or painters giving a coat 
                        of paint to one or more rooms, or a contractor tearing apart your kitchen.

                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/#ixzz6YwQkfDQU

                        It may be that you are having parties or committee meetings at your home, but during a pandemic that seems unlikely—when you have them they are probably on
                        Zoom. Your children may be learning online and be home most of the time, so your role might have changed—you may be part-time teacher to your children, too. 
                        Or if you are worried about the coronavirus spreading at a nursing home, you may have invited your mother to come live with your family—and she accepted. 
                        Her nurse or aid may be living with you as well, so there’s more commotion at home, but more love, too. Those are some examples, but you get the idea.

                        The reason you will have a long focus on your home is that Mars will go retrograde. Mars is set to stay from June 27 until January 6, 2021. In the middle of the period, 
                        Mars will be out of phase, from September 9 to November 13. It is about to get more complicated.

                        Adding to the pandemonium of Mars retrograde, Mars’ little brother Mercury will copy Mars and go retrograde too, from October 13 to November 3. Yikes, having 
                        both out of commission at somewhat of the same time. This could mean that your home-related project or plans will slow down considerably. You may change your 
                        mind about a decision you previously made about home and family plans. Your workmen may find something in the walls of your home that must be fixed 
                        immediately before they can continue. If you are selling property and not finding buyers, you and your broker may have to come up with a new strategy on the price.


                        Also, it would not be wise to buy new electronic items during this period, so make it a point to shop early in September if you need a new computer, TV, smart phone,
                        refrigerator, vacuum cleaner, or other item you were hoping to buy. If that is too soon to shop, then wait until mid-to-late November to do so.



                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/2/#ixzz6YwQs2ub9

                        You will have a longing to travel, and this new moon, September 17, may give you a way to pack and go. This new moon seems made for you, 
                        and all the areas I listed that come under the umbrella of the ninth house will shine for you like diamonds in the Sun

                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/2/#ixzz6YwQyH4wS

                        I am going to jump ahead the full moon October 1, which you will feel as you get close to the final days of September. That full moon will be in Aries, your home and family sector, the same sector where Mars is. This full moon may bring options that you’ve been seeking but had not found until now. Mercury won’t retrograde until October 13, so you may be able to proceed with signing a lease or closing on a house, but keep in mind that action planet Mars will be retrograde at the time, so proceed slowly. If you buy property, get your own appraiser to check things out, for you might have to make improvements you had not counted on.

                        The outcome of this full moon in Aries might be quite lovely, however, because it puts Mars in the lead. We always look to the tightest mathematical signal that Mars will receive—and that would be from his lover Venus. Venus will be in Leo, your financial eighth house, during most of September, starting September 6 and going to October 2. The placement of Venus will boost your finances, especially at the full moon October 1, plus or minus four days. Mars will be in your real estate sector, so you may see a lucrative sale of property or get an attractive deal on the purchase of your dream house. You may get a generous check from family to help you put a down payment on a house (just in time for your birthday), or you might find a solution for an aging parent that you and your parent love and which you and your siblings can afford.

                        Now let’s turn to that yearning for travel I see in your chart. On the September 1 full moon in Pisces, 10 degrees (it will be operative for four additional days), there is a good chance you might get to take a surprise trip to a beautiful location near the sea or other body of water. If you go, you would find the location soothes and inspires you. I love that this full moon comes filled with outstandingly positive wishes from Uranus, the planet that is capable of bringing a thrilling surprise when you least expect it. Uranus is in your fifth house of fun, romance, leisure, and time off, so the start of the month is shaping up to something quite special.

                        This same full moon might bring an important deal or offer for you to sign off on, one that will allow you to use your talents and instincts to shape the venture in a way that you find is especially “you” in every way.

                        Jupiter, the good fortune planet, will be watching all that is going on at this full moon and sending golden wishes from his perch in Capricorn, favoring you. He will be within range of the Sun, adding to the possibility that a deal is in the making that could earn you good money.

                        All Capricorns will enjoy this September 1 full moon, however, if your birthday falls on December 31, plus or minus five days, you’ll get an extra dose of goodness from this full moon. The same would apply if you have Capricorn rising at 10 degrees or a natal planet at 10 degrees in Capricorn, Taurus, Virgo, Cancer, Pisces, or Scorpio, plus or minus five degrees, in all cases.

                        Jupiter will be in sync with the Sun to exact degree on September 9, the same day that Mars goes retrograde. If you are having a meeting about an possible deal, schedule it a few days ahead, as the energy of this aspect is building, but move heaven and earth to stay away from Mars retrograde.

                        It is never wise to start a new venture while Mars is retrograde. Mars is the energy planet and teaches us how to compete skillfully. Without Mars’ strength behind a venture, most will fall flat. Those projects that you think wouldn’t require much time and effort will turn out to be harder to get to the success you had assumed. It’s just not the time to start a new venture, to launch a new product or service, or even to start a new business relationship.

                        It’s not the time to start a romantic relationship either as the spark that will be evident at the beginning will soon evaporate. Capricorns who are attached are in a far better position. You need not be concerned about building Mars retrograde into a new relationship because you already built yours some time ago.



                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/4/#ixzz6YwR5rTQK

                        The way to deal with Mars retrograde in business is to focus on the clients, managers, VIPs, and colleagues you know and continue to do business with. If you have not heard from a person you enjoyed working with, contact them again, and see if you can create something new together for the future. Keep in mind that Mercury, Mars’ little brother, will be retrograde from October 13 to November 3, making for delays, redo’s, postponements, and changes of direction.

                        I feel we need to be ready for a second wave of the virus that I spelled out in detail in the forecast for Pisces. Take a moment to read what I wrote in Pisces. The net result is that due to a coming conjunction of Jupiter and Pluto on November 12, we have to brace for an outbreak more virulent than the previous ones. (Jupiter and Pluto meet every 13 years, and their first meeting this year was April 4, and the second was June 29-30.)

                        After their conjunction on November 12, Jupiter and Pluto will part, not to meet again until February 2033. No, I don’t feel we will have a pandemic that year—usually the meeting of these two planets heralds big financial deals in the news, but this year those huge, unprecedented financial deals turned out to be governments’ stimulus money sent to citizens in the trillions of dollars. I looked up the Spanish Flu and sure enough, in 1918 Jupiter and Pluto were in conjunction then too, precisely as we have now.

                        Pluto takes 248 years to circle the Sun and all the houses of the horoscope, and Jupiter takes 12 years to take the same journey, so you can see why they meet only rarely, every 13 years. Bill Gates and Warren Buffett both were born under this same aspect, Jupiter conjunct Pluto, so it can bring quite amazing financial success to those born under that rare aspect.



                        I need Jupiter and Pluto to be eight degrees apart, which they will be by Christmas 2020, and they’ll be even more distant on January 12, 2021. By then I feel the medical community will have a workable virus which could lessen the severest parts of the coronavirus.

                        The coming year, 2021, will be a far better year than 2020. While we will have some financial austerity, there will always people who perceive what the public wants, and in a crisis there are always new opportunities emerging in the newly fluid marketplace.

                        Now let’s talk about the new moon of September 17 in Virgo, 25 degrees. It will appear in your ninth house, which rules a host of delicious parts of life: travel, foreign markets, international relationships, favor from an academic institution, including luck with admissions, exams, and presenting your thesis. This area of your chart also rules the media (publishing, broadcasting, digital) with you either as journalist or producer, or the subject of an important story, giving you enviable publicity.

                        You also will do well if you’re involved in the court system with, for example, a verdict that will eventually be judged in your favor, or in securing patents and trademarks, or you could hear good news about immigration or matters concerning citizenship, a green card, or visa. The way new moons work is that the universe opens the door, but you must show your intent by doing your part and working with the positive energy provided. This new moon is breathtaking in its support of you.



                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/6/#ixzz6YwRAGIU8

                        All Capricorns will benefit from this new moon, but especially if you were born on January 14, plus or minus five days, or have either Virgo rising or a natal planet in Virgo, Capricorn, Taurus, Pisces, Cancer, or Scorpio at 25 degrees, plus or minus four degrees.

                        As I mentioned at the start of your report, you will have a longing to travel, and this new moon, September 17, may give you a way to pack and go. While a full moon will only give you a plus or minus four days, a new moon provides a much larger opportunity to capture your dream, one that lasts months. This new moon seems made for you, and all the areas I listed that come under the umbrella of the ninth house will shine for you like diamonds in the Sun.

                        —————————————–
                        Please Note: On October 1, 2020, there is a full moon in Aries 9º, not Aquarius 9º. We apologize for this error in our 2020 calendar.
                        ——————————————
                        SUMMARY

                        Every part of you is longing to go on a trip to get a change of scene. Life has required a lot of self-discipline lately, but as a Capricorn, self-discipline is never a problem—you have that in abundance. Everyone needs change, though, and you are feeling the need especially strongly now. Yet we are in the middle of a pandemic, and even if your region or city is doing well, other parts of the world may be having a hard time coping with the virus and are still in lockdown. Check with authorities before you plan any trip.



                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/7/#ixzz6YwRK8fpj

                        YOUR HOROSCOPE BY SUSAN MILLER
                        Taking a road trip may be your best option, and that’s certainly going to be possible at the full moon in Pisces on September 1. This is a graceful, lyrical full moon, so consider going to a gorgeous setting nearby that offers a view of the sea, lake, or stream—a full moon in Pisces would have you soothed by hearing the surf crashing on the beach, waves lapping on the edge of a lake, or of a waterfall bubbling over boulders. This full moon is one of the best of the year.

                        The Sun and full moon will be in ideal sync with surprise planet Uranus, indicating that if you do go, it may well be a last minute, spontaneous decision, which is always exciting. Your spouse, partner, or sweetheart, appears to be enthusiastic about going along with all your plans.

                        Good news about money is likely to come to you at the start of the month—it would involve a one-time sum of money, which might represent a bonus, commission, royalty, insurance payout, or other payment. That is sure to make you happy.

                        You may be asked to sign a contract or other important papers. Set the signing for September 2 or, if that is too early to be ready, sign on your runner-up day, September 4, your two best days to sign on the dotted line. Avoid launching anything new while Mars is retrograde, September 9 to November 13.



                        Read more: https://www.astrologyzone.com/forecasts/capricorn-horoscope-september-2020/8/#ixzz6YwRNJ4WX

                        Don’t be blue if you cannot travel as far away as you’d like. The new moon of September 17 strongly suggests you will have ample opportunities to pack and go later in the year, assuming authorities give you the green light to travel further afield. Faraway people and places are beckoning you to come, so you may be working with executives in a foreign country over email and Zoom conferences now, with a plan to meet in person later when the virus has gotten under control.

                        It may be just as well that you don’t travel now. Mars has recently moved into Aries and is putting a big spotlight on your home sector, suggesting you will need to be there to supervise changes. You may soon be ordering repairs, a thorough cleaning, or renovation, or you may be starting a decorating project. Mars will continue to accent this area until January 6, 2021, so it is likely your concentration will be on your home through most of that period. Mars will retrograde from September 9 to November 13, so you will need to factor in delays or changes of direction during that time—it comes with the territory and is natural.

                        The period from mid-November through the first week of January will be your most productive for home and family matters. If you are not focused on your residence or other property you may own or rent (or hope to sell or buy soon), then you may be thinking intensely on how to best help one of your parents.

                        You may spend more time with your mother or father or help them with small things that need to be done around their house, or you may help by finding the right specialist to address your mother’s or father’s health concern. While you are together, you can ask all the questions about their childhood and other details about your family tree that you’ve always wanted to know. It can be a lovely time to grow closer.

                    `
                }
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
                var time3 = setTimeout(function(){
                    self.isShowOverBlock = false;
                },100);
            },
            searchList(){
                // 查询数据列表
                // 缺少了抖动的判断
                console.log(this.searchValue);
            },
            changeShow(){
                this.isShowAll = !this.isShowAll;
            },
            showBlock(){
                this.isShowOverBlock = true;
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
        // opacity: 0;
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
                text-align: right;
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
        &:hover{
            color: grey;
            border: 2px solid grey;
            &::after{
                transform: rotate(45deg) scale(0);
            }
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
        right: 55px;
        top: 28px;
        display: none;
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
        }
        .mobile-list{
            width: calc(100%);
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