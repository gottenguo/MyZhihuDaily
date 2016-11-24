## MyZhihuDaily
我的《知乎日报》IOS版，__仅供学习和娱乐__。

### 前言
因为很喜欢知乎日报某些栏目内容，所以决定自己来写一个客户端，虽然跟官方的APP比较起来略显幼稚，但这也不失为一个锻炼自己的机会，断断续续历时一个月写完这个APP后很有成就感。

### 关于APP 

![HomePage](https://raw.githubusercontent.com/gottenGuo/ResourceFile/master/HomePage.png)
![NightHomePage](https://raw.githubusercontent.com/gottenGuo/ResourceFile/master/NightHomePage.png)
![SideslipPage](https://raw.githubusercontent.com/gottenGuo/ResourceFile/master/SideslipPage.png)
![AboutZhiHuDailyPage](https://raw.githubusercontent.com/gottenGuo/ResourceFile/master/AboutZhiHuDailyPage.png)

首先要感谢 [izzyleung](https://github.com/izzyleung/ZhihuDailyPurify/wiki/%E7%9F%A5%E4%B9%8E%E6%97%A5%E6%8A%A5-API-%E5%88%86%E6%9E%90)，没有他对知乎日报API的详细分析就不会有这个APP。再要感谢[官方APP](http://daily.zhihu.com/)，没有它作为原型参照，此APP也不可能这么快的完成。

MyZhiHuDaily主要获取官方三个数据接口：__瞎扯、小事、大误__，与官方同步更新，本地并未保存数据（图片缓存除外）。MyZhiHuDaily除以上三个模块，还拥有__关于知乎__模块，此模块有对知乎日报（官方）的简介，并提供下载链接与二维码链接。

项目中部分模块在加载数据时偶尔会出现白屏闪烁的BUG（特别是下载界面），我怀疑是由于UIWebView的私有控件（UIWebBrowserView）造成，我虽然采用了添加遮罩层去规避这个问题，但也只是降低了闪烁的机率，后续会解决，__Mark__

项目开始时分享功能是在规划内的，但因为最近公司有新项目启动，暂时顾不上，后续添加，__Mark__

### 关于初学者
MyZhiHuDaily代码相对简洁，且由纯代码构成，仍采用经典的MVC模式。初学者可以很容易的读懂代码，并了解整个APP的构成，在本项目中还可以了解 __Delegate、NSNotification、Category、枚举、继承__的具体使用场景，以及基础的OC编码技巧。建议初学者多读源码（开源框架、官方文档），是提升自我编码能力一种有效途径。

### 感谢
在日常的学习中以及项目的开发中，得到了很多前辈的指导，以至于让自己少踩了很多坑（也踩过很多坑），非常崇拜这些有分享精神的技术前辈，他们也影响了我整个开发之路，如果有可能我也想完成自己的一个开源框架（^_^），推荐一篇文章 [什么是开源精神 ?](https://github.com/lifesinger/blog/issues/167)

__MyZhiHuDaily项目中用到了很多优秀的第三方框架，感谢以下开发者：__

- [AFNetworking](https://github.com/AFNetworking)
- [Draveness](https://github.com/Draveness)
- [Jonathan George](https://github.com/jdg)
- [M了个J](https://github.com/CoderMJLee)
- [Olivier Poitrey](https://github.com/rs)
- [ViewDeck](https://github.com/ViewDeck)








