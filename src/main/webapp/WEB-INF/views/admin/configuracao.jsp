<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Configuração</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Data Início</th>
					<th>Data Fim</th>
					<th>Valor</th>
					<th>Valor Venda</th>
					<th>Ação
						<button class="btn btn-success btn-xs" type="button" onclick="novo()">
							<span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
						</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${configs}" var="config">
					<fmt:formatDate value="${config.dataInicio}" pattern="dd/MM/yyyy" var="dataInicio"/>
					<fmt:formatDate value="${config.dataFim}" pattern="dd/MM/yyyy" var="dataFim"/>
					<fmt:formatNumber value="${config.valor}" maxFractionDigits="2" minFractionDigits="2" var="valor"></fmt:formatNumber>
					<fmt:formatNumber value="${config.valorVenda}" maxFractionDigits="2" minFractionDigits="2" var="valorVenda"></fmt:formatNumber>
					<tr>
						<td class="f_id">${config.id}</td>
						<td class="f_dataInicio">${dataInicio}</td>
						<td class="f_dataFim">${not empty config.dataFim ? dataFim : '-'}</td>
						<td class="f_valor">${valor}</td>
						<td class="f_valorVenda">${valorVenda}</td>
						<td>
							<button class="btn btn-primary btn-xs" type="button" onclick="editar(this)">
								<span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
							</button>
							<button class="btn btn-danger btn-xs" type="button" onclick="remover('admin/configuracao', ${config.id})">
								<span aria-hidden="true" class="glyphicon glyphicon-trash"></span>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form action="save" method="post" style="display: none;">
			<input type="hidden" id="id" name="id"/>
			<div class="form-group">
				<label for="dataInicio">Data Início</label>
				<input type="date" class="form-control" id="dataInicio" name="dataInicio" placeholder="Data Início">
			</div>
			<div class="form-group">
				<label for="dataFim">Data Fim</label>
				<input type="date" class="form-control" id="dataFim" name="dataFim" placeholder="Data Fim">
			</div>
			<div class="form-group">
				<label for="valor">Valor</label>
				<input type="number" class="form-control" id="valor" name="valor" placeholder="Valor">
			</div>
			<div class="form-group">
				<label for="valorVenda">Valor Venda</label>
				<input type="number" class="form-control" id="valorVenda" name="valorVenda" placeholder="Valor Venda">
			</div>
			<button type="submit" class="btn btn-default">Salvar</button>
		</form>
	</tiles:putAttribute>
</tiles:insertDefinition>
