$(document).ready(function(){
	$('ul.accordion').accordion({
		active: ".selected",
		autoHeight: false,
		header: ".opener",
		collapsible: true,
		event: "click"
	});
});