# 移动端问题总结

最近更新时间：星期二, 19. 九月 2017 04:56下午 

[TOC]
##### html5 video在安卓大部分浏览器包括微信最顶层的问题？
##### video在不同浏览器播放时自动全屏？
##### video/audio在移动端浏览器不能自动播放（autoplay无效）？
##### ios下iframe嵌入的qq.com不能自适应
解决办法：
[How to get an IFrame to be responsive in iOS Safari?](https://stackoverflow.com/questions/23083462/how-to-get-an-iframe-to-be-responsive-in-ios-safari "在iOS Safari中怎样使iframe的内容自适应")
The solution for this problem is actually quite simple and there are two ways to go about it. If you have control over the Content.html then simply change the div#ScrolledArea width CSS to:

        width: 1px;
        min-width: 100%;
        *width: 100%;
Basically the idea here is simple, you set the width to something that is smaller than the viewport (iframe width in this case) and then overwrite it with min-width: 100% to allow for actual width: 100% which iOS Safari by default overwrites. The *width: 100%; is there so the code would remain IE6 compatible, but if you do not care for IE6 you can omit it. Demo

enter image description here enter image description here

As you can see now, the div#ScrolledArea width is actually 100% and the overflow: scroll; can do it's thing and hide the overflowing content. If you have access to the iframe content, then this is preferable.

However if you do not have access to the iframe content (for what ever reason) then you can actually use the same technique on the iframe itself. Simply use the same CSS on the iframe:
```
    iframe {
        width: 1px;
        min-width: 100%;
        *width: 100%;
    }
 ```
 
However, there is one limitation with this, you need to turn off the scrollbars with scrolling="no" on the iframe for this to work:


```
\<iframe height=\"950\" width=\"100%\" scrolling=\"no\" src=\"Content.html\"\></iframe\>
```

If the scrollbars are allowed, then this wont work on the iframe anymore. That said, if you modify the Content.html instead then you can retain the scrolling in the iframe. 

---
##### 安卓下的浏览器退到后台以后，依然播放音频
解决方法：
监听H5新事件`visibilitychange`，当页面不可见（即`visibilityState=='hidden'`或`document.hidden==true`）时暂停音乐播放.
相关知识：
H5新特性-页面可见性Page Visibility API
Page Visibility API的规范很简单，`document.hidden` 根据浏览器窗口的状态返回 `true` 或 `false`。具体的状态存储在`document.visibilityState（hidden 、 visible、prerender、unloaded）`里。`visibilitychange`可以作为一个事件。document.visibilityState可以检测为什么document不可见。

---
##### 音视频方法fastSeek对safari支持，对chrome不支持。
---
##### UC/360/搜狗浏览器不能监听到video的error事件
---
##### IOS下的QQ浏览器video播放时会调用视频播放器且置顶，即使删除video标签，视频依然会播放。

