<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<jsp:include page="./common/taglibs.jsp"></jsp:include>
     <!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
        <!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
<style type="text/css">
#page-wrapper{
background-image: url(../img/5.jpg)
}

</style>
</head>
<body>
	<div id="wrapper">
        
        <jsp:include page="./common/head.jsp"></jsp:include>
        <jsp:include page="./common/menu.jsp"></jsp:include>
        
	    <div id="page-wrapper" >
	    <h2>欢迎进入学生信息管理系统！</h2>
    	</div>
    </div>
</body>
</html>