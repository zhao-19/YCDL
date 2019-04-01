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
	<link rel="stylesheet" type="text/css" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/jquery.dialogbox.css">
	<link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog/jDialog.css" type="text/css">
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/script.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/add.js"></script>
	<script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery.dialogBox.js"></script>
	<script type="text/javascript" src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jDialog.js"></script>
</head>
<body>
<style>
.ib{color:blue;cursor:pointer;}
.hi{display: none;}
.btn{
    cursor: pointer;}
</style>

<div class="zgezhaoceng" style="display: none;width:100%;height:2400px;"></div>

<script>
	$(function(){
		//$(".zgezhaoceng").width(body).width();
//		$('.zgezhaoceng').height(body).height();
		$('.zgezhaoceng').css('left',0);
		$('.zgezhaoceng').css('top',0);
	});	

 
</script>
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
 			<div id="peixunhuodong" class="vipinfo" >
				<div class="title"><li><span class="t">已发布的股权信息</span><a href="/usercenter/getPublishguquaninfo.html?t=a"><span id="CreateTBpxhd" class="update">发布股权融资</span></a> </li></div>

				<table id="ycacti" align="center" border="0" cellpadding="0" cellspacing="1">
					<tr class="TT">
 						<td >项目名称</td>
 						<td >行业</td>
 						<td >出让股权比例</td>
						<td >融资金额</td>
						<td style="width:72px;">审核状态</td>
 						<td >操作</td>
					</tr>
					<s:iterator value="#request.list">
						
						<tr>
					     <td><s:property value="mingcheng"/></td>
					     <td><s:property value="hangye"/></td>
              	  		 <td><s:property value="crgqbl"/> %</td>
              	  		 <td><s:property value="rongziedu"/> 万</td>
	               		 <td><s:property value="shenhezhuangtai"/></td>
						<td class="xgwk">
							<div class="button">
                            <form action="" >
                              <input type="button" class="an ck" lang="${shenhezhuangtai}" pkid="${id}" value="查看">
                              <input type="button" class="an tb" lang="${shenhezhuangtai}" pkid="${id}" value="填报">
                              <input type="button" class="an shjl" lang="${shenhezhuangtai}" pkid="${id }" value="审核记录" >
                              <input type="hidden" name="id" class="eid" value="${id}" />
                              <input type="hidden" name="t" class="et" value="v"/>
                          </form>
                    </div>  
						</td>
					</tr>
					</s:iterator>
					
 
					  

				</table>
			 <div class="shjlTab">
            <div class="shjl_tit ov">
                <h2 class="fl">审核记录</h2>
                <span class="fr shjl_close">&times;</span>
            </div>
            <div class="shjl_over">
                <table class="sbhzTab" >
                    <thead>
                        <tr class="TT">
                            <td>时间</td>
                            <td>动作</td>
                            <td>处理人</td>
                            <td>意见</td>
                        </tr>
                    </thead>
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
				<script type="text/javascript">
				$('.shjlTab .shjl_tit .shjl_close').click(function(){
				      $('.shjlTab').fadeOut(200);
				  })
				  
				  $('#peixunhuodong').delegate(' tr>td .shjl','click',function(e){
      e.stopPropagation();
      $('.shjlTab').fadeIn(200);
      var id=$(this).attr('pkid');
      $.ajax({
          cache: true,
          type: "POST",
          url:"/usercenter/getWorkFlowDetail.html?id="+id+"&tablename=tb_guquan",
          async: false,
          error: function(request) {
              // alert("请求出错");
          },
          success: function(data) {
              $('.sbhzTab tbody').html('');
              if(data.length==0||data==""){
                  $('.sbhzTab tbody').html('<p>暂无审核记录！</p>');
              }
              for(var i=0;i<data.length;i++){
                  var dealuser =data[i].dealusername;
                  if (dealuser==""){
                      dealuser = data[i].dealuserid;
                      dealuser = dealuser.substring(2);
                  }
                  var tr="";
                  tr+='<tr><td>'+data[i].sendtime+'</td><td>'+data[i].operation +'</td><td>'+dealuser+'</td><td>'+data[i].comments+'</td></tr>';
                  $('.sbhzTab tbody').append(tr);
              }
          }
      })
  })
				
				var datas = $(".xgwk");
                var nowwidth = 0;
                var sceilwkwidth = $(".sceilwk").eq(0).width();
                var sceilwidth = (sceilwkwidth/10);
                
                datas.each(function(i,v){
                    //获取每一条的step值
                    step = $(this).attr("lang");
                
                    var ck = $(this).children(".button").eq(0).children("form").eq(0).children(".ck").eq(0);
                    var tb = ck.next();
                    var fz = ck.next().next();
                    var form = ck.parent();
                    var status = ck.attr("lang");
                    if (status!="未提交"){
                        tb.addClass("hi");
                    }
                    ck.click(function(){
                       form.attr('action',"/usercenter/getPublishguquaninfo.html");
                       $(".et").val('v')
                        form.submit();
                    });
                    tb.click(function(){
                        
                        form.attr('action',"/usercenter/getPublishguquaninfo.html");
                        $(".et").val('u')
                        form.submit();
                    });
                    


                

                    
                    //alert(ck.html()+"||"+ck.next().html()+"||"+ck.next().next().html());
                
                    nowwidth = (step*10)+"%";
                    //alert(nowwidth);
                    //alert($(this).children(".sceilwk").eq(0).children(".hidediv").length);
                    //获取每一条下面所有hidediv
                    //alert($(this).children(".progress").eq(0).children(".progress-bar").eq(0).attr("class"));
                    $(this).children(".progress").eq(0).children(".progress-bar").eq(0).attr("style","width:"+nowwidth);                                                
                    $(this).children(".sceilwk").eq(0).children(".hidediv").eq(step-1).show(800);       
                    $(this).children(".sceilwk").eq(0).children(".sceil").css("width",sceilwidth);      
                    $(this).children(".sceilwk").eq(0).hover(function(i,v){
                        $(this).children(".detail").stop().slideDown(200);
                        $(this).addClass("lhover");
                        //$(this).prev(".progress").children(".progress-bar").addClass("lhover");
                    },function(){
                        $(this).children(".detail").stop().slideUp(100);
                        $(this).removeClass("lhover");
                        //$(this).prev(".progress").children(".progress-bar").removeClass("lhover");
                    });
                });
				
				
				
				var opls = $("#ycacti .opl");
				var oprs = $("#ycacti .opr");
				opls.each(function(){
					var stateinput= $(this).parent().prev().prev().children("label").html();
					if(stateinput=="审批中" || stateinput=="审批通过"){
						$(this).attr("disabled","false");
						$(this).removeClass("op").addClass("padd");
						//$(this).next().attr("disabled","false");
						//$(this).next().removeClass("op");
					}
					if(stateinput=="驳回"){
						$(this).parent().prev().prev().addClass("showh");
					}
					
				});
				$(".showh").hover(function(){
					$(this).children("span").show();
				},function(){
					$(this).children("span").hide();
				});
				
				//修改
				opls.click(function(){

						var id=$(this).attr("lang");
						location.href="/usercenter/getPublishguquaninfo.html?e.id="+id+"&t=u";
				});
				//查看
				oprs.click(function(){

					var id=$(this).attr("lang");
					location.href="/usercenter/getPublishguquaninfo.html?e.id="+id+"&t=v";
			});
				

				</script>
			</div>
			</div>
			</div>





</div>
 <%@ include file="../footer.jsp"%>
 <script type="text/javascript" >
 	leftnav_init("publishguquanlist");
 </script>
</body>
</html>
 