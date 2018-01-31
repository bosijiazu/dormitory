<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户表查询</title>
	<%@include file="/common/include.jsp" %>

<script>
$(function(){
	<%-- 为分页行设置"添加"和"删除"按钮 --%>
	var pager = $('#testGrid').datagrid().datagrid('getPager');	// get the pager of datagrid
	pager.pagination({
		buttons:[],
	});			
})

<%-- 执行查询，点击查询按钮时调用 --%>
function doSearch(){
	if(!$("#_form").form("validate")){
		return;
	}
	$('#testGrid').datagrid('load',{
		xm:$('#xm').val(),
		xb:$('#xb').val()
	});
}

<%-- 查询列表datagrid的"操作"列的内容渲染，若有其他操作请修改此方法 --%>
function formatOper(val,row,index){  
    return "<span onclick='updTest("+val+")' style='text-decoration:underline;cursor:pointer;'>修改</span> "
    			+"<span onclick='vieTest("+val+")' style='text-decoration:underline;cursor:pointer;'>查看</span>";
} 

<%-- 打开修改页面，点击记录行的"修改"链接时调用 --%>
function updTest(id){
	$('#testViewWin').dialog('close');
	$('#testEditWin').dialog('open');
	$('#testEditWin').get(0).contentWindow.load(id);
} 

<%-- 打开查看页面，点击记录行的"查看"链接时调用 --%>
function vieTest(id){
	$('#testEditWin').dialog('close');
	$('#testViewWin').dialog('open');
	$('#testViewWin').get(0).contentWindow.load(id);
}

<%-- 删除记录 --%>
function delTest(){
	var checkedItems = $('#testGrid').datagrid('getChecked');
	var ids = [];
	$.each(checkedItems, function(index, item){
		ids.push(item.no);
	});
	if(ids.length==0){
		$.messager.alert('敬告','请选择删除的记录？');
		return;
	}
	$.messager.confirm('敬告','删除选定记录？',function(r){
		if(r){
			$.get("/${projectName}/Demo/test/delTest.action",{ids:ids},function(data){
				$('#testGrid').datagrid('reload');
			});
		}
	});
}

<%-- 刷新数据，当添加或修改了数据后调用。从upd页中调用。 --%>
function reloadData(){
	$('#testEditWin').dialog('close');
	$('#testGrid').datagrid('reload');
}
</script>
</head>
<body>
<table id="testGrid" title="用户表" class="easyui-datagrid" fitcolumns=true
	data-options="singleSelect:false,pagination:true,rownumbers:true,fit:true,striped:true,toolbar:'#testGridToolbar',collapsible:true,url:'/${projectName}/demo/test/schTest.action',method:'get'">
	<thead>
		<tr>
			<th data-options="field:'checkbox',checkbox:true" ></th>
			<th data-options="field:'xm',width:80,sortable:true">姓名</th>
			<th data-options="field:'xb',sortable:true">性别</th>

			<th data-options="field:'_oper',align:'center',formatter:formatOper">操作</th>
		</tr>
	</thead>
</table>
<%-- 查询条件设定栏 --%>
<div id="testGridToolbar">
	<div style="margin-bottom:5px">
		<a href="javascript:updTest(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:delTest()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
	</div>
	<form id="_form">
	姓名：<input name='xm' id="xm" class='easyui-textbox' value='' data-options="iconWidth:16,
icons: [{iconCls:'icon-clear',handler: function(e){$(e.data.target).textbox('setValue', '');}
}]"/>
	性别：<input name='xb' id="xb" class='easyui-textbox' value='' data-options="iconWidth:16,
icons: [{iconCls:'icon-clear',handler: function(e){$(e.data.target).textbox('setValue', '');}
}]"/>

	<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
	</form>
</div>


<%-- 修改or添加面板 --%>
<iframe id="testEditWin" src="/${projectName}/demo/test/page.action?page=test_upd" class="easyui-dialog" data-options="iconCls:'icon-save',buttons: '#testEditButton'" title="修改用户表" closed="true" style="width:500px;height:500px;padding:5px;" scrolling="no" frameborder="0"></iframe>
<div id="testEditButton">
	<a href="javascript:$('#testEditWin').get(0).contentWindow.submitForm()" class="easyui-linkbutton" iconCls="icon-ok">保 存</a>
	<a href="javascript:$('#testEditWin').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取 消</a>
</div>
<%-- 查看面板 --%>
<iframe id="testViewWin" src="/${projectName}/demo/test/page.action?page=test_vie" class="easyui-dialog" data-options="iconCls:'icon-save',buttons: '#testViewButton'" title="查看用户表" closed="true" style="width:500px;height:500px;padding:5px;" scrolling="auto" frameborder="0"></iframe>
<div id="testViewButton">
	<a href="javascript:$('#testViewWin').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >关 闭</a>
</div>
</body>
</html>
