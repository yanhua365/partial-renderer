<#--
@param src 要渲染的局部模板
@param object 渲染用的对象
@param attrs 用来放置其它扩展变量的hash容器，默认值是空map
-->
<#macro render src object attrs={}>
    <#include src>
</#macro>