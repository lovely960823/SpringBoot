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

    <title> - 文章页面</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="/favicon.ico"> 
    
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js" type="text/javascript" ></script><!-- 引入jquery -->
    <link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath }/static/bootstrap/js/bootstrap.min.js" type="text/javascript" ></script>
	
    <link href="${pageContext.request.contextPath }/static/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath }/static/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/static/css/style.css?v=4.1.0" rel="stylesheet">
    <!-- 表情包 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/emoticons/myemojiPl.css">
    
   <!-- 分享的css -->
    <link href="${pageContext.request.contextPath }/static/share/css/share.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	/*  点击加载更多    */
	.clickbtn {
		border: 0px red solid;
		text-align: center;
		width: 100%;
		height: 40px;
		line-height: 40px;
		margin-top: 10px;
		margin-bottom: 20px
	}
	
	.clickbtn .clickbtn_btn {
		display: none;
		border: 0px red solid;
		background: #fafafa;
		margin: 0px auto;;
		width: 120px;
		height: 40px;
		line-height: 40px
	}
	
	.clickbtn .clickbtn_btn_nomore {
		display: none;
		border: 0px red solid;
		background: #fafafa;
		margin: 0px auto;;
		width: 120px;
		height: 40px;
		line-height: 40px
	}
	
	.clickbtn .clickbtn_btn:hover {
		cursor: pointer;
		color: #0a7840
	}
	
	/*  加载 动画  */
	.clickbtn .loading {
		border: 0px solid #D0D0D0;
		text-indent: 20px;
		margin: 0px auto;
		display: none;
		width: 125px;
		height: 32px;
		line-height: 32px;
		color: #494A5F;
		font-size: 12px;
		background: url("${pageContext.request.contextPath }/static/img/loading.gif") no-repeat 8px 8px;
	}
	</style>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="pull-right">
                            	<a href="javascript:void(0)" onclick="dianz('${note.id}')"><span>点赞:</span></a><span style="color:green" id="mydzcount">0</span>
                            	<span>评论数:</span><span style="color:green">${plcount}</span>
                            <button class="btn btn-white btn-xs" type="button" onclick="callback()">返回</button>
                            <div class="share-demo">
                         		<a href="javascript:void(0)" class="share" title="分享"><img width="50px;" height="50px;" src="${pageContext.request.contextPath }/static/share/images/share-ico.png"/></a>
                       		</div>
                        </div>
                        <div class="text-center article-title">
                            <h1>${note.title}</h1>
                        </div>
                       	<p>${note.contents}</p>
                        <hr>

                        <div class="row">
                            <div class="col-lg-12">
                                <h2>评论： </h2>
                                	<form method="post" autocomplete="off" id="form1">
									<div class="Main">
										<div class="Input_Box">
											<div contenteditable="true" class="Input_text"></div>
											<div class="Input_Foot">
												<a class="imgBtn" href="javascript:void(0);" title="添加表情">'◡'</a> <a class="postBtn">发表</a>
													
											</div>
										</div>
										<div class="faceDiv">
											<section class="emoji_container"> </section>
											<section class="emoji_tab"></section>
										</div>
									</div>
										 <input name="contents" id="plName" type="hidden" value="">
                                		<input type="hidden" name="nid" value="${note.id}" >
                                		<!-- <input type="button" value="发表" onclick="ensubmit()"> -->
                                	</form>
                                	
                                <div id="pldata"><!-- 存放评论数据的容器 -->
	                               
                                </div>
                                <!-- 加载查询 -->
								<div class="clickbtn">
									<div id="loading" class="loading">数据加载中...</div>
									<p class="clickbtn_btn" onclick="findAllplAjax('more')">点击加载更多</p>
								</div>
								<!-- 加载查询 -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">头像</h4>
				</div>
				<div class="modal-body"><img id="imgId" alt="image" style="width: 200px;height: 200px;" src=""></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
		<nav class="navbar navbar-default navbar-fixed-bottom">
		<div class="container">
			<nav aria-label="Page navigation" style="border:0px red solid;">
			<ul class="pagination"  style="border:0px red solid;">
				<li>
					<c:if test="${pre ne '0'}">
				  		<a href="${pageContext.request.contextPath }/protal/note/noteDetail?id=${pre }">上一篇: ${preNews.title }</a>
				  	</c:if>
					<c:if test="${pre eq '0'}">
				  		<a href="javascript:void(0)" style="color:green">上一篇： 暂无更多数据</a>
				  	</c:if>
				</li>
				
				<li>
					<c:if test="${next ne '0'}">
				  		<a href="${pageContext.request.contextPath }/protal/note/noteDetail?id=${next }">下一篇：${nextNews.title }</a>
				  	</c:if>
					<c:if test="${next eq '0'}">
				  		<a href="javascript:void(0)"  style="color:green">下一篇： 暂无更多数据</a>
				  	</c:if>
				</li>
			</ul>
			</nav>
		</div>
	</nav>
	<!-- 全局js -->
    <script src="${pageContext.request.contextPath }/static/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath }/static/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath }/static/js/content.js?v=1.0.0"></script>
	<!-- 表情包 -->
	<script src="${pageContext.request.contextPath }/static/emoticons/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/static/emoticons/myemojiPl.js"></script>
	 <!-- layui  查看 https://www.layui.com/alone.html 即可 -->
	<script src="${pageContext.request.contextPath }/static/layui/layer-v3.1.1/layer/layer.js" type="text/javascript" ></script>
	<!-- 分享的js -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/share/js/share.js"></script>
</body>
<script type="text/javascript">
var sessionUser = '${loginUser.id }';

	//评论数据查找
	var page = 1;
	var noteId = '${note.id}';
	function findAllplAjax(flag) {
		if(flag =="init"){
            $("#pldata").html("");//查询数据前清空展示的ul
            page = 1;
        }
		var result = '';//要展示的信息
		$('#loading').show();//数据加载中loading展示
        $('.clickbtn_btn').hide();//加载更多按钮隐藏
		$.ajax({
			url : "${pageContext.request.contextPath }/protal/pl/plMessage",
			data : {
				"page" : page,
				"limit" : 10,
				"noteId" : noteId
			},
			type : "POST",
			success : function(rs) {
				//数据写入
				page = rs.page + 1;
				var data = rs.data;
				//console.log(data);
				if(data.length>0){
					  for (var i = 0; i < data.length; i++) {
						  var photo=data[i].user.name.img;
						  if(photo==null||photo==''){
							  photo="${pageContext.request.contextPath }/static/file/default/404.jpg";
						  }
						  if(sessionUser==data[i].user.id){
							  result+='<div class="social-feed-box">'
			                        +'<div class="social-avatar">'
			                        +'<a href="" class="pull-left" data-toggle="modal" data-target="#myModal" onclick="showModal(\''+photo+'\')">'
			                        +'<img alt="image" src="'+photo+'">'
			                        +'</a>'
			                        +' <div class="media-body">'
			                        +'  <a href="#">'
			                        +     data[i].user.name
			                        +'</a>'
			                        +' <small class="text-muted">'+data[i].createTime+'</small>'
			                        +'</div>'
			                        +'</div>'
			                        +'<div class="social-body">'
			                        +'  <p>'
			                        +  data[i].contents
			                        +'</p>'
			                        +'<p><a href="javascript:void(0)" onclick="deletePl('+data[i].id+')">删除</a><p>'
			                        +'</div>'
			                        +'</div>';
						  }else{
							  result+='<div class="social-feed-box">'
			                        +'<div class="social-avatar">'
			                        +'<a href="" class="pull-left" data-toggle="modal" data-target="#myModal" onclick="showModal(\''+photo+'\')">'
			                        +'<img alt="image" src="'+photo+'">'
			                        +'</a>'
			                        +' <div class="media-body">'
			                        +'  <a href="#">'
			                        +     data[i].user.name
			                        +'</a>'
			                        +' <small class="text-muted">'+data[i].createTime+'</small>'
			                        +'</div>'
			                        +'</div>'
			                        +'<div class="social-body">'
			                        +'  <p>'
			                        +  data[i].contents
			                        +'</p>'
			                        +'</div>'
			                        +'</div>';
						  	 }
				 		  }
						  $('#pldata').append(result);//根据class获取第一个元素填充数据
	                      $('#loading').hide();//数据加载中loading隐藏
	                      $('.clickbtn_btn').show();//加载更多按钮展示
	                      if(data.length<10){
	                         $('.clickbtn').html("暂无更多数据");
	                      }  
				}else{
					 $('.clickbtn').html("暂无数据");
				 } 
			},
			error : function() {
				layer.alert("服务器忙");
			},
			dataType : "json"
		});

	}
	findAllplAjax('more');

	function callback() {
		window.location.href = "${pageContext.request.contextPath }/protal/note/noteList";
	}
	
	//评论删除
	function deletePl(id){
		layer.confirm('确定删除该评论吗？', function(index){
			$.ajax({
				url : "${pageContext.request.contextPath }/protal/pl/deleteMyPl",
				data : {"id":id},
				type : "POST",
				success : function(data) {
					if (data > 0) {
						layer.alert("删除成功", {
	                           icon : 1
	                           }, function() {
	                               // 可以对父窗口进行刷新 
	                               window.location.reload();
	                           });
					}
				},
				error : function() {
					layer.alert("服务器忙");
				},
				dataType : "json"
			});
		});
	}
	
	//头像大图显示查看
	 function showModal(obj){
	   $('#imgId').attr("src",obj);
   }
	
	//表情包
	var emojiconfig = {
    tieba: {
        name: "贴吧表情",
        path: "${pageContext.request.contextPath }/static/emoticons/img/tieba/",
        maxNum: 50,
        file: ".jpg",
        placeholder: ":{alias}:",
        alias: {
            1: "hehe",
            2: "haha",
            3: "tushe",
            4: "a",
            5: "ku",
            6: "lu",
            7: "kaixin",
            8: "han",
            9: "lei",
            10: "heixian",
            11: "bishi",
            12: "bugaoxing",
            13: "zhenbang",
            14: "qian",
            15: "yiwen",
            16: "yinxian",
            17: "tu",
            18: "yi",
            19: "weiqu",
            20: "huaxin",
            21: "hu",
            22: "xiaonian",
            23: "neng",
            24: "taikaixin",
            25: "huaji",
            26: "mianqiang",
            27: "kuanghan",
            28: "guai",
            29: "shuijiao",
            30: "jinku",
            31: "shengqi",
            32: "jinya",
            33: "pen",
            34: "aixin",
            35: "xinsui",
            36: "meigui",
            37: "liwu",
            38: "caihong",
            39: "xxyl",
            40: "taiyang",
            41: "qianbi",
            42: "dnegpao",
            43: "chabei",
            44: "dangao",
            45: "yinyue",
            46: "haha2",
            47: "shenli",
            48: "damuzhi",
            49: "ruo",
            50: "OK"
        },
        title: {
            1: "呵呵",
            2: "哈哈",
            3: "吐舌",
            4: "啊",
            5: "酷",
            6: "怒",
            7: "开心",
            8: "汗",
            9: "泪",
            10: "黑线",
            11: "鄙视",
            12: "不高兴",
            13: "真棒",
            14: "钱",
            15: "疑问",
            16: "阴脸",
            17: "吐",
            18: "咦",
            19: "委屈",
            20: "花心",
            21: "呼~",
            22: "笑脸",
            23: "冷",
            24: "太开心",
            25: "滑稽",
            26: "勉强",
            27: "狂汗",
            28: "乖",
            29: "睡觉",
            30: "惊哭",
            31: "生气",
            32: "惊讶",
            33: "喷",
            34: "爱心",
            35: "心碎",
            36: "玫瑰",
            37: "礼物",
            38: "彩虹",
            39: "星星月亮",
            40: "太阳",
            41: "钱币",
            42: "灯泡",
            43: "茶杯",
            44: "蛋糕",
            45: "音乐",
            46: "haha",
            47: "胜利",
            48: "大拇指",
            49: "弱",
            50: "OK"
        }
      },
    AcFun:{
    	name : "AcFun表情",
    	path : "${pageContext.request.contextPath }/static/emoticons/img/AcFun/",
    	maxNum : 54,
    	file : ".png"
    }
  };
$('.Main').myEmoji({emojiconfig : emojiconfig});

//评论发表方法在    ${pageContext.request.contextPath }/static/emoticons/myemojiPl.js里面
//js里面不能试用绝对路径，单独拿出来试用
function doPlAdd(){
	$.ajax({
		url : "${pageContext.request.contextPath }/protal/pl/plAdd",
		data : $("#form1").serialize(),
		type : "POST",
		success : function(data) {
			if (data > 0) {
				layer.alert("评论成功", {
                       icon : 1
                       }, function() {
                           window.location.reload();
                       });
			}
		},
		error : function() {
			layer.alert("服务器忙");
		},
		dataType : "json"
	});
}

//分享引入函数
$('.share').shareConfig({
		Shade : true, //是否显示遮罩层
		Event:'click', //触发事件
		Content : 'Share', //内容DIV ID
		Title : '分享到' //显示标题
	});
	
	//点赞
	function dianz(noteId){
		if(sessionUser==null||sessionUser==''){
			layer.alert('您还未登录，无法进行该操作');
			return false;
		}
		$.ajax({
        	url:"${pageContext.request.contextPath }/protal/note/redisDz",
        	data:{"noteId":noteId,"userId":sessionUser},
        	type:"POST",
        	success:function(data){
        		console.log(data);
        		var isDo=data.isDo;//点赞还是取消
        		var size=data.size;//总赞数
        		$('#mydzcount').text(size);
        		
        	},
        	error:function(){
        		layer.alert("服务器忙");
        	},
        	dataType:"json"
        });  
	}
	//进来的时候加载出来该文章有多少赞
	function getAllZs(){
		var noteId='${note.id}';
		$.ajax({
	    	url:"${pageContext.request.contextPath }/protal/note/getAllz",
	    	data:{"noteId":noteId},
	    	type:"POST",
	    	success:function(data){
	    	
	    		$('#mydzcount').text(data);
	    		
	    	},
	    	error:function(){
	    		layer.alert("服务器忙");
	    	},
	    	dataType:"json"
	    });
	}	
	getAllZs();//调用方法
</script>
</html>
