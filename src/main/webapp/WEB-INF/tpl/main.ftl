<#import "/spring.ftl" as spring/>
<#include "_render.ftl"/>
<#include "_main_layout.ftl"/>

<#-- 覆盖布局中script_content部分的内容-->
<#macro script_content>

<script>
    function loadBook(id){
        //加载指定的一条记录
        $.get("./detail/"+id).then(function(data){
            $('#book-detail').html(data);
        });
    }
</script>

</#macro>

<@main_layout title="局部渲染示例">

<div class="container">
    <div class="row">
        <div class="span6">
            <ul id="book-list">
                <#list books as book>
                    <li>
                        <a href="#" onclick="loadBook('${book.id}');return false;">${book.name}</a>
                    </li>
                </#list>
            </ul>
        </div>

        <div class="span6" id="book-detail">
            <@render "_detail.ftl", {'book':books[0]}/>
        </div>
    </div>
</div> <!-- /container -->

</@main_layout>
