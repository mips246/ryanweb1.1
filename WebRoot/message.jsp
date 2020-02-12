<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>文件上传结果</title>
	</head>
	
	<body>
    	<center>
       		<h2>${message}</h2><br>
       		<h2>即将返回上级页面...</h2>
       		<script language="JavaScript" type="text/javascript">
		        function myRedirect(){
		        	var role = '<%=session.getAttribute("role")%>';
		        	if("teacher"==role) window.location = "teacher/teacher_upload.jsp";
		        }
		        setTimeout('myRedirect()', 3000);//第二个参数是时间，单位毫秒
	  		</script>
    	</center>
	</body>
</html>