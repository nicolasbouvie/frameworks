<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function novo() {
		var id = $("#id").val();
		$("form input, form select").val("");
		if (id == "0") {
			$("form").slideUp();
		} else {
			$("form").slideDown();
			$("#id").val("0");
		}
	}
	function editar(el) {
		var tds = $(el).parent().parent().find("td[class^='f_']");
		$("form").slideDown();
		for (i in tds) {
			var f = $(tds[i]).attr("class").substr(2);
			if (f == 'id' && $("#id").val() == $(tds[i]).text()) {
				$("#id").val("");
				$("form").slideUp();
				return;
			}
			$("#"+f).val($(tds[i]).text());
		}
	}

	function remover(entity, id) {
		if (confirm("Confirmar exclusão")) {
			var form = $("<form method='POST'></form>");
			form.attr("action", "${pageContext.request.contextPath}/" + entity + "/remover/" + id);
			$('body').append(form);
			form.submit().remove();
		}
	}
</script>