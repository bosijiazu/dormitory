<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Basic Panel - jQuery EasyUI Demo</title>
	<%@include file="/common/include.jsp" %>
	<script>
	$(function(){
		//加载Module
		$.get("/${projectName}/sysmanage/module/schMyModule.action",function(data){
			if(data!=""){
				var list=eval("("+data+")").rows;
				var res="";
				for(var i=0;i<list.length;i++){
					res+="<li onclick=\"javascript:openModule("+list[i].id+")\"><a><img src='/${projectName}"+list[i].icon+"'/><br/>"+list[i].name+"</a></li>";
				}
				$("#module").html(res);
			}
		});
	});
	function menuover(div){
		var imgobj=$(div).find("img");
		var oldstr=imgobj.attr("oldsrc")+"";
		oldstr=oldstr.substring(0,oldstr.length-4);
		imgobj.attr("src","/${projectName}/"+oldstr+"_o.png");
	}
	function menuout(div){
		var imgobj=$(div).find("img");
		var oldstr=imgobj.attr("oldsrc")+"";
		oldstr=oldstr.substring(0,oldstr.length-4);
		imgobj.attr("src","/${projectName}/"+oldstr+".png");
	}
	function openModule(moduleid){
		$.get("/${projectName}/sysmanage/module/schMenuByModule.action",{id:moduleid},function(data){
			if(data!=""){
				var list=eval("("+data+")").rows;
				var res="";
				for(var i=0;i<list.length;i++){
					var fun=list[i];
					var img="";
					if(fun.picico!=""){
						img="<img oldsrc='"+fun.picico+"' src='/${projectName}"+fun.picico+"'/>";
					}
					res+="<div onmouseover='menuover(this)' onmouseout='menuout(this)' onclick=\"javascript:addTab('"+fun.name+"','/${projectName}/"+fun.link+"')\">"+img+"<a>"+fun.name+"</a></div>";
				}
				$("#menu").html(res);
			}
		});
	}
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
	
    function cd() {
        var $easyuiTheme = $('#easyuiTheme');
        var url = $easyuiTheme.attr('href');
        $easyuiTheme.attr('href', '/${projectName}/easyui1_5/themes/default/easyui.css');
    };
	</script>
	<style>
	.panel-body {
		position: relative;
		overflow:hidden;
	}
	
	.logo {
		width:190px;
		height:60px;
		float:left;
		background:url('/${projectName}/common/img/huatang.png') no-repeat;
		background-size: 170px auto;
		background-position: 12px 6px;
	}
	
	#module {
		position: absolute;
    	top: 0;
    	right: 0;
		margin:0;
		width: 80%;
		/*padding: 0 10px 0 0;*/
		text-align: right;
	}
	#module li {
		padding: 9px 10px;
		text-align: center;
		display: inline-block;
		cursor: pointer;
		font-size: 14px;
		border: 1px #293c55 solid;
		list-style-type:none;
		transition: background .4s,border-color .4s;
		-moz-transition: background .4s,border-color .4s;	/* Firefox 4 */
		-webkit-transition: background .4s,border-color .4s;	/* Safari 和 Chrome */
		-o-transition: background .4s,border-color .4s;	/* Opera */
	}
	#module li:hover {
		background: #1d1d59;
		border: 1px #4b4da4 solid;
		border-bottom: none;
	}
	#module li a {
		line-height: 20px;
		color: #fff;
		text-decoration:none;
	}
	
	#menu {
		/*background:#293c55;*/
		border:0;
	}
	
	#menu div {
		/*background:#293c55;*/
		line-height:50px;
		height:50px;
		display:block;
		padding-left: 15px;
		font-size:14px;
		/*border-left-color:#293c55;
		border-left-style:solid;
		border-left-width:5px;*/
		cursor:pointer;
		transition: background .4s,border-left-color .4s;
		-moz-transition: background .4s,border-left-color .4s;	/* Firefox 4 */
		-webkit-transition: background .4s,border-left-color .4s;	/* Safari 和 Chrome */
		-o-transition: background .4s,border-left-color .4s;	/* Opera */
		overflow: hidden;
    	text-overflow: ellipsis;
    	white-space: nowrap;
	}
	#menu div a {
		color: #333;
		text-decoration:none;
	}
	#menu div:hover {
		background: #e43c59;
	}
	#menu div:hover a {
		color: #fff;
		transition: color .4s;
		-moz-transition: color .4s;	/* Firefox 4 */
		-webkit-transition: color .4s;	/* Safari 和 Chrome */
		-o-transition: color .4s;	/* Opera */
	}
	#menu img {
		width: 20px;
    	vertical-align: -3PX;;
    	margin-right: 5px;
	}	
	</style>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:70px;background:#293c55;padding:0;">
		<div class="logo"></div>
		<ul id="module">
			
		</ul>
	</div>
	<div data-options="region:'west',split:true" style="width:200px;padding:0px;border-right:0;" id="menu">
		
	</div>
<!-- 	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div> -->
	<div data-options="region:'south',border:false" style="height:30px;line-height:30px;text-align:center;color: #fff;background:#293c55;">Copyright 2013-2017 华唐中科教育科技（北京）有限公司 <a href="www.cnccss.cn" target="_blank" style="color: #fff;">www.cnccss.cn</a></div>
	<div data-options="region:'center'">
		<div id="tabdiv" class="easyui-tabs" data-options="fit:true,border:false,plain:true" fit="true">
		</div>
	</div>
</body>
</html>
