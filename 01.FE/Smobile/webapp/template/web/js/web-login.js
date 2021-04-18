/*<script type="text/javascript">
	$(document).ready(function() {


		$(document).delegate('#submit', 'click', function (event) {
			event.preventDefault();

			var username = $('#username').val();
			var password = $('#password').val();

			$.ajax({
				type: "POST",
				contentType: "application/json; charset=utf-8",
				url: "http://localhost:8080/api/v1/login",
				data: JSON.stringify({ 'username': username, 'password': password }),
				cache: false,
				success: function (result) {
				},
				error: function (err) {
				}
			});
		})

		});
	</script>*/