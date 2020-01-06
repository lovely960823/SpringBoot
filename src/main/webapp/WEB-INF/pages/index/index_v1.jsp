<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title> - 个人资料</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row animated fadeInRight">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>个人资料</h5>
                    </div>
                    <div>
                        <div class="ibox-content no-padding border-left-right">
                            <img alt="image" class="img-responsive" src="${pageContext.request.contextPath }/static/img/profile_big.jpg">
                        </div>
                        <div class="ibox-content profile-content">
                            <h4><strong>${user.name}</strong></h4>
                            <p> ${user.xzqycode}</p>
                            	<h5>
                                	    关于我
                                </h5>
                            <p>
                                ${user.contents}
                            </p>
                            <div class="row m-t-lg">
                                <div class="col-sm-4">
                                    <span class="bar">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>169</strong> 文章</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="line">5,3,9,6,5,9,7,3,5,2</span>
                                    <h5><strong>28</strong> 关注</h5>
                                </div>
                                <div class="col-sm-4">
                                    <span class="bar">5,3,2,-1,-3,-2,2,3,5,2</span>
                                    <h5><strong>240</strong> 关注者</h5>
                                </div>
                            </div>
                            <div class="user-button">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-primary btn-sm btn-block"><i class="fa fa-envelope"></i> 发送消息</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="button" class="btn btn-default btn-sm btn-block"><i class="fa fa-coffee"></i> 赞助</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>


    <!-- Peity -->
    <script src="${pageContext.request.contextPath }/static/js/plugins/peity/jquery.peity.min.js"></script>

    <!-- Peity -->
    <script src="${pageContext.request.contextPath }/static/js/demo/peity-demo.js"></script>


</body>
<script type="text/javascript">

/* 鼠标特效 */
var a_idx = 0;
jQuery(document).ready(function($) {
    $("body").click(function(e) {
        var a = new Array("❤富强❤","❤民主❤","❤文明❤","❤和谐❤","❤自由❤","❤平等❤","❤公正❤","❤法治❤","❤爱国❤","❤敬业❤","❤诚信❤","❤友善❤");
        var $i = $("<span></span>").text(a[a_idx]);
        a_idx = (a_idx + 1) % a.length;
        var x = e.pageX,
        y = e.pageY;
        $i.css({
            "z-index": 999999999999999999999999999999999999999999999999999999999999999999999,
            "top": y - 20,
            "left": x,
            "position": "absolute",
            "font-weight": "bold",
            "color": "rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"
        });
        $("body").append($i);
        $i.animate({
            "top": y - 180,
            "opacity": 0
        },
        1500,
        function() {
            $i.remove();
        });
    });
});
</script>

</html>
