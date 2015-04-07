<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Usuários Cadastrados</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Ação</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td>${user.id}</td>
						<td>${user.nome}</td>
						<td>${user.username}</td>
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
				<label for="email">Email</label>
				<input type="email" class="form-control" id="email" name="email" placeholder="Email">
			</div>
			<div class="form-group">
				<label for="nome">Nome</label>
				<input type="text" class="form-control" id="nome" name="nome" placeholder="Nome">
			</div>
			<div class="form-group">
				<label for="password">Senha</label>
				<input type="password" class="form-control" id="password" name="password" placeholder="Senha">
			</div>
			<div class="form-group">
				<label for="confPassword">Confirmar</label>
				<input type="password" class="form-control" id="confPassword" name="confPassword" placeholder="Confirmar">
			</div>
			<button type="submit" class="btn btn-default">Salvar</button>
		</form>
	</tiles:putAttribute>
	
	<tiles:putAttribute name="script">
		<script type="text/javascript">
			function editar(el) {
				var tds = $(el).parent().parent().find("td");
				$("form").slideDown();
				$("#id")   .val($(tds[0]).text());
				$("#email").val($(tds[1]).text());
				$("#nome") .val($(tds[2]).text());
				$("#password, #confPassword") .val("");
			}
			
			function remover(el) {
				var id = $(el).parent().parent().find("td:eq(0)").text();
				alert("Remover "+id)
			}
		</script>
	</tiles:putAttribute>
</tiles:insertDefinition>
