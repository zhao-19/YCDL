/**
 * @author Administrator
 */

function productczdcwxx(){
	jQuery.validator.addMethod("isNum", function(value, element) {       
	    var num = /^[0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");
	
	jQuery.validator.addMethod("isNumd", function(value, element) {       
	    var num = /^[\-0-9]+[.]{0,1}[0-9]{0,2}$/;    //手写验证数字保留两位小数,可以为负数
	    return this.optional(element) || (num.test(value));       
	}, "请正确填写数字");

    $("#productczdcwxx").validate({
    	 onkeyup:false,
        rules: {
            "cwxx.firstzongzichan": {
                required: true,
                isNum: true,
                maxlength:18
                },
            "cwxx.secondzongzichan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdzongzichan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cuzongzichan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.lastzongzichan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changezongzichan": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstzongfuzai": {
                required: true,
                isNum:true,
                maxlength:18
            },
            "cwxx.secondzongfuzai": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdzongfuzai": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cuzongfuzai": {
                required: true,
                maxlength:18
            },
            "cwxx.lastzongfuzai": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changezongfuzai": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstsuoyouzequanyi": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.secondsuoyouzequanyi": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.thirdsuoyouzequanyi": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.cusuoyouzequanyi": {
                required: true,
                isNumd:true,
                maxlength:18
            },
            "cwxx.lastsuoyouzequanyi": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.changesuoyouzequanyi": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            
            "cwxx.firstshishouzhiben": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.secondshishouzhiben": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdshishouzhiben": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cushishouzhiben": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.lastshishouzhiben": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changeshishouzhiben": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstyinhangjiekuan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.secondyinhangjiekuan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdyinhangjiekuan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cuyinhangjiekuan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.lastyinhangjiekuan": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changeyinhangjiekuan": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstxiaoshoushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.secondxiaoshoushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdxiaoshoushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cuxiaoshoushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.lastxiaoshoushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changexiaoshoushouru": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstzhuyinyewushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.secondzhuyinyewushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.thirdzhuyinyewushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.cuzhuyinyewushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.lastzhuyinyewushouru": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.changezhuyinyewushouru": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstlirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.secondlirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.thirdlirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.culirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.lastlirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.changelirunzonge": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstjinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.secondjinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.thirdjinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.cujinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.lastjinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.changejinglirun": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.firstniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.secondniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.thirdniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.cuniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.lastniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.changeniandunashui": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.maolilv": {
                required: true,
                isNumd: true,
                maxlength:18
            },
            "cwxx.cunhuozhouzhuanlv": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.liudongbilv": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.yingshouzhangkuanzhouzhuanlv": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.sudongbilv": {
                required: true,
                isNum: true,
                maxlength:18
            },
            "cwxx.zichanfuzhailv": {
                required: true,
                isNum: true,
                maxlength:18
            }

        },
        messages: {
            "cwxx.firstzongzichan": {
                required: "请输入",
                isNum: "请填数字,保留2位小数",
                maxlength:"18字符以内"
                },
            "cwxx.secondzongzichan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdzongzichan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuzongzichan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastzongzichan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changezongzichan": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstzongfuzai": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondzongfuzai": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdzongfuzai": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuzongfuzai": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastzongfuzai": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changezongfuzai": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstsuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondsuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdsuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cusuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastsuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changesuoyouzequanyi": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            
            "cwxx.firstshishouzhiben": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondshishouzhiben": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdshishouzhiben": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cushishouzhiben": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastshishouzhiben": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changeshishouzhiben": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstyinhangjiekuan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondyinhangjiekuan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdyinhangjiekuan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuyinhangjiekuan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastyinhangjiekuan": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changeyinhangjiekuan": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstxiaoshoushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondxiaoshoushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdxiaoshoushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuxiaoshoushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastxiaoshoushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changexiaoshoushouru": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstzhuyinyewushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondzhuyinyewushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdzhuyinyewushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuzhuyinyewushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastzhuyinyewushouru": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changezhuyinyewushouru": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstlirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondlirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdlirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.culirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastlirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changelirunzonge": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstjinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondjinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdjinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cujinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastjinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changejinglirun": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.firstniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.secondniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.thirdniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cuniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.lastniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.changeniandunashui": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.maolilv": {
            	  required: "请输入",
                  isNumd: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.cunhuozhouzhuanlv": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.liudongbilv": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.yingshouzhangkuanzhouzhuanlv": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.sudongbilv": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
                  maxlength:"18字符以内"
            },
            "cwxx.zichanfuzhailv": {
            	  required: "请输入",
                  isNum: "请填数字,保留2位小数",
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
