/**
 * @author Administrator
 */

function productczdgdandbzqk(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

    $("#productczdgdandbzqk").validate({
    	 onkeyup:false,
        rules: {
        	"gudongmingcheng0": {
                required: true,
                maxlength:64
            },
            "chuzijine0": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "zhanbi0": {
                required: true,
                number:true,
                maxlength:18
            },
            "xingming0": {
                required: true,
                maxlength:16
                },
            "zhiwu0": {
                required: true,
                maxlength:8
            },
            "bzqkList[0].nianling": {
                required: true,
                isOCC:true,
                maxlength:7
            },
            "xueli0": {
                required: true,
                maxlength:8
            },
            "zhicheng0": {
                required: false,
                maxlength:8
            },
            "xingming1": {
                required: true,
                maxlength:16
                },
            "zhiwu1": {
                required: true,
                maxlength:8
            },
            "bzqkList[1].nianling": {
                required: true,
                isOCC:true,
                maxlength:7
            },
            "xueli1": {
                required: true,
                maxlength:8
            },
            "zhicheng1": {
                required: false,
                maxlength:8
            },
            "xingming2": {
                required: true,
                maxlength:16
                },
            "zhiwu2": {
                required: true,
                maxlength:8
            },
            "bzqkList[2].nianling": {
                required: true,
                isOCC:true,
                maxlength:7
            },
            "xueli2": {
                required: true,
                maxlength:8
            },
            "zhicheng2": {
                required: false,
                maxlength:8
            },
            "xingming3": {
                required: true,
                maxlength:16
                },
            "zhiwu3": {
                required: true,
                maxlength:8
            },
            "bzqkList[3].nianling": {
                required: true,
                isOCC:true,
                maxlength:7
            },
            "xueli3": {
                required: true,
                maxlength:8
            },
            "zhicheng3": {
                required: false,
                maxlength:8
            }

        },
        messages: {
        	"gudongmingcheng0": {
                required: "请输入股东名称",
                maxlength:"64字符以内"
            },
            "chuzijine0": {
                required: "请输入出资金额",
                isNum:"出资金额请填数字,保留2位小数",
                maxlength:"18字符以内"
            },
            "zhanbi0": {
                required: "请输入占比",
                number:"占比请输入数字",
                maxlength:"18字符以内"
            },
            "xingming0": {
                required: "请输入",
                maxlength:"16字符以内"
                },
            "zhiwu0": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "bzqkList[0].nianling": {
                required: "请输入",
                isOCC:"请输入数字",
                maxlength:"7字符以内"
            },
            "xueli0": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "zhicheng0": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "xingming1": {
                required: "请输入",
                maxlength:"16字符以内"
                },
            "zhiwu1": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "bzqkList[1].nianling": {
                required: "请输入",
                isOCC:"请输入数字",
                maxlength:"7字符以内"
            },
            "xueli1": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "zhicheng1": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "xingming2": {
                required: "请输入",
                maxlength:"16字符以内"
                },
            "zhiwu2": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "bzqkList[2].nianling": {
                required: "请输入",
                isOCC:"请输入数字",
                maxlength:"7字符以内"
            },
            "xueli2": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "zhicheng2": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "xingming3": {
                required: "请输入",
                maxlength:"16字符以内"
                },
            "zhiwu3": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "bzqkList[3].nianling": {
                required: "请输入",
                isOCC:"请输入数字",
                maxlength:"7字符以内"
            },
            "xueli3": {
                required: "请输入",
                maxlength:"8字符以内"
            },
            "zhicheng3": {
                required: "请输入",
                maxlength:"8字符以内"
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
        	       //var eid = element.attr('name');
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
