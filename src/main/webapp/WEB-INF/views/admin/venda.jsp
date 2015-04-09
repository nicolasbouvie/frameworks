<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<security:authorize access="hasRole('admin')" var="admin"/>
<security:authorize access="hasRole('operacional')" var="operacional"/>
<security:authorize access="hasRole('financeiro')" var="financeiro"/>
<security:authorize access="hasRole('usuario')" var="usuario"/>
<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Vendas</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<c:if test="${admin or operacional or financeiro}">
						<th>Pessoa</th>
					</c:if>
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
					<fmt:formatNumber value="${venda.quantidade * venda.configuracao.valorVenda}" maxFractionDigits="2" minFractionDigits="2" var="valorVenda"></fmt:formatNumber>
					<fmt:formatDate value="${venda.dataProposta}" pattern="dd/MM/yyyy" var="dataProposta"/>
					<fmt:formatDate value="${venda.dataVenda}" pattern="dd/MM/yyyy" var="dataVenda"/>
					<fmt:formatDate value="${venda.dataPagamento}" pattern="dd/MM/yyyy" var="dataPagamento"/>
					<tr>
						<td class="f_id">${venda.id}</td>
						<c:if test="${admin or operacional or financeiro}">
							<td>${venda.usuario.nome}</td>
						</c:if>
						<td class="f_quantidade">${venda.quantidade}</td>
						<td>${valorVenda}</td>
						<td class="f_proposta">${dataProposta}</td>
						<td class="f_venda">${dataVenda}</td>
						<td class="f_pagamento">${dataPagamento}</td>
						
						<c:if test="${admin or operacional or financeiro}">
							<td class="f_pessoa" style="display:none;">${venda.usuario.id}</td>
							<td class="f_configuracao" style="display:none;">${venda.configuracao.id}</td>
						</c:if>
						
						<td>
							<c:if test="${admin}">
								<button class="btn btn-primary btn-xs" type="button" onclick="editar(this)">
									<span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
								</button>
								<button class="btn btn-danger btn-xs" type="button" onclick="remover('admin/venda', ${venda.id})">
									<span aria-hidden="true" class="glyphicon glyphicon-trash"></span>
								</button>
							</c:if>
							<c:if test="${operacional and empty dataVenda}">
								<button class="btn btn-primary btn-xs" type="button" onclick="updateDataVenda(${venda.id})">
									<span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
								</button>
								<button class="btn btn-danger btn-xs" type="button" onclick="remover('admin/venda', ${venda.id})">
									<span aria-hidden="true" class="glyphicon glyphicon-trash"></span>
								</button>
							</c:if>
							<c:if test="${financeiro and not empty dataVenda and empty dataPagamento}">
								<button class="btn btn-primary btn-xs" type="button" onclick="updateDataPagamento(${venda.id})">
									<span aria-hidden="true" class="glyphicon glyphicon-ok"></span>
								</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:if test="${admin or usuario}">
			<form action="save" method="post" style="display: none;">
				<input type="hidden" id="id" name="id"/>
				<c:if test="${admin}">
					<div class="form-group">
						<label for="pessoa">Pessoa</label>
						<select id="pessoa" name="pessoa" class="form-control">
							<c:forEach items="${usuarios}" var="usuario">
								<option value="${usuario.id}">${usuario.nome}</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
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
				<c:if test="${admin}">
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
				</c:if>
				<button type="submit" class="btn btn-default">Salvar</button>
			</form>
		</c:if>
	</tiles:putAttribute>
	<tiles:putAttribute name="script">
		<c:if test="${operacional}">
			<script type="text/javascript">
				function updateDataVenda(id) {
					var form = $("<form method='POST' action='venda/updateDataVenda/"+id+"'></form>");
					$("body").append(form);
					form.submit();
				}
			</script>
		</c:if>
		<c:if test="${financeiro}">
			<script type="text/javascript">
				function updateDataPagamento(id) {
					var form = $("<form method='POST' action='venda/updateDataPagamento/"+id+"'></form>");
					$("body").append(form);
					form.submit();
				}
			</script>
		</c:if>
	</tiles:putAttribute>
</tiles:insertDefinition>
