<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<security:authorize access="hasRole('admin')" var="admin"/>
<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Vendas</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<security:authorize access="hasRole('admin')">
						<th>Pessoa</th>
					</security:authorize>
					<th>Quantidade</th>
					<th>Valor</th>
					<th>Proposta</th>
					<th>Venda</th>
					<th>Pagamento</th>
					<th>Ação
						<button class="btn btn-success btn-xs" type="button" onclick="novo()">
							<span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
						</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${vendas}" var="venda">
					<tr>
						<td class="f_id">${venda.id}</td>
						<security:authorize access="hasRole('admin')">
							<td>${venda.usuario.nome}</td>
						</security:authorize>
						<td class="f_quantidade">${venda.quantidade}</td>
						<td>${venda.quantidade * venda.configuracao.valorVenda}</td>
						<td class="f_proposta">${venda.dataProposta}</td>
						<td class="f_venda">${venda.dataVenda}</td>
						<td class="f_pagamento">${venda.dataPagamento}</td>
						
						<security:authorize access="hasRole('admin')">
							<td class="f_pessoa" style="display:none;">${venda.usuario.id}</td>
							<td class="f_configuracao" style="display:none;">${venda.configuracao.id}</td>
						</security:authorize>
						
						<td>
							<c:if test="${admin or empty venda.dataVenda}">
								<button class="btn btn-primary btn-xs" type="button" onclick="editar(this)">
									<span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
								</button>
								<button class="btn btn-danger btn-xs" type="button" onclick="remover('admin/venda', ${venda.id})">
									<span aria-hidden="true" class="glyphicon glyphicon-trash"></span>
								</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${admin or empty venda.dataVenda}">
			<form action="save" method="post" style="display: none;">
				<input type="hidden" id="id" name="id"/>
				<security:authorize access="hasRole('admin')">
					<div class="form-group">
						<label for="pessoa">Pessoa</label>
						<select id="pessoa" name="pessoa" class="form-control">
							<c:forEach items="${usuarios}" var="usuario">
								<option value="${usuario.id}">${usuario.nome}</option>
							</c:forEach>
						</select>
					</div>
				</security:authorize>
				<div class="form-group">
					<label for="quantidade">Quantidade</label>
					<input type="number" class="form-control" id="quantidade" name="quantidade" placeholder="Quantidade">
				</div>
				<div class="form-group">
					<label for="configuracao">Configuração</label>
					<select id="configuracao" name="configuracao" class="form-control">
						<c:forEach items="${configs}" var="config">
							<option value="${config.id}">${config.valor} - ${config.valorVenda}</option>
						</c:forEach>
					</select>
				</div>
				<security:authorize access="hasRole('admin')">
					<div class="form-group">
						<label for="proposta">Proposta</label>
						<input type="date" class="form-control" id="proposta" name="proposta" placeholder="Proposta">
					</div>
					<div class="form-group">
						<label for="venda">Venda</label>
						<input type="date" class="form-control" id="venda" name="venda" placeholder="Venda">
					</div>
					<div class="form-group">
						<label for="pagamento">Pagamento</label>
						<input type="date" class="form-control" id="pagamento" name="pagamento" placeholder="Pagamento">
					</div>
				</security:authorize>
				<button type="submit" class="btn btn-default">Salvar</button>
			</form>
		</c:if>
	</tiles:putAttribute>
</tiles:insertDefinition>
