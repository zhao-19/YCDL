<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.userinfo{
    display:none;
    border-radius: 5px;z-index: 10000;height:90%;overflow: hidden;
    width:96%;position: fixed;left:2%;top:50%;border: 1px solid #e2e2e2;
    transform:translateY(-50%);-ms-transform:translateY(-50%);-moz-transform:translateY(-50%); -webkit-transform:translateY(-50%);-o-transform:translateY(-50%);
    background:#fff;box-sizing: border-box;  padding: 5px 25px 30px;  box-shadow: 0px 0px 20px rgba(0,0,0,0.2);
}
iframe{
    width: 100%;
    border: 0;
    height: 80%;}
/*审核记录弹出框*/
.sbhzTab td,.sbhzTab th{border:1px solid #ddd;padding:7px 0;}
.sbhzTab td{width: 25%;padding-left:10px;}
.sbhzTab{width:100%;border-collapse: collapse;}
.shjlTab .shjl_tit{margin:5px 0 13px;border-bottom: 1px solid #e5e5e5;padding-bottom: 6px;}
.shjlTab .shjl_tit>h2{font-size: 17px;color:#666;font-weight: normal;line-height:30px;margin:0;}
.shjlTab .shjl_tit .shjl_close{font-size: 22px;cursor: pointer;color:#ddd;margin-top: -27px;
    float: right;}
.shjlTab .shjl_tit .shjl_close:hover{color: #000;}
.userinfo .shjl_tit{margin:5px 0 13px;border-bottom: 1px solid #e5e5e5;padding-bottom: 6px;}
.userinfo .shjl_tit>h2{font-size: 17px;color:#666;font-weight: normal;line-height:30px;margin:0;}
.userinfo .shjl_tit .shjl_close{font-size: 22px;cursor: pointer;color:#ddd;margin-top: -27px;
    float: right;}
.userinfo .shjl_tit .shjl_close:hover{color: #000;}
.sbhzTab>tbody>tr:nth-child(even){background: #f5f5f5;}
.sbhzTab>tbody>tr:hover{background:#fadada;}
.shjl_over{height:78%;overflow-y: auto;}
.sbhzTab>tbody>p{margin:20px 5px;color:#999;}
.sbhzTab>thead>tr{background:#dff0d8;font-weight:bold;}
.alink{display:none;}
 #ldksq_c{padding: 20px 20px 10px;box-shadow: 0px 0px 20px rgba(0,0,0,0.2);display: none;
     position: fixed;  top: 50%;  left: 50%;  transform: translate(-50%,-50%);height: 85%;box-sizing: border-box;
 }
 #ldksq_c.on{height:37%;}
 #ldksq_c.on .choice,#ldksq_c.on .jgbox{display: none;}
 #ldksq_c.on2{height: 85%;}
 #ldksq_c.on2 #tckremark{display: none;}
 .jgbox{ height: 74%; overflow-x: hidden; overflow-y: auto; position: absolute; width: 100%;left: 0;padding: 5px 20px;
     box-sizing: border-box;}
 #ldksq_c>h2{font-size: 17px;font-weight: normal;  margin: 0; line-height: 20px;}
 .jigoubox{overflow: hidden;background: #f9f9f9;margin:12px 0;position: relative;padding:10px 15px;border-radius: 5px;}
 .jigoubox>div{margin-left: 35px;}
 .jigoubox>div>h3{font-size: 15px;line-height:30px;font-weight: normal;margin: 0;}
 #ldksq_c .jigoubox>div>p{text-align: left;margin: 0;}
 .jigoubox>input{ position: absolute;  top: 50%;   margin-top: -7.5px;z-index: 10; width: 15px; height: 15px;}
 .btns{ position: absolute;  bottom: 15px;  width: 100%;left: 0;}
.center{display:none;padding: 20px 20px 10px;box-shadow: 0px 0px 20px rgba(0,0,0,0.2);background:#fff;min-width:30%;width: 80%;height:70%;
    position: fixed;  top: 50%;  left: 50%;  transform: translate(-50%,-50%);max-height: 85%;box-sizing: border-box;}
    .tc{text-align:center;}
     #danxuan{margin:0;}
    #danxuan .tc{margin-top:20px;}
    #danxuan input[type="radio"]{  margin: 0 3px 0 10px}
      #danxuan label{width:25%;float:left;margin-bottom:7px;}
   .newperson{overflow: auto;position:absolute;height:80%;}
   .newbtn{position:absolute;bottom:15px; text-align: center;width: 100%;}
</style>

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
 <div class="userinfo">
            <div class="shjl_tit ov">
                <h2 class="fl">用户信息</h2>
                <span class="fr shjl_close">&times;</span>
            </div>
                    <iframe id="frameA" src=""></iframe>
        </div>
 <div id="ldksq_c">
    <div id="ldksq_lose"></div>
    <h2 class="choice">选择推荐机构</h2>
    <form action="productapp!operate.action" name="indexdksq" id="indexdksq" method="post">
                <input type="hidden" name="method" value="user!getTaskList1.action?querytype=1">
                <input type="hidden" name="taskid" id="taskid">
                <input type="hidden" name="pkid" id="pkid">
                 <input
                    type="hidden" name="buttonid" id="buttonid"> 
                    <p id="tckremark">
                    <span class="msgcontenttype">审核意见：</span>
                    <textarea class="duanxin" rows="4" cols="80" name="msgcontent"
                        id="msgcontent" data-rule="短信标题:required;m_remark;length[2~512]">   </textarea>
                </p>
                <p class="btns">
                    <button id="ldksq_lose2" type="reset" class="btn btn-inverse"
                        style="margin-left: 20px;"> 取消
                    </button>
                    <button type="submit" class="btn btn-success"
                        style="margin-left: 20px;">确定
                    </button>
                </p>
            </form>
 </div>
    <%--选项--%>
<div class="center"  id="chioce">
        <form action="" name="" id="danxuan" method="post">
        	<input type="hidden" id="retaskid">
        	<input type="hidden" id="reolduserid">
        	<input type="hidden" id="recreator">
            <div class="newperson">
                <p>请选择新的办理人：</p>
                <s:iterator value="#request.adminmap">
               		<label><input type="radio" name="redealuserid" value="${key }">${value }</label>
                </s:iterator>
            </div>
            <div class="newbtn">
	             <button id="centerclose" type="reset" class="btn btn-inverse"> 取消</button>
	            <button type="button" onclick="replaceUser();" class="btn btn-success">  确定</button>
            </div>
           
         </form>
    </div>

 <script>
 	function replaceUser(){
 		var redealuserid = $("input[name='redealuserid']:checked").val();
 		if (typeof (redealuserid) == "undefined") {
 			alert("请选择新的办理人！");
 			return;
		}
		$.ajax({
            type: "post",
            url:"/manage/user!replaceUser.action",
            data: {
            		taskid : $("#retaskid").val(),
            		olduserid : $("#reolduserid").val(),
            		dealuserid : "B_" + redealuserid,
            		recreator : $("#recreator").val()
            },
            dataType: "json",
            success: function(data) {
                alert(data.msg);
                parent.location.reload();
            }
        });	
 	
 	}
 	
 
 			$('body').delegate(".radio","click",function(){
 				$("#retaskid").val($(this).attr("taskid"));
 				$("#reolduserid").val($(this).attr("olduserid"));
 				$("#recreator").val($(this).attr("creator"));
 				$('#chioce').show();
 			})
 			
 			$('#centerclose').click(function(){
 				$('#chioce').hide();
 			})
 
                $('.jigoubox>input').click(function () {

                    if($(this).is(':checked')){
                        $(this).siblings('input').prop("checked",true);
                    }else{
                        $(this).siblings('input').prop("checked",false);
                    }
                })
       $('body').delegate(".oper","click",function(){
        $('#msgcontent').val($.trim($(this).children('span').text()));
        $('#taskid').val($(this).attr("taskid"));
        $('#pkid').val($(this).attr("pkid"));
        var apporpc = $(this).attr("apporpc");
        var type = $(this).attr("type");
        var buttonid = $(this).attr("buttonid");
        var userid = $(this).attr("userid");
        var taskid = $(this).attr("taskid");
        if (apporpc=="1"){
            
        $('#buttonid').val(buttonid);
        if(buttonid) {
            var type = buttonid.split("_")[2];
            if (type == "14107"){
                $('#ldksq_c').addClass("on2");
            }else {
                $('#ldksq_c').addClass("on");
            }
            $('#ldksq_c').show();
        }
        $('#ldksq').show();
        }
        if (apporpc=="2"){
            alert("请在App端操作");
        }
        if (apporpc=="3"){
            if(type=="14101"){	//审批记录
                $('.shjlTab').fadeIn(200);
                  var id=$(this).attr('instanceid');
                  $.ajax({
                      cache: true,
                      type: "POST",
                      url:"/manage/user!getWorkFlowDetail.action?id="+id,
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
            } else if (type=="14102") { //用户信息
                $('#frameA').attr("src","cust!toEditByUserid.action?userid="+userid);
                $('.userinfo').fadeIn(200);
            } else if (type=="14103") { //供应商信息
            	var title = $(this).find(".title").html();
            	var ti = eval('(' + title + ')');
            	var f_id = ti.paradetail.agencyid;
            	if (f_id == "") {
            		alert("当前无法查看供应商信息！");
            		return;
            	}
                $('#frameA').attr("src","cust!toEditByUserid.action?f_id="+f_id);
                $('.userinfo').fadeIn(200);
            } else if (type == "14108") { //终止流程
            	layer.confirm("是否终止该流程？", {title : "提示",btn : [ '确定', '取消' ]}, function(index) {
					layer.close(index);
	            	$.ajax({
			            type: "post",
			            url:"/manage/user!stopInstance.action",
			            data: {
			            		taskid : taskid,
			            		buttonid : buttonid
			            },
			            dataType: "json",
			            success: function(data) {
			                alert(data.msg);
			                parent.location.reload();
			            }
			        });
		     	});	
            } else if (type == "14107") {
            	alert("请在详细信息里继续审核！");
           		return;
            }else {
            	 $('#buttonid').val(buttonid);
                 if(buttonid) {
                     var type = buttonid.split("_")[2];
                     if (type == "14107"){
                         $('#ldksq_c').addClass("on2");
                     }else {
                         $('#ldksq_c').addClass("on");
                     }
                     $('#ldksq_c').show();
            	}
            }
        }
    });
    $("#ldksq_lose").click(function(){
        $("#ldksq_c").hide();
    });
    $("#ldksq_lose2").click(function(){
        $("#ldksq_c").hide();
    });
    $('.shjlTab .shjl_tit .shjl_close').click(function(){
        $('.shjlTab').fadeOut(200);
    })
    $('.userinfo .shjl_tit .shjl_close').click(function(){
        $('.userinfo').fadeOut(200);
    })
    $('#peixunhuodong').delegate(' tr>td .shjl','click',function(e){
        e.stopPropagation();
        $('.shjlTab').fadeIn(200);
        var id=$(this).attr('productappid');
        $.ajax({
            cache: true,
            type: "POST",
            url:"/manage/user!getWorkFlowDetail.action?id="+id,
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


            </script>
            