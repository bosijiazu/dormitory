<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/dictionary.tld" prefix="dc"%>
<!DOCTYPE html>
<html>
<head>
	<title>机构查询</title>
	<%@include file="/common/include.jsp" %>
</head>
<body class="easyui-layout">
	<div region="west" split="true" title="组织机构" style="width:260px;">
		<dc:includeTree dictId="SYS_ORGAN" name="organtree" style="synch_single" bind="select:openOrgan"/>
	</div>
	<div id="content" region="center" style="border:0;">
		<table id="organGrid" title="" class="easyui-datagrid" fitcolumns=true
			data-options="singleSelect:false,pagination:true,rownumbers:true,fit:true,striped:true,toolbar:'#organGridToolbar',collapsible:true,url:'/${projectName}/sysmanage/organ/schOrgan.action',method:'get'">
			<thead>
				<tr>
					<th data-options="field:'checkbox',checkbox:true" ></th>
					<th data-options="field:'name',width:80,sortable:true">机构名称</th>
					<th data-options="field:'ismaster',sortable:true">是否机构</th>
					<th data-options="field:'info',sortable:true">说明</th>
					<th data-options="field:'code',sortable:true">机构编码</th>
					<th data-options="field:'type',sortable:true">机构类型</th>
					<th data-options="field:'_oper',align:'center',formatter:formatOper">操作</th>
				</tr>
			</thead>
		</table>
		<div id="organGridToolbar">
			机构名称：<input class="easyui-textbox" name="name" id="name" style="width:200px;" data-options="
							iconWidth:16,
							icons: [{iconCls:'icon-clear',
								handler: function(e){$(e.data.target).textbox('setValue', '');}
							},{iconCls:'icon-search',
								handler: function(e){
									doSearch();
								}
						}]"/>
			<label for="child"><input type="checkbox" name="child" id="child" value="1" style="vertical-align: middle;width:15px;height:15px" checked="checked"/>包含下级</label>
		</div>
	</div>
<script>
$(function(){
	var pager = $('#organGrid').datagrid().datagrid('getPager');	// get the pager of datagrid
	pager.pagination({
		buttons:[{
			iconCls:'icon-add',
			text:'添加',
			handler:function(){
				updOrgan(0);
			}
		},{
			iconCls:'icon-remove',
			text:'删除',
			handler:function(){
				var checkedItems = $('#organGrid').datagrid('getChecked');
				var ids = [];
				$.each(checkedItems, function(index, item){
					ids.push(item.id);
				});
				$.messager.confirm('敬告','删除选定记录？',function(r){
					if(r){
						$.get("./organ/delOrgan.action",{ids:ids},function(data){
							$('#organGrid').datagrid('reload');
						});
					}
				});
			}
		}],
	});
	
	$('#name').textbox('textbox').keydown(function (e) {
        if (e.keyCode == 13) {
           doSearch();
        }
    });
    
    $('#child').click(function(){
    	doSearch();
    });
})
function doSearch(){
	$('#organGrid').datagrid('load',{
		name: $('#name').val(),
		id: currOrganId,
		child:$('#child').get(0).checked
	});
}
function formatOper(val,row,index){  
    return "<span onclick='updOrgan("+val+")' style='text-decoration:underline;cursor:pointer;'>修改</span>";  
} 

function updOrgan(id){
	$('#organEditWin').dialog('open');
	$('#organEditWin').get(0).contentWindow.load(id,currOrganId);
}
function reloadData(){
	$('#organEditWin').dialog('close');
	$('#organGrid').datagrid('reload');
	$('#organtree').tree('reload');
}
var currOrganId;
function openOrgan(json){//{id:'',text:''}
	currOrganId=json.id;
	doSearch();
}
</script>
<iframe id="organEditWin" src="/${projectName}/sysmanage/organ_upd.jsp" class="easyui-dialog" data-options="iconCls:'icon-save',buttons: '#organEditButton'" title="修改机构" closed="true" style="width:500px;height:500px;padding:5px;" scrolling="no" frameborder="0"></iframe>
<div id="organEditButton">
	<a href="javascript:$('#organEditWin').get(0).contentWindow.submitForm()" class="easyui-linkbutton" iconCls="icon-ok">保 存</a>
	<a href="javascript:$('#organEditWin').dialog('close');" class="easyui-linkbutton" iconCls="icon-cancel" >取 消</a>
</div>
</body>
</html>
