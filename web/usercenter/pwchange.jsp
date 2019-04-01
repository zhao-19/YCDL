<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html>
<head >
    <title></title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.4.2.min.js"></script>
	<script language="javascript" type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.validate.js"></script>
</head>
<body>
<div id="ggts2"></div>
<!-- t有值代表是查看 -->
<input type="hidden" id="backnotice" value="<s:property value="#request.flag"/>">
<script type="text/javascript">

$(window).load(function(){
	  var backnotice = $("#backnotice").val();
		         var a = document.getElementById("ggts2");//获取div块对象
		         var Height=document.documentElement.clientHeight;//取得浏览器页面可视区域的宽度
		         var Width=document.documentElement.clientWidth;//取得浏览器页面可视区域的宽度
		         var gao1 = a.offsetHeight;//获取div块的高度值
		         var gao2 = a.offsetWidth;//获取div块的宽度值
		         var Sgao1= (Height - gao1)/2-110+"px";
		         var Sgao2= (Width - gao2)/2+"px";
		         a.style.top=Sgao1;
		         a.style.left=Sgao2;
		if(backnotice=='0'){
		     
		        // $("#ggts2").show();
		    ggts2('修改密码失败');
		}else if(backnotice=='1'){
		    ggts2('修改密码成功');
		    
		
		}});
	 
 
</script>
<style>
.error {
    border: none;
    background:none;
    }
label.error {
    border: 1px solid #f5694b!important;
    background:none;
	color: #f5694b;
	padding: 0 2px;
	display:inline-block;
	height: 20px;
    line-height: 20px;
    }
</style>
<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>





<!-- 个人中心 -->
<div class="background"></div>
<div class="creditor widthbox">
	<div class="show fl">
		<%@ include file="leftnav.jsp"%>
	</div>


	<div class="list fr">
		<div class="rightbox">
			
			<!-- 债权信息修改    用户为企业时显示    -->
			<div id="zaiquanxinxi-update" class="vipinfo" >
			
					<form id="personappinfo" name="personappinfo" action="/usercenter/pswdchange.html" method="post">
			
				<div class="title"><li><span class="t">修改密码</span></li></div>
				<div class="inputtest inputtestl" style="padding-left: 146px;">
					<span class="leftname leftnamel">原密码：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="oldpassword" name="oldpassword" type="text"  value="<s:property value='person.username'/>" /></span>
				</div>
				<div class="inputtest inputtestl" style="padding-left: 146px;">
					<span class="leftname leftnamel">新密码：<span style="color:red">*</span></span>
					<span class="rightinfo"><input class="input" id="newpassword" name="newpassword" type="text"  /></span>
				</div>
				<div class="inputtest inputtestl" style="padding-left: 146px;">
					<span class="leftname leftnamel">新密码：<span style="color:red">*</span></span>
					<span class="rightinfo leftnamesex" style="line-height: 38px;">  
					<input class="input" id="newpassword2" name="newpassword2" type="text"/>
					</span>
				</div>
			 

				<div class="revise" id="zqxxxgbtn" >  <input class="shenqingdkt shenqingdkthide" type="submit" value="保存"/></div>
			</form>
				</div>
							
		</div>	
		
		</div>





<script>
    $(document).ready(function () {
    	
    	
		$("#personappinfo").validate({
           
            rules: {
				"oldpassword": {
	                required: true
	             },
	            "newpassword" : {
		            required : true,
		            rangelength: [6,12]
	      		 },
	      		"newpassword2" : {
	      			required : true,
	            	equalTo: "#newpassword"
	            }
			},
            messages: {
                "oldpassword":{
                    required: '请输入原密码'
                },
                "newpassword":{
		            required : "请输入密码",
		            rangelength : "6到12个字符"
       	 		},
       	 	    "newpassword2":{
       	 		    required : "请输入新密码",
       	 		    equalTo:"两次输入的密码不相同"
		        }
            },
            errorPlacement: function (error, element) {
            	if (element.is(':radio') || element.is(':checkbox')) { 
            		//如果是radio或checkbox
            	       var eid = element.attr('name');
            	       //获取元素的name属性
            	       error.appendTo(element.parent()); 
            	       //将错误信息添加当前元素的父结点后面
            	     }else{
            	       error.insertAfter(element);
            	       //element.html(error); 
            	     }
            	
            	}
            ,
            submitHandler:function(form){
            	//alert('ok!');
            	//return false;
            	$("#personappinfo").submit();
            } 
        });
    });
</script>









</div>
 <%@ include file="../footer.jsp"%> 
 <script type="text/javascript" >
 	leftnav_init("pwchange");
 </script>
</body>
</html>
 