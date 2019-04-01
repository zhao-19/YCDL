/**
 * @author Administrator
 */
//动态读取验证码
function reloadImg2() {
	document.getElementById("JD_Verification1").src = "/ValidateImage.do?" + "radom="
			+ Math.random();
	$("#txyzm").focus();
}
function fbrzxq(){
	$("#err").html("");
	$("#err2").html("");
	jQuery.validator.addMethod("isDate", function(value, element) {
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));
	}, "请正确填写日期");

	  jQuery.validator.addMethod("isTel", function(value, element) {
          var length = value.length;
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");

    $("#fbrzxq").validate({
    	 onkeyup:false,
        rules: {
            "leixing": {
                required: true
                },
            "mingcheng": {
                required: true,
                rangelength:[2,50]
            },
            "xingming": {
                required: true,
                maxlength:8
            },
            "dianhuan": {
                required: true,
                isTel:true
            },
            "jine": {
                required: true,
                number: true,
                maxlength:18
            },
            "chegnliriqi": {
                required: true,
                isDate: true
            },
            "qiyeqingkuang": {
                required: true,
                maxlength:512
            },
            "rongziyongtu": {
                required: true,
                maxlength:512
            },
            "address": {
                required: true,
                maxlength:64
            },
            "txyzm": {
                required: true
            }

        },
        messages: {
        	"leixing": {
                required: "请选择要融资的类型"
                },
            "mingcheng": {
                required: "请填写企业名称",
                rangelength:"企业名称2到50字符"
            },
            "xingming": {
                required: "请填写姓名",
                maxlength:"姓名在8个字符以内"
            },
            "dianhuan": {
                required: "请填写手机号码",
                isTel:"请正确填写手机号码"
            },
            "jine": {
                required: "请填写融资金额",
                number: "融资金额请填写数字",
                maxlength:"融资金额最多18个字符"
            },
            "chegnliriqi": {
                required: "请填写成立日期",
                isDate: "请正确填写日期格式"
            },
            "qiyeqingkuang": {
                required: "请填写企业情况",
                maxlength:"企业情况最多512个字符"
            },
            "rongziyongtu": {
                required: "请填写融资用途",
                maxlength:"融资用途最多512个字符"
            },
            "address": {
                required: "请填写联系地址",
                maxlength:"联系地址最多64个字符"
            },
            "txyzm": {
                required: "请填写图形验证码"
            }

        },
        /*errorElement:"font",
        errorPlacement: function(error, element){
            error.appendTo(element.parent().find(".tipinfo"));
        },success:"valid"
        ,*/
        /*errorPlacement: function (error, element) {

        		//把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
    	       //error.appendTo($(".errorts").eq(0)); //将错误信息添加当前元素的父结点后面
    	       //$(".errorts label").eq(0).nextAll().remove();
        	$(".errorts").eq(0).append(error);
        	$(".errorts label").eq(0).nextAll().remove();

        	}
        ,*/
        errorLabelContainer:"#err",
        wrapper:"span",
        focusClass: "focus",
        showErrors:function(errorMap,errorList) {
            this.defaultShowErrors();
            $('#err span:hidden').remove();//删除所有隐藏的li标签
            $('#err span:eq(0)').nextAll().remove();//第一个li下所有跟随的同胞级li删除
        }
        ,
        submitHandler: function(form){
        	//表单提交句柄,为一回调函数，带一个参数：form
            //alert("提交表单");   return;
        	//因为此 jquery validate 引用的是1.6.4.js【是为了方便首页的digital.js数字效果】  不是1.4.2  所以在IE7中没法验证，就只有手写一个验证。


        	$("#err").html("数据提交中...").show();
            //form.submit();   //提交表单

        	 $.ajax({
                 url:'/indexapp!insert.action',
                 type:'POST',
                 data:{
                	 leixing:$(".grad input[name=leixing]:checked").val(),
                	 studio:$("#mingcheng").val(),
                	 xingming:$("#xingming").val(),
                	 dianhuan : $("#dianhuan").val(),
                	 jine : $("#jine").val(),
                	 chegnliriqi : $("#chegnliriqi").val(),
                	 qiyeqingkuang : $("#qiyeqingkuang").val(),
                	 rongziyongtu : $("#rongziyongtu").val(),
                	 address : $("#address").val(),
                	 txyzm : $("#txyzm").val(),
                     guquanfinancingtype : $("#guquanfinancingtype").val()
                 },
                 beforeSend : function () {
                 },
                 success : function (data) {

                	 	var timeId = 0;
                		var timeLeft = 4;
                		function countt(){
                			if(timeLeft<=0){
                				window.clearInterval(timeId);
                				$("#ldksq").hide();
                				return;
                			}else{
                				$("#err2").html(timeLeft+"秒后自动关闭").show();
                				//timeId = window.setInterval("countt()",1000);
                				timeLeft--;
                			}

                		}


                     if(data==1){
                         $("#err").html("发布成功").show();
                         /*setTimeout(function(){
                             $("#ldksq").hide();
                         }, 1000);*/
                         timeId = setInterval(function(){
                        	 countt();
                         }, 1000);

                         return;
                     }else if(data==-1){
                         $("#err").html("验证码错误").show();
                         /*setTimeout(function(){
                        	 $("#err").hide();
                         },2000);*/
                         /*timeId = setInterval(function(){
                        	 countt();
                         }, 1000);*/
                         $("#JD_Verification1").click();
                         return;
                     }else{
                         $("#err").html('发布失败！').show();
                         /*timeId = setInterval(function(){
                        	 countt();
                         }, 1000);*/
                         return;
                         //location.reload();
                     }

                 }});

        }
        
    });

}
