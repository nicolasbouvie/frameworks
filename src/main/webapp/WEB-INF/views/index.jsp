<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<security:authorize access="hasRole('admin')" var="admin"/>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h2>Bem Vindo ${user.nome}</h2>
		<table class="table">
			<thead>
				<tr>
					<c:if test="${admin}">
						<th>Pessoa</th>
					</c:if>
					<th>Proposta</th>
					<th>Vendido</th>
					<th>Recebido</th>
				</tr>
			</thead>
			<c:forEach items="${users}" var="u">
				<tr>
					<c:if test="${admin}">
						<td>${u.key.nome}</td>
					</c:if>
					<c:set var="proposta" value="0"/>
					<c:set var="vendido" value="0"/>
					<c:set var="recebido" value="0"/>
					<c:forEach items="${u.value}" var="venda">
						<c:set var="proposta" value="${proposta + venda.quantidade * venda.configuracao.valorVenda}"/>
						<c:if test="${not empty venda.dataVenda}">
							<c:set var="vendido" value="${vendido + venda.quantidade * venda.configuracao.valorVenda}"/>
						</c:if>
						<c:if test="${not empty venda.dataPagamento}">
							<c:set var="recebido" value="${recebido + venda.quantidade * venda.configuracao.valorVenda}"/>
						</c:if>
					</c:forEach>
					<td>${proposta}</td>
					<td>${vendido}</td>
					<td>${recebido}</td>
				</tr>
			</c:forEach>
		</table>
	</tiles:putAttribute>
</tiles:insertDefinition>
