<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String userid = request.getParameter("id");
		String passward = request.getParameter("passwd");
	%>
	<p>아이디 : <%= userid %></p>
	<p>비밀번호 : <%= passward %></p>
	
	
</body>
</html>