<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="gb2312">
<title>个人中心</title>
<meta name="keywords" content="个人博客模板" />
<meta name="description" content="个人博客模板" />
<link href="/static/blog_myself/css/styles.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
<header>
 <nav id="nav">
   <ul>
    <li><a href="/">博客首页</a></li>
    <li><a href="#">模板</a></li>
    <li><a href="#">关于我们</a></li>
    <li><a href="#">我们的故事</a></li>
    <li><a href="#">我们的蜜月</a></li>
    <li><a href="#">婚礼现场</a></li>
    <li><a href="#">婚纱摄影</a></li>
    <li><a href="#">我们的博客</a></li>       
    <li><a href="#">联系我们</a></li>
   </ul>
  <script src="/static/blog_myself/js/silder.js"></script><!--获取当前页导航 高亮显示标题-->
 </nav>
 </header>
 <div class="mainContent">
    <aside>
      <div class="avatar">
        	<img style="width: 150px;height: 150px;" alt="" src="http://qzapp.qlogo.cn/qzapp/101826833/997067731A75F3D6D6FAAB74EF308ADC/100">
      </div>
      <section class="topspaceinfo">
        <h1>执子之手，与子偕老</h1>
        <p>于千万人之中，我遇见了我所遇见的人....</p>
      </section>
      <div class="userinfo"> 
        <p class="q-fans"> 粉丝：<a href="#">167</a></p> 
        <!-- <p class="btns"><a href="#" >私信</a><a href="#">相册</a><a href="#">存档</a></p>    -->
      </div>
      <section class="newpic">
         <h2>最新照片</h2>
         <ul>
           <li><a href="#"><img src="/static/blog_myself/images/01.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/02.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/03.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/04.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/05.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/06.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/07.jpg"></a></li>
           <li><a href="#"><img src="/static/blog_myself/images/08.jpg"></a></li>
         </ul>
      </section>
    </aside>
    <div class="blogitem">
      <article>
        <h2 class="title"><a href="#">陌上花开，可缓缓归矣</a></h2>
        <ul class="text">
          <p>“陌上花开，可缓缓归矣。” 含义：（夫人），田间阡陌上的花开了，你可以一边赏花，一边慢慢地回来。</p>
          <p>“陌上花开，如果没有悄然伫立阡陌并为陌上风情所陶醉的人，那么花开也寂寞，风情也苍白....”喜欢这句话，是因为看了忍冬的作品《陌上花开缓缓归》</p>
          <p>阳春三月，风和日暖，信步城外，看阡陌之上的杨柳依依，野花绚烂，身心不由得轻爽而浪漫。“三月风情陌上花”，古远的诗句似乎随风从天边飘来，从历史的深处飘来，拂过阡陌，袭上心头，诗是属于清乾嘉诗人赵翼的，可昂首远望，眼前的陌上风情却是不折不扣的现代，由眼帘入心扉。</p>
          <p>漫步陌上，心情是诗意的那种，优雅而散淡，不惹匆促，只因陌上花开；花是自然的那种，朴素而恬淡，不落尘俗。“三月风情陌上花”，是花在其中生命得以璀璨，人在其中心情得以畅然的一种意境。三月陌上花，让人爱让人痴，恍惚人的骨子里头都沉淀了花的影子，花的风韵。</p>
          <p>陌上花开，如果没有了从俗累的生活中走出来，悄然伫立阡陌并为陌上风情所陶醉的人，那么花开也寂寞，风情也苍白。于是，一句“陌上花开，可缓缓归矣”不知被多少人吟诵了多少遍。人归缓缓，那花便有灵性，便开得执著，陌上风情也被撩拨得浓郁而热烈。</p>
          <p>缓缓归，缓缓归，披一袭“三月风情”，再采一束“陌上花”，缓缓归。</p>
          <p>缓缓归矣，我心已是陌上花开。</p>
        </ul>
      </article> 
    </div>
 </div>
<footer>
   <div class="footavatar">
    <!--  <img src="/static/blog_myself/images/photo.jpg" class="footphoto"> -->
    <img style="width: 100px;height: 100px;" alt="" src="http://qzapp.qlogo.cn/qzapp/101826833/997067731A75F3D6D6FAAB74EF308ADC/100" class="footphoto">
     <ul class="footinfo">
       <p class="fname"><a href="/dancesmile" >${loginUser.name}</a>  </p>
   </div>
   <div class="Copyright">
     <ul>
       <a href="#">帮助中心</a><a href="#">空间客服</a><a href="#">投诉中心</a><a href="#">空间协议</a>
     </ul>
     <p>Design by myself</p>
   </div>
 </footer>
</body>
<script type="text/javascript">
	//http://qzapp.qlogo.cn/qzapp/101826833/997067731A75F3D6D6FAAB74EF308ADC/100
</script>
</html>