<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect_colorbox</title>
<link rel='stylesheet' type='text/css' href='colorbox.css'/>
<script src='../lib/jquery-3.4.1.js'></script>
<script src='../lib/jquery.colorbox-min.js'></script>

</head>
<body>
<h3>colorbox plug-in</h3>
<a title='펭귄' rel='abc' href='../images/img1.jpg'>img1</a>
<a rel='abc' href='../images/img2.jpg'>img2</a>
<a rel='abc' href='../images/img3.jpg'>img3</a>
<a rel='abc' href='../images/img4.jpg'>img4</a>
<a rel='abc' href='../images/img5.jpg'>img5</a>
<a href='../images/drink.png'></a>
<script>
$("a[rel='abc']").colorbox({
	opacity : 0.5
});
</script>
</body>
</html>