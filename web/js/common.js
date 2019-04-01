//公共
$(function () {
	function ggts(val){
        $(".ggts").html(val).fadeIn().delay(1500).fadeOut();//显示，停留，隐藏
    }
    
});


//**********--------后台银行金额“数字逗号形式”显示---------***************

//3)页面加载完成时，所有金额的数字展示又要改写成数字逗号形式
$(document).ready(function(){
	//在新添加时(t=a时)不调用排列样式,其它情况下，有值都要排列样式
	// alert(t);

	//贴息这块的后台没有添加，只有查看和修改，所以都要重新排列样式
     var t = "";
	 if((typeof(t) != "undefined")&& (t != 'a')){
		 styleNum("isBankZint");
	 }
});

function styleNum(att){
	$("["+att+"]").each(function(){
		//有值才显示样式
		if(this.value.length>0){
			this.onchange();
		}
	});
}



//1)把金额都自动以数字逗号形式填写
function formatNum(str){
	//查找字符串，如果里面有逗号了我就不验证了，直接返回true
	var strx = str;
	var hasdh = strx.indexOf(",");
	if(hasdh != -1){
		return strx;
	}else{
		
		var newStr = "";
		var count = 0;
		 
		if(str.indexOf(".")==-1){
		   for(var i=str.length-1;i>=0;i--){
		 if(count % 3 == 0 && count != 0){
		   newStr = str.charAt(i) + "," + newStr;
		 }else{
		   newStr = str.charAt(i) + newStr;
		 }
		 count++;
		   }
		   str = newStr + ".00"; //自动补小数点后两位
		   //str = newStr; //自动补小数点后两位
		   return str;
		}
		else
		{
		   for(var i = str.indexOf(".")-1;i>=0;i--){
		 if(count % 3 == 0 && count != 0){
		   newStr = str.charAt(i) + "," + newStr;
		 }else{
		   newStr = str.charAt(i) + newStr; //逐个字符相接起来
		 }
		 count++;
		   }
		   str = newStr + (str + "00").substr((str + "00").indexOf("."),3);
		   //console.log(str)
		   return str;
		 }

	}
}

//2)点击提交按钮的时候，遍历所有的金额，把金额的值又还原为纯数字
function nativeNum(att){
	$("["+att+"]").each(function(){
		$(this).val($(this).val().replace(/,/ig, ''));
	});
}
