<%@ page contentType="text/html; charset=UTF-8"%>

<style type="text/css">
	
	<!-- 全新的上传控件代码 -->
   .btn{-webkit-border-radius:3px;-moz-border-radius:3px;-ms-border-radius:3px;-o-border-radius:3px;border-radius:3px;
        background-color: #ff8400;color: #fff;display: inline-block;height: 28px;line-height: 28px;text-align: center;
        width: 72px;transition: background-color 0.2s linear 0s;border:none;cursor:pointer;margin:0 0 20px;}
   .demo{width:700px;margin:0 auto;width:100%;overflow:hidden;}
   .btn:hover{background-color: #e95a00;text-decoration: none}
   .ul_pics li{float:left;width:160px;height:160px;border:1px solid #ddd;padding:2px;text-align: center;margin:0 5px 5px 0;}
   .ul_pics li .img{width: 160px;height: 140px;display: table-cell;vertical-align: middle;}
   .ul_pics li img{max-width: 160px;max-height: 140px;vertical-align: middle;}
   .picimg li img{max-width: 100%!important;border:none!important;max-height: 100%;vertical-align: middle;};
   .progress{position:relative;padding: 1px; border-radius:3px; margin:60px 0 0 0;} 
   .bar {background-color: #FF8140; display:block; width:0%; height:20px; border-radius:3px; } 
   .percent{position:absolute; height:20px; display:inline-block;top:3px; left:2%; color:#fff } 

 	<!-- 删除弹出框样式 -->
	#ldksq #ldksq_c .tjdiv input.res{margin-right:0;}
    #ldksq #ldksq_c {width: auto;/*height: 434px;*/height: auto;max-width: 1200px;float:left;position: relative;}
    #ldksq #ldksq_c .delt{padding: 10px;}
    #ldksq #ldksq_c .delimglist{border:1px solid #ccc;height:100%;widht:100%;}
    #ldksq #ldksq_c .delimglist .imglis{margin:12px;float:left;max-height:100%;max-widht:100%;}
    #ldksq #ldksq_c .delimglist .imglis img{}
    #ldksq #ldksq_c .delimglist .imglis p{margin-bottom:5px;cursor:pointer;color: #fff;text-align: center;background-color: #555;border-radius: 5px 0px;}
    #ldksq #ldksq_c .delimglist .imglis p:hover{background-color:#FF8140;color:#fff;}
    
</style>

<!--我要参加弹出框 start-->
	<div id="ldksq">
	    <div id="ldksq_c">
	        <div id="ldksq_lose"></div>
	        <div class=""></div>
	        <div class="delt" id="delt">营业执照(或者三证合一执照)图片：</div>
	        <div class="delimglist" id="delimglist"></div>
	        
	        
	        <!--<input type="button"  class="res tj"  value="返回"/>-->
<!--	       	<div class="tjdiv"><input id="rztjan"  type="button"  class="res sure tj" value="确定"/></div>-->
	    </div>
	</div>
<!--我要参加弹出框 end-->