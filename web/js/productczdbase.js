/**
 * @author Administrator
 */

function productczdbase(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	jQuery.validator.addMethod("isOCC", function(value, element) {       
	    var num = /^[0-9]*$/;    //手写验证整数数字和0
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
          var isTel = /^((0\d{2,3}-\d{7,8})|(1[35847]\d{9}))$/;
          return this.optional(element) || (isTel.test(value));
      }, "请输入正确的电话或传真号码");
    $("#productczdbase").validate({
    	onkeyup:false,
        rules: {
            "userid": {
                required: true,
                maxlength:32
                },
            "username": {
                required: true,
                maxlength:64
            },
            "qiyemingcheng": {
                required: true,
                maxlength:64
            },
            "chengliriqi": {
                required: true,
                isDate:true
            },
            "gszcd": {
                required: true
            },
            "bgdz": {
                required: true,
                rangelength:[2,64]
            },
            "zhuceziben": {
                required: true,
                isNum:true,
                maxlength:7
            },
            "scdz": {
                required: true,
                maxlength:64
            },
            "faren": {
                required: true,
                maxlength:8
            },
            "sfzhm": {
                required: true,
                isIdcard:true,
                maxlength:32
            },
            "lianxiren": {
                required: true,
                maxlength:8
            },
            "zhiwu": {
                required: true,
                rangelength:[2,8]
            },
            "dianhua": {
                required: true,
                isTel: true,
                maxlength:16
            },
            "dianzhiyoujian": {
                required: true,
                email: true
            },
            "kehuleixing": {
                required: true
            },
            "daikuanpingz": {
                required: true,
                maxlength:16
            },
            "yewulaiyuan": {
                required: true
            },
            "zhuyingyewu": {
                required: true,
                maxlength:256
            },
            
            "jianyingywu": {
                required: false,
                maxlength:256
            },
            "zhuyingchanpin": {
                required: true,
                maxlength:32
            },
            "jianyingchanpin": {
               //required: true,
                maxlength:32
            },
            "zhizhizhegnshu": {
                required: true,
                maxlength:1024
            },
            "zhuanliqingkuang": {
                required: true,
                maxlength:64
            },
            "hangyeguishu": {
                required: true
            },
            "qiyexingzhi": {
                required: true
            },
            "yuangongshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "jishurenyuanshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "shuoshirenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "guanliyuanrenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "dazhuanrenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "benkerenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "zhonggaojirenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "benkeyishangrenshu": {
                required: true,
                number: true,
                maxlength:7
            },
            "shenqingjine": {
                required: true,
                isOCC: true,
                maxlength:5
            },
            "daikuanqixian": {
                required: true,
                number: true,
                maxlength:7
            },
            "daikuanyinhang": {
                required: true,
                maxlength:32
            },
            "danbaogongsi": {
                required: true,
                maxlength:32
            },
            "daikuanyongtu": {
                required: true,
                rangelength:[10,100],
                maxlength:123
            },
            "xiangmuqingkuang": {
                required: false,
                maxlength:512
            },
            "huankuanlaiyuan": {
                required: true,
                maxlength:123
            }

        },
        messages: {
            "userid": {
                required: "请输入申请人名字",
                maxlength: "32字符以内"
                },
            "username": {
                required: "请输入申请人名字",
                maxlength: "64字符以内"
            },
            "qiyemingcheng": {
                required: "请输入企业名称",
                maxlength: "64字符以内"
            },
            "chengliriqi": {
                required: "请输入成立时间",
                isDate:"请输入正确的日期格式"
            },
            "gszcd": {
                required: "请输入注册地"
            }, 
            "gszcd_province": {
                required: "请输入省份"
            }, 
            "gszcd_city": {
                required: "请输入城市"
            },
            "gszcd_county": {
                required: "请输入区县"
            },
            "bgdz": {
                required: "请输入办公地址",
                rangelength: "2到64字符以内"
            },
            "zhuceziben": {
                required: "请输入注册资本",
                isNum:"注册资本请填数字,保留2位小数",
                maxlength: "7字符以内"
            },
            "scdz": {
                required: "请输入生产地址",
                maxlength: "64字符以内"
            },
            "faren": {
                required: "请输入法人代表",
                maxlength: "8字符以内"
            },
            "sfzhm": {
                required: "请输入身份证号",
                isIdcard:"请输入正确的身份证号码",
                maxlength: "32字符以内"
            },
            "lianxiren": {
                required: "请输入联系人",
                maxlength: "8字符以内"
            },
            "zhiwu": {
                required: "请输入职务",
                rangelength: "2到8字符以内"
            },
            "dianhua": {
                required: "请输入电话或传真",
                isTel:"请输入正确的电话或传真",
                maxlength: "16字符以内"
            },
            "dianzhiyoujian": {
                required: "请输入邮箱号码",
                email: "请输入正确的邮箱号码"
            },
            "kehuleixing": {
                required: "请选择客户类型"
            },
            "daikuanpingz": {
                required: "请输入申请品种",
                maxlength: "32字符以内"
            },
            "yewulaiyuan": {
                required: "请选择业务来源"
            },
            "zhuyingyewu": {
                required: "请输入主营业务",
                maxlength: "256字符以内"
            },
            
            "jianyingywu": {
                required: "请输入兼营业务",
                maxlength: "256字符以内"
            },
            "zhuyingchanpin": {
                required: "请输入主营产品",
                maxlength: "32字符以内"
            },
            "jianyingchanpin": {
               // required: "请输入兼营产品",
                maxlength: "32字符以内"
            },
            "zhizhizhegnshu": {
                required: "请输入相关资质证书",
                maxlength: "32字符以内"
            },
            "zhuanliqingkuang": {
                required: "请输入专利状况",
                maxlength: "64字符以内"
            },
            "hangyeguishu": {
                required: "请选择行业归属"
            },
            "qiyexingzhi": {
                required: "请选择企业性质"
            },
            "yuangongshu": {
                required: "请输入员工人数",
                number: "员工人数请填数字",
                maxlength: "7字符以内"
            },
            "jishurenyuanshu": {
                required: "请输入技术开发人员总数",
                number: "技术开发人员总数请填数字",
                maxlength: "7字符以内"
            },
            "shuoshirenshu": {
                required: "请输入硕士及以上人数",
                number: "硕士及以上人数请填数字",
                maxlength: "7字符以内"
            },
            "guanliyuanrenshu": {
                required: "请输入管理人员人数",
                number: "管理人员人数请填数字",
                maxlength: "7字符以内"
            },
            "dazhuanrenshu": {
                required: "请输入大专以上人数",
                number: "大专以上人数请填写数子",
                maxlength: "7字符以内"
            },
            "benkerenshu": {
                required: "请输入其中本科学历人数",
                number: "其中本科学历人数请填写数子",
                maxlength: "7字符以内"
            },
            "zhonggaojirenshu": {
                required: "请输入中高级技术职称人数",
                number: "中高级技术职称人数请填数字"
            },
            "benkeyishangrenshu": {
                required:  "请输入本科以上人数",
                number:  "本科以上人数前填写数字",
                maxlength: "7字符以内"
            },
            "shenqingjine": {
                required:  "请输入申请贷款额度",
                isOCC:  "申请贷款额度请填写整数",
                maxlength: "5字符以内"
            },
            "daikuanqixian": {
                required: "请输入申请贷款期限",
                number: "申请贷款额度请填数字,保留2位小数",
                maxlength: "7字符以内"
            },
            "daikuanyinhang": {
                required: "请输入贷款银行",
                maxlength: "32字符以内"
            },
            "danbaogongsi": {
                required: "请输入担保公司",
                maxlength: "32字符以内"
            },
            "daikuanyongtu": {
                required: "请输入贷款用途",
                rangelength:"贷款用途说明在10-100字之间",
                maxlength: "123字符以内"
            },
            "xiangmuqingkuang": {
                required: "请输入与贷款用途相关的项目情况",
                maxlength: "512字符以内"
            },
            "huankuanlaiyuan": {
                required: "请输入还款期限及还款来源",
                maxlength: "123字符以内"
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
        	     }else if (element.is('select[class*=ssx]')) { 
             		//把联动选择的提示只提示一个（思路：错误都一次放入容器最后，每次放入时，把第一个错误之后的错误节点删除）
          	       error.appendTo(element.parent()); //将错误信息添加当前元素的父结点后面
          	       $("#gszcdspan label").eq(0).nextAll().remove();
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
    
    $("#daikuanyongtu").click(function(){
    	if($(this).val() == "10到100字") $(this).val("");
	    if($(this).val() == "") $(this).val("10到100字");
    });
   


}
