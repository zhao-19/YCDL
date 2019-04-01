<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.winpow.services.manage.fzlc.bean.Fzlc" %>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的的科技金融服务门户网站</title>
    <link href="../css/equity.css" rel="stylesheet" type="text/css" />
    <link href="../css/about.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css" rel="stylesheet" type="text/css" />
    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
<%@ include file="../header.jsp"%>
<!-- 内容部分 -->

<div class="about_cj_banner">
     <img src="../image/box/about_banner1.jpg"/>
</div>

 <br/>
<div class="about_type widthbox">
    
        <li><a  style="display: inline-block;width: 100%;" href="/aboutus/about.html">盈创介绍</a></li>
    <li  class="type_bgc"><a  style="display: inline-block;width: 100%;" href="/aboutus/rczp.html">发展历程</a></li>
    <li><a style="display: inline-block;width: 100%;"  href="/aboutus/flsm.html">法律声明</a></li>
    <li  ><a  style="display: inline-block;width: 100%;" href="/aboutus/yjfk.html" >意见反馈</a></li>
    <li class="type_lxwm fr"><a  style="display: inline-block;width: 100%;" href="/aboutus/lxwm.html">联系我们</a></li>
    
</div>

<div class="widthbox">
    
<div class="ycjs_count">

  <style type="text/css">
        .bg{margin: 0 auto;width: 100%;font-family: "微软雅黑";}
        .content{width: 1200px;margin: 0 auto;}
        .fixed{right:auto;margin-top: -243px;width: 1200px;height: 100%;background: url("../image/history/ditu.jpg") no-repeat center;position: fixed;z-index: -1;}
        .fixedimg{background-color:#f1f1f1;cursor:pointer;background:url("../image/history/touming.png");width: 1200px;height: 100%;position: fixed;z-index: 1;display: none;top:0;}
        .fixedimgc{background-repeat:no-repeat;background-position:center;text-align:center;width: 1200px;height: 100%;position: fixed;z-index: 1;top:0;}

        .li{width: 100%;min-height: 82px;}
        .block{width: 610px;}
        .right{float: right;}
        .left{float: left;}
        .wenzi{width: 364px;padding-top: 7px;height: 68px;overflow: hidden;}
        .bigwenzi{width: 496px!important;}
        .pic{position: relative;width: 140px;height: 82px;overflow: hidden;cursor:pointer;}
        .pic img{    position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 118px;
            transition: all 0.2s linear;}
        .pic img:hover{/*box-shadow: 0 0 0 3px #ccc;*/width: 128px;}
        .minbg{min-width: 76px;margin-top: 28px;}
        .hengxian{margin-top: 10px;}
        .shuxian{width: 20px;min-height: 82px;}
        .shuxian_t{width: 20px;height: 28px;}
        .shuxian_t1{width: 10px;height: 28px;background-color: #fff;margin-left: 5px;}
        .shuxian_t2{background-color: #e7201a;}
        .shuxian_t3{background-color: #D4B508;}
        .shuxian_t4{background-color: #efd731;}
        .shuxian_t5{background-color: #42a64c;}
        .shuxian_t6{background-color: #2ae5d7;}
        .shuxian_t7{background-color: #3b83b4;}
        .shuxian_t8{background-color: #5e446e;}
        .shuxian_b{width: 20px;height: 54px;}
        .shuxian_b1{width: 10px;height: 35px;background-color: #e7201a;    margin-left: 5px;    margin-top: -1px;}
        .shuxian_b2{background-color: #D4B508;}
        .shuxian_b3{background-color: #efd731;}
        .shuxian_b4{background-color: #42a64c;}
        .shuxian_b5{background-color: #2ae5d7;}
        .shuxian_b6{background-color: #3b83b4;}
        .shuxian_b7{background-color: #5e446e;}
        .shuxian_b8{background-color: #fff;}

        .yuan{border-radius:10px;width: 10px;height: 10px;border: 5px solid #e7201a;background-color: #faf2c5; }
        .yuan1{border-color:#e7201a}
        .yuan2{border-color:#D4B508}
        .yuan3{border-color:#efd731}
        .yuan4{border-color:#42a64c}
        .yuan5{border-color:#2ae5d7}
        .yuan6{border-color:#3b83b4}
        .yuan7{border-color:#5e446e}
        .yuan8{border-color:#fff}

        .time{margin-top: 27px;min-width: 122px;font-weight: bold;}
        .time1{color:#e7201a}
        .time2{color:#D4B508}
        .time3{color:#efd731}
        .time4{color:#42a64c}
        .time5{color:#2ae5d7}
        .time6{color:#3b83b4}
        .time7{color:#5e446e}
        .time8{color:#fff}

        .lefttime{text-align: right;}
        .hengxianr{margin-right: 6px;}
        .hengxianl{margin-left: 6px;}
        .right .pic{text-align: right;}
        .right .wenzi{width: 354px;}


    </style>
    
    
    <div class="bg">
    <div class="content">
    <div class="fixed"></div>
    <div class="fixedimg"><div class="fixedimgc"></div></div>
    
    
    
      
        <%
        	List list = (List)request.getAttribute("list");
        	//控制方向
        	String[] side ={"right block","left block"};
        	//控制颜色
        	String[] colors ={"left","right"};
        	
        	
			for(int i=0;i<list.size();i++ ){
			
			
					Fzlc fzlc = (Fzlc)list.get(i);
				if(i%2==0) {
						  out.println(" <div class=\"li\">"); 
			            out.println("<div class=\""+side[i%2]+"\">");  
			
			              out.println("<div class=\"shuxian left\">");    
			              out.println("<div class=\"shuxian_t\"><div class=\"shuxian_t1 shuxian_t"+(i%8+1)+"\"></div></div>");        
			              out.println("<div class=\"shuxian_b\">");        
			               out.println("  <div class=\"yuan yuan"+(i%8+1)+"\"></div>");         
			               out.println(" <div class=\"shuxian_b1 shuxian_b"+(i%8+1)+"\"></div>");          
			              out.println("   </div>");     
			             out.println("  </div>");   
			
			             out.println(" <div class=\"left minbg\"><img src=\"../image/history/hengxian.jpg\" class=\"left hengxian hengxianr\" alt=\"\"/><img class=\"left\" src=\"../image/history/naozhong.jpg\" alt=\"\"/></div>");    
			
			             out.println("<div class=\"pic right\">");     
			             out.println("   <img src=\""+request.getContextPath()+fzlc.getPic()+"\" alt=\"\"/>");      
			             out.println(" </div>");    
			             out.println(" <div class=\"wenzi right\">"+fzlc.getNeirong()+"");    
			        out.println(" </div>");         
			
			       out.println(" </div>");      
			           out.println(" <div class=\"right time time"+(i%8+1)+"\">"+fzlc.getShijian().substring(0,10)+"</div>");       
			        out.println(" </div>"); 
				}else {
				
				
				 out.println(" <div class=\"li\">");   
             out.println(" <div class=\""+side[i%2]+"\">");   

                 out.println(" <div class=\"pic left\">");   
                     out.println(" <img src=\""+request.getContextPath()+fzlc.getPic()+"\" alt=\"\"/>");   
               out.println("   </div>");   
                out.println("  <div class=\"wenzi left\">"+fzlc.getNeirong()); 
              out.println("    </div>");   
                out.println("  <div class=\"shuxian right\">");   
                  out.println("    <div class=\"shuxian_t\"><div class=\"shuxian_t1 shuxian_t"+(i%8+1)+"\"></div></div>");   
                  out.println("    <div class=\"shuxian_b\">");   
                   out.println("       <div class=\"yuan yuan"+(i%8+1)+"\"></div>");   
                     out.println("     <div class=\"shuxian_b1 shuxian_b"+(i%8+1)+"\"></div>");   
                   out.println("   </div>");   
                 out.println("    </div>");   
                out.println("   <div class=\"right minbg\"><img src=\"../image/history/naozhong.jpg\" class=\"left\" alt=\"\"/><img class=\"hengxian hengxianl left\" src=\"../image/history/hengxian.jpg\" alt=\"\"/></div>");   


         	 out.println("    </div>");   
           out.println("   <div class=\"left time time"+(i%8+1)+" lefttime\">"+fzlc.getShijian().substring(0,10)+"</div>");   
	
	       out.println("   </div>");   
        
        
				}
				
			}
			        	
        	
        
        
         %>
         
         
          







    </div>
</div>
<script>
    $(".block img").click(function(){
        var src = $(this).attr("src");
//        $(".fixedimg").css("background-image","123.jpg").show();
        $(".fixedimgc").get(0).style.backgroundImage="url("+src+")";
        $(".fixedimg").fadeIn();

    });
    $(".fixedimg").click(function(){
        $(this).hide();
    });

</script>









</div>

  
<!--  
<div class="data_list widthbox">

   <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div><div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
    <div class="info">
        <img class="fl" src="../image/ab/grzp_img.png" alt="">
        <li class="fl">高级银行顾问经理：要求五官端正，口齿伶俐 </li>
        <li class="fl"><span>20K-30K</span>经验5-10年 / 本科 / 全职</li>
        <div class="icon_time fl">3016-04-22   发布</div>       
    </div>
</div> -->
</div>
 
  <div id="menu" style="top:93%;">
   	<ul>    		
   		<li><a id="back" style="cursor:pointer">返回顶部</a></li> 
   	</ul>	
</div>

<script>
$(function(){
	//回到顶部
	$("#back").click(function(){
		$('body,html').animate({scrollTop:0},500);
		return false;
	});

    //首先将#back-to-top隐藏
    $("#menu").hide();

    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(function(){

        $(window).scroll(function(){
            if ($(window).scrollTop()>500){
                $("#menu").fadeIn();
            }else{
                $("#menu").fadeOut();
            }
        });


    });

});
</script>
<script>
 menu_init("aboutus");

 
</script>

 

         <%@ include file="../footer.jsp"%>

</body>
</html>
 