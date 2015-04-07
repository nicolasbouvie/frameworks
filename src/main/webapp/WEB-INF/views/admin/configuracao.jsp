<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Configurações</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Data Início</th>
					<th>Data Fim</th>
					<th>Valor</th>
					<th>Valor Venda</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${configs}" var="config">
					<tr>
						<td>${config.id}</td>
						<td>${config.dataInicio}</td>
						<td>${not empty config.dataFim ? config.dataFim : '-'}</td>
						<td>${config.valor}</td>
						<td>${config.valorVenda}</td>
						<td>
							<button class="btn btn-primary btn-xs" type="button" onclick="editar(this)">
								<span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
							</button>
							<button class="btn btn-danger btn-xs" type="button" onclick="remover(this)">
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
	
	<tiles:putAttribute name="script">
		<script type="text/javascript">
			function editar(el) {
				var tds = $(el).parent().parent().find("td");
				$("form").slideDown();
				$("#id")        .val($(tds[0]).text());
				$("#dataInicio").val($(tds[1]).text());
				$("#dataFim")   .val($(tds[2]).text());
				$("#valor")     .val($(tds[3]).text());
				$("#valorVenda").val($(tds[4]).text());
			}
			
			function remover(el) {
				var id = $(el).parent().parent().find("td:eq(0)").text();
				alert("Remover "+id)
			}
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
