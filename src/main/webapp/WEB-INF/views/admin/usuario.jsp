<%@page session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertDefinition name="default">
	<tiles:putAttribute name="body">
		<h3>Usuários</h3>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Nome</th>
					<th>Email</th>
					<th>Ação
						<button class="btn btn-success btn-xs" type="button" onclick="novo()">
							<span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
						</button>
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="user">
					<tr>
						<td class="f_id">${user.id}</td>
						<td class="f_nome">${user.nome}</td>
						<td class="f_email">${user.username}</td>
						<td class="f_password" style="display:none;"></td>
						<td class="f_confPassword" style="display:none;"></td>
						<td>
							<button class="btn btn-primary btn-xs" type="button" onclick="editar(this)">
								<span aria-hidden="true" class="glyphicon glyphicon-edit"></span>
							</button>
							<button class="btn btn-danger btn-xs" type="button" onclick="remover('admin/usuario', ${user.id})">
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
</tiles:insertDefinition>
