<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>



<!-- 内容部分 -->
<div class="ycdata_bgimg">
	<img src="../image/data/data_img.png" alt="背景图">
</div>

<div class="ycdata_info">
	<div class="data_info_nav widthbox">
		<div class="data_info_gzs fl">
			<li>股权融资交易</li>
		</div>
		<!-- <div class="data_info_search fr" >
			<input id="contentquery" type="text" placeholder="请输入搜索名称">
			<a href="javascript:doquery()"><img src="../image/data/fdj.jpg" alt=""></a>
		</div>
		 -->
	</div>
</div>

<div class="ycdata_center">
	<div class="ycdata_title widthbox">
		<div class="data_title_head">
			<div class="name fl">
				<li>公司名称</li>
			</div>
			 
			<div class="scale fl">
				<li>交易情况</li>
		 
			</div>
			<div class="profession fl">
				<li>状态</li>
			 
			</div>
			<div class="school fr">
				<li>交易时间</li>
			 
			</div>
		</div>
		
		<!-- 工作室列表 -->
		<div class="ycdata_box1">  <!-- 列表x -->
		 <div class="hidden">
             
           <s:iterator value="pager.list">
	   			<div class="ycdata_list1 widthbox fl">
					<div class="data_list_name1 fl">
	 					<li class="data_list_name_info1 fl"> <s:property value="compName"/> <br><div class="xiamian1 fl"> </div></li>
					</div>
				 
					<div class="data_list_scale1 fl">
					 
						<li>
						
							<s:if test="dytype==1">
	 						申请 <s:property value="dytypedetail"/> 
						</s:if>
						<s:if test="dytype==2">
	 						订购增值业务 <s:property value="dytypedetail"/> 
						</s:if>
						
						<s:if test="dytype==3">
	 						约谈项目 <s:property value="dytypedetail"/>  
						</s:if>
						<s:if test="dytype==4">
	 						发布 <s:property value="dytypedetail"/> 
						</s:if>
						<s:if test="dytype==5">
	 						申请 <s:property value="dytypedetail"/> 
						</s:if>
						<s:property value="rongziedu"/> <s:property value="amt"/>万元  </li> 
					</div>
					<div class="data_list_profession1 fl">
						<li><s:property value="crgqbl"/> <s:property value="dystatus"/> </li>
					</div>
					<div class="data_list_scale1 fl">
						<li>   <s:date name="dytime" format="yyyy-MM-dd"/>
					</div>
				</div>
		   </s:iterator>
		   
		    
		   
		
		


		</div>	
			<ul class="morebox"></ul>
			<li id="loadmorewordh" onClick="lanren.loadMore();" >查看更多</li>

	</div>
</div>


<script>
	var pagesize =20;
	var queryDataCount = 0;
    var _content = []; //临时存储li循环内容
    var offset;
    var lanren = {
        _default:pagesize, //默认显示图片个数
        _loading:pagesize,  //每次点击按钮后加载的个数
        init:function(){
            var lis = $(".hidden .ycdata_list1");
            $(".morebox").html("");
            for(var n=0;n<lanren._default;n++){
                lis.eq(n).appendTo(".morebox");
            }
            $(".morebox .ycdata_list1").each(function(){
                $(this).attr('.ycdata_list1',$(this).attr('.ycdata_list1'));
            })
            for(var i=lanren._default;i<lis.length;i++){
                _content.push(lis.eq(i));
            }
            $(".hidden").html("");
        },
        
        loadMore:function(){
        	//alert($('#loadmorewordh').html());
        	//$('#loadmorewordh').html("<p>玩命加载中，请稍后...</p>");
        	
        	document.getElementById("loadmorewordh").innerHTML="玩命加载中，请稍后...";
        	var test = document.getElementById("loadmorewordh").innerHTML;
        	
        	//alert($('#loadmoreword').html());
        	//如果 _content.length 小于每次显示的页数，则需要再次做异步请了。   
        	/*if(_content.length<pagesize){
        		queryData();
        	}else {
        		loadData();
        	}*/
        	queryData();
        	
        }
    }
    
    lanren.init();
    
    function loadData(){
      var mLis = $(".morebox .ycdata_list1").length;
           for(var i =0;i<lanren._loading;i++){
              var target = _content.shift();
              if(!target){
                  $('#loadmorewordh').html("<p>亲，没有数据可以加载了！！！</p>");
                  break;
              }
              $(".morebox").append(target);
              $(".morebox .ycdata_list1").eq(mLis+i).each(function(){
                  $(this).attr('.ycdata_list1',$(this).attr('.ycdata_list1'));
              });
           }
           $('#loadmorewordh').html("加载更多");
     }
    function queryData(){
   		queryDataCount = queryDataCount+1;
    	var _url = "/data/getRzjyList2.html?page="+queryDataCount;
//	alert(_url);
		$.ajax({
		  type: 'POST',
		  url: _url,
		  data: {},
		  beforeSend : function () {
              $("#loadmorewordh").html("数据拼命加载中...");
          },
		  success: function(data){
			  if(data=="0"){
				  //jQuery.unblockUI();
				 // alert("查询不到任何数据！");
				 // return null;
               $("#loadmorewordh").html("已经加载完所有数据");
				 
			  }
			  for(var i=0;i<data.length;i++ ){  
			  	var dytype = data[i].dytype;
			  	var dytypedetail  = data[i].dytypedetail;
			  	var str = '';
			  	if(dytype.equals("1")) {  //债权融资
						str = "申请"+d.getDytypedetail();
					}else if(dytype.equals("2")) {//增值业务
						str ="订购增值业务"+d.getDytypedetail();
					}else if(dytype.equals("3")) { //股权融资
						str ="约谈项目"+d.getDytypedetail();
					}else if(dytype.equals("5")) { //基金申请
						str ="申请基金"+d.getDytypedetail();
					}else{  //发布融资
						str ="发布"+d.getDytypedetail();
					} 
                     
                      
			  
 			    _content.push(
			    	"<div class=\"ycdata_list1 widthbox fl\">"+
					"<div class=\"data_list_name1 fl\">"+
						"<li class=\"data_list_name_info1 fl\"> "+data[i].compName+" <br><div class=\"xiamian1 fl\"> </div></li>"+
					"</div>"+
					"<div class=\"data_list_scale1 fl\">"+
						
						"<li>"+str+data[i].amt+"万元</li>"+
					"</div>"+
					"<div class=\"data_list_profession1 fl\">"+
						"<li>"+data[i].dystatus+"</li>"+
					"</div>"+
					"<div class=\"data_list_scale1 fl\">"+
						"<li>"+data[i].dytime+"</li>"+
					"</div>"+
				"</div>"
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
    }
    
</script>


 
<script>
 menu_init("data");

</script>

<!--盈创活动end-->
         <%@ include file="../footer.jsp"%>

</body>
</html>


