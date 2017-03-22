<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default top-navbar" role="navigation">
           
                <a class="navbar-brand"  > <img  src="${pageContext.request.contextPath}/img/xiaohui.jpg" width="40%" height="180%" style="position: relative; top: -20px; height: 60px">
                	<strong  style="position: relative; top: -15px; height: 60px">滨江学院</strong> 
                
                </a>
            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
          		   ${user.username}
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
						
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>个人资料</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i>修改密码</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/user/exit.action"><i class="fa fa-sign-out fa-fw"></i>退出</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
</body>
</html>