<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.winpow.core.system.bean.Config"%>
<%@ page import="com.winpow.core.front.SystemManager"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="../css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>



<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/college/banner.jpg"/>
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>盈创活动</li>
		</div>
		<div class="data_info_search fr" >
			<input value="请输入搜索名称" id="contentquery"  onkeypress="if (event.keyCode == 13)  doquery()"
			 type="text" onfocus="if(value=='请输入搜索名称') {value=''} this.style.color='#666';" 
onblur="if (value=='') {value='请输入搜索名称';this.style.color='#999';}" placeholder="请输入搜索名称">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
		
	</div>
</div>


<!-- 盈创活动列表 -->
<div class="college_info widthbox">
    <div class="lanren">
        <div class="hidden">
        
        
        <s:iterator value="pager.list">
        	<s:if test="attend==0" >
        		<div class="college_info_list libg"  >
   			</s:if> 
       		<s:else>
        		<div class="college_info_list"  >
			</s:else>
	 		
				<div class="college_info_list_l fl"><a href="/collegedetail/<s:property value="id" />.html"><img src="<s:property value="activities_image" />" ></a></div> 

				<div class="fr" style="width:855px;">	
				<div class="college_info_list_r_title fl">
					<h3><a href="/collegedetail/<s:property value="id" />.html"><s:property value="activities_name" /></a>
					
						<s:if test="attend==0" >
			        		<span>(已举办)</span>
			   			</s:if> 
			       		<s:else>
			        		<span></span>
						</s:else>
					
					</h3>
					<div><span>报名截止时间：   <s:date name="stoptime" format="yyyy-MM-dd HH:mm:ss"/> </span> <br>  
					    <span>活动开始时间：    <s:date name="begintime" format="yyyy-MM-dd HH:mm:ss"/> </span> <br> 
					    <span>活动结束时间：    <s:date name="endtime" format="yyyy-MM-dd HH:mm:ss"/> </span> <br>
					     <span>活动地址：<s:property value="address" /></span></div>
				</div>
				<!--<div class="college_info_list_r_info fl">
					<div> <a href="/collegedetail/<s:property value="id" />.html"><s:property value="show" /></a></div>
				</div>  -->
				</div>
				
			</div>
			
		</s:iterator>

            </div>
                <ul class="listjz widthbox"></ul>
                <div class="dianji" onClick="lanren.loadMore();" style="margin-bottom: 50px;"><div class="morejz widthbox" id="loadmoreword">加载更多 </div></div>
             </div>
</div>

   
 
 
 
 
 
 
 
<script>
	var pagesize = 20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".lanren .hidden .college_info_list");
            $(".lanren ul.listjz").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".lanren ul.listjz");
            }
            $(".lanren ul.listjz .college_info_list").each(function(){
                $(this).attr('.college_info_list',$(this).attr('.college_info_list'));
            })
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".lanren .hidden").html("");
        },
        loadMore:function(){
        	//alert($('#loadmoreword').html());
        	//$('#loadmoreword').html("<p>玩命加载中，请稍后...</p>");
			
        	//var test = document.getElementById("loadmoreword").innerHTML;
        	

            	document.getElementById("loadmoreword").innerHTML="玩命加载中，请稍后...";

        		
        		
        		queryData();
        		
        	//alert(test);
        	//alert($('#loadmoreword').html());
        	//如果 _content.length 小于每次显示的页数，则需要再次做异步请了。   
        	/*if(_content.length<pagesize){
        		queryData();
        		
        	}else {
        		loadData();
        	}*/
        	
        }
    }
    
    lanren.init();
 
    function loadData(){
      var mLis = $(".lanren ul.listjz .college_info_list").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  //alert('nodata');
                  $('#loadmoreword').html("<p style='color:#888;'>亲，没有数据可以加载了！！！</p>");
                  return false;
              }
              $(".lanren ul.listjz").append(target);
              $(".lanren ul.listjz .college_info_list").eq(mLis+i).each(function(){
                  $(this).attr('.college_info_list',$(this).attr('.college_info_list'));
              });
           }
           $('#loadmoreword').html("加载更多");
     }
    function queryData(){
    	
   		queryDataCount = queryDataCount+1;
   		
    	var _url = "/college/toList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  success: function(data){
			  
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
			  }
			  for(var i=0;i<data.length;i++ ){  
			  	var aaa = data[i];
			  	
			  	if(data[i].attend==0) {
			  		var str = 	"<div class=\"college_info_list libg\">";
			  		var ifjb = "<span>(已举办)</span>";
				}else{
			  		var str = 	"<div class=\"college_info_list\">";
			  		var ifjb = "<span></span>";
				}
				
			  	str=str+"<div class=\"college_info_list_l fl\"><a href=\"/collegedetail/"+data[i].id+".html\"><img  src=\""+data[i].activities_image+"\"   ></a></div>"+
			  	"<div class=\"fr\" style==\"width:855px;\">"+
				"<div class=\"college_info_list_r_title fl\">"+
					"<h3><a href=\"/collegedetail/"+data[i].id+".html\">"+data[i].activities_name+ifjb+"</a></h3>"+
					"<div><span> 开始时间："+data[i].begintime+" </span> <br/> <span>截止时间："+data[i].stoptime+"</span><br/> <span>活动结束时间："+data[i].endtime+"</span><br><span>活动地址："+data[i].address+"</span></div>"+
				"</div>"+
				
				"</div>";
				
				
				str = str+"</div>";
	  
 			    _content.push(
					str	  
				);
		  } 
			 loadData();
			
		  },
		  error:function(){
			  //console.log("加载数据失败，请联系管理员。");
			//  alert("加载数据失败，请联系管理员。");
			 // jQuery.unblockUI();
			return null;
		  }
		});
		return false;
    };
    
    function doquery(){
    var query = $('#contentquery').val();
 	if(query=='') {
		
	}else {
		var url = '/college/colleges.html?t=q&q='+query;
 		window.location = url;
		return ;
	}
 	};

    
</script>
<div class="fixed" id="totop">
    <div class="home">
        <div class="fixed_img">
            <a href="javascript:$('body,html').animate({scrollTop:0},500)">
            <a id="backtop" href="javascript:void(0)"><img src="../image/index/home.png" alt="返回顶部"></a>
            </a>
        </div>
    </div>
</div>
<style type="text/css">
.fixed{top:auto;bottom:10%!important;height:82px;}
</style>

<script>
 menu_init("college");
</script>

<!-- 网站尾部 --> 
         <%@ include file="../footer.jsp"%>
         
         
</body>
</html>