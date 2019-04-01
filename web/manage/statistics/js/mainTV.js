$(document).ready(function() {
    //根元素字体大小
    $.fn.fontFlex = function(min, max, mid) {
        var $this = this;
        $(window).resize(function() {
            var size = (window.innerWidth / mid).toFixed(2);
            if (size < min) size = min;
            if (size > max) size = max;
            $this.css('font-size', size + 'px');
        }).trigger('resize');
    };
    $('html').fontFlex(5, 80, 70);


    // 获取当前时间 定时器每秒调用一次fnDate()
    var countDown=10;
    setInterval(function(){
        fnDate();
        if(countDown==0){
            $.fn.fullpage.moveSectionDown();
            countDown=10
        }
        countDown--;
        $('#countDown>span').html(countDown)
    },1000);

    //画流星
    init();
    for (var i=0;i<rainCount;i++) {
        var rain = new MeteorRain();
        rain.init();
        rain.draw();
        rains.push(rain);
    }
    playRains();//绘制流星

    $('#dowebok').fullpage({
//                sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE', '#f90'],
        continuousVertical: true,
        navigation: true,
        afterLoad:function(anchorLink, index){
            if(index==1){
                // loadScript("js/progressBar.js");
            }
            if(index==2){
                // $(".tabBox1").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:8});
            }
            if(index==3){
                // $(".tabBox1").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:false,vis:8});
            }

        },
        onLeave:function (index, direction) {
            if(index==1){
                $(".tabBox1").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:8});
                $(".tabBox2").slide({mainCell:".bd2 ul",autoPage:true,effect:"top",autoPlay:true,vis:8});
                countDown=10;
            }
            if(index==2){
                countDown=10;

            }
            if(index==3){
                countDown=10;
            }

        }
    });
    // setInterval(function(){
    //     $.fn.fullpage.moveSectionDown();
    // }, 10000);

});


function loadScript(url) {
    var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = url;
    script.id="progressJS"
    document.body.appendChild(script);
}

var windowWidth = $(window).width(); //当前的窗口的高度
var windowHeight = $(window).height(); //当前的窗口的高度
$('.container').width(windowWidth*0.87).height(windowHeight*0.9);
$('.border').height($('.container').height());
$(window).resize(function(){
    windowWidth = $(window).width(); //当前的窗口的高度
    windowHeight = $(window).height(); //当前的窗口的高度
    $('.container').width(windowWidth*0.87).height(windowHeight*0.9);
    $('.border').height($('.container').height()-103);

})


/**********************流星**************************/
var context;
var rains = new Array();
var rainCount =3;
//初始化画布及context
function init(){
    //获取canvas
    var stars = document.getElementById("stars");
    console.log(windowWidth);
    console.log(windowHeight);
    stars.width=windowWidth;
    stars.height=windowHeight;
    //获取context
    context = stars.getContext("2d");
}
/*流星雨开始*/
var MeteorRain = function(){
    this.x = -1;
    this.y = -1;
    this.length = -1;//长度
    this.angle = 30; //倾斜角度
    this.width = -1;//宽度
    this.height = -1;//高度
    this.speed = 1;//速度
    this.offset_x = -1;//横轴移动偏移量
    this.offset_y = -1;//纵轴移动偏移量
    this.alpha = 1; //透明度
    this.color1 = "";//流星的色彩
    this.color2 = "";  //流星的色彩

    /****************初始化函数********************/
    this.init = function () //初始化
    {
        this.getPos();
        this.alpha = 1;//透明度
        this.getRandomColor();
        //最小长度，最大长度
        var x = Math.random() * 80 + 30; //原本+150
        this.length = Math.ceil(x);
//                  x = Math.random()*10+30;
        this.angle = 30; //流星倾斜角
        x = Math.random(); //默认设置加了+0.5
        this.speed = Math.ceil(x); //流星的速度
        var cos = Math.cos(this.angle*3.14/180);
        var sin = Math.sin(this.angle*3.14/180) ;
        this.width = this.length*cos ;  //流星所占宽度
        this.height = this.length*sin ;//流星所占高度
        this.offset_x = this.speed*cos ;
        this.offset_y = this.speed*sin;
    }

    /**************获取随机颜色函数*****************/
    this.getRandomColor = function (){
        var a = Math.ceil(255-240* Math.random());
        //中段颜色
        this.color1 = "rgba("+a+","+a+","+a+",1)";
        //结束颜色
        this.color2 = "#071225";
    }


    /***************重新计算流星坐标的函数******************/
    this.countPos = function ()//
    {
        //往左下移动,x减少，y增加
        this.x = this.x - this.offset_x;
        this.y = this.y + this.offset_y;
    }

    /*****************获取随机坐标的函数*****************/
    this.getPos = function () //
    {
        //横坐标200--1200

        this.x = Math.random() * window.innerWidth; //窗口高度
        //纵坐标小于600
        this.y = Math.random() * window.innerHeight;  //窗口宽度
    }
    /****绘制流星***************************/
    this.draw = function () //绘制一个流星的函数
    {
        context.save();
        context.beginPath();
        context.lineWidth = 1; //宽度
        context.globalAlpha = this.alpha; //设置透明度
        //创建横向渐变颜色,起点坐标至终点坐标
        var line = context.createLinearGradient(this.x, this.y,
            this.x + this.width,
            this.y - this.height);



        //分段设置颜色
        line.addColorStop(0, "white");
        line.addColorStop(0.3, this.color1);
        line.addColorStop(0.6, this.color2);
        context.strokeStyle = line;
        //起点
        context.moveTo(this.x, this.y);
        //终点
        context.lineTo(this.x + this.width, this.y - this.height);
        context.closePath();
        context.stroke();
        context.restore();
    }
    this.move = function(){
        //清空流星像素
        var x = this.x+this.width-this.offset_x;
        var y = this.y-this.height;
        context.clearRect(x-3,y-3,this.offset_x+5,this.offset_y+5);
//                  context.strokeStyle="red";
//                  context.strokeRect(x,y-1,this.offset_x+1,this.offset_y+1);
        //重新计算位置，往左下移动
        this.countPos();
        //透明度增加
        this.alpha -= 0.002;
        //重绘
        this.draw();
    }

}
//绘制流星
function playRains(){

    for (var n = 0; n < rainCount; n++){
        var rain = rains[n];
        rain.move();//移动
        if(rain.y>window.innerHeight){//超出界限后重来
            context.clearRect(rain.x,rain.y-rain.height,rain.width,rain.height);
            rains[n] = new MeteorRain();
            rains[n].init();
        }
    }
    setTimeout("playRains()",2);
}

/****************获取当前时间*************************/
function fnDate(){
    var oDiv=document.getElementById("time");
    var date=new Date();
    var year=date.getFullYear();//当前年份
    var month=date.getMonth();//当前月份
    var data=date.getDate();//天
    var hours=date.getHours();//小时
    var minute=date.getMinutes();//分
    var second=date.getSeconds();//秒

    var time=year+"-"+fnW((month+1))+"-"+fnW(data)+" "+fnW(hours)+":"+fnW(minute)+":"+fnW(second);
    oDiv.innerHTML=time;
}
function fnW(str){//补位 当某个字段不是两位数时补0
    var num;
    str>=10?num=str:num="0"+str;
    return num;
}


/****************图表们*******************************/

//天府之星企业分布图

function setonlineNum(){
    $.ajax({
        type: 'post',
        url: "/userextend/onlineNum.html",
        dataType: "json",
        success: function(data) {
            $('#maxOnlineNum>span').text(data.maxOnlineNum);
            $('#peoplenum>span').html(data.onlineNum);
        }
    });
}
setonlineNum();
setInterval("setonlineNum();", 600000);


function map3(data){
    var weiboData=[data];
    var myChart4 = echarts.init(document.getElementById('area'));
    weiboData = weiboData.map(function (serieData, idx) {
        var res = [];
        for (var i = 0; i < serieData.length; i += 2) {
            var dy = serieData[i] ;
            var dx = serieData[i + 1];
            res.push([dx,dy]);
        }
        return res;
    });
    myChart4.setOption(option = {
        legend: {
            left: '2%',
            top:'5%',
            data: ['强', '中', '弱'],
            textStyle: {
                color: '#ccc'
            }
        },
        geo: {
            map: '四川',
            label: {
                emphasis: {
                    show: false
                }
            },
            itemStyle: {
                normal: {
                    areaColor: '#323c48',
                    borderColor: '#34A7E8',
                    borderWidth: 0.5
                },
                emphasis: {
                    areaColor: '#2a333d'
                }
            }
        },
        series: [{
            name: '弱',
            type: 'scatter',
            coordinateSystem: 'geo',
            symbolSize: 1.5,
            large: true,
            itemStyle: {
                normal: {
                    shadowBlur: 15,
                    shadowColor: 'rgba(255, 255, 255, 1)',
                    color: 'rgba(88, 255, 255,1)'
                }
            },
            data: weiboData[0]
        }, {
            name: '中',
            type: 'scatter',
            coordinateSystem: 'geo',
            symbolSize: 1,
            large: true,
            itemStyle: {
                normal: {
                    shadowBlur: 2,
                    shadowColor: 'rgba(14, 241, 242, 0.8)',
                    color: 'rgba(14, 241, 242, 0.8)'
                }
            },
            data: weiboData[1]
        }, {
            name: '强',
            type: 'scatter',
            coordinateSystem: 'geo',
            symbolSize: 1,
            large: true,
            itemStyle: {
                normal: {
                    shadowBlur: 2,
                    shadowColor: 'rgba(255, 255, 255, 0.8)',
                    color: 'rgba(255, 255, 255, 0.8)'
                }
            },
            data: weiboData[2]
        }]
    })
};

//企业总数
$.ajax({
    type: 'post',
    url: "/userextend/getQiyeInfo.html",
    dataType: "json",
    success: function(data) {
        $("#totalCompanyCount").html(data.count);
    }
});

//企业分布
$.ajax({
    type: 'post',
    url: "/userextend/getQiyeDistribute.html",
    dataType: "json",
    success: function(data) {
        var html = "";
        for(var key in data.citymap) {
            html += "<li><div><span>" + key + "</span><div class='progress-line'><div class='line'><div class='div' w='" + data.citymap[key] + "'></div></div></div>" + data.citymap[key] + "%</div></li>";
        }
        $("#top5City2").html(html);
        loadScript("/manage/statistics/js/progressBar.js");
        var dex = 0;
        for(var key in data.dismap) {
            $("#disLi li:eq(" + dex + ") p").html(key)
            $("#disLi li:eq(" + dex + ") div span").html(data.dismap[key] + "%")
            dex ++ ;
        }
        map3(data.locations);
    }
});


//表格

$.ajax({
    type: 'post',
    url: "/userinfo/getSubStation.html",
    dataType: "json",
    success: function(data) {
        var Rem=(windowHeight*0.55)/8
        console.log(Rem);
        var html = '';
        if(JSON.stringify(data.data.dpcount.dpcountdata) != "{}"){
            $.each(data.data.dpcount.dpcountdata,function(i,v){
                html += '<li style="height: '+Rem+'px;line-height: '+Rem+'px">' +
                    '       <ol>' +
                    '           <li>'+data.data.username[v.userid] +'</li>' +
                    '           <li>'+v.todonum +'</li>' +
                    '           <li>'+v.hastodonum +'</li>' +
                    '           <li>'+v.completenum+'</li>' +
                    '           <li>'+v.durationnum +'</li>' +
                    '       </ol>' +
                    '    </li>';
            })
        }

        $(".ulPerson").append(html);

        var html2 = '';
        if(data.data.substat.length!=0){
            $.each(data.data.substat,function(i,v){
                html2 += '<li style="height: '+Rem+'px;line-height: '+Rem+'px">' +
                    '       <ol>' +
                    '           <li>'+v.name +'</li>' +
                    '           <li>'+v.product +'</li>' +
                    '           <li>'+v.loancount +'</li>' +
                    '           <li>'+v.loanamt +'</li>' +
                    '           <li>'+v.activity+'</li>' +
                    '           <li>'+v.activityapp +'</li>' +
                    '       </ol>' +
                    '    </li>';
            })
        }

        $(".ulZhan").append(html2);

        loadScript("/manage/statistics/js/jquery.SuperSlide.js");

    }
});



