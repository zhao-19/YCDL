//判断undefined
function udf(value) {
	if (typeof(value) == "undefined") { 
		return "";
	} else {
		return value;
	}
}
// 时间戳格式化 长时间
function timeformat(timestamp) {
	if (typeof(timestamp) == "undefined") { 
		return "";
	}
    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
    var Y = date.getFullYear() + '-';
    var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
    var D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ';
    var h = (date.getHours() < 10 ? '0' + date.getHours() : date.getHours()) + ':';
    var m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) + ':';
    var s = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();
    return Y + M + D + h + m + s;
}

//时间戳格式化 短时间
function stimeformat(timestamp) {
	if (typeof(timestamp) == "undefined") { 
		return "";
	}
 var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
 var Y = date.getFullYear() + '-';
 var M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
 var D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ';
 return Y + M + D;
}