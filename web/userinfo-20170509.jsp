<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.winpow.services.manage.cust.bean.Cust"%>
<div class="topf">
<span class="jj">科技金融服务平台</span>
<div class="login_re fr">
		<%  Cust acc =(Cust)session.getAttribute(com.winpow.core.FrontContainer.USER_INFO);
		if(acc==null){
		 out.print("<li class=\"fl\"><a href=\"/user/login.html\" class=\"login\">登录</a>|<a href=\"/user/register.html\" class=\"register\">注册</a></li>");
		 }
		else { 
			out.print("<li class=\"fl\">欢迎 &nbsp;<a href=\"/usercenter/usercenter.html\" class=\"login\">"+acc.getUserid()+"</a>&nbsp;&nbsp;<a href=\"/user/loginout.html\" class=\"register\">退出</a></li>");
		;}%>
			
		
		         
	     <li class="fl finput" >
		   <input class="inputtext" type="text"  id="query"  onkeypress="if (event.keyCode == 13)  doquery()"
		    value="请输入关键字" onfocus="if(value=='请输入关键字'){value=''}" onblur="if(value==''){value='请输入关键字'}"/>
		   <a href="javascript:doquery()"><img src="/image/index/fdj.jpg" alt=""></a>
		</li>
		           

		     <li class="zhandian fr"  id="subsite">
		     <span>子站点</span>&nbsp;&nbsp;<span>&gt;</span>
		     <ul id="subuls">
		     	<a href="/news/bazhong.jsp"  target="_blank">巴中</a>
		     	<a href="/news/panzhihua.jsp" target="_blank">攀枝花</a>
		     	<a href="/news/neijiang.jsp" target="_blank">内江</a>
		     	<a href="/news/yaan.jsp" target="_blank">雅安</a>
		     	<a href="/news/leshan.jsp" target="_blank">乐山</a>
		     	<a href="/news/guangan.jsp" target="_blank">广安</a>
		     	<a href="http://w2.forgood.net/" target="_blank">德阳</a>
		     </ul>
		     </li>
   
     </div>
</div>
<script>

 $(document).ready(function(){
    $('#subsite').hover(function(){
        var subnav = $(this).children("#subuls")
        if(subnav.is(':animated')){
            subnav.stop(true,true);
        }
        subnav.slideToggle("1000")
    })
}); 
function doquery(){
    var query = $('#query').val();
 	if(query=='') {
		
	}else {
		var url = '/news/toList.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
	
	
	 
     
 }

	/* $("#xiaoguo").click(function(){
		  $("#subuls").slideToggle(200);
	  }); */

</script>




<!--ajax加载提示提示框-->
<div class="ajaxloading"></div>
<script type="text/javascript">
    function ggts(val){
        $(".ggts").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    //公共提示二,第二种js样式
    function ggts2(val){
        $("#ggts2").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    function ajaxloading(val){
        $(".ajaxloading").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }

</script>


