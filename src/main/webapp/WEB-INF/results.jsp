<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${update != null}">
		<form action="update" method="post">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th style="width: 12%">Field</th>
						<th>Value</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>ID</td>
						<td><input value="${update.id}" readonly name="id" /></td>
					</tr>
					<tr>
						<td>Title</td>
						<td><input value="${update.title}" name="title" /></td>
					</tr>
					<tr>
						<td>Description</td>
						<td><input value="${update.description}" name="description" /></td>
					</tr>
					<tr>
						<td>Release Year</td>
						<td><input name="releaseYear" type="number" value="${update.releaseYear }" /></td>
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
						<script>
							$("#lang>option")
									.each(
											function() {
												let opt = $(this)

												if (opt.attr("value") === "${update.language.id}") {
													opt.attr("selected",
															"selected")
												}
											});
						</script>
					</tr>
					<tr>
						<td>Rental Duration</td>
						<td><input name="rentalDuration" type="number" value="${update.rentalDuration}" /></td>
					</tr>
					<tr>
						<td>Rental Rate</td>
						<td><input name="rentalRate" type="number" value=${update.rentalRate } /></td>
					</tr>
					<tr>
						<td>Length</td>
						<td><input name="length" type="number" value="${update.length }" /></td>
					</tr>
					<tr>
						<td>Replacement Cost</td>
						<td><input name="replacementCost" type="number" value="${update.replacementCost}" /></td>
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
					</tr>
					<tr>
						<td>Special Features</td>
						<td>
							<div>
								<label><input type="checkbox" name="specialFeatures[]" value="Trailers">Trailers</label>
							</div>
							<div>
								<label><input type="checkbox" name="specialFeatures[]" value="Commentaries">Commentaries</label>
							</div>
							<div>
								<label><input type="checkbox" name="specialFeatures[]" value="Deleted Scenes">Deleted Scenes</label>
							</div>
							<div>
								<label><input type="checkbox" name="specialFeatures[]" value="Behind the Scenes">Behind the
									Scenes</label>
							</div>
						</td>
					</tr>
					<tr>
						<td>Actors</td>
						<td>
							<table class="table table-sm">
								<c:forEach items="${update.actors}" var="actor">
									<tr>
										<td>${actor.fullName}</td>
									</tr>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href="search?id=${update.id}"><button type="button" class="btn btn-secondary">Cancel</button></a>
							| <input class="btn btn-primary" type="submit" value="Apply" /></td>
					</tr>
				</tbody>
			</table>
		</form>

		<script>
			$("#lang>option").each(function() {
				let opt = $(this)

				if (opt.attr("value") === "${update.language.id}") {
					opt.attr("selected", "selected")
				}
			});

			$("#rating>option").each(function() {
				let opt = $(this)

				if (opt.attr("value") === "${update.rating}") {
					opt.attr("selected", "selected")
				}
			});

			$("label>input").each(function() {
				let opt = $(this)
				let ratings = "${update.specialFeatures}"
				if (ratings.includes(opt.attr("value"))) {
					opt.attr("checked", "checked")
				}
			});
		</script>
	</c:when>

	<c:when test="${result != null}">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th style="width: 12%">Field</th>
					<th>Value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>ID</td>
					<td>${result.id}</td>
				</tr>
				<tr>
					<td>Category</td>
					<td>${result.category.name}</td>
				</tr>
				<tr>
					<td>Title</td>
					<td>${result.title}</td>
				</tr>
				<tr>
					<td>Description</td>
					<td>${result.description}</td>
				</tr>
				<tr>
					<td>Release Year</td>
					<td>${result.releaseYear}</td>
				</tr>
				<tr>
					<td>Language</td>
					<td>${result.language.name}</td>
				</tr>
				<tr>
					<td>Rental Duration</td>
					<td>${result.rentalDuration}</td>
				</tr>
				<tr>
					<td>Rental Rate</td>
					<td>${result.rentalRate}</td>
				</tr>
				<tr>
					<td>Length</td>
					<td>${result.length}</td>
				</tr>
				<tr>
					<td>Replacement Cost</td>
					<td>${result.replacementCost}</td>
				</tr>
				<tr>
					<td>Rating</td>
					<td>${result.rating}</td>
				</tr>
				<tr>
					<td>Special Features</td>
					<td>${result.specialFeatures}</td>
				</tr>
				<tr>
					<td>Actors</td>
					<td>
						<table class="table table-sm">
							<c:forEach items="${result.actors}" var="actor">
								<tr>
									<td>${actor.fullName}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2"><a href="delete?id=${result.id}"><button type="button"
								class="btn btn-danger">Delete</button></a> | <a href="update?id=${result.id}"><button type="button"
								class="btn btn-primary">Modify</button></a></td>
				</tr>
			</tbody>
		</table>
	</c:when>

	<c:when test="${results != null }">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>ID</th>
					<th>Category</th>
					<th>Title</th>
					<th>Description</th>
					<th>Release Year</th>
					<th>Language</th>
					<th>Rental Duration</th>
					<th>Rental Rate</th>
					<th>Length</th>
					<th>Replacement Cost</th>
					<th>Rating</th>
					<th>Special Features</th>
					<th></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${results}" var="result">
					<tr>
						<td>${result.id}</td>
						<td>${result.category.name}</td>
						<td>${result.title}</td>
						<td>${result.description}</td>
						<td>${result.releaseYear}</td>
						<td>${result.language.name}</td>
						<td>${result.rentalDuration}</td>
						<td>${result.rentalRate}</td>
						<td>${result.length}</td>
						<td>${result.replacementCost}</td>
						<td>${result.rating}</td>
						<td>${result.specialFeatures}</td>
						<td>
							<div class="dropdown">
								<button class="btn btn-info dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Actors</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<c:forEach items="${result.actors}" var="actor">
										<a class="dropdown-item" href="#">${actor.fullName}</a>
									</c:forEach>
								</div>
							</div>
						</td>
						<td>
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">Actions</button>
								<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
									<a class="dropdown-item" href="update?id=${result.id}">Update</a> <a class="dropdown-item"
										href="delete?id=${result.id}">Delete</a>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:when>
</c:choose>