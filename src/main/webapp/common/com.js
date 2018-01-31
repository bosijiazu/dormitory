function QMoveDialog(dia){
	dia.dialog("move", { top:$(document).scrollTop() + ($(window).height()-dia.height()) * 0.2})
}