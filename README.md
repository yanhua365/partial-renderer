partial-renderer
================

## 功能

这个示例使用Spring MVC和FreeMarker实现RoR的局部渲染（partial render）功能。

参考了rails的局部渲染功能： http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html

为什么需要局部渲染呢？

示例里演示了这样一个场景：

- 第一次进入这个页面，左边是一个图书的列表，右边的面板显示列表中第一本图书的详细信息；
- 在此页面选中左边的列表中的某一本图书，右边面板的内容要变为选中的图书的详细信息。

很显然，第二点通常的办法是通过一个ajax请求获取一本书的JSON数据或HTML片段，然后更新页面上的区域内容来实现。
而第一点就有两个选择：
- 页面在服务器端渲染时就渲染右侧详细信息面板。但这样和第二点采用的技术不一致了，需要维护两部分的代码。
- 页面在客户端渲染完列表后，再发起一次ajax请求去取列表中第一本书的详细内容，这和第二点用的技术一致了，
但是，多了一次请求，也多了一次数据查询，有时候页面第一次显示的效果也不好，对SEO也有一定程度的影响。

局部渲染通过抽象出“局部模板”来综合上面两个的优点 —— 第一次在服务器端和页面主体部分一起渲染抽象出的局部，
后续响应ajax请求生成局部的HTML片段，都使用同一个“局部模板”。既兼顾性能、SEO又简化开发，减少重复。


# 用法

目前只实现的一般的局部渲染，未实现集合的渲染（可以在局部模板中使用list指令实现相同的功能）。

在页面上要渲染一个局部模板只需调用：

```
<@render "_detail.ftl" books[0]/>
```

在局部模板中通过```object```访问变量：

```
<#--
 @param object : Book对象
 -->
<div>
<h2>${object.name}</h2>
<img src="${object.picUrl}">
<p>
    ${object.desc}
</p>
</div>
```

也可以在控制器里单独渲染局部模板:

```
@RequestMapping("/detail/{id}")
public String detail(@PathVariable("id") String id,ModelMap modelMap){
    modelMap.addAttribute("object", Book.getBook(id));
    return "_detail";
}
```

## 运行示例

确认先安装了Gradle，运行：

```
gradle jettyRun
```
即可。
