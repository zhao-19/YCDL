/**
 * @author Administrator
 */
function productczdqtxx(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
    $("#productczdqtxx").validate({
    	 onkeyup:false,
        rules: {
        	"qtxx.yanfafeiyong": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.xiaoshoufeiyong": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.yanfarenyuan": {
                required: true,
                digits:true,
                maxlength:8
                },
            "qtxx.gongsizongrenshu": {
                required: true,
                isNum:true,
                maxlength:8
                },
            "qtxx.sannianleijijiekuan": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.sannianleijiguihuan": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.zhishichanquan2_0": {
                isOCC:true,
                maxlength:3
                },
            "qtxx.zhishichanquan2_1": {
            	isOCC:true,
                maxlength:3
                },
            "qtxx.zhishichanquan2_2": {
            	isOCC:true,
                maxlength:3
                },
            "qtxx.zhishichanquan2_3": {
            	isOCC:true,
                maxlength:3
                },
                
            "qtxx.daoqichanghuanlv": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.zhuyaochanpingjieshao": {
                required: true,
                maxlength:1000
                },
            "qtxx.yanfafeiyongbili": {
                required: true,
                isNum:true,
                maxlength:18
                },
            "qtxx.yanfarenyuanbili": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "qtxx.zhishichanquan1[]": {
                required: true
            },
            "qtxx.zhishichanquan2": {
                required: true,
                isNum:true,
                maxlength:6
            },
            "qtxx.zhishichanquan3": {
                required: true,
                maxlength:1000
            },
            "qtxx.quanweirending1[]": {
                required: true
            },
            "qtxx.quanweirending2": {
                required: true,
                isNum:true,
                maxlength:6
            },
            "qtxx.quanweirending3": {
                required: false,
                maxlength:1000
            },
            "qtxx.shichangqianjing": {
                required: true,
                maxlength:2000,
                minlength:200
            },
            "qtxx.fazhanqianjing": {
                required: true,
                maxlength:2000,
                minlength:200
            },
            "qtxx.chanpinjingzhengli": {
                required: true,
                maxlength:2000,
                minlength:200
            },
            "qtxx.gaoguantuandui": {
                required: true,
                maxlength:2000,
                minlength:50
            },
            "qtxx.tuozhanqianjing": {
                required: true,
                maxlength:2000,
                minlength:200
            }

        },
        messages: {
        	"qtxx.yanfafeiyong": {
                required: "请输入研发费用",
                isNum:"研发费用请填数字",
                maxlength:"18字符以内"
                },
            "qtxx.xiaoshoufeiyong": {
                required: "请输入销售收入",
                isNum:"销售收入请填数字",
                maxlength:"18字符以内"
                },
            "qtxx.yanfarenyuan": {
                required: "请输入研发人员",
                digits:"研发人员请填整数数字",
                maxlength:"8字符以内"
                },
            "qtxx.gongsizongrenshu": {
                required: "请输入职工人数",
                isNum:"职工人数请填数字",
                maxlength:"8字符以内"
                },
            "qtxx.sannianleijijiekuan": {
                required: "请输入三年累计借款",
                isNum:"累计借款请填数字",
                maxlength:"18字符以内"
                },
            "qtxx.sannianleijiguihuan": {
                required: "请输入三年累计还款",
                isNum:"累计还款请填数字",
                maxlength:"18字符以内"
                },
            "qtxx.zhishichanquan2_0": {
            	isOCC:"请填整数数字",
                maxlength:"3字符以内"
                },
            "qtxx.zhishichanquan2_1": {
            	isOCC:"请填整数数字",
                maxlength:"3字符以内"
                },
            "qtxx.zhishichanquan2_2": {
            	isOCC:"请填整数数字",
                maxlength:"3字符以内"
                },
            "qtxx.zhishichanquan2_3": {
            	isOCC:"请填整数数字",
                maxlength:"3字符以内"
                },
            "qtxx.daoqichanghuanlv": {
                required: "请输入到期偿还率",
                isNum:"到期偿还率请填数字",
                maxlength:"18字符以内"
                },
            "qtxx.zhuyaochanpingjieshao": {
                required: "请输入产品介绍",
                maxlength:"1000字符以内"
                },
        	"qtxx.yanfafeiyongbili": {
                required: "请输入比例",
                isNum:"请填数字,保留2位小数",
                maxlength:"18字符以内"
                },
            "qtxx.yanfarenyuanbili": {
            	 required: "请输入比例",
                 isNum:"请填数字,保留2位小数",
                 maxlength:"18字符以内"
            },
            "qtxx.zhishichanquan1[]": {
                required: "请选择"
            },
            "qtxx.zhishichanquan2": {
                required: "请输入数量",
                isNum:"请填数字",
                maxlength:"6字符以内"
            },
            "qtxx.zhishichanquan3": {
                required: "请输入详情",
                maxlength:"1000字符以内"
            },
            "qtxx.quanweirending1[]": {
                required: "请选择"
            },
            "qtxx.quanweirending2": {
                required: "请输入数量",
                isNum:"请填数字",
                maxlength:"6字符以内"
            },
            "qtxx.quanweirending3": {
                required: "请输入详情",
                maxlength:"2000字符以内",
            },
            "qtxx.shichangqianjing": {
                required: "请输入描述",
                maxlength:"2000字符以内",
                minlength:"至少输入200字"
            },
            "qtxx.fazhanqianjing": {
                required: "请输入描述",
                maxlength:"2000字符以内",
                minlength:"至少输入200字"
            },
            "qtxx.chanpinjingzhengli": {
                required: "请输入描述",
                maxlength:"2000字符以内",
                minlength:"至少输入200字"
            },
            "qtxx.gaoguantuandui": {
                required: "请输入描述",
                maxlength:"2000字符以内",
                minlength:"至少输入50字"
            },
            "qtxx.tuozhanqianjing": {
                required: "请输入描述",
                maxlength:"2000字符以内",
                minlength:"至少输入200字"

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
