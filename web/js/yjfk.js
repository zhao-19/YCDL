/**
 * @author Administrator
 */

function yjfk(){
	//邮政编码验证       
	jQuery.validator.addMethod("isEmail", function(value, element) {       
	    return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);     
	}, "请正确填写邮箱格式");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话或传真号码");
    $("#yjfkk").validate({
    	 onkeyup:false,
	        rules: {
	            "e.feedtype": {
	                required: true
	                },
	            "e.feedcontent": {
	                required: true,
	                maxlength:512
	            },
	            "e.email": {
	                required: true,
	                isEmail: true,
	                maxlength:64
	            },
	            "e.cellphone": {
	                required: true,
	                isTel: true
	            },
	            "e.imgcode": {
	                required: true
	            }
	
		     },
	        messages: {
	        	"e.feedtype": {
	            	required: "请选择反馈类型"
	            },
		        "e.feedcontent": {
		            required: "请描述问题内容",
		            maxlength:"512字符之内"
		        },
		        "e.email": {
		            required: "请输入邮箱",
		            isEmail: "请正确输入邮箱",
		            maxlength:"最多64字符以内"
		        },
		        "e.cellphone": {
		            required: "请输入手机号",
		            isTel: "请正确输入手机号"
		        },
		        "e.imgcode": {
		            required: "请输入验证码"
		        }
	
	        },
        /*errorElement:"font",
        errorPlacement: function(error, element){
            error.appendTo(element.parent().find(".tipinfo"));
        },success:"valid"
        ,*/
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
        submitHandler: function(form){       	
        	//表单提交句柄,为一回调函数，带一个参数：form   
            //alert("提交表单");   return;
            form.submit();   //提交表单   
        }
    });

}
