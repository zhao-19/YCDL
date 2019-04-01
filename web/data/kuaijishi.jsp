<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.winpow.core.system.bean.Config" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="com.winpow.core.front.SystemManager" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>盈创动力-国内领先的科技金融服务门户网站</title>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/common.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/index.css"/>
    <link rel="stylesheet" href="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/css/equity.css"/>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/index.js"></script>
    <script src="<%=SystemManager.CONFIGS.get(Config.BANBENHAO_KEY) %>/js/tiexizhinan.js"></script>
</head>
<body>

<!-- 网站头部 -->
	<%@ include file="../header.jsp"%>


<!-- 内容部分 -->
<div class="ycdata_bgimg">
    <img src="../image/data/zcsbbanner_02.png" alt="背景图">
</div>

<div class="ycdata_info ycdata_info_inlist">
    <div class="data_info_nav widthbox">
        <div class="data_info_gzs fl">
            <li>会计师事务所</li>
        </div>
         
    </div>

</div>

<div class="ycdata_center ycdata_center_inlist" style='background:none;'>

    <div class="tx_wk">

        <div class="tx_wktwo tx_wktwo2">
            <div class="tx_titlewk">
                <div class="tx_title"><span class='first' lang='gxqzc'>全国前100名会计师事务所</span>
 <span lang='cdszc'>全省前50名会计师事务所</span>
            <!--     <span lang='scszc'>全国前100名律师事务所</span>
                   <span lang='gjbzc'>全省前50名律师事务所</span></div>
                    -->
            </div>
            <div class="tx_content">
                <div class='tx_table'>
                
                     <table class='gxqzc'>
                     
                            <tr class="first">
                <th>会计师事务所名称<span style="color:#ea5504;font-weight:normal;font-size:12px;">&nbsp;&nbsp;&nbsp;&nbsp;更新时间：2018年10月</span></th>
             
                <th>序号</th>
            </tr>
<tr><td>信永中和会计师事务所（ 特殊普通合伙） 成都分所    </td><td>1</td>        </tr>
<tr><td>四川华信（ 集团） 会计师事务所（ 特殊普通合伙）        </td><td>2</td>        </tr>
<tr><td>四川中衡安信会计师事务所有限公司      </td><td>3</td>        </tr>
<tr><td>普华永道中天会计师事务所（ 特殊普通合伙） 成都分所        </td><td>4</td>        </tr>
<tr><td>毕马威华振会计师事务所（ 特殊普通合伙） 成都分所      </td><td>5</td>        </tr>
<tr><td>立信会计事务所（ 特殊普通合伙） 四川分所     </td><td>6</td>        </tr>
<tr><td>瑞华会计师事务所（ 特殊普通合伙） 四川分所        </td><td>7</td>        </tr>
<tr><td>大信会计师事务所（ 特殊普通合伙） 四川分所      </td><td>8</td>        </tr>
<tr><td>安永华明会计师事务所（ 特殊普通合伙） 成都分所      </td><td>9</td>        </tr>
<tr><td>天健会计师事务所（ 特殊普通合伙） 四川分所        </td><td>10</td>       </tr>
<tr><td>致同会计师事务所（ 特殊普通合伙） 成都分所        </td><td>11</td>       </tr>
<tr><td>中天运会计师事务所（ 特殊普通合伙） 四川分所        </td><td>12</td>       </tr>
<tr><td>四川华强会计师事务所      </td><td>13</td>       </tr>
<tr><td>中审众环会计师事务所（ 特殊普通合伙） 四川分所        </td><td>14</td>       </tr>
<tr><td>四川启明悦华会计师事务所有限公司       </td><td>15</td>       </tr>
<tr><td>天职国际会计师事务所（ 特殊普通合伙） 成都分所      </td><td>16</td>       </tr>
<tr><td>德勤华永会计师事务所（ 特殊普通合伙） 成都分所    </td><td>17</td>       </tr>
<tr><td>中汇会计师事务所（ 特殊普通合伙） 成都分所     </td><td>18</td>       </tr>
<tr><td>泸州开元会计师事务所有限公司       </td><td>19</td>       </tr>
<tr><td>四川中天浩会计师事务所有限公司        </td><td>20</td>       </tr>
<tr><td>华普天健会计师事务所（ 特殊普通合伙） 四川分所       </td><td>21</td>       </tr>
<tr><td>大华会计师事务所（ 特殊普通合伙） 四川分所    </td><td>22</td>       </tr>
<tr><td>四川名扬正信会计师事务所有限公司        </td><td>23</td>       </tr>
<tr><td>中审亚太会计师事务所（ 特殊普通合伙） 四川分所      </td><td>24</td>       </tr>
<tr><td>四川德维会计师事务所有限责任公司      </td><td>25</td>       </tr>
<tr><td>四川德文会计师事务所有限公司    </td><td>26</td>       </tr>
<tr><td>四川华文会计师事务所有限公司    </td><td>27</td>       </tr>
<tr><td>四川亿永正勤会计师事务有限责任公司      </td><td>28</td>       </tr>
<tr><td>四川中砝会计师事务所      </td><td>29</td>       </tr>
<tr><td>亚太（ 集团） 会计师事务所（ 特殊普通合伙） 四川分所       </td><td>30</td>       </tr>
<tr><td>四川维诚会计师事务所有限公司    </td><td>31</td>       </tr>
<tr><td>四川方略会计师事务所有限责任公司        </td><td>32</td>       </tr>
<tr><td>四川中方会计师事务所有限责任公司      </td><td>33</td>       </tr>
<tr><td>四川衡立泰会计师事务所有限公司    </td><td>34</td>       </tr>
<tr><td>中兴华会计师事务所（ 特殊普通合伙） 四川分所       </td><td>35</td>       </tr>
<tr><td>四川华衡会计师事务所有限公司  </td><td>36</td>       </tr>
<tr><td>乐山正源会计师事务所有限公司     </td><td>37</td>       </tr>
<tr><td>乐山众信会计师事务所        </td><td>38</td>       </tr>
<tr><td>四川承信会计师事务所有限公司     </td><td>39</td>       </tr>
<tr><td>四川兴良信会计师事务所有限责任公司        </td><td>40</td>       </tr>
<tr><td>四川鹏程会计师事务所有限责任公司      </td><td>41</td>       </tr>
<tr><td>四川嘉汇会计师事务所有限责任公司       </td><td>42</td>       </tr>
<tr><td>四川万豪会计师事务所有限责任公司     </td><td>43</td>       </tr>
<tr><td>四川志和会计师事务所有限责任公司      </td><td>44</td>       </tr>
<tr><td>四川佳华金诚会计师事务所      </td><td>45</td>       </tr>
<tr><td>四川武达众信会计师事务所      </td><td>46</td>       </tr>
<tr><td>四川鑫鑫会计师事务所有限责任公司     </td><td>47</td>       </tr>
<tr><td>北京兴华会计师事务所（ 特殊普通合伙） 四川分所      </td><td>48</td>       </tr>
<tr><td>四川金典会计师事务所有限公司      </td><td>49</td>       </tr>
<tr><td>四川力久会计师事务所有限责任公司     </td><td>50</td>       </tr>
<tr><td>四川金达会计师事务所有限责任公司    </td><td>51</td>       </tr>
<tr><td>四川广源会计师事务所有限责任公司      </td><td>52</td>       </tr>
<tr><td>四川万友会计师事务所有限公司    </td><td>53</td>       </tr>
<tr><td>四川宏道会计师事务所有限公司      </td><td>54</td>       </tr>
<tr><td>四川银巢会计师事务所有限责任公司   </td><td>55</td>       </tr>
<tr><td>四川科达信会计师事务所有限责任公司    </td><td>56</td>       </tr>
<tr><td>四川同浩会计师事务所有限公司      </td><td>57</td>       </tr>
<tr><td>四川光星会计师事务所有限公司  </td><td>58</td>       </tr>
<tr><td>四川瑞诚润信会计师事务所有限公司     </td><td>59</td>       </tr>
<tr><td>中兴财光华会计师事务所（ 特殊普通合伙） 四川分所        </td><td>60</td>       </tr>
<tr><td>四川长信会计师事务所有限公司    </td><td>61</td>       </tr>
<tr><td>四川良建会计师事务所有限责任公司     </td><td>62</td>       </tr>
<tr><td>中审华会计师事务所（ 特殊普通合伙） 四川分所    </td><td>63</td>       </tr>
<tr><td>利安达会计师事务所四川分所      </td><td>64</td>       </tr>
<tr><td>成都川衡联合会计师事务所（ 普通合伙）    </td><td>65</td>       </tr>
<tr><td>四川汇丰会计师事务所有限责任公司      </td><td>66</td>       </tr>
<tr><td>四川天润华邦会计师事务所有限公司      </td><td>67</td>       </tr>
<tr><td>四川同方会计师事务所有限责任公司    </td><td>68</td>       </tr>
<tr><td>四川新智会计师事务所有限公司      </td><td>69</td>       </tr>
<tr><td>四川永乐会计师事务所有限责任公司      </td><td>70</td>       </tr>
<tr><td>四川钰华纳会计师事务所有限公司    </td><td>71</td>       </tr>
<tr><td>四川冠信会计师事务所有限公司      </td><td>72</td>       </tr>
<tr><td>四川蜀威会计师事务所有限公司      </td><td>73</td>       </tr>
<tr><td>四川中振会计师事务所有限责任公司      </td><td>74</td>       </tr>
<tr><td>四川天勤会计师事务所有限责任公司      </td><td>75</td>       </tr>
<tr><td>四川巨丰会计师事务所有限责任公司      </td><td>76</td>       </tr>
<tr><td>四川中天信会计师事务所有限公司    </td><td>77</td>       </tr>
<tr><td>四川中源会计师事务所有限公司    </td><td>78</td>       </tr>
<tr><td>成都中大会计师事务所有限责任公司      </td><td>79</td>       </tr>
<tr><td>四川兴诚信联合合计师事务所      </td><td>80</td>       </tr>
<tr><td>四川中和会计师事务所有限公司      </td><td>81</td>       </tr>
<tr><td>四川圣源会计师事务所有限责任公司        </td><td>82</td>       </tr>
<tr><td>四川华雄会计师事务所有限责任公司   </td><td>83</td>       </tr>
<tr><td>希格玛会计师事务所（ 特殊普通合伙） 四川分所      </td><td>84</td>       </tr>
<tr><td>四川中鑫恒德会计师事务所有限公司     </td><td>85</td>       </tr>
<tr><td>四川首义联合会计师事务所（ 普通合伙）      </td><td>86</td>       </tr>
<tr><td>四川华天君安会计师事务所有限公司      </td><td>87</td>       </tr>
<tr><td>四川天华会计师事务所有限公司    </td><td>88</td>       </tr>
<tr><td>四川中天恒会计师事务所有限公司      </td><td>89</td>       </tr>
<tr><td>四川建科会计师事务所有限公司      </td><td>90</td>       </tr>
<tr><td>四川设信会计师事务所有限公司     </td><td>91</td>       </tr>
<tr><td>四川锦程会计师事务所有限责任公司      </td><td>92</td>       </tr>
<tr><td>四川川泰会计师事务所有限公司      </td><td>93</td>       </tr>
<tr><td>四川鼎鑫宏长会计师事务所有限责任公司      </td><td>94</td>       </tr>
<tr><td>四川博达会计师事务所有限责任公司   </td><td>95</td>       </tr>
<tr><td>四川玖鼎会计师事务所有限公司     </td><td>96</td>       </tr>
<tr><td>四川中天华正会计师事务所有限责任公司      </td><td>97</td>       </tr>
<tr><td>四川佳文会计师事务所有限公司      </td><td>98</td>       </tr>
<tr><td>四川众鑫会计师事务所      </td><td>99</td>       </tr>
<tr><td>四川华腾联合会计师事务所（ 普通合伙）      </td><td>100</td>      </tr>
                    </table>
                    
                    
                </div>
                <div class='tx_table'>
                   
                     <table class="cdszc" >
            <tr class="first">
                <th>会计师事务所名称<span style="color:#ea5504;font-weight:normal;font-size:12px;">&nbsp;&nbsp;&nbsp;&nbsp;更新时间：2017年10月</span></th>
                <th>事务所类型</th>
                <th>序号</th>
            </tr>
  <tr>
    <td>信永中和会计师事务所（特殊普通合伙）成都分所</td>
    <td>大型</td>
    <td>1</td>
   </tr>
   <tr>
    <td>四川华信（集团）会计师事务所（特殊普通合伙）</td>
    <td>大型</td>
    <td>2</td>
   </tr>
   <tr>
    <td>四川中衡安信会计师事务所有限公司</td>
    <td>大型</td>
    <td>3</td>
   </tr>
   <tr>
    <td>立信会计师事务所（特殊普通合伙）四川分公司</td>
    <td>中型</td>
    <td>4</td>
   </tr>
   <tr>
    <td>瑞华会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>5</td>
   </tr>
   <tr>
    <td>安永华明会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>6</td>
   </tr>
   <tr>
    <td>四川华强会计师事务所有限公司</td>
    <td>中型</td>
    <td>7</td>
   </tr>
   <tr>
    <td class="xl78">普华永道中天会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>8</td>
   </tr>
   <tr>
    <td>大信会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>9</td>
   </tr>
   <tr>
    <td>天健会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>10</td>
   </tr>
   <tr>
    <td>天职国际会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>11</td>
   </tr>
   <tr>
    <td>四川中砝会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>12</td>
   </tr>
   <tr>
    <td>四川华文会计师事务所有限公司</td>
    <td>中型</td>
    <td>13</td>
   </tr>
   <tr>
    <td>中汇会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>14</td>
   </tr>
   <tr>
    <td class="xl78">毕马威华振会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>15</td>
   </tr>
   <tr>
    <td>四川德维会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>16</td>
   </tr>
   <tr>
    <td>中天运会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>17</td>
   </tr>
   <tr>
    <td>致同会计师事务所（特殊普通合伙）成都分所</td>
    <td>中型</td>
    <td>18</td>
   </tr>
   <tr>
    <td>四川维诚会计师事务所有限公司</td>
    <td>中型</td>
    <td>19</td>
   </tr>
   <tr>
    <td>四川衡立泰会计师事务所有限公司</td>
    <td>中型</td>
    <td>20</td>
   </tr>
   <tr>
    <td>利安达会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>21</td>
   </tr>
   <tr>
    <td>四川安必信会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>22</td>
   </tr>
   <tr>
    <td class="xl79">四川兴良信会计师事务所</td>
    <td>中型</td>
    <td>23</td>
   </tr>
   <tr>
    <td>四川启明悦华会计师事务所有限公司</td>
    <td>中型</td>
    <td>24</td>
   </tr>
   <tr>
    <td>四川德文会计师事务所有限公司</td>
    <td>中型</td>
    <td>25</td>
   </tr>
   <tr>
    <td>中兴华会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>26</td>
   </tr>
   <tr>
    <td>四川亿永正勤会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>27</td>
   </tr>
   <tr>
    <td>四川志和会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>28</td>
   </tr>
   <tr>
    <td>泸州开元会计师事务所有限公司</td>
    <td>中型</td>
    <td>29</td>
   </tr>
   <tr>
    <td>四川鑫鑫会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>30</td>
   </tr>
   <tr>
    <td>四川协合会计师事务所有限公司</td>
    <td>中型</td>
    <td>31</td>
   </tr>
   <tr>
    <td>亚太（集团）会计师事务所（特殊普通合伙)四川分所</td>
    <td>中型</td>
    <td>32</td>
   </tr>
   <tr>
    <td>成都中大会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>33</td>
   </tr>
   <tr>
    <td>四川光星会计师事务所有限公司</td>
    <td>中型</td>
    <td>34</td>
   </tr>
   <tr>
    <td>中审亚太会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>35</td>
   </tr>
   <tr>
    <td>四川名扬正信会计师事务所有限公司</td>
    <td>中型</td>
    <td>36</td>
   </tr>
   <tr>
    <td>四川鼎鑫宏长会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>37</td>
   </tr>
   <tr>
    <td>四川长信会计师事务所有限公司</td>
    <td>中型</td>
    <td>38</td>
   </tr>
   <tr>
    <td>四川建科会计师事务所有限公司</td>
    <td>中型</td>
    <td>39</td>
   </tr>
   <tr>
    <td>四川银巢会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>40</td>
   </tr>
   <tr>
    <td>四川神州会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>41</td>
   </tr>
   <tr>
    <td>四川嘉汇会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>42</td>
   </tr>
   <tr>
    <td>四川明道会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>43</td>
   </tr>
   <tr>
    <td>中准会计师事务所（特殊普通合伙）四川分所</td>
    <td>中型</td>
    <td>44</td>
   </tr>
   <tr>
    <td>四川方略会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>45</td>
   </tr>
   <tr>
    <td>四川中天恒会计师事务所有限公司</td>
    <td>中型</td>
    <td>46</td>
   </tr>
   <tr>
    <td>四川鹏程会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>47</td>
   </tr>
   <tr>
    <td>四川力久会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>48</td>
   </tr>
   <tr>
    <td>成都川衡联合会计师事务所</td>
    <td>中型</td>
    <td>49</td>
   </tr>
   <tr>
    <td>四川良建会计师事务所有限责任公司</td>
    <td>中型</td>
    <td>50</td>
   </tr>
 


        </table>
        
        
                </div>
                <!-- 
                <div class='tx_table'>
                    <table class='scszc'>
                      333
                    </table>
                </div>
                <div class='tx_table'>
                    <table class='gjbzc'>
                       444
                    </table>
                </div>
                 -->
                <input type='hidden' id='qiehuanbiaozhifu' value='gxqzc'/>
            </div>
        </div>
     </div>
</div>
</div>
<% request.setAttribute("pageSize", "1"); %>
<input type="hidden"
       value="100"
       id="gxCount">
<input type="hidden"
       value="<s:if test="#request.cdlist != null"><s:property value="#request.cdlist.size"/></s:if><s:else>0</s:else>"
       id="cdCount">
<input type="hidden"
       value="<s:if test="#request.sclist != null"><s:property value="#request.sclist.size"/></s:if><s:else>0</s:else>"
       id="scCount">
<input type="hidden"
       value="<s:if test="#request.gjlist != null"><s:property value="#request.gjlist.size"/></s:if><s:else>0</s:else>"
       id="gjCount">
<script>
    //政策切换
    //1设置没有更多内容bzf,
	var gxqzc=cdszc=scszc=gjbzc=0,qiehuanbiaozhifu;
    //2
    var tx_title_span2 = $('span', '.tx_wktwo2 .tx_title');
    var tx_content_tx_table2 = $('.tx_table', '.tx_wktwo2 .tx_content');
    tx_title_span2.eq(0).addClass('active');
    tx_content_tx_table2.eq(0).fadeIn('slow');
    tx_title_span2.click(function () {
        //alert(gxqzc+"||"+cdszc+"||"+scszc+"||"+gjbzc);
        var thisqhbzf = $(this).attr('lang');
        	if (thisqhbzf == 'gxqzc') {
	            if(!gxqzc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'cdszc') {
	        	if(!cdszc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'scszc') {
	        	if(!scszc){$("#moredata").text("加载更多").css("color","#333");};
	        }
	        if (thisqhbzf == 'gjbzc') {
	        	if(!gjbzc){$("#moredata").text("加载更多").css("color","#333");};
	        }
        
        if(!eval($(this).attr('lang'))){$("#moredata").text("加载更多").css("color","#333");}
        //alert($("#moredata").attr("name")+'&'+$("#moredata").attr("lang")+'&'+$("#moredata").attr("accesskey")+'*'+$("#moredata").attr("contextmenu"));
        
        //var pageSize = <s:property value="#pageSize"/>;
        var pageSize;
        $('#qiehuanbiaozhifu').val($(this).attr('lang'));
        $(this).addClass('active').siblings().removeClass('active');
        spanindex2 = $(this).index();
        tx_content_tx_table2.eq(spanindex2).fadeIn('slow').siblings().hide();

    });


    //点击加载更多
    $("#moredata").click(function () {
        //qiehuanbiaozhifu表明当前是属于哪个切换块
        qiehuanbiaozhifu = $('#qiehuanbiaozhifu').val();
        //page是点击加载更多时传递的页码，count是每页显示条数
        var page = '';
        if (qiehuanbiaozhifu == 'gxqzc') {
            if(gxqzc){return;}//表示该区域块没有更多数据
            page = $(this).attr("name");
        }
        if (qiehuanbiaozhifu == 'cdszc') {
        	if(cdszc){return;}
            page = $(this).attr("lang");
        }
        if (qiehuanbiaozhifu == 'scszc') {
        	if(scszc){return;}
            page = $(this).attr("accesskey");
        }
        if (qiehuanbiaozhifu == 'gjbzc') {
        	if(gjbzc){return;}
            page = $(this).attr("contextmenu");
        }
        //var pageSize = <s:property value="#pageSize"/>;
        var pageSize;
      
        $.ajax({
            url: '/interestapp/fuchizhichengLoadMore.html',
            type: 'POST',
            data: {
                'qiehuanbiaozhifu': qiehuanbiaozhifu,
                'page': page,
                'count': pageSize
            },
            dataType: "json",
            beforeSend: function () {
                $("#moredata").text("数据加载中...");
            },
            success: function (data, response, status) {
                
	            	if(data.length<1){
	      			  $("#moredata").text("没有更多内容了").css("color","#888");
	      			if (qiehuanbiaozhifu == 'gxqzc') {
	      	            gxqzc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'cdszc') {
	      	        	cdszc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'scszc') {
	      	        	scszc=1;
	      	        }
	      	        if (qiehuanbiaozhifu == 'gjbzc') {
	      	        	gjbzc=1;
	      	        }
      			    return;
      			  
      			}else{

      				if(qiehuanbiaozhifu=='gxqzc'){
      					$("#moredata").attr("name",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='cdszc'){
      				    $("#moredata").attr("lang",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='scszc'){
      				    $("#moredata").attr("accesskey",parseInt(page)+1);
      				}
      				if(qiehuanbiaozhifu=='gjbzc'){
      				    $("#moredata").attr("contextmenu",parseInt(page)+1);
      				}
      				
      				
      			    $("#moredata").text("加载更多");
      			 	var item;  
                    $.each(data, function (i, result) {
                        var date = new Date(result['lurushijian']);
                        var newdate = formatDate(date, "yyyy-MM-dd hh:mm:ss");

                        item = "<tr><td><span class='title'><a href='/interestapp!fuchizhichengDetail?e.id=" +
                                result['id'] + "'>" + result['mingcheng'] + "</a></span><br/><span class='source'>来源：" +
                                result['laiyuan'] + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间：" + newdate +
                                "</span></td></tr>";

                        $("." + qiehuanbiaozhifu).append(item);
                        //$("table[name = "+ qiehuanbiaozhifu +"]").append(item);
                    });

                }
                ;
            }
        });
    });

    //日期转换格式转换----函数
    function formatDate(date,format) {
        var o = {
            "M+" : date.getMonth()+1, //month
            "d+" : date.getDate(),    //day
            "h+" : date.getHours(),   //hour
            "m+" : date.getMinutes(), //minute
            "s+" : date.getSeconds(), //second
            "q+" : Math.floor((date.getMonth()+3)/3),  //quarter
            "S" : date.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,(date.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o) if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,
                    RegExp.$1.length==1 ? o[k] :("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    }

    //点击搜索，不带当前切换区域参数，搜索全部区域块，异步返回来的数据就加载在这个区域
    function doquery() {
        var query = $('#contentquery').val();
        var url = '/interestapp/interestlistsearch.html?count=<s:property value="#pageSize"/>&q=' + query;
        location.href = url;
    }


</script>


<script>
    menu_init("data");

</script>

<!--盈创活动end-->
<%@ include file="../footer.jsp" %>

</body>
</html>

 
