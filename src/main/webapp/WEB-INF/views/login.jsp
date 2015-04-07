<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
        <form name="f" action="${pageContext.request.contextPath}/login" method="post">               
			<div class="form-group">
				<label for="username">Email</label>
				<input type="text" class="form-control" id="username" name="username" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="password">Senha</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Senha">
			</div>
			<button type="submit" class="btn btn-default">Entrar</button>
        </form>
  	</tiles:putAttribute>
</tiles:insertDefinition>
