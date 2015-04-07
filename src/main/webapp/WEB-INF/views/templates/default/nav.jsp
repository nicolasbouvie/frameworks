<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button aria-controls="navbar" aria-expanded="false" data-target="#navbar" data-toggle="collapse" class="navbar-toggle collapsed" type="button">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a href="#" class="navbar-brand">Vendas</a>
		</div>
		<div class="navbar-collapse collapse" id="navbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/venda">Vendas</a></li>
    			
    			<security:authorize access="hasRole('admin')">
					<li class="dropdown">
						<a aria-expanded="false" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">
							Manutenção <span class="caret"></span>
						</a>
						<ul role="menu" class="dropdown-menu">
							<li><a href="${pageContext.request.contextPath}/admin/usuario">Usuários</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/grupo">Grupos</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/configuracao">Configuração</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/venda">Vendas</a></li>
						</ul>
					</li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:sobre()">Sobre</a></li>
				<security:authorize access="hasRole('ROLE_ANONYMOUS')" var="anonymous"/>
				<c:if test="${anonymous}">
					<li><a href="${pageContext.request.contextPath}/login">Entrar</a></li>
				</c:if>
				<c:if test="${not anonymous}">
					<li><a href="${pageContext.request.contextPath}/logout">Sair</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>