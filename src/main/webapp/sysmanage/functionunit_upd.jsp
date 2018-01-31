<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>修改功能单元</title>
	<%@include file="/common/include.jsp" %>
<script>
function load(id){
	$('#_form').form('load','./functionunit/updFunctionunit.action?id='+id);
};
function submitForm(){
	$('#_form').form('submit',{
      success:function(data) {
      	parent.reloadData();
      }
   });
}
</script>
</head>
<body>
<form id="_form" method="post" action="./functionunit/updFunctionunit.action">
	<input type="hidden" name="from" value="submit"/>
	<input type="hidden" name='id' value=""/>
	<input type="hidden" name='ord' value=""/>
	<input type="hidden" name='picico' value=""/>
	<input type="hidden" name='modulename' value=""/>
	<input type="hidden" name='funcs' value=""/>
	<table>
		<tr><td>功能单元名称：</td><td><input type='text' name='name' class='easyui-textbox' data-options='required:true' value=''/></td></tr>
		<tr><td>功能单元说明：</td><td><input type='text' name='info' class='easyui-textbox' data-options='required:true' value=''/></td></tr>
	</table>

</form>
</body>
</html>
