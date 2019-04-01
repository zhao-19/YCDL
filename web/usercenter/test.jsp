<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.winpow.services.manage.activities.bean.Activities"%>
<%@page import="com.winpow.core.util.StringUtil"%>
<!DOCTYPE html>
<html> <head>
    <title>上传文件</title>
  </head>
  <body>
    enctype="multipart/form-data:指定对上传表单项进行URL编码
    <form action="/manage/upload.action" method="post" enctype="multipart/form-data">
    	<table align="center" border="1">
    			<caption><h2>上传</h2></caption>
    			<tr>
    				<td>username：</td>
    				<td><input type="text" name="username"/></td>
    			</tr>
    			<tr>
    				<td>dir：</td>
    				<td><input type="text" name="dir" value="image"/></td>
    			</tr>
    			<tr>
    				<td>上传文件：</td>
    				<td><input type="file" name="upload"/></td>
    			</tr>
    			<tr align="center">
    				<td colspan="2"><input type="submit" value="上传"/></td>
    			</tr>
    	</table>
    </form>
  <br/>
     
    <form action="/goodaaa.action" method="post" enctype="multipart/form-data">
<input type="file" name="file" title="选择上传的文件"/>
 <input type="submit" value="上传"/> 
</form>
    
  </body>
</html>
 