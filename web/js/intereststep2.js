/**
 * @author Administrator
 */
function intereststep2(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	
	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	
	  jQuery.validator.addMethod("isIdcard", function(value, element) {
          var length = value.length;
          var isIdcard = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
          return this.optional(element) || (isIdcard.test(value));
      }, "请输入正确的身份证号码");
	  jQuery.validator.addMethod("isTel", function(value, element) {
          var length = value.length;
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#intereststep2").validate({
    	onkeyup:false,
    	rules: {
            "e.zhuyingyewu": {
                required: true,
                maxlength:512
            },
            "e.sscy": {
                required: true
            },
            "e.qylx": {
            	required: true
            },
            "e.tjgxszd": {
            	required: true,
            	maxlength:8
            },
            "e.gsjngxszd": {
            	//required: true,
                maxlength:8
            },
            "e.dsjngxszd": {
                //required: true,
                maxlength:8
            },
            "e.yhxydj": {
            	required: true,
                maxlength:4
            },
            "e.zcze": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "e.fzze": {
	        	required: true,
	        	isNum:true,
	        	maxlength:18
	        },
            "e.ckchze": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.cpsczyl": {
                required: true,
                number:true,
                maxlength:8
            },
            "e.thirdsell": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.thirdinte": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.thirdtax": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.secondsell": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.secondinte": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.secondtax": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.firstsell": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.firstinte": {
                required: true,
                number:true,
	        	maxlength:18
            },
            "e.firsttax": {
                required: true,
                number:true,
	        	maxlength:18
            }
        },
        messages: {
        	"e.zhuyingyewu": {
	            required: "请输入主营业务",
	            maxlength:"512字符以内"
	        },
	        "e.sscy": {
	            required: "请选择所属产业"
	        },
	        "e.qylx": {
	        	required: "请选择企业类型"
	        },
	        "e.tjgxszd": {
	        	required: "请输入统计关系所在地",
	        	maxlength:"8字符以内"
	        },
	        "e.gsjngxszd": {
	        	//required: "请输入国税缴纳关系所在地",
	            maxlength:"8字符以内"
	        },
	        "e.dsjngxszd": {
	            //required: "请输入地税缴纳关系所在地",
	            maxlength:"8字符以内"
	        },
	        "e.yhxydj": {
	        	required: "请输入银行信用等级",
	            maxlength:"4字符以内"
	        },
	        "e.zcze": {
	            required: "请输入资产总额",
	            isNum:"请填数字,可保留2位小数",
	            maxlength:"18字符以内"
	        },
	        "e.fzze": {
	        	required: "请输入负债总额",
	        	isNum:"请填数字,可保留2位小数",
	        	maxlength:"18字符以内"
	        },
	        "e.ckchze": {
	            required: "请输入出口创汇总额",
	            number:"出口创汇总额请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.cpsczyl": {
	            required: "请输入产品市场占有率",
	            number:"市场占有率请填数字",
	            maxlength:"8个字符以内"
	        },
	        "e.thirdsell": {
	            required: "请输入前年销售总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.thirdinte": {
	            required: "请输入前年利润总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.thirdtax": {
	            required: "请输入前年税收总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.secondsell": {
	            required: "请输入去年销售总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.secondinte": {
	            required:  "请输入去年利润总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.secondtax": {
	            required: "请输入去年税收总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.firstsell": {
	            required: "预计今年的销售总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.firstinte": {
	            required:  "预计今年的利润总额",
	            number:"请填数字",
	        	maxlength:"18字符以内"
	        },
	        "e.firsttax": {
	            required: "预计今年的税收总额",
	            number:"请填数字",
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
    	       error.appendTo(element.parent()); 
    	       $("#gszcdspan lable.eq(0)").nextAll().remove();
    	       //将错误信息添加当前元素的父结点后面
    	     }
        	else if (element.is('select[class*=ssx]')) { 
        		//把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
    	       error.appendTo(element.parent()); //将错误信息添加当前元素的父结点后面
    	       $("#gszcdspan label").eq(0).nextAll().remove();
    	     }
        	else{
        	       error.insertAfter(element);
        	       //element.html(error); 
    	     }
        	
    	},
        submitHandler: function(form){       	
        	//表单提交句柄,为一回调函数，带一个参数：form   
            //alert("提交表单");   return;
            form.submit();   //提交表单   
        }
    });
    
}
