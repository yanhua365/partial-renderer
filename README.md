partial-renderer
================

## 功能和用法

使用Spring MVC和FreeMarker实现RoR的局部渲染（partial render）功能。

参考RoR的功能： http://api.rubyonrails.org/classes/ActionView/PartialRenderer.html

目前只实现的一般的局部渲染，还未实现集合的渲染。

在主页面上要渲染一个局部模板只需调用：

```
<@render "_detail.ftl", {'book':books[0]}/>
```

在局部模板中访问变量需要加上```_prctx_```这个前缀：

```
<div>
<img src="${_prctx_.book.picUrl}">
<p>
    ${_prctx_.book.desc}
</p>
</div>

```

要在控制器里单独渲染局部模板，也需要带上前缀，这里用```PartialRenderContext```这个类做了一点简单的封装：

```
@RequestMapping("/detail/{id}")
public String detail(@PathVariable("id") String id,ModelMap modelMap){
    //不要直接加到modelMap里，先加到一个prCtx中，多了一层（丑陋的）包装，
    //是因为reeMarker的local指令不能用一个变量作为要定义的变量的名称。
    PartialRenderContext<String,Object> prCtx = new PartialRenderContext<String, Object>();
    prCtx.put("book", Book.getBook(id));
    modelMap.addAttribute(PartialRenderContext.KEY, prCtx);
    return "_detail";
}
```

> 这个丑陋的前缀是因为FreeMarker的```local```指令不能用一个变量作为要定义的变量的名称。

## 运行示例

确认先安装了Gradle，运行：

```
gradle jettyRun

```
即可。
