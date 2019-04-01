/**
 * @author Administrator
 */

function productczdjyxx(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

	  jQuery.validator.addMethod("isIdcard", function(value, element) {
          var length = value.length;
          var isIdcard = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
          return this.optional(element) || (isIdcard.test(value));
      }, "请输入正确的身份证号码");
	  jQuery.validator.addMethod("isTel", function(value, element) {
          var length = value.length;
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#productczdjyxx").validate({
    	 onkeyup:false,
        rules: {
            "zhuyaochanpin0": {
                required: true,
                maxlength:64
                },
            "zhuyaoxiaoshoushichang0": {
                required: true,
                maxlength:18
            },
            "jishuxianjinxing0": {
                required: true
            },
            "guoneishichagnzhanyoulv0": {
                isNum:true,
                maxlength:18
            },
            "sichuanshichagnzhanyoulv0": {
                isNum:true,
                maxlength:18
            },
            "shangnianduxiaoshoue0": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "zhanshourubili0": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "shichangquyu0": {
                required: true
            },
            
            "shichangquyu1": {
                required: true
            },
            "x_gongshingmingcheng0": {
                required: true,
                maxlength:64
            },
            "x_shagnminmingcheng0": {
                required: true,
                maxlength:32
            },
            "x_jine0": {
                required: true,
                isNum:true,
                maxlength:18
            }

        },
        messages: {
        	"zhuyaochanpin0": {
                required: "请输入",
                maxlength:"64字符以内"
                },
            "zhuyaoxiaoshoushichang0": {
                required: "请输入",
                maxlength:"18字符以内"
            },
            "jishuxianjinxing0": {
                required: "请选择"
            },
            "guoneishichagnzhanyoulv0": {
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "sichuanshichagnzhanyoulv0": {
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "shangnianduxiaoshoue0": {
                required: "请输入",
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "zhanshourubili0": {
                required: "请输入",
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "shichangquyu0": {
                required: "请选择"
            },
            
            "shichangquyu1": {
                required: "请选择"
            },
            "x_gongshingmingcheng0": {
                required: "请输入公司名称",
                maxlength:"64字符以内"
            },
            "x_shagnminmingcheng0": {
                required: "请输入商品名称",
                maxlength:"32字符以内"
            },
            "x_jine0": {
                required: "请输入供应额",
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
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
