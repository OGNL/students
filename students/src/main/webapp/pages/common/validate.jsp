<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
	
<script type="text/javascript">
$(document).ready(function() {

    // Validate the form manually
    $('#validateBtn').click(function() {
        $('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
        $('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
    
    $('#birthday').daterangepicker({ singleDatePicker: true }, function(start, end, label) {

        console.log(start.toISOString(), end.toISOString(), label);

      });
    
    $('#enterTime').daterangepicker({ singleDatePicker: true }, function(start, end, label) {

        console.log(start.toISOString(), end.toISOString(), label);

      });

    
});
</script>
</html>