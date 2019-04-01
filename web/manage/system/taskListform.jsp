<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/jquery-1.9.1.min.js"></script>
</head>
<body>
</body>
<script type="text/javascript">
	$("body").html($('#toAllDetail', window.parent.document).prop("outerHTML"));
	$("#toAllDetail").submit();
</script>
</html>
