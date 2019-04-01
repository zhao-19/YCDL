/**
 * @author Administrator
 */

function finareportinfo(){
	jQuery.validator.addMethod("isDate", function(value, element) {       
	    var tel = /^\d{4}(\-|\/|.)\d{1,2}\1\d{1,2}$/;    //日期
	    return this.optional(element) || (tel.test(value));       
	}, "请正确填写日期");
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证正负数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
    $("#finareportinfoForm").validate({
    	onkeyup:false,
        	rules: {
                "tbfinareport.report_type": {
                    required: true,
                },
                "tbfinareport.report_time": {
                    required: true,
                    isDate:true
                },
                "tbfinareport.assets": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.liabilities": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.owner_equity": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.paicl_up": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.notallot_profit": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.bank_borrowings": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.income": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.main_income": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.should_income": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.oper_cost": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.goods_amt": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.flow_assets": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.flow_liabilities": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.total_profit": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.net_margin": {
                	required: true,
                	isNum:true
                },
                "tbfinareport.taxamt": {
                	required: true,
                	isNum:true
                }
            },
            messages: {
            	"tbfinareport.report_type": {
                    required: "请选择报表类型",
                },
                "tbfinareport.report_time": {
                    required: "请选择报表时间",
                    isDate:"报表时间格式不正确"
                },
                "tbfinareport.assets": {
                	required: "请输入总资产",
                	isNum:"总资产请填数字,最多保留2位小数",
                },
                "tbfinareport.liabilities": {
                	required: "请输入总负债",
                	isNum:"总负债请填数字,最多保留2位小数",
                },
                "tbfinareport.owner_equity": {
                	required: "请输入所有者权益",
                	isNum:"所有者权益请填数字,最多保留2位小数",
                },
                "tbfinareport.paicl_up": {
                	required: "请输入实收资本",
                	isNum:"实收资本请填数字,最多保留2位小数",
                },
                "tbfinareport.notallot_profit": {
                	required: "请输入未分配利润",
                	isNum:"未分配利润请填数字,最多保留2位小数",
                },
                "tbfinareport.bank_borrowings": {
                	required: "请输入银行借款",
                	isNum:"银行借款请填数字,最多保留2位小数",
                },
                "tbfinareport.income": {
                	required: "请输入营业收入",
                	isNum:"营业收入请填数字,最多保留2位小数",
                },
                "tbfinareport.main_income": {
                	required: "请输入其它业务收入",
                	isNum:"其它业务收入请填数字,最多保留2位小数",
                },
                "tbfinareport.should_income": {
                	required: "请输入应收账款",
                	isNum:"应收账款请填数字,最多保留2位小数",
                },
                "tbfinareport.oper_cost": {
                	required: "请输入营业成本",
                	isNum:"营业成本请填数字,最多保留2位小数",
                },
                "tbfinareport.goods_amt": {
                	required: "请输入存货",
                	isNum:"存货请填数字,最多保留2位小数",
                },
                "tbfinareport.flow_assets": {
                	required: "请输入流动资产",
                	isNum:"流动资产请填数字,最多保留2位小数",
                },
                "tbfinareport.flow_liabilities": {
                	required: "请输入流动负债",
                	isNum:"流动负债请填数字,最多保留2位小数",
                },
                "tbfinareport.total_profit": {
                	required: "请输入利润总额",
                	isNum:"利润总额请填数字,最多保留2位小数",
                },
                "tbfinareport.net_margin": {
                	required: "请输入净利润",
                	isNum:"净利润请填数字,最多保留2位小数",
                },
                "tbfinareport.taxamt": {
                	required: "请输入纳税总额",
                	isNum:"纳税总额请填数字,最多保留2位小数",
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
        	for (var i = 1; i <= 6; i ++ ) {
        		calculate(i);
        	}
            form.submit();   //提交表单   
        }
    });
    
}
