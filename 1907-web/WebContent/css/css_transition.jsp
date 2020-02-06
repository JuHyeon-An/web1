<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_transition</title>
<style>

#main>div{
  overflow:hidden;
  border:2px solid #aaaaff;
  padding:10px;
  width:10px;
  
  margin:0px;
  background-color:#ddd;
  color:#000;
  font-family:'나눔스퀘어B';
  transform:rotate(0deg);
  opacity:0.8;
  transition:transform 3s, color 3s, background 3s, opacity 3s, width 3s;
}

#main>div:hover{
  width:100px;
  background-color:#5c5353;
  color:#fff;
  transform:rotate(3deg);
  opacity:1;
  transition:transform 1s, color 1s, background 1s, opacity 1s, width 1s;
}
</style>
</head>
<body>
<h3>transition</h3>

<div id='main'>
<div>html</div>
<div>css</div>
<div>javascript</div>
<div>jsp</div>
<div>java</div>
</div>
</body>
</html>