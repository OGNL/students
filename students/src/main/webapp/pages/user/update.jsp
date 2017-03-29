<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改账户</title>
<jsp:include page="../common/taglibs.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrapValidator.css">
<!-- FontAwesome Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/menu/font-awesome.css">
<!-- Custom Styles-->
<link href="${pageContext.request.contextPath}/css/menu/custom-styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css">

</head>
<body>
	<div id="wrapper">

		<jsp:include page="../common/head.jsp"></jsp:include>
		<jsp:include page="../common/menu.jsp"></jsp:include>
		
		<div id="page-wrapper">
			<div class="container">
        <div class="row">
            <!-- form: -->
            <section>
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="page-header">
                        <h3>修改账户</h3>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/user/doUpdateUser.action">
                        <input type="hidden" name="userId"  value="${u.userId}">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">用户名</label>
                            <div class="col-lg-5">
                                   <input id="username" type="text" class="form-control" name="username" value="${u.username}" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">密码</label>
                            <div class="col-lg-5">
                                <input id="password" type="password" class="form-control" name="password" />
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">角色</label>
                            <div class="col-lg-5">
                                <select class="form-control" id="role" name="role">
                                	<option value="">---请选择---</option>
                                		<option value="班主任">班主任</option>
										<option value="教导主任">教导主任</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-3">
                                <button type="button" onclick="history.go(-1)" class="btn btn-primary" name="signup" value="Sign up">返回</button>
                                <button type="submit"  class="btn btn-primary" name="signup" value="Sign up">修改</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
	</div>	
	</div>
</body>
	<script src="${pageContext.request.contextPath}/js/bootstrapValidator.js" type="text/javascript"></script>
<script type="text/javascript">

$(function(){
	
	showMenu(9);
	
	$("#password").val('${u.password}');
	$("#role").val('${u.role}');
	
});


$('#defaultForm').bootstrapValidator({
//    live: 'disabled',

    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
        password: {
            validators: {
                notEmpty: {
                    message: '密码不能为空！'
                },
                stringLength: {
                    min: 5,
                    message: '密码至少5位！'
                }
            }
        },
        role: {
            validators: {
                notEmpty: {
                    message: '请选择角色！'
                }
            }
        },
         
        }

    
});


</script>
</html>