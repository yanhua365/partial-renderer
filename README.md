partial-renderer
================

## 功能和用法

使用Spring MVC和FreeMarker实现RoR的局部渲染（partial render）功能。

参考RoR的功能： http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html

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
