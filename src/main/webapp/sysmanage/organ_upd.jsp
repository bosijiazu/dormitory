<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>修改机构</title>
	<%@include file="/common/include.jsp" %>
<script>
$(function(){
	$('#_form').form({
		onLoadSuccess:function(){
			roleListDict.select($('#roles').val());
		}
	});
});
function load(id,pid){
	$('#_form').form('load','./organ/updOrgan.action?id='+id+'&pid='+pid);
};
function submitForm(){
	if(!$("#_form").form("validate")){
		return;
	}
	$('#roles').val(roleListDict.getValue());
	$('#_form').form('submit',{
      success:function(data) {
      	parent.reloadData();
      }
   });
}
</script>
<style>
</style>
</head>
<body>
<form id="_form" method="post" action="./organ/updOrgan.action">
	<input type="hidden" name="from" value="submit"/>
	<input type="hidden" name='id' value=""/>
	<input type="hidden" name='pid' value=""/>
	<input type="hidden" name='ord' value=""/>
	<input type="hidden" name='treetrack' value=""/>
	<input type="hidden" name='modulename' value=""/>
	<input type="hidden" name='funcunits' value=""/>
	<input type="hidden" name='type' value=""/>
	<input type="hidden" name='code' value=""/>
	<input type="hidden" name="roles" id="roles"/>
	<table style="width:100%">
		<tr><td class='label'>机构名称：</td><td><input name='name' class='easyui-textbox' data-options='required:true' value=''/></td></tr>
		<tr><td class='label'>上级机构：</td><td><input name='pname' class='easyui-textbox' value='' readonly="readonly"/></td></tr>
		<tr><td class='label'>是否机构：</td><td><dc:insertList name="ismaster" dictId="SYS_ORGAN_NATURE" style="enu_radio"/></td></tr>
		<tr><td class='label' style="vertical-align:top;">说明：</td><td><input name='info' class='easyui-textbox' data-options='multiline:true' value='' style="width:100%;height:40px"/></td></tr>
		<tr><td class='label'>角色：</td><td>
			<dc:includeList name="roleList" dictId="SYS_ROLE" style="bill_checkbox" cssWidth="150px"/>
		</td></tr>
	</table>
</form>
</body>
</html>
