<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html height="100%">
<head>
<style>
body{background:#E6EAE9;}
.center{ position: fixed;width: 85%;height: 90%; top: 5%; left: 7.5%;box-sizing: border-box;background:#fff;border:1px solid #ccc9c7;border-radius:5px;}
	   .one a{ display:block; float:left;color:#141414;  text-decoration: none;}
	  .one a span{display:block; background:#364654;color:#fff;border-radius:5px;width:250px;line-height:50px;text-align:center;margin-top:50px;}
	 .one a span:hover  {background:#283742}
	  .one a img{width:240px;}
	    .box{  text-align: center;position:absolute;top:50%;left:50%;margin: -190px 0 0 -340px;}
	    .one{display: inline-block;}
	    .one:first-child{margin-right:200px;'}
</style>
<title>Insert title here</title>
</head>
<body height="100%" >
<!-- <iframe src="http://zzsb.winpow.com/manage/getPolicyList.do#" style="position: fixed;top: 0;left: auto;width: 100%;height: 100%;"  frameborder="0"></iframe> -->
<div class="center">
	 <div class="box">
		  <div class="one">
		  <a href="http://zzsb.winpow.com/manage/getPolicyList.do#" target="_blank">
		   	<img alt="" src="<%=request.getContextPath() %>/resource/images/pachong1.png">
		  	<span>政策新闻爬取</span>
		  </a>
		  </div>
		  <div class="one">
		  <a href="http://zzsb.winpow.com/manage/getSpiderConfigList.do#" target="_blank">
		  	<img alt="" src="<%=request.getContextPath() %>/resource/images/pachong2.png">
		  <span>政策新闻爬虫配置</span>
		  </a>
		  </div>
	 </div>
</div>
</body>
</html>