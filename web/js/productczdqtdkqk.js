/**
 * @author Administrator
 */
function productczdqtdkqk(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	  jQuery.validator.addMethod("isTel", function(value, element) {
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#productczdqtdkqk").validate({
    	 onkeyup:false,
        rules: {
            "zhaiquanyinhang0": {
                required: true,
                maxlength:18
                },
            "daikuanyue0": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "daikuanfangshi0": {
                required: true,
                maxlength:18
            },
            "jiekuanriqi0": {
                required: true,
                isDate:true
            },
            "daoqiriqi0": {
                required: true,
                isDate:true
            }

        },
        messages: {
        	"zhaiquanyinhang0": {
                required: "请输入贷款银行",
                maxlength:"18字符以内"
                },
            "daikuanyue0": {
                required: "请输入贷款金额",
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "daikuanfangshi0": {
                required: "请输入贷款方式",
                maxlength:"18字符以内"
            },
            "jiekuanriqi0": {
                required: "请输入借款日期",
                isDate:"请正确输入"
            },
            "daoqiriqi0": {
            	required: "请输入还款日期",
                isDate:"请正确输入"
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
