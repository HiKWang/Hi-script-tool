# jQuery运用
*创建时间：星期五, 03. 十一月 2017 02:25下午*
***更新时间：星期五, 03. 十一月 2017 02:25下午***

[TOC]

## load()
load(url, data, complete)
url #query，url空格后跟`#query`可以返回id为query的html内容。注意url和`#`之间有空格.

## 获取当前元素索引值
```jquery
$("li").hover(function(){ 
      alert($("li").index(this)); 
});
```