/**
 * @author Administrator
 */

function qiyeappinfo(){
	
    jQuery.validator.addMethod("isOCC", function(value, element) {   
	    var num = /(^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$)|(^[A-Z0-9]{18}$)/;    //手写验证组织机构代码或统一社会信用代码  用竖线表示两个条件为或（共10位）
	    //var num = /^[a-zA-Z0-9]{8}-[a-zA-Z0-9]$/;//组织机构代码
		    return this.optional(element) ||  (num.test(value));       
	    
	}, "请正确【组织机构代码】或者【统一社会信用代码】");
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

	//邮政编码验证       
	jQuery.validator.addMethod("isEmail", function(value, element) {       
	    return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/.test(value);     
	}, "请正确填写邮箱格式");
		
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
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#qiyeappinfo").validate({
    	onkeyup:false,
        	rules: {
                "qiye.qiyemingcheng": {
                    required: true,
                    maxlength:50
                },
                "qiye.chengliriqi": {
                    required: true,
                    isDate:true
                },
                "qiye.dizhi": {
                	required: true,
                	maxlength:64
                },
                "qiye.zhuceziben": {
                	required: true,
                	isNum:true,
                	maxlength:18
                },
                "qiye.faren": {
                	required: true,
                	maxlength:64
                },
                "qiye.zzjgdm": {
                	required: true,
                	isOCC:true,
                	rangelength:[10,18]
                },
                "qiye.gszcd_province": {
                    required: true
                },
                "qiye.gszcd_city": {
                	required: true
                },
                "qiye.gszcd_county": {
                    required: true
                },
                "qiye.qiyexingzhiid": {
    	        	required: true
    	        },
                "qiye.hangyeid": {
                    required: true
                },
                "qiye.suchujieduanid": {
                    required: true
                },
                "qiye.jingyingfanwei": {
                    required: true,
                	maxlength:512
                },
                "qiye.qiyejieshao": {
                    required: true,
                	maxlength:2048
                },
                "qiye.zhuyingyewu": {
                    required: true,
                	maxlength:256
                },
                "qiye.jianyingyewu": {
                    /*required: true,*/
                	maxlength:256
                },
                "qiye.qiyerenzheng": {
                    /*required: true,*/
                	maxlength:64
                },
                "qiye.yuangongshu": {
                    required: true,
                    isNum:true,
                	maxlength:7
                },
                "qiye.dazhuanrenshu": {
                    required: true,
                    isNum:true,
                	maxlength:7
                },
                "qiye.yanfarenshu": {
                    /*required: true,*/
                	isNum:true,
                	maxlength:7
                },
                "qiye.bkzglbl": {
                    /*required: true,*/
                    number:true,
                	maxlength:8
                },
                "qiye.shangshijihua": {
                    required: true
                },
                "qiye.logo": {
                   /* required: true*/
                	maxlength:256
                },
                "qiye.wangzhi": {
                    /*required: true,*/
                	maxlength:64
                },
                "qiye.xingming": {
                    required: true,
                	maxlength:18
                },
                "qiye.bumenzhiwu": {
                    required: true,
                	maxlength:25
                },
                "qiye.yidongdianhua": {
                    required: true,
                    isTel:true,
                	maxlength:25
                },
                "qiye.gudingdianhua": {
                   /* required: true,*/
                    isTel: true,
                	maxlength:25
                },
                "qiye.email": {
                    required: true,
                    isEmail: true,
                	maxlength:64
                }
            },
            messages: {
            	"qiye.qiyemingcheng": {
                    required: "请输入企业名称",
                    maxlength: "50字符以内"
                },
                "qiye.chengliriqi": {
                    required: "请输入成立日期",
                    isDate:"请正确填写日期格式"
                },
                "qiye.dizhi": {
                	required: "请输入地址",
                	maxlength:"64字符以内"
                },
                "qiye.zhuceziben": {
                	required: "请输入注册资本",
                	isNum:"注册资本请填数字,保留2位小数",
                	maxlength:"18字符以内"
                },
                "qiye.faren": {
                	required: "请输入法人姓名",
                	maxlength:"64字符以内"
                },
                "qiye.zzjgdm": {
                	required: "请输入组织机构代码",
                	isOCC:"请正确【组织机构代码】或者【统一社会信用代码】",
                	rangelength:"10到18个字符"
                },
                "qiye.gszcd_province": {
                    required: "请选择省份"
                },
                "qiye.gszcd_city": {
                	required: "请选择城市"
                },
                "qiye.gszcd_county": {
                    required: "请选择区县"
                },
                "qiye.qiyexingzhiid": {
    	        	required: "请选择企业性质"
    	        },
                "qiye.hangyeid": {
                    required: "请选择所属行业"
                },
                "qiye.suchujieduanid": {
                    required: "请选择所处阶段"
                },
                "qiye.jingyingfanwei": {
                    required: "请输入经营范围",
                	maxlength:"512字符以内"
                },
                "qiye.qiyejieshao": {
                    required: "请输入企业基本介绍",
                	maxlength:"2048字符以内"
                },
                "qiye.zhuyingyewu": {
                    required: "请输入主营业务",
                	maxlength:"256字符以内"
                },
                "qiye.jianyingyewu": {
                    /*required: "请输入兼营业务",*/
                	maxlength:"256字符以内"
                },
                "qiye.qiyerenzheng": {
                   /* required: "请输入企业认证",*/
                	maxlength:"64字符以内"
                },
                "qiye.yuangongshu": {
                    required: "请输入员工人数",
                    isNum:"员工人数请填数字",
                	maxlength:"7字符以内"
                },
                "qiye.dazhuanrenshu": {
                    /*required: "请输入大专以上人数",*/
                	isNum:"请填写数字",
                	maxlength:"7字符以内"
                },
                "qiye.yanfarenshu": {
                    required: "请输入研发人数",
                    isNum:"研发人数请填数字",
                	maxlength:"7字符以内"
                },
                "qiye.bkzglbl": {
                    /*required: "请输入本科以上占比",*/
                    number:"请填写数字",
                	maxlength:"8字符以内"
                },
                "qiye.shangshijihua": {
                    required: "请选择有无上市计划"
                },
                "qiye.logo": {
                    /*required: "请上传企业logo"*/
                	maxlength:"256字符以内"
                },
                "qiye.wangzhi": {
                    /*required: "请输入网址",*/
                	maxlength:"64字符以内"
                },
                "qiye.xingming": {
                    required: "请输入联系人姓名",
                	maxlength:"18字符以内"
                },
                "qiye.bumenzhiwu": {
                    required: "请输入职务",
                	maxlength:"25字符以内"
                },
                "qiye.yidongdianhua": {
                    required: "请输入移动电话",
                    isTel:"请正确输入",
                	maxlength:"25字符以内"
                },
                "qiye.gudingdianhua": {
                  /*  required: "请输入固定电话",*/
                    isTel: "请正确输入",
                	maxlength:"25字符以内"
                },
                "qiye.email": {
                  required: "请输入联系人邮箱",
                    isEmail: "请正确输入",
                	maxlength:"64字符以内"
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
