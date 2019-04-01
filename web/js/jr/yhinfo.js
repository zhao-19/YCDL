function yhinfo(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    // var num = /^(\-|\+)?[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
        var num = /^(\-|\+)?[0-9]+(,*[0-9]*)*[.]{0,1}[0-9]{0,2}$/;    //验证千分位保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("NumLength", function(value, element) {       
	    return !(value < -1000000000000 || value > 1000000000000);       
	}, "字符过长");
	jQuery.validator.addMethod("isTel", function(value, element) {
        var length = value.length;
        var isTel = /^((0\d{2,3}-\d{7,8})|(1[3584]\d{9}))$/;
        return this.optional(element) || (isTel.test(value));
    }, "请输入正确的电话");
    $("#tbjryhFormInfo").validate({
    	 onkeyup:false,
        rules: {
            "tbjryh.deposit_total": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_deposit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.person_deposit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.loan_total": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_so_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_small_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.incre_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_so_incre_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_small_incre_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.obs_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.loan_deposit_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.all_loan_sum": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.current_loan_add": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.current_loan_add_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.loan_sum_city_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.add_loan_city_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.three_add_loan": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.three_loan_add_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_add_load": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.company_add_load_rate": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.cost_rate_compare": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.investment_scale": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.bond_investment_scale": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.other_investment_scale": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.business_income": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.profit": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.fixed_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.intangible_assets": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.salaries": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.added_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.income_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.other_tax": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.staff_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjryh.branche_count": {
                required: true,
                isOCC:true,
                rangelength:[1,10]
            },
            "tbjryh.loan_total_forgign": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.loan_total_shot": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.loan_total_long": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.incre_loan_forgign": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.forgign_shot": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.forgign_long": {
                required: true,
                isNum:true,
                NumLength:true
            },
            "tbjryh.contact_name": {
                required: true,
                rangelength:[1,16]
            },
            "tbjryh.contact_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjryh.leader_tele": {
                required: true,
                isTel: true,
                rangelength:[1,16]
            },
            "tbjryh.contact_duty": {
                required: true,
                rangelength:[1,16]
            },
            "tbjryh.time_port": {
                required: true
            },
            "tbjryh.org_name": {
            	required: true,
                rangelength:[1,64]
            }
        },
        messages: {
            "tbjryh.deposit_total": {
            	required: "请输入高新区内存款余额",
            	isNum:"高新区内存款余额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_deposit": {
            	required: "请输入其中：企业存款",
            	isNum:"其中：企业存款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.person_deposit": {
            	required: "请输入城乡居民储蓄存款",
            	isNum:"城乡居民储蓄存款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.loan_total": {
            	required: "请输入高新区内贷款余额",
            	isNum:"高新区内贷款余额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_so_loan": {
            	required: "请输入其中：国有企业贷款",
            	isNum:"其中：国有企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_small_loan": {
            	required: "请输入中小企业贷款",
            	isNum:"中小企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.incre_loan": {
            	required: "请输入高新区本年新增贷款",
            	isNum:"高新区本年新增贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_so_incre_loan": {
            	required: "请输入其中：国有企业贷款",
            	isNum:"其中：国有企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_small_incre_loan": {
            	required: "请输入中小企业贷款",
            	isNum:"中小企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.obs_loan": {
            	required: "请输入表外为企业提供融资额",
            	isNum:"表外为企业提供融资额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.loan_deposit_rate": {
            	required: "请输入存贷比",
            	isNum:"存贷比请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.all_loan_sum": {
            	required: "请输入总贷款余额",
            	isNum:"总贷款余额请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.current_loan_add": {
            	required: "请输入当期贷款新增",
            	isNum:"当期贷款新增请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.current_loan_add_rate": {
            	required: "请输入当期贷款增幅",
            	isNum:"当期贷款增幅请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.loan_sum_city_rate": {
            	required: "请输入高新区贷款余额在本行全市占比",
            	isNum:"高新区贷款余额在本行全市占比请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.add_loan_city_rate": {
            	required: "请输入高新区新增贷款金额在本行全市占比",
            	isNum:"高新区新增贷款金额在本行全市占比请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_add_load": {
            	required: "请输入高新区中小微企业新增贷款",
            	isNum:"高新区中小微企业新增贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.company_add_load_rate": {
            	required: "请输入高新区中小微企业贷款增幅",
            	isNum:"高新区中小微企业贷款增幅请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.cost_rate_compare": {
            	required: "请输入加权平均贷款成本与基准利率比较",
            	isNum:"加权平均贷款成本与基准利率比较请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.investment_scale": {
            	required: "请输入高新区股权投资规模",
            	isNum:"高新区股权投资规模请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.bond_investment_scale": {
            	required: "请输入高新区非信贷债权投资规模",
            	isNum:"高新区非信贷债权投资规模请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.other_investment_scale": {
            	required: "请输入高新区其他投资规模",
            	isNum:"高新区其他投资规模请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.business_income": {
            	required: "请输入营业收入",
            	isNum:"营业收入请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.profit": {
            	required: "请输入净利润",
            	isNum:"净利润请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.fixed_assets": {
            	required: "请输入固定资产折旧",
            	isNum:"固定资产折旧请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.intangible_assets": {
            	required: "请输入无形资产摊销",
            	isNum:"无形资产摊销请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.salaries": {
            	required: "请输入人员薪酬及福利",
            	isNum:"人员薪酬及福利请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.added_tax": {
            	required: "请输入增值税",
            	isNum:"增值税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.income_tax": {
            	required: "请输入所得税",
            	isNum:"所得税请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.other_tax": {
            	required: "请输入其他税金及附加",
            	isNum:"其他税金及附加请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.staff_count": {
            	required: "请输入员工数",
            	isOCC:"员工数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjryh.branche_count": {
            	required: "请输入网点数",
            	isOCC:"网点数请输入整数",
            	rangelength:"字符过长"
            },
            "tbjryh.loan_total_forgign": {
            	required: "请输入外资企业贷款",
            	isNum:"外资企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.loan_total_shot": {
            	required: "请输入中短期贷款",
            	isNum:"中短期贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.loan_total_long": {
            	required: "请输入长期贷款",
            	isNum:"长期贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.incre_loan_forgign": {
            	required: "请输入外资企业贷款",
            	isNum:"外资企业贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.forgign_shot": {
            	required: "请输入中短期贷款",
            	isNum:"中短期贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.forgign_long": {
            	required: "请输入长期贷款",
            	isNum:"长期贷款请输入数字(保留2位小数)",
            	NumLength:"字符过长"
            },
            "tbjryh.contact_name": {
            	required: "请输入填报人姓名",
            	rangelength:"字符过长"
            },
            "tbjryh.contact_tele": {
            	required: "请输入填报人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjryh.leader_tele": {
            	required: "请输入负责人手机",
            	isTel: "手机号不正确",
            	rangelength:"字符过长"
            },
            "tbjryh.contact_duty": {
            	required: "请输入填报人职务",
            	rangelength:"字符过长"
            },
            "tbjryh.time_port": {
                required: "请选择"
            },
            "tbjryh.org_name": {
            	required: "请输入机构名称",
                rangelength:"字符过长"
            }
        },
        errorPlacement: function (error, element) {
        	if (element.is(':radio') || element.is(':checkbox')) { 
        	    var eid = element.attr('name');
        	    error.appendTo(element.parent()); 
        	} else {
        		error.insertAfter(element);
        	}
        },
        submitHandler: function(form){
            nativeNum("isBankZint");//还原为数字
        	$("#tbjryhSub,#tbjryhSave").attr("disabled","disabled");
            form.submit();
        }        
    });
}