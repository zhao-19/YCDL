<%@page import="com.winpow.core.front.SystemManager"%>
<%@page import="com.alibaba.fastjson.JSONObject"%>
<%@page import="org.slf4j.Logger"%>
<%@page import="org.slf4j.LoggerFactory"%>
<%@page import="com.winpow.core.util.ImageUtils"%>
<%@page import="com.winpow.core.oss.OSSObjectSample"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.winpow.services.front.systemSetting.bean.SystemSetting"%>
<%@page import="com.winpow.core.ManageContainer"%>
<%@ page import="java.util.*,java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>

<%@ page import="java.awt.Image" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="com.winpow.core.system.bean.User" %>
<%@ page import="com.winpow.core.ManageContainer" %>
<%@ page import="com.winpow.services.manage.picture.bean.Picture" %>
<%@ page import="com.winpow.core.util.BeanContext"%>
<%@ page import="com.winpow.services.manage.picture.PictureService"%>

<%-- <%@ page import="org.json.simple.*" %> --%>
<%

/**
 * KindEditor JSP
 * 
 * 本JSP程序是演示程序，建议不要直接在实际项目中使用。
 * 如果您确定直接使用本程序，使用之前请仔细确认相关安全设置。
 * 
 */
Logger logger = LoggerFactory.getLogger(OSSObjectSample.class);
logger.error("upload_json.jsp>>>>>");
SystemSetting systemSetting = SystemManager.systemSetting;
//文件保存目录路径
String savePath = pageContext.getServletContext().getRealPath("/") + "attached/";
//String savePath = "D:\\workspace\\myshop\\web\\attached\\";//pageContext.getServletContext().getRealPath("/") + "attached/";
System.out.println(pageContext.getServletContext().getRealPath("/")+"attached/");
//文件保存目录URL
//String saveUrl  = systemSetting.getImageRootPath()+"/attached/";//request.getContextPath() + "/attached/";
String saveUrl  = systemSetting.getImagerootpath() +"/attached/";

//定义允许上传的文件扩展名
HashMap<String, String> extMap = new HashMap<String, String>();
extMap.put("image", "gif,jpg,jpeg,png,bmp");
extMap.put("flash", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
extMap.put("file", "pdf,doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");


//修改文件目录后的
extMap.put("uploadfile", "pdf,doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
extMap.put("uploadimg", "gif,jpg,jpeg,png,bmp");

//最大文件大小
long maxSize = 50*1024*1024;

session.setAttribute("ajax_upload", 1);
response.setContentType("text/html; charset=UTF-8");
if(!ServletFileUpload.isMultipartContent(request)){
	out.println(getError("请选择文件。"));
	return;
}
//检查目录
File uploadDir = new File(savePath);
if(!uploadDir.isDirectory()){
	out.println(getError("上传目录不存在。"));
	return;
}
//检查目录写权限
if(!uploadDir.canWrite()){
	out.println(getError("上传目录没有写权限。"));
	return;
}

String dirName = request.getParameter("dir");
if (dirName == null) {
	dirName = "image";
}

if(!extMap.containsKey(dirName)){
	out.println(getError("目录名不正确。"));
	return;
}

//如果是file则文件存放在uploadfile ，如果是image ，则存放在 uploadimg
if(dirName.equals("file")){
	dirName = "uploadfile" ;
}else {
	dirName = "uploadimg" ;
	maxSize = 2*1024*1024;
}
  
//创建文件夹
savePath += dirName + "/";
saveUrl += dirName + "/";
File saveDirFile = new File(savePath);
if (!saveDirFile.exists()) {
	saveDirFile.mkdirs();
}

File dirFile = new File(savePath);
if (!dirFile.exists()) {
	dirFile.mkdirs();
}

FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
upload.setHeaderEncoding("UTF-8");
List items = upload.parseRequest(request);
//session.setAttribute("ajax_upload", null);
Iterator itr = items.iterator();
while (itr.hasNext()) {
	FileItem item = (FileItem) itr.next();
	String fileName = item.getName();
	long fileSize = item.getSize();
	if (!item.isFormField()) {
		//检查文件大小
		if(item.getSize() > maxSize){
			out.println(getError("上传文件大小超过限制。最大只能传"+maxSize/1024/1024+"M ，当前文件"+item.getSize()/1024/1024+"M"  ));
			return;
		}
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
			out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
			return;
		}
		
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		try{
			File uploadedFile = new File(savePath, newFileName);
			String mark = request.getParameter("mark");
			if ("newsmarks".equals(mark)) {	//盈创新闻图片压缩
				InputStream input = item.getInputStream();
				BufferedImage src = ImageIO.read(input);
				int newwidth = 500;		//压缩 固定宽度
				int newheight = (src.getHeight() * newwidth) / src.getWidth();
		        BufferedImage tag = new BufferedImage(newwidth, newheight, BufferedImage.TYPE_INT_RGB);
		        tag.getGraphics().drawImage(src.getScaledInstance(newwidth, newheight, Image.SCALE_SMOOTH), 0, 0, null);
		        ImageIO.write(tag, "jpg", uploadedFile);
			} else if ("guquanmarks".equals(mark)) {	//股权详情图片压缩
				InputStream input = item.getInputStream();
				BufferedImage src = ImageIO.read(input);
				int newwidth = 750;		//压缩 固定宽度
				int newheight = (src.getHeight() * newwidth) / src.getWidth();
		        BufferedImage tag = new BufferedImage(newwidth, newheight, BufferedImage.TYPE_INT_RGB);
		        tag.getGraphics().drawImage(src.getScaledInstance(newwidth, newheight, Image.SCALE_SMOOTH), 0, 0, null);
		        ImageIO.write(tag, "jpg", uploadedFile);
			} else {
				item.write(uploadedFile);
			}
		}catch(Exception e){
			out.println(getError("上传文件失败。"));
			return;
		}

		JSONObject obj = new JSONObject();
		obj.put("error", 0);
		//obj.put("url", saveUrl + newFileName);
		obj.put("url", "/attached/"+dirName+"/" + newFileName);
		out.println(obj.toJSONString());
		
		logger.error("upload_json.jsp>>>>>upload file success :"+saveUrl + newFileName);
		
		User user = (User)session.getAttribute(ManageContainer.manage_session_user_info);
		if (user != null) {
			Picture pic = new Picture();
			pic.setInputuser(user.getUsername());
			pic.setPicurl("/attached/" + dirName + "/" + newFileName);
			BeanContext.getBean(PictureService.class).insert(pic);
		}
	}
}
%>
<%!
private String getError(String message) {
	JSONObject obj = new JSONObject();
	obj.put("error", 1);
	obj.put("message", message);
	return obj.toJSONString();
}
%>