<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<title>功能单元查询</title>
	<%@include file="/common/include.jsp" %>
</head>
<body>
<table id="functionunitGrid" title="功能单元" class="easyui-datagrid" fitcolumns=true
	data-options="singleSelect:false,pagination:true,rownumbers:true,fit:true,striped:true,toolbar:'#functionunitGridToolbar',collapsible:true,url:'/${projectName}/sysmanage/functionunit/schFunctionunit.action',method:'get'">
	<thead>
		<tr>
			<th data-options="field:'checkbox',checkbox:true" ></th>
			<th data-options="field:'name',width:80,sortable:true">功能单元名称</th>
			<th data-options="field:'info',sortable:true">功能单元说明</th>

			<th data-options="field:'_oper',align:'center',formatter:formatOper">操作</th>
		</tr>
	</thead>
</table>
<div id="functionunitGridToolbar">
	功能单元名称：<input type="text" name="name" id="name" style="width:80px;"/>
	功能单元说明：<input type="text" name="info" id="info" style="width:80px;"/>

	<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="doSearch()">查询</a>
</div>


<script>
$(function(){
	var pager = $('#functionunitGrid').datagrid().datagrid('getPager');	// get the pager of datagrid
	pager.pagination({
		buttons:[{
			iconCls:'icon-add',
			text:'添加',
			handler:function(){
				updFunctionunit(0);
			}
		},{
			iconCls:'icon-remove',
			text:'删除',
			handler:function(){
				var checkedItems = $('#functionunitGrid').datagrid('getChecked');
				var ids = [];
				$.each(checkedItems, function(index, item){
					ids.push(item.id);
				});
				$.messager.confirm('敬告','删除选定记录？',function(r){
					if(r){
						$.get("./functionunit/delFunctionunit.action",{ids:ids},function(data){
							$('#functionunitGrid').datagrid('reload');
						});
					}
				});
			}
		}],
	});			
})
function doSearch(){
	$('#functionunitGrid').datagrid('load',{
		name: $('#name').val(),
		email: $('#email').val()
	});
}
function formatOper(val,row,index){  
    return "<a href='javascript:updFunctionunit("+val+")'>修改</a>";  
} 

function updFunctionunit(id){
	$('#functionunitEditWin').dialog('open');
	$('#functionunitEditWin').get(0).contentWindow.load(id);
} 
function reloadData(){
	$('#functionunitEditWin').dialog('close');
	$('#functionunitGrid').datagrid('reload');
}
</script>
<iframe id="functionunitEditWin" src="/${projectName}/sysmanage/functionunit_upd.jsp" class="easyui-dialog" data-options="iconCls:'icon-save',buttons: '#functionunitEditButton'" title="修改功能单元" closed="true" style="width:500px;height:500px;padding:5px;" scrolling="no" frameborder="0"></iframe>
<div id="functionunitEditButton">
	<a href="javascript:$('#functionunitEditWin').get(0).contentWindow.submitForm()" class="easyui-linkbutton" iconCls="icon-ok">保 存</a>
	<a href="javascript:$('#functionunitEditWin').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取 消</a>
</div>
</body>
</html>
