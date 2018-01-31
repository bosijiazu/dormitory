<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Basic Panel - jQuery EasyUI Demo</title>
	<%@include file="/common/include.jsp" %>
	<script>
	function addTab(title, url){
		if ($('#tabdiv').tabs('exists', title)){
			$('#tabdiv').tabs('select', title);
		} else {
			var content = '<iframe scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
			$('#tabdiv').tabs('add',{
				title:title,
				content:content,
				closable:true
			});
		}
	}
	</script>
	<style>
	.panel-body{overflow:hidden}
	</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'west',split:true" style="width:200px;padding:0px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<div title="Title1"  data-options="selected:true"  style="padding:10px;">
				<a href="javascript:addTab('测试用户表','/${projectName}/demo/test/page.action?page=test_sch')">测试用户表</a><br/>

			</div>
		</div>
	</div>
	<div data-options="region:'center'">
		<div id="tabdiv" class="easyui-tabs" data-options="fit:true,border:false,plain:true" fit="true">
		</div>
	</div>
</body>
</html>