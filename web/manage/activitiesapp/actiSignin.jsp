<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/resource/common_html_meat.jsp"%>
<%@ include file="/manage/system/common.jsp"%>
<%@ include file="/resource/common_html_validator.jsp"%>
<style>
	.td_right{text-align: right;}
	select{height:auto;}
	.table_title{text-align: left;font-weight: bold;font-size: 20px;background-color: #dff0d8;}
</style>
<script type="text/javascript">
	$(function() {
		 $("#keys").focus();
	});
</script>
</head>

<body>
		<table class="table table-bordered">
 			<tr>
	            <td colspan="4" class="table_title" style="text-align: center;">【<span id="name"></span>】扫码签到</td>
	        </tr>
 			<tr>
				<td style="text-align: center;" colspan="2">
					<input id="keys" style="width: 50%;" onkeydown="if(event.keyCode==13){actiSignin()};"/>
				</td>
			</tr>
		</table>
		
		<table class="table table-bordered">
			<thead>
		        <tr>
		            <td class="table_title" style="width:115px;">签到时间</td>
		            <td class="table_title" style="width:120px;">签到状态</td>
		            <td class="table_title">签到详情(成功：<span id="succ">0</span>;出错：<span id="fail">0</span>)</td>
		        </tr>
	        </thead>
	        <tbody id="tbody">
	        	<td colspan="3" style="text-align: center;" id="tiptd">暂无签到</td>
	        </tbody>
	        <tfoot>
	        	<tr>
	        		<td colspan="3">
	        		温馨提示：<br/>
					1.扫码时确保光标在输入框里闪烁。<br/>
					2.扫码时确保当前输入方式为英文。<br/>
					3.扫码时不要离得太近。<br/>
					4.扫码枪故障时阅读说明书查看，可尝试扫恢复出厂默认设置条码。<br/>
					</td>
	        	</tr>
	        </tfoot>
		</table>
		<div style="display: none;">
			<audio class="mp3"  src="/manage/activitiesapp/music/succ.mp3" controls="controls" id="succmusic"></audio>
			<audio class="mp3"  src="/manage/activitiesapp/music/fail.mp3" controls="controls" id="failmusic"></audio>
		</div>
		
<script type="text/javascript">
	var succ = 0;
	var fail = 0;
	function actiSignin() {
		var keys = $.trim($("#keys").val());
		if (keys == "") {
			return;
		}
		$("#keys").val("");
		$("#tiptd").remove();
		$.ajax({
			type: 'post',
			url: "/manage/activitiesapp!actiSignin.action",
			data: {"keys": keys, "activitiid" : '${e.activitiid}'},
			dataType:"json",
			success: function(data){
				var code = "";
				if (data.code == 100) {
					code = "<span style='color:blue;'>签到成功！<span>";
					$("#succ").html( ++ succ);
					$("#succmusic")[0].play();
				} else {
					code = "<span style='color:red;'>签到失败！</span>";
					$("#fail").html( ++ fail);
					$("#failmusic")[0].play();
				}
				$("#tbody").prepend("<tr><td>" + data.time + "</td><td>" + code + "</td><td>" + data.msg + "</td></tr>");
			}
		});
	}
	$("#name").html(decodeURI('${e.activities_name }'));
</script>
</body>
</html>
