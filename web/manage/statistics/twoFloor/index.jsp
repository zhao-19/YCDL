<%@page import="com.winpow.core.PrivilegeUtil" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <title>科技金融大数据</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/twoFloor/css/common.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/manage/statistics/twoFloor/css/style.css">
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/jquery-1.8.3.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/js/loading.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/common.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/echarts.js"></script>
    <script src="<%=request.getContextPath() %>/manage/statistics/twoFloor/js/layer/layer.js"></script>
</head>
<body>
<div class="bodyBox">
    <div class="gifsBox">
        <!--bottom-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomC.gif" alt="" class="gif bottomC">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomL.gif" alt="" class="gif bottom bottomL">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottomR.gif" alt="" class="gif bottom bottomR">
        <!--bottom侧方-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottom1L.gif" alt="" class="gif bottom1 bottom1L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/bottom1R.gif" alt="" class="gif bottom1 bottom1R">
        <!--中间-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/midL.gif" alt="" class="gif mid midL">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/midR.gif" alt="" class="gif mid midR">
        <!--顶部-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top3L.gif" alt="" class="gif top3 top3L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top3R.gif" alt="" class="gif top3 top3R">

        <!--顶部侧方-->
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top1L.gif" alt="" class="gif top1 top1L">
        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/gif/top1R.gif" alt="" class="gif top1 top1R">
    </div>
    <div class="borderBox ov">
       <img src="img/title.png" alt="" class="title">
        <ul class="rectBox">
            <li class="rextTwo">
                <ol>
                    <li>
                        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/l1.png" alt="">
                        <span class="unit unitR1">单位：亿元</span>
                        <div id="l1"></div>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/l2.png" alt="">
                        <span class="unit unitR1">单位：亿元</span>
                        <div id="l2"></div>
                    </li>
                </ol>
            </li>
            <li>
                <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/l3.png" alt="">
                <span class="unit">单位：家</span>
                <div id="l3"></div>
                <div id="l33"></div>
            </li>
            <li class="rextTwo">
                <ol>
                    <li>
                        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/l4.png" alt="">
                        <div id="l4"></div>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/l5.png" alt="">
                        <div id="l5"></div>
                    </li>
                </ol>
            </li>
        </ul>
        <div class="midBox">
            <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/mapChengdu.png" alt="" class="mapChengdu">
            <div class="wave solid warning">
                <div class="circle circle1"></div>
                <div class="circle circle2"></div>
            </div>
        </div>
        <ul class="rectBox rectBoxR1">
            <li>
                <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/r1.png" alt="">
                <span class="unit">单位：万人</span>
                <div style="width: 100%;height:100%;margin-top:0;">
                    <ol>
                        <li>
                            <div id="r1"></div>
                        </li>
                        <li>
                            <div id="r12"></div>
                        </li>
                    </ol>
                </div>

            </li>
            <li>
                <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/r2.png" alt="">
                <span class="unit">单位：亿元</span>
                <div id="r2"></div>
            </li>
            <li>
                <img src="<%=request.getContextPath() %>/manage/statistics/twoFloor/img/r3.png" alt="">
                <span class="unit">单位：亿元</span>
                <div id="r3"></div>
            </li>
        </ul>
    </div>
</div>
<script>

    window.onload=function (ev) {
            // setTimeout(function(){
            //     $('.circle2').addClass('circle3')
            // },6000)

        var index;
        $('.midBox').click(function(){
            index=layer.open({
                type: 2,
                title:false,
                shadeClose: true,
                shade: 0.8,
                area: ['100%', '100%'],
                content: 'sichuanMap.jsp'
            });
        })



        var chartData;
        function getData(){
            $.ajax({
                type : "get",
                url : "<%=request.getContextPath()%>/manage/user!winpowStat.action",
                async:false,
                success : function(data) {
                    chartData=JSON.parse(data).data;
                },
                fail:function (data) {
                    console.log(data)
                }
            });
        }
        getData();
        if(chartData){
            l1(chartData[1]);
            l2(chartData[0]);
            l3(chartData[2]);
            l33(chartData[2]);
            l4(chartData[3]);
            l5(chartData[4]);
            r1(chartData[5]);
            r12(chartData[6]);
            r2(chartData[8]);
            r3(chartData[9]);
        }

        setInterval(function(){
            getData();
        },1800000);
        setInterval(function(){
            l1(chartData[1]);
        },20000)
        setInterval(function(){
            l2(chartData[0]);
        },30000)
        setInterval(function(){
            r1(chartData[5]);
        },22000)
        setInterval(function(){
            r2(chartData[8]);
        },20000)
        setInterval(function(){
            r3(chartData[9]);
        },22000)

        var  myChartL1,myChartL2,myChartR1,myChartR2,myChartR3;
        function l1(data) {
            $('#l1').height(($('#l1').parent('li').height())*0.9);
            if (myChartL1 != null && myChartL1 != "" && myChartL1 != undefined) {
                myChartL1.dispose();
            }
            myChartL1 = echarts.init(document.getElementById("l1"));
            var legendData=[],seriesData=[];
            $.each(data.thedata,function(i,v){
                var showdata=[];
                $.each(v.showdata,function(i,v){
                    if(i<9){
                        showdata.push((v*0.0001).toFixed(1))
                    }
                })
                legendData.push(v.name)
                seriesData.push({
                    name: v.name,
                    type: 'bar',
                    barWidth: '30%',
                    barGap:0,
                    data:showdata,
                    itemStyle: {
                        normal: {
                            label: {
                                show: true,
                                position: 'top',
                                textStyle: {
                                    color: '#fff',
                                    fontSize: 16
                                }
                            }
                        }}

                })
            })
            option = {
                color:['#ffc637','#33efec'],
                textStyle:{
                    color:'#fff'
                },
                legend: {
                    x:'5%',
                    y:'12%',
                    itemGap:30,
                    textStyle:{
                        color:'#fff',
                        fontSize:20
                    },
                    // icon: 'rect',
                    itemWidth:18,
                    itemHeight:18,
                    data:[
                        {
                            name:legendData[0],
                            icon:'image://img/legendCircle_B.png'
                        },
                        {
                            name:legendData[1],
                            icon:'image://img/legendCircle_Y.png'
                        }
                    ]
                },
                grid: {
                    top:'30%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'value',
                    splitNumber: 1,
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:true,
                        lineStyle: {
                            color: ['#234163'],
                            width: 1,
                            type: 'dashed'
                        }
                    },
                    boundaryGap: [0, 0.01]
                },
                xAxis: {
                    type: 'category',
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '16'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:false
                    },
                    data: data.type
                },
                series: seriesData
            };

            myChartL1.setOption(option,true);
        }

        function l2(data) {
            $('#l2').height(($('#l2').parent('li').height())*0.9);
            if (myChartL2 != null && myChartL2 != "" && myChartL2 != undefined) {
                myChartL2.dispose();
            }
            myChartL2 = echarts.init(document.getElementById("l2"));
            var legendData=[],seriesData=[],types=[];
            $.each(data.type,function(i,v){
                types.push(v.substring(0, 3))
            })
            $.each(data.thedata,function(i,v){
                var showdata=[];
                $.each(v.showdata,function(i,v){
                    showdata.push((v*0.0001).toFixed(1))
                })
                legendData.push(v.name)
                seriesData.push(
                    {
                        name: v.name,
                        type: 'bar',
                        barWidth: '40%',
                        barGap:0,
                        data:showdata,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    position: 'top',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 16
                                    }
                                }
                            }}

                    }
                )
            })

            option = {
                color:['#33efec'],
                textStyle:{
                    color:'#fff'
                },

                legend: {
                    x:'20%',
                    y:'12%',
                    textStyle:{
                        color:'#fff',
                        fontSize:20
                    },
                    icon: 'rect',
                    itemWidth:18,
                    itemHeight:18,
                    data:[
                        {
                            name:legendData[0],
                            icon:'image://img/legendCircle_B.png'
                        }
                    ]

                },
                grid: {
                    top:'30%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'value',
                    splitNumber: 2,
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:true,
                        lineStyle: {
                            color: ['#234163'],
                            width: 1,
                            type: 'dashed'
                        }
                    },
                    boundaryGap: [0, 0.01]
                },
                xAxis: {
                    type: 'category',
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '16'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:false
                    },
                    data: types
                },
                series:seriesData
            };

            myChartL2.setOption(option);
        }

        function l3(data) {

            $('#l3').height($('#l3').parent('li').height()*0.9);
            var myChart = echarts.init(document.getElementById("l3"));
            var seriesData=[];
            $.each(data.thedata[0].showdata,function(i,v){
                seriesData.push(
                    {value:v, name:''}
                )
            })
            $.each(data.type,function (i,v) {
                seriesData[i].name=v
            })

            option = {
                color:['#ffad2a','#ff64a7','#a098ff','#53d5ff','#3abaa0'],
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend:[{
                    orient: 'horizontal',
                    x : '17%',
                    y : '70%',
                    align: 'left',
                    data: [data.type[0]],
                    textStyle:{
                        fontSize: 24,
                        color:'#ffad2a'
                    },
                    icon: 'rect',
                    itemWidth:22,
                    itemHeight:22
                },
                    {
                        orient: 'horizontal',
                        x : '75%',
                        y : '70%',
                        align: 'left',
                        data: [data.type[1]],
                        textStyle:{
                            fontSize: 24,
                            color:'#ff64a7'
                        },
                        icon: 'rect',
                        itemWidth:22,
                        itemHeight:22
                    },
                    {
                        orient: 'horizontal',
                        x : '17%',
                        y : '80%',
                        align: 'left',
                        data: [data.type[2]],
                        textStyle:{
                            fontSize: 24,
                            color:'#a098ff'
                        },
                        icon: 'rect',
                        itemWidth:22,
                        itemHeight:22
                    },
                    {
                        orient: 'horizontal',
                        x : '75%',
                        y : '80%',
                        align: 'left',
                        data: [data.type[3]],
                        textStyle:{
                            fontSize: 24,
                            color:'#53d5ff'
                        },
                        icon: 'rect',
                        itemWidth:22,
                        itemHeight:22
                    }
                ],
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '60%',
                        center: ['50%', '42%'],
                        hoverAnimation:false,
                        labelLine:{
                            normal:{
                                length:30,
                                // lineStyle: {
                                //     color: "#fff"
                                // }
                            }
                        },

                        label:{
                            normal:{
                                show:true,
                                position:'left',
                                textStyle : {
                                    fontSize : 22,
                                    // color:'#fff'
                                },
                                formatter:'{c}家'
                            }
                        },
                        data:seriesData
                    }
                ]
            };

            myChart.setOption(option);
        }
        function l33(data) {

            $('#l33').height($('#l33').parent('li').height()*0.9);
            var myChart = echarts.init(document.getElementById("l33"));
            var seriesData=[];
            $.each(data.thedata[0].showdata,function(i,v){
                seriesData.push(
                    {value:v, name:''}
                )
            })
            $.each(data.type,function (i,v) {
                seriesData[i].name=v
            })

            option = {
                color:['#ffad2a','#ff64a7','#a098ff','#53d5ff','#3abaa0'],
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '60%',
                        center: ['50%', '42%'],
                        hoverAnimation:false,
                        label:{
                            normal:{
                                show:true,
                                position:'inner',
                                textStyle : {
                                    fontSize : 20
                                },
                                formatter:'{d}%'
                            }
                        },
                        data:seriesData
                    }
                ]
            };

            myChart.setOption(option);
        }

        function l4(data) {
            $('#l4').height($('#l4').parent('li').height()*0.9);
            var myChart = echarts.init(document.getElementById("l4"));
            var seriesData=[];
            $.each(data.thedata[0].showdata,function(i,v){
                seriesData.push(
                    {value:v, name:''}
                )
            })
            $.each(data.type,function (i,v) {
                seriesData[i].name=v
            })

            option = {
                color:['#ffac2a','#ff64a7','#53d5ff','#6863e6','#3abaa0','#feea62'],
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: [
                    {
                        orient: 'horizontal',
                        x : '5%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[1]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ffac2a'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '37%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[2]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ff64a7'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },

                    {
                        orient: 'horizontal',
                        x : '70%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[3]],
                        textStyle:{
                            fontSize: 20,
                            color:'#53d5ff'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    }, {
                        orient: 'horizontal',
                        x : '5%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[4]],
                        textStyle:{
                            fontSize: 20,
                            color:'#6863e6'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '37%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[5]],
                        textStyle:{
                            fontSize: 20,
                            color:'#3abaa0'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },

                    {
                        orient: 'horizontal',
                        x : '70%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[6]],
                        textStyle:{
                            fontSize: 20,
                            color:'#feea62'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },

                ],
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['0%', '53%'],
                        center: ['50%', '45%'],
                        avoidLabelOverlap: false,
                        hoverAnimation:false,
                        labelLine:{
                            normal:{
                                length:27,
                            }
                        },
                        label:{
                            normal:{
                                show:true,
                                position:'left',
                                textStyle : {
                                    fontSize : 18
                                },
                                formatter:'{d}%'
                            }
                        },
                        data:seriesData
                    }
                ]
            };
            myChart.setOption(option);
        }

        function l5(data) {
            $('#l5').height($('#l5').parent('li').height()*0.9);
            var myChart = echarts.init(document.getElementById("l5"));
            var seriesData=[];
            $.each(data.thedata[0].showdata,function(i,v){
                seriesData.push(
                    {value:v, name:''}
                )
            })
            $.each(data.type,function (i,v) {
                seriesData[i].name=v
            })
            option = {
                color:['#ffac2a','#ff64a7','#53d5ff','#6863e6','#3abaa0','#feea62'],
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                // legend: {
                //     // orient: 'vertical',
                //     x: 'center',
                //     bottom:1,
                //     textStyle:{
                //         color:'#fff',
                //         fontSize:12
                //     },
                //     icon: 'rect',
                //     itemWidth:7,
                //     itemHeight:7,
                //     data:data.type
                // },
                legend: [
                    {
                        orient: 'horizontal',
                        x : '5%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[0]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ffac2a'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '37%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[1]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ff64a7'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },

                    {
                        orient: 'horizontal',
                        x : '70%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[2]],
                        textStyle:{
                            fontSize: 20,
                            color:'#53d5ff'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    }, {
                        orient: 'horizontal',
                        x : '5%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[3]],
                        textStyle:{
                            fontSize: 20,
                            color:'#6863e6'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '37%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[4]],
                        textStyle:{
                            fontSize: 20,
                            color:'#6863e6'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },

                    {
                        orient: 'horizontal',
                        x : '70%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[5]],
                        textStyle:{
                            fontSize: 20,
                            color:'#feea62'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    }

                ],
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['0%', '53%'],
                        center: ['50%', '45%'],
                        avoidLabelOverlap: false,
                        hoverAnimation:false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine:{
                            normal:{
                                length:27,
                            }
                        },
                        label:{
                            normal:{
                                show:true,
                                position:'left',
                                textStyle : {

                                    fontSize : 18
                                },
                                formatter:'{d}%'
                            }
                        },
                        data:seriesData
                    }
                ]
            };
            myChart.setOption(option);
        }

        function r1(data) {
            $('#r1').height(($('#r1').parent('li').height())*0.9);
            if (myChartR1 != null && myChartR1 != "" && myChartR1 != undefined) {
                myChartR1.dispose();
            }
            myChartR1 = echarts.init(document.getElementById("r1"));
            var showdata=[];
            $.each(data.thedata[0].showdata,function(i,v){
                showdata.push((v*0.0001).toFixed(1))
            })
            option = {
                color:['#53d5ff','#ff64a7','#ffac2a'],
                textStyle:{
                    color:'#fff'
                },

                legend: {
                    // x:'5%',
                    y:'12%',
                    textStyle:{
                        color:'#fff',
                        fontSize:20
                    },
                    icon: 'rect',
                    itemWidth:18,
                    itemHeight:18,
                    data:[
                        {
                            name:data.tittle,
                            icon:'image://img/legendCircle_B.png'
                        }
                    ]

                },
                grid: {
                    top:'30%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'value',
                    splitNumber: 1,
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:true,
                        lineStyle: {
                            color: ['#234163'],
                            width: 1,
                            type: 'dashed'
                        }
                    },
                    boundaryGap: [0, 0.01]
                },
                xAxis: {
                    type: 'category',
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:false
                    },
                    data:data.type
                },
                series: [
                    {
                        name: data.tittle,
                        type: 'bar',
                        barWidth: '45%',
                        barGap:0,
                        data: showdata,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    position: 'top',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 18
                                    }
                                }
                            }}

                    },
                ]
            };

            myChartR1.setOption(option);
        }

        function r12(data) {
            $('#r12').height(($('#r12').parent('li').height())*0.9);
            var myChart = echarts.init(document.getElementById("r12"));
            var seriesData=[];
            $.each(data.thedata[0].showdata,function(i,v){
                seriesData.push(
                    {value:v, name:''}
                )
            })
            $.each(data.type,function (i,v) {
                seriesData[i].name=v
            })

            seriesData.push({value:null, name:'人才分类'});

            option = {
                color:['#ffac2a','#ff64a7','#53d5ff','#6863e6','#3abaa0','#feea62'],

                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c} ({d}%)"
                },
                legend: [
                    {
                        orient: 'horizontal',
                        x : '20%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[0]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ffac2a'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '65%',
                        y : '82%',
                        align: 'left',
                        data: [data.type[1]],
                        textStyle:{
                            fontSize: 20,
                            color:'#ff64a7'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '20%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[2]],
                        textStyle:{
                            fontSize: 20,
                            color:'#53d5ff'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '65%',
                        y : '90%',
                        align: 'left',
                        data: [data.type[3]],
                        textStyle:{
                            fontSize: 20,
                            color:'#6863e6'
                        },
                        icon: 'rect',
                        itemWidth:18,
                        itemHeight:18
                    },
                    {
                        orient: 'horizontal',
                        x : '40%',
                        y : '12%',
                        data: ['人才分类'],
                        textStyle:{
                            fontSize: 20,
                            color:'#fff'
                        },
                        icon:'image://img/legendCircle_Y.png',
                        itemWidth:18,
                        itemHeight:18
                    }

                ],
                series: [
                    {
                        name:'访问来源',
                        type:'pie',
                        radius: ['0%', '50%'],
                        center: ['50%', '50%'],
                        avoidLabelOverlap: false,
                        hoverAnimation:false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        label:{
                            normal:{
                                show:true,
                                position:'inner',
                                textStyle : {

                                    fontSize : 18
                                },
                                formatter:'{d}%'
                            }
                        },
                        data:seriesData
                    }
                ]
            };
            myChart.setOption(option);
        }

        function r2(data) {
            $('#r2').height(($('#r2').parent('li').height())*0.8);
            if (myChartR2 != null && myChartR2 != "" && myChartR2 != undefined) {
                myChartR2.dispose();
            }
            myChartR2 = echarts.init(document.getElementById("r2"));
            var legendData=[],seriesData=[];
            $.each(data.thedata,function(i,v){
                var showdata=[];
                $.each(v.showdata,function(i,v){
                    showdata.push((v*0.0001).toFixed(1))
                })
                legendData.push(v.name)
                seriesData.push(
                    {
                        name: v.name,
                        type: 'bar',
                        barWidth: '20%',
                        barGap:0,
                        data:showdata,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    position: 'top',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 18
                                    }
                                }
                            }}

                    }
                )
            })
            option = {
                color:['#ff64a7','#53d5ff'],
                textStyle:{
                    color:'#fff'
                },

                legend: {
                    y:'12%',
                    itemGap:50,
                    textStyle:{
                        color:'#fff',
                        fontSize:20
                    },
                    icon: 'rect',
                    itemWidth:18,
                    itemHeight:18,
                    data:legendData
                },
                grid: {
                    top:'30%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'value',
                    splitNumber: 2,
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:true,
                        lineStyle: {
                            color: ['#234163'],
                            width: 1,
                            type: 'dashed'
                        }
                    },
                    boundaryGap: [0, 0.01]
                },
                xAxis: {
                    type: 'category',
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }
                    },
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize: '20'
                        }
                    },
                    axisTick:{
                        show:false
                    },

                    splitLine:{
                        show:false
                    },
                    data: data.type
                },
                series: seriesData
            };

            myChartR2.setOption(option);
        }

        function r3(data) {
            $('#r3').height(($('#r3').parent('li').height())*0.8);
            if (myChartR3 != null && myChartR3 != "" && myChartR3 != undefined) {
                myChartR3.dispose();
            }
            myChartR3 = echarts.init(document.getElementById("r3"));
            var legendData=[],seriesData=[];
            $.each(data.thedata,function(i,v){
                var showdata=[];
                $.each(v.showdata,function(i,v){
                    showdata.push((v*0.0001).toFixed(1))
                })
                legendData.push(v.name)
                seriesData.push(
                    {
                        name: v.name,
                        type: 'bar',
                        barWidth: '40%',
                        barGap:0,
                        data:showdata,
                        itemStyle: {
                            normal: {
                                label: {
                                    show: true,
                                    position: 'top',
                                    textStyle: {
                                        color: '#fff',
                                        fontSize: 20
                                    }
                                }
                            }}

                    }
                )
            })

            option = {
                color:['#6289f6'],
                textStyle:{
                    color:'#fff'
                },

                // legend: {
                //     textStyle:{
                //         color:'#fff',
                //         fontSize:12
                //     },
                //     icon: 'rect',
                //     itemWidth:7,
                //     itemHeight:7,
                //     data: '纳税贡献'
                // },
                grid: {
                    top:'25%',
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                yAxis: {
                    type: 'value',
                    splitNumber: 2,
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'

                        }},
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize:'20'
                        }
                    },
                    splitLine:{
                        show:true,
                        lineStyle: {
                            color: ['#234163'],
                            width: 1,
                            type: 'dashed'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    boundaryGap: [0, 0.01]
                },
                xAxis: {
                    type: 'category',
                    axisLine: {
                        lineStyle: {
                            color: '#96c8f2'
                        }},
                    axisLabel: {
                        show: true,
                        textStyle: {
                            color: '#96c8f2',
                            fontSize:'20'
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:false
                    },
                    data: data.type
                },
                series:seriesData
            };

            myChartR3.setOption(option);
        }
    }
</script>
</body>
</html>