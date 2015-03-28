<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>

	<c:forEach items="${users}" var="user">
		${user.username}<br/>
	</c:forEach> 
</body>
</html>