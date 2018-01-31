<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>查看用户表</title>
	<%@include file="/common/include.jsp" %>
<script>
function load(id){
	$('#_form').form('load','/${projectName}/demo/test/vieTest.action?toL=true&zj='+id);
};
</script>
</head>
<body>
<form id="_form">
	<input type="hidden" name='zj' value=""/>
	<table>
		<tr><td class='label'>姓名：</td><td><input type='text' name='xm' class='viewbox' readonly='readonly'/></td></tr>
		<tr><td class='label'>性别：</td><td><input type='text' name='xb' class='viewbox' readonly='readonly'/></td></tr>
	</table>

</form>
</body>
</html>
