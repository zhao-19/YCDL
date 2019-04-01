<%@page import="com.winpow.services.manage.catalog.bean.Catalog"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/jquery-jquery-ui/themes/base/jquery.ui.all.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/themes/default/default.css" />

<style>
#insertOrUpdateMsg{
border: 0px solid #aaa;margin: 0px;position: fixed;top: 0;width: 100%;
background-color: #d1d1d1;display: none;height: 30px;z-index: 9999;font-size: 18px;color: red;
}
select{height:auto;}
/*重新调整财务信息table表的样式，只在当前页面有效*/
#tabs-3 input{width:104px;margin: 10px 0px;}
#tabs-3 td{vertical-align: middle;}
.n-ok .n-icon {margin-top: 12px;}
#layui-layer1{margin-left: 40%;}
iframe,.iframebox{width: 100%;height: 100%;border: 0;}
.iframebox{padding:15px;overflow:auto;box-sizing: border-box;-webkit-box-sizing: border-box;-moz-box-sizing: border-box;}
.ui-tabs .ui-tabs-panel{padding:1em 0;}
    .ui-tabs .ui-tabs-panel{padding:0;}
#tabs{position: fixed;width: 99%;height: 91%;left: 0%;}
    #tabs>div{height: 90%;}
</style>


<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" href="../css/progressBar.css"/>
<link rel="stylesheet" href="../css/massage.css"/>
<script src="../js/jquery.min.js"></script> 
<script src="../js/message3.0.js"></script> 
 

</head>

<body style="padding: 5px;margin-top: -20px;">
<input type="hidden" id="ifsave" value="<s:property value="#request.ifsave"/>"/>
 <s:form action="productczdbase!updateGZL.action" id="form" name="form" namespace="/manage" theme="simple"   method="post">
        <input type="hidden" name="taskid" value="${taskid }"/>
        <input type="hidden" name="instanceid" value="${instanceid }"/>
        <input type="hidden" name="ctype" value="${ctype }"/>
    <div class="navbar navbar-inverse" >
        <div id="insertOrUpdateMsg">
            <s:property value="#session.insertOrUpdateMsg"/>
            <%request.getSession().setAttribute("insertOrUpdateMsg", "");//列表页面进行编辑文章的时候,需要清空信息 %>
        </div>
    </div>
    <span id="pifeSpan" class="input-group-addon" style="display:none"><%=SystemManager.systemSetting.getImagerootpath()%></span>
         <!-- 流程进度条 -->
    <%--  <div class="project-screening">
        <div class="project-screening-yellow"></div>
        <div class="select-1-yellow"></div>
        <div  id="step1" class="screening-select select-1 current"><span>1</span><a href="javascript:void(0)">基础资料审查通过</a></div>
        <div  id="step2"  class="screening-select select-2" selval="4,6"><span>2</span><a href="javascript:void(0)" >详细资料审查通过</a></div>
        <div  id="step3"  class="screening-select select-3" selval="6,7"><span>3</span><a href="javascript:void(0)">项目评审会评审通过</a></div>
        <div  id="step4"  class="screening-select select-4" selval="7,10"><span>4</span><a href="javascript:void(0)" >担保公司审批通过</a></div>
        <div  id="step5"  class="screening-select select-5" selval="10,-1"><span>5</span><a href="javascript:void(0)" >银行审批通过</a></div>
        <div  id="step6"  class="screening-select select-6" selval="10,-1"><span>6</span><a href="javascript:void(0)" >金融办审批通过</a></div>
        <div  id="step7"  class="screening-select select-7" selval="10,-1"><span>7</span><a href="javascript:void(0)" >银行放贷成功</a></div>
    </div> --%>

    <script type="text/javascript">
   /*  $(document).ready(function(){
        var step = "<s:property value='e.status'/>";
        if(step==0){
            
        }else if(step == 10){
            step = 1;
        }else if(step == 20){
            step = 1;
        }else if(step == 30){
            step = 1;
        }else if(step == 40){
            step = 2;
        }else if(step == 50){
            step = 3;
        }else if(step == 60){
            step = 4;
        }else if(step == 70){
            step = 5;
        }else if(step == 80){
            step = 6;
        }else if(step == 90){
            step = 7;
        }else{
            step =1;
        }
        
        for(var i=1;i<=step;i++){
            refresh(i);
        }
        
    });
 */
   /*  function refresh(value){
            var _parent = $("#step"+value+"");
        var _postX = _parent.position().left+65;
        _parent.siblings(".screening-select").removeClass("current");

        _parent.siblings(".project-screening-yellow").animate({ width: _postX }, 300);

        _parent.siblings(".select-1-yellow").animate({ left: _postX -75 }, 300,function(){
            _parent.addClass("redbg");
            _parent.prevAll(".screening-select").addClass("redbg");
            _parent.addClass("current");
        });

        //_parent.nextAll().removeAttr("style");
    } */
    </script>
            <div style="text-align: center;margin-bottom:3px;">
            <div id="updateMsg"><font color='red'><s:property value="updateMsg" /></font></div>
        <!--    <s:if test="e.id=='' or e.id==null">
                <button method="productczdbase!insert.action" class="btn btn-success">
                    <i class="icon-ok icon-white"></i> 新增
                </button>
            </s:if> 
            <s:else> 
            </s:else>
            -->
                用户ID：<span class="badge badge-success"><s:property value="e.id"/></span>
                <s:iterator value="#request.buttonlist" var="button" status="st">
					<s:if test="apporpc != 2 && type!=14101">
		                 <span apporpc="${apporpc }" buttonid="${id }" type="${type }" class="btn btn-info buoper"> 
							<i class="icon-ok icon-white "></i><span>${name }</span>
						</span>
					</s:if>
                </s:iterator>
            <%-- <s:if test="#request.ctype == 1">  
                <button method="productczdbase!updateGZL.action" class="btn btn-success" >
                    <i class="icon-ok icon-white"></i> 保存
                </button>
                <button type="button" class="btn btn-danger" id="backstep" style="margin-left:20px;">
                        <i class="icon-ok icon-error"></i> 驳回
                </button>
                <button type="button" class="btn btn-info btnnextstep" style="margin-left:20px;">
                        <i class="icon-ok icon-white"></i> 下一步
                </button>
            </s:if> --%>
        <!-- <input type="button" class="btnnextstep"  value="下一步"> --> 
        </div>
        <div id="tabs">
            <ul>
                <li><a href="#tabs-8">流程信息</a></li>
                <li><a href="#tabs-10">贷款基础信息</a></li>
                <li><a href="#tabs-9">贷款详细信息</a></li>
            </ul>
             <div id="tabs-9">
                 <iframe src="productczdbase!toEditDetail.action?e.id=${productappid }"></iframe>
             </div>
             <div id="tabs-10">
                 <iframe src="productapp!toEdit.action?e.id=${productappid }"></iframe>
             </div>
         <!-- 流程信息 -->
            <div id="tabs-8">
                <div class="iframebox">
                <img src="${wfimg }rest/showflowpic?instanceid=${instanceid}"/>
                <table class="table table-condensed table-bordered">
                    <tr>
                        <th class="td_right">业务数据id</th>
                        <td style="text-align: left;">${result.data.app_key }</td>
                        <th class="td_right">业务表</th>
                        <td style="text-align: left;">${result.data.app_table }</td>
                    </tr>
                    <tr>
                        <th class="td_right">业务编号</th>
                        <td style="text-align: left;">${result.data.bus_id }</td>
                        <th class="td_right">业务名称</th>
                        <td style="text-align: left;">${result.data.bus_name }</td>
                    </tr>
                    <tr>
                        <%-- <th class="td_right">流程id</th>
                        <td style="text-align: left;">${result.data.flowid }</td> --%>
                        <th class="td_right">分类</th>
						<td style="text-align: left;">${result.data.bustype }</td>
                        <th class="td_right">流程名称</th>
                        <td style="text-align: left;">${result.data.flowname }</td>
                    </tr>
                    <tr>
                        <th class="td_right">申请人公司名称</th>
                        <td style="text-align: left;">${result.data.companyname }</td>
                        <th class="td_right">实例id</th>
                        <td style="text-align: left;">${result.data.instanceid }</td>
                    </tr>
                    <tr>
                        <th class="td_right">系统编号</th>
                        <td style="text-align: left;">${result.data.sys_id }</td>
                        <th class="td_right">数据的总条数</th>
                        <td style="text-align: left;">${result.data.totalcount }</td>
                    </tr>
                    <tr>
                        <th class="td_right">申请人id</th>
                        <td style="text-align: left;">${result.data.userid }</td>
                        <th class="td_right">状态名</th>
						<td style="text-align: left;">${result.data.statusname }</td>
                    </tr>
                </table>
                
                <table class="table table-condensed table-bordered">
				<thead>
					<tr style="display: none;">
						<td>
							<span id="agencyid">${title.paradetail.agencyid }</span>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="td_right">${title.paradetail.top }</th>
						<td style="text-align: left;">${title.paradetail.title }</td>
					</tr>
				</thead>
				<s:iterator value="#request.title.paradetail.dlist">
					<tr>
						<th class="td_right">${name }</th>
						<td style="text-align: left;">${val }</td>
					</tr>
				</s:iterator>
			</table>
                
                <table class="table table-condensed table-bordered">
                    <thead>
                        <tr style="background-color: #dff0d8">
                           <!--  <th>任务id</th> -->
                            <th>业务名称</th>
                            <th style="max-width: 200px;">审批意见</th>
                            <th>流程名称</th>
                            <th>节点id</th>
                            
                            <th>节点名称</th>
                            <th>操作名称</th>
                            <th>用户id</th>
                            <th>处理人id</th>
                            <th>处理人名称</th>
                            <th>任务发送时间</th>
                            <th>任务处理时间</th>
                            
                            
                            <!-- 
                            <th>业务编号</th>
                            <th>流程id</th>
                            <th>用户名称</th>
                            <th>状态</th>
                            <th>系统编号</th>
                            <th>用户名称</th> -->
                        </tr>
                    </thead>
                    <s:iterator value="#request.result.data.rows">
                        <tr>
                            <%-- <td>${taskid }</td> --%>
                            <td>${bus_name }</td>
                            <td>${comments }</td>
                            <td>${flowname }</td>
                            <td>${nodeid }</td>
                            
                            <td>${nodename }</td>
                            <td>${operation }</td>
                            <td>${senduserid }</td>
                            <td>${dealuserid }</td>
                            <td>${dealusername }</td>
                            <td>${sendtime }</td>
                            <td>${dealtime }</td>
                            
                            
                            <%-- 
                            <td>${bus_id }</td>
                            <td>${flowid }</td>
                            <td>${sendusername }</td>
                            <td>${status_ }</td>
                            <td>${sys_id }</td>
                            <td>${username }</td> --%>
                        </tr>
                    </s:iterator>
                </table>
                <div>
            </div>
        </div>
            </div></div>
 </s:form>

<script type="text/javascript">

var custtype = '<s:property value="userType"/>';
</script>

<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.core.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath() %>/resource/jquery-jquery-ui/ui/jquery.ui.tabs.js"></script>
<script src="<%=request.getContextPath() %>/resource/js/area.js"></script>


<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
<script type="text/javascript">
  
var Gid  = document.getElementById ;
 

$(function() {
    $( "#tabs,#tabs2" ).tabs({
        //event: "mouseover"
    });

    //alert($("#insertOrUpdateMsg").html());
    if($("#insertOrUpdateMsg").html()!='' && $("#insertOrUpdateMsg").html().trim().length>0){
        $("#insertOrUpdateMsg").slideDown(1000).delay(1500).slideUp(1000);
    }
    
    
    $("#removePife").click(function(){
        clearRootImagePath();
    });
});
/* $('.oper').click(function(){
    $('#msgcontent').val($.trim($(this).children('span').text()));
    $('#buttonid').val($(this).attr("buttonid"));
    
    showDiv();
    $('#ldksq').show();
});
 */
function showDiv(id) {
    var divName = $("#ldksq_c");
    var top = ($(window).height() - $(divName).height())/3;
    var left = ($(window).width() - $(divName).width())/2;
    var scrollTop = $(document).scrollTop();
    var scrollLeft = $(document).scrollLeft();
    $(divName).css( { position : 'absolute', 'top' : top, left : left + scrollLeft } ).show();

};
if ('${msg}' != "") {
    layer.alert('${msg}', {icon: 7, title : '提示'});
}
</script>

<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/kindeditor-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/resource/kindeditor-4.1.7/lang/zh_CN.js"></script>
 <!--点击下一步弹出发送短信对话框 start-->
<div id="ldksq">
    <div id="ldksq_c">
        <div id="ldksq_lose"></div>
        <form action="productapp!operate.action" name="indexdksq" id="indexdksq" method="post">
        <input type="hidden" name="method" value="productapp!selectPolicyList.action?init=y">
        <p id="tckremark"><span class="msgcontenttype">审核意见：</span><textarea class="duanxin" rows="4" cols="80" name="msgcontent" id="msgcontent"   data-rule="短信标题:required;m_remark;length[2~512]">   </textarea></p>
        <input type="hidden" name="taskid" id="taskid" value="${taskid }">
        <input type="hidden" name="buttonid" id="buttonid">
        <input type="hidden" name="e.id" value="<s:property value="e.id" />"/>
        <p>
            <button id="ldksq_lose2" type="reset" class="btn btn-inverse"  style="margin-left:20px;">
                <i class="icon-ok icon-white qx"></i> 取消
            </button>
            <button type="submit" class="btn btn-success" style="margin-left:20px;">
                <i class="icon-ok icon-white"></i> 确定
            </button></p>
        </form>
    </div>
</div>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/newlayer/layer.js"></script>
<span style="display:none;" id="agencyid">${title.paradetail.agencyid }</span>
<style type="text/css">
.userinfo{margin-left: 1% !important;top:1% !important}
.userinfo .layui-layer-content{height:90%}
.layui-layer-rim{margin-left: 25% !important;}
.layui-layer-dialog{margin-left: 30% !important;}
.allocation{margin: 1% !important;}
.allocation .layui-layer-content{height:80%;}
.userinfo iframe {height:100%}
</style>
<script type="text/javascript">
	if ($("#agencyid").html() == "") {
		$("span[type='14103']").hide();
	}
	$('.buoper').click(function(){
	    var buttonid = $(this).attr("buttonid");
	    var type = $(this).attr("type");
	    if (type == "14101") {				// 审批记录(已屏蔽)
	    	
	    } else if (type == "14102") {		// 用户信息
	        getuserinfo('${creator}');
	    } else if (type == "14103") {		// 银行信息
		    getuserinfo($("#agencyid").html());
	    } else if (type == "14104") {		// 审核（通过，取消，退回）
	    	checkwf(type, buttonid);
	    } else if (type == "14105") {		// 审核(填原因)
	    	checkwf(type, buttonid);
	    } else if (type == "14106") {		// 审核(填金额)
	    	checkwf(type, buttonid);
	    } else if (type == "14107") {		// 推荐银行
	    	allocation(buttonid);
	    } else if (type == "14108") {		// 流程终止
	    	stopwf(buttonid);
	    }
	});
	
function allocation(buttonid) {
	$.ajax({
         type: "post",
         url:"/manage/user!getWFList.action",
         data: {
         		app_key : '${app_key}',
        		app_table : '${app_table}'
         },
         dataType: "json",
         success: function(data) {
             var html = "<table class='table table-condensed table-bordered'><tr><td></td><td>头像</td><td>用户ID</td><td>用户名</td><td>机构名</td><td>手机号</td></tr>";
             for (var i=0;i<data.length;i++) {
             	var da = data[i]; 
             	html += "<tr><td><input type='checkbox' data='" + JSON.stringify(da) + "' name='allos'/></td><td><img src='" + da.agencylogo + "' style='max-width:50px;max-height:50px;'/></td><td>" + da.userid + "</td><td>" + da.username + "</td><td>" + da.agencyname + "</td><td>" + da.mobile + "</td></tr>"
             }
             html+="</table>"
             layer.open({
		        type:  1 ,
		        title:'流程分配',
		        skin:'layui-layer-lan allocation userinfo',
		        area: ['98%', '96%'],
		        content: html,
		        btn:['提交','取消'],
		        btn1: function (index, layero) {
		        	var arr = new Array();
		        	$("input[name='allos']:checked").each(function(i){
		        		arr[i] = $.parseJSON($(this).attr("data"));
		        	});
		        	if (arr.length==0) {
		        		layer.alert('请选择后重新提交！', {icon: 7, title : '提示'});
		        		return;
		        	}
		        	$.ajax({
			            type: "post",
			            url:"/manage/user!saveUserInfo.action",
			            data: {
		            		taskid : '${taskid}',
		            		app_table : '${app_table}',
		            		app_key : '${app_key}',
		            		userinfo 	: JSON.stringify(arr),
		            		buttonid : buttonid
			            },
			            dataType: "json",
			            success: function(data) {
			                alert(data.msg);
			                if (data.code == 100) {
			                	parent.location.reload();
			                }
			            }
			        });
		    	},
		        btn2:function (index, layero) {
		        	 layer.close(index);
		        }
		    });
         }
     });	
}

function checkwf(type, buttonid) {
	var ti = "备注";
	var checkmark = "提交"; 
	if (type == "14105") {
		ti = "原因";
		checkmark = ""; 
	} else if (type == "14106") {
		ti = "金额";
		checkmark = "已放款XX万元"; 
	}
	var html = "<div style='width: 420px;margin:10px;'><span>" + ti + "&nbsp;：&nbsp;</span><input id='checkmark' style='width:300px;' type='text' value='" + checkmark + "'></div>";
	layer.open({
		id: 1 ,
        type:  1 ,
        title:'流程审核',
        skin:'layui-layer-rim',
        area:['450px', 'auto'],
        content: html,
        btn:['提交','取消'],
        btn1: function (index, layero) {
        	var remark = $("#checkmark").val();
        	if (remark == "" || (remark == checkmark && remark != "提交")) {
        		layer.alert('请填写' + ti, {icon: 7, title : '提示'});
        		return;
        	}
        	$.ajax({
	            type: "post",
	            url:"/manage/user!saveUserInfo.action",
	            data: {
            		taskid : '${taskid}',
            		app_table : '${app_table}',
            		app_key : '${app_key}',
            		remark 	: remark,
            		buttonid : buttonid
	            },
	            dataType: "json",
	            success: function(data) {
	                alert(data.msg);
	                if (data.code == 100) {
	                	parent.location.reload();
	                }
	            }
	        });	
    	},
        btn2:function (index, layero) {
        	 layer.close(index);
        }
    });
}

function getuserinfo(userid) {
	layer.open({
         title: '用户信息',
         type: 2,
         skin: 'layui-layer-lan userinfo',
         area: ['98%', '98%'],
         fix: false,
         maxmin: false,
         content: "cust!toEditByUserid.action?userid=" + userid
     });
}

function stopwf(buttonid) {
	layer.confirm("是否终止该流程？", {
		title : "提示",
		btn : [ '确定', '取消' ]
	}, function(index) {
		layer.close(index);
		$.ajax({
			type : "post",
			url : "/manage/user!stopInstance.action",
			data : {
				taskid : '${taskid}',
				buttonid : buttonid
			},
			dataType : "json",
			success : function(data) {
				alert(data.msg);
				if (data.code == 100) {
					parent.location.reload();
				}
			}
		});
	});
}


</script>

</body>
</html>
