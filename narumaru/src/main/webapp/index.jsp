<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
	
	<form method="post" action="boardListAll.bo">
		<input type="number" id="nmno" name="nmno"><br>
		<button type="submit"></button>
	</form>
	<%-- <jsp:forward page="WEB-INF/views/naru/naruBoard.jsp"/>
	<jsp:forward page="WEB-INF/views/naru/naruInsertBoard.jsp"/>
	<jsp:forward page="WEB-INF/views/main/mainLogin.jsp"/> --%>
</body>
</html>



