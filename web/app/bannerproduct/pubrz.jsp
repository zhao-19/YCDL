<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<meta name="description" content="">
<jsp:include page="/app/common/head.jsp">
    <jsp:param name="title" value="发布融资需求"/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/app/js/skin/layer.css">
<script src="${pageContext.request.contextPath}/app/js/layer.js"></script>
<script src="${pageContext.request.contextPath}/app/js/check.js"></script>
<body class="example gqrzjs pubrz">
<div class="txt">
    <div class="boxbg">
        <form action="" method="post" id="rzform" onsubmit="return checkrz(this);">
        		<div class="inputrow ov">
        				<span>选择类型</span>
        				<div class="fr leixing">
        						<label><input type="radio" name="leixing" value="股权融资" >发布股权融资</label>
        						<label><input type="radio" name="leixing" value="债权融资">发布债权融资</label>
        				</div>
        		</div>
        		<div class="inputrow ov">
        				<span>申请人姓名</span>
        				<div class="fr">
        						<input type="text" name="xingming" value="" placeholder="请输入申请人姓名" >
        				</div>
        		</div>
        		<div class="inputrow ov">
        				<span>联系电话</span>
        				<div class="fr">
        						<input type="number" name="dianhuan" value="" placeholder="请输入联系电话"  id="dianhuan">
        				</div>
        		</div>
        		<div class="inputrow ov">
        				<span>验证码</span>
        				<div class="fr">
        						<input type="number" name="msgcode" value="" placeholder="请输入验证码"  id="writecode">
        						<span id="getcode">获取</span>
        				</div>
        		</div>
        		<div class="inputrow ov jine">
        				<span>融资金额（万元）</span>
        				<div class="fr">
        						<input type="number" name="jine" value="" placeholder="请输入融资金额">
        				</div>
        		</div>
        		<div class="inputrow ov">
        				<span>企业名称</span>
        				<div class="fr">
        						<input type="text" name="studio" value="" placeholder="请输入企业名称">
        				</div>
        		</div>
        		<div class="inputrow ov">
        				<span>成立日期</span>
        				<div class="fr ">
        						 <input type="date" name=""  id="maxDate"   value="" onchange="showplace(this);">
        						<input type="text" name="chegnliriqi"  id="dateplace"  value=""  placeholder="请选择成立日期">
        				</div>
        		</div>
        		<div class="inputrow ov noborder">
        				<span>融资用途</span>
        		</div>
        		<div class="">
        				<textarea name="rongziyongtu" rows="3" cols="20"  placeholder="请输入简要的描述"></textarea>
        		</div>
        		<div class="sub">
        				<input type="submit" class="subbutton" disabled>
        		</div>

        </form>
		<div class="pubtip" id="pubtip">入驻申请发布成功！<br/><p>客户经理将在一个工作日内联系您。</p><span id="dsback" class="pubbtn">返回首页</span></div>
		<div class="pubtip" id="pubtip2">入驻申请发布失败！<br/><p><a href="javascript:location.reload();" class="pubbtn">点击重试</a></p></div>

    </div>
</div>
<script type="text/javascript">
$('.txt').css('min-height',$('body').height())
	function showplace(dateinput){
		if($('#maxDate').val()==""){
			$('#dateplace').val('');
		}else{
			$('#dateplace').val($('#maxDate').val());
		}
	}
	$('.leixing>label').click(function(){
		$(this).addClass('on').siblings('.on').removeClass('on');
	})
	$('#rzform input,#rzform textarea').change(function(){
			$('.sub>.subbutton').removeAttr("disabled");
	})


	  function isPoneAvailable(str) {
            var myreg=/^[1][3,4,5,7,8][0-9]{9}$/;
            if (!myreg.test(str)) {
                return false;
            } else {
                return true;
            }
        }
             var validCode=true;
              $("#getcode").click (function  () {
            	  if(!$(this).hasClass("gray")){
            		  var dianhuan=$('#dianhuan').val();
                	  if(dianhuan==""||isPoneAvailable(dianhuan)==false){
                          layer.msg('请输入有效联系电话')
                		  return false;
                	  }else{
                		  $.ajax({
     	     	             type: "GET",
     	     	             url: "/app/sendMsgCode.action",
     	     	             crossDomain: true,
					         xhrFields: {
					            withCredentials: true
					         },
     	     	             data:{
     	     	            	 'msgtype':'10001',
     	     	            	 'mobile':dianhuan
     	     	             },
     	     	             dataType: "json",
     	     	             success: function(data){

     	     	                 }
     	     	         });
                	 }
    	                  var time=60;
    	                  var $code=$(this);
    	                  if (validCode) {
    	                   		   validCode=false;
    		                      var t=setInterval(function  () {
    		                       time--;
    		                       $code.addClass('gray');
    		                        $code.html(time+"S");
    		                        if (time==0) {
    			                         clearInterval(t);
    			                         $code.removeClass('gray');
    			                        $code.html("重新获取");
    			                          validCode=true;
    		                         }
    	                    },1000)
                 	   }

            	  }

             })

     var dsid='123';
    $('#dsback').click(function(){//返回首页
        if (/(iPhone|iPad|iPod|iOS)/i.test(navigator.userAgent)) {
            window.webkit.messageHandlers.dsback.postMessage(dsid);
        } else {
            dsback.dsback(dsid);
        }
    });

</script>
</body>
</html>
