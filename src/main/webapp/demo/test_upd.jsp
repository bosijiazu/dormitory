<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>修改用户表</title>
	<%@include file="/common/include.jsp" %>
<script>
<%-- 查询页点击修改时调用此方法加载记录详情 --%>
function load(id){
	$('#_form').form('load','/${projectName}/demo/test/vieTest.action?zj='+id);
};

<%-- 点击保存按钮时调用此方法。(注:保存按钮在查询列表页) --%>
function submitForm(){
	if(!$("#_form").form("validate")){
		return;
	}
	$('#_form').form('submit',{
      success:function(data) {
      	parent.reloadData();
      }
   });
}
</script>
</head>
<body>
<form id="_form" method="post" action="/${projectName}/demo/test/updTest.action">
	<input type="hidden" name='zj' id='zj'/>
	<table>
		<tr><td class='label'>姓名：</td><td><input name='xm' id='xm' class='easyui-textbox' data-options=""/></td></tr>
		<tr><td class='label'>性别：</td><td><input name='xb' id='xb' class='easyui-textbox' data-options=""/></td></tr>
	</table>

</form>
</body>
</html>
