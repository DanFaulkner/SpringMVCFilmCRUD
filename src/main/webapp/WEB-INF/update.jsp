<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table class="table table-striped">
	<thead>
		<tr>
			<th>Field</th>
			<th>Value</th>
		</tr>
	</thead>
	<tbody>
		<form action="update" method="post">
			<tr>
				<td>ID</td>
				<td>${film.id}</td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input value="${film.title}" name="title" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input value="${film.description}" name="description" /></td>
			</tr>
			<tr>
				<td>Release Year</td>
				<td><input name="releaseYear" type="number"
					value="${film.releaseYear }" /></td>
			</tr>
			<tr>
				<td>Language</td>
				<td><select name="language.id" id="lang">
						<option value="1">English</option>
						<option value="2">Italian</option>
						<option value="3">Japanese</option>
						<option value="4">Mandarin</option>
						<option value="5">French</option>
						<option value="6">German</option>
				</select></td>
				<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
				<script>
					$("#lang>option").each(function() {
						let opt = $(this)

						if (opt.attr("value") === "${film.language.id}") {
							opt.attr("selected", "selected")
						}
					});
				</script>
			</tr>
			<tr>
				<td>Rental Duration</td>
				<td><input name="rentalDuration" type="number"
					value="${film.rentalDuration}" /></td>
			</tr>
			<tr>
				<td>Rental Rate</td>
				<td><input name="rentalRate" type="number"
					value=${film.rentalRate } /></td>
			</tr>
			<tr>
				<td>Length</td>
				<td><input name="length" type="number" value="${film.length }" /></td>
			</tr>
			<tr>
				<td>Replacement Cost</td>
				<td><input name="replacementCost" type="number"
					value="${film.replacementCost}" /></td>
			</tr>
			<tr>
				<td>Rating</td>
				<td><select name="rating" id="rating">
						<option value="G">G</option>
						<option value="PG">PG</option>
						<option value="PG13">PG13</option>
						<option value="R">R</option>
						<option value="NC17">NC17</option>
				</select></td>
				<script>
					$("#rating>option").each(function() {
						let opt = $(this)

						if (opt.attr("value") === "${film.rating}") {
							opt.attr("selected", "selected")
						}
					});
				</script>
			</tr>
			<tr>
				<td>Special Features</td>
				<td>
					<div>
						<label><input type="checkbox" name="specialFeatures[]"
							value="Trailers">Trailers</label>
					</div>
					<div>
						<label><input type="checkbox" name="specialFeatures[]"
							value="Commentaries">Commentaries</label>
					</div>
					<div>
						<label><input type="checkbox" name="specialFeatures[]"
							value="Deleted Scenes">Deleted Scenes</label>
					</div>
					<div>
						<label><input type="checkbox" name="specialFeatures[]"
							value="Behind the Scenes">Behind the Scenes</label>
					</div>
				</td>
				<script>
					$("label>input").each(function() {
						let opt = $(this)
						let ratings = "${film.specialFeatures}"
						if (ratings.includes(opt.attr("value"))) {
							opt.attr("checked", "checked")
						}
					});
				</script>

			</tr>
			<tr>
				<td colspan="2"><input class="btn btn-primary" type="submit" /></td>
			</tr>
	</tbody>
</table>