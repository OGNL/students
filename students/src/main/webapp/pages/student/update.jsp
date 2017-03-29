<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改学生信息</title>
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
                        <h3>修改学生</h3>
                    </div>

                    <form id="defaultForm" method="post" class="form-horizontal" action="${pageContext.request.contextPath}/student/doupdate.action">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">学号</label>
                            <div class="col-lg-5">
                                   <input id="stuNo" type="text" class="form-control" name="stuNo" readonly="readonly" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">姓名</label>
                            <div class="col-lg-5">
                                <input id="stuName" type="text" class="form-control" name="stuName" />
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">籍贯</label>
                            <div class="col-lg-5">
                                <select class="form-control" id="address" name="address">
                                	<option value="">---请选择---</option>
                                	<option value="北京市">北京市</option>
                                	<option value="上海市">上海市</option>
                                	<option value="天津市">天津市</option>
                                	<option value="重庆市">重庆市</option>
                                	<option value="黑龙江省">黑龙江省</option>
                                	<option value="吉林省">吉林省</option>
                                	<option value="辽宁省">辽宁省</option>
                                	<option value="江苏省">江苏省</option>
                                	<option value="山东省">山东省</option>
                                	<option value="安徽省">安徽省</option>
                                	<option value="河北省">河北省</option>
                                	<option value="河南省">河南省</option>
                                	<option value="湖北省">湖北省</option>
                                	<option value="湖南省">湖南省</option>
                                	<option value="江西省">江西省</option>
                                	<option value="陕西省">陕西省</option>
                                	<option value="山西省">山西省</option>
                                	<option value="四川省">四川省</option>
                                	<option value="青海省">青海省</option>
                                	<option value="海南省">海南省</option>
                                	<option value="广东省">广东省</option>
                                	<option value="贵州省">贵州省</option>
                                	<option value="浙江省">浙江省</option>
                                	<option value="福建省">福建省</option>
                                	<option value="甘肃省">甘肃省</option>
                                	<option value="云南省">云南省</option>
                                	<option value="内蒙古自治区">内蒙古自治区</option>
                                	<option value="宁夏回族自治区">宁夏回族自治区</option>
                                	<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                                	<option value="西藏自治区">西藏自治区</option>
                                	<option value="广西壮族自治区">广西壮族自治区</option>
                                	<option value="香港特别行政区">香港特别行政区</option>
                                	<option value="澳门特别行政区">澳门特别行政区</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">性别</label>
                            <div class="col-lg-5">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="男" /> 男
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" value="女" /> 女
                                    </label>
                                </div>
                               
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">专业</label>
                            <div class="col-lg-5">
                                <input id="major" type="text" class="form-control" name="major" />
                            </div>
                        </div>
                        
                         <div class="form-group">
                            <label class="col-lg-3 control-label">出生日期</label>
                            <div class="col-lg-5">
                              <!--  <input type="text" readonly style="width: 200px" name="birthday" id="birthday" class="form-control" value="03/18/2013" />  -->
                               
                                 <input  id ="birthday"type="text" class="form-control" name="birthday" readonly="readonly" value="1990-01-01"/> 
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">入学时间</label>
                            <div class="col-lg-5">
                                <input id="enterTime" type="text" class="form-control" name="enterTime" readonly="readonly"  value="2010-01-01"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">联系方式</label>
                            <div class="col-lg-5">
                                <input id="phone" type="text" class="form-control" name="phone" />
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
		showMenu(1);
		
		$("#stuNo").val('${stu.stuNo}');
		$("#stuName").val('${stu.stuName}');
		$("input[value = '${stu.gender}']").attr("checked",true);
		$("#major").val('${stu.major}');
		$("#birthday").val('${stu.birthday}');
		$("#enterTime").val('${stu.enterTime}');
		$("#phone").val('${stu.phone}');
		$("#address").val('${stu.address}');
		
		$('#birthday').fdatepicker({
			format: 'yyyy-mm-dd',
		});
		$('#enterTime').fdatepicker({
			format: 'yyyy-mm-dd',
		});
		
		  $('#defaultForm').bootstrapValidator({
//	        live: 'disabled',
		
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            stuName: {
	                validators: {
	                    notEmpty: {
	                        message: '姓名不能为空！'
	                    }
	                }
	            },
	            gender: {
	                validators: {
	                    notEmpty: {
	                        message: '请选择性别！'
	                    }
	                }
	            },
	            major: {
	                validators: {
	                    notEmpty: {
	                        message: '专业不能为空！'
	                    }
	                }
	            },
	         /*    birthday: {
	                validators: {
	                     notEmpty: {
	                        message: '出生日期不能为空！'
	                    } 
	                    integer: {},
	    				callback: {
	    					message: '出生日期不能大于入学时间！',
	    					callback:function(value, validator,$field,options){
	    						var begin = $('#pro_info').find("input[name='enterTime']").val();
	    						return parseInt(value)<=parseInt(begin);
	    					}
	    				}
	                }
		            
	            },
	            enterTime: {
	                validators: {
	                     notEmpty: {
	                        message: '入学时间不能为空！'
	                    } 
	                    integer: {},
	    				callback: {
	    					message: '入学时间不能小于出生日期！',
	    					callback:function(value, validator,$field){
	    						var begin = $('#pro_info').find("input[name='birthday']").val();
	    						$('#pro_info').find("input[name='birthday']").keypress();
	    						validator.updateStatus('birthday', 'VALID');
	    						return parseInt(value)>=parseInt(begin);
	    					}
	    				}
	                }
	            }, */
	            phone: {
	                validators: {
	                    notEmpty: {
	                        message: '联系方式不能为空！'
	                    },
	                    regexp: {
	                        regexp: /^[0-9]{11}$/,
	                        message: '联系方式只能由11位数字组成！'
	                    }
	                }
	            },
	            address: {
	                validators: {
	                    notEmpty: {
	                        message: '籍贯不能为空！'
	                    }
	                }
	            },
	             
	            }
	         
	        
	    });
		
	});

</script>
</html>