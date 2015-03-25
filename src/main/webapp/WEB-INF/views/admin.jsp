<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
 
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<%=System.getProperty("OPENSHIFT_POSTGRESQL_DB_HOST") %><br/>
		<%=System.getProperty("OPENSHIFT_POSTGRESQL_DB_PORT") %><br/>
		<%=System.getProperty("OPENSHIFT_POSTGRESQL_DB_USERNAME") %><br/>
		<%=System.getProperty("OPENSHIFT_POSTGRESQL_DB_PASSWORD") %><br/>
		<h2>Welcome : ${pageContext.request.userPrincipal.name} 
                 | <a href="<c:url value="/logout" />" > Logout</a></h2>  
	</c:if>
</body>
</html>