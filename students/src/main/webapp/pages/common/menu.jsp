<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生信息表</title>
</head>
<body>
	 <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href=""><i class="fa fa-dashboard"></i> 主页</a>
                    </li>
                    <li id="1">
                        <a href=""><i class="fa fa-desktop"></i>学生管理<span class="fa arrow"></span></a>
                   		  <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/student/showall.action"> 学生信息表</a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath}/score/fuzzyQuery.action"> 学生成绩表</a>
                            </li>
                        </ul>
                    </li>
					<li id="2">
                        <a href=""><i class="fa fa-bar-chart-o"></i>数据统计<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="">各专业学生人数统计</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href=""> <i class="fa fa-qrcode"></i>Responsive Tables</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-table"></i> Forms </a>
                    </li>


                    <li id="9">
                        <a href="#"><i class="fa fa-sitemap"></i>系统设置<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">账户管理</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                            </li>
                            <li>
                                <a href="#">Second Level Link</a>
                    

                            </li>
                        </ul>
                    </li>
                </ul>

            </div>

        </nav>
<script type="text/javascript">
	function showMenu(id){
		$("#"+id).attr("class","active");
		$("#"+id+">ul").attr("class","nav nav-second-level collapse in");
	}



</script>
</body>
</html>