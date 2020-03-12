<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selector_find</title>
<style>
#result{
  border : 1px solid black;
}
</style>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<div id='result'>
</div>
<script>
let xml = '<friends>'
		+ '		<friend>'
		+ '			<name>hong</name>'
		+ '			<language>Ruby</language>'
		+ '		</friend>'
		+ '		<friend>'
		+ '			<name>kim</name>'
		+ '			<language>Javascript</language>'
		+ '		</friend>'
		+ '		<friend>'
		+ '			<name>park</name>'
		+ '			<language>Java</language>'
		+ '		</friend>'
		+'</friends>';
		
let xmlDoc = $.parseXML(xml);
	let output=''; 
$(xmlDoc).find('friend').each(function(index){
	output += '<div>';
	output += '   <h1>' + $(this).find('name').text() + '</h1>';
	output += '   <p> ' + $(this).find('language').text() + '</p>';
	output += '</div>';
})

$('#result').html(output); // html -> innerHTML

$('div>div').css({
	'display' :'inline-block',
	'padding' : '20px',
	'border' : '3px solid #aaf',
	'margin' : '10px',
	'box-shadow' : '3px 3px 5px #aaa',
	'border-radius' : '10px'
});
</script>
</body>
</html>