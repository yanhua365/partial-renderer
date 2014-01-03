<#import "/spring.ftl" as spring/>

<#macro script_content>
</#macro>

<#macro style_content>
</#macro>

<#macro main_layout title="DEFAULT TITLE">
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="<@spring.url '/resources/css/bootstrap.css'/>" rel="stylesheet">
    <style>
        body {
            padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
        }
    </style>
    <link href="<@spring.url '/resources/css/bootstrap-responsive.css'/>" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="<@spring.url '/resources/js/html5shiv.js'/>"></script>
    <![endif]-->

    <@style_content></@style_content>

    <!-- Fav and touch icons
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
    -->
</head>

<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">PARTIAL RENDERER</a>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li><a href="<@spring.url '/'/>">首页</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>



<div class="container">
    <#if globalMessage??>
    <div id="globalMessage" class="alert alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong>提示：</strong> ${globalMessage}
    </div>
    </#if>

    <#nested>
</div> <!-- /container -->

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="<@spring.url '/resources/js/jquery.js'/>"></script>
<script src="<@spring.url '/resources/js/bootstrap.js'/>"></script>

<script>
    $(document).ready(function(){
        $("#globalMessage").fadeOut().fadeIn();
    });
</script>

<@script_content></@script_content>
</body>
</html>
</#macro>