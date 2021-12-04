<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp" />

<div class="container-fluid">
	<div class="row">
		<div class="col-3">
			<div id="accordion">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h5 class="mb-0">
							<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">Search</button>
						</h5>
					</div>

					<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
						<div class="card-body">
							<table id="search-by" class="table">
								<thead>
									<tr>
										<th>By</th>
										<th>Value</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<form method="post">
										<td>ID</td>
										<td><input name="id" type="number" /></td>
										<td><input type="submit" /></td>
										</form>
									</tr>
									<tr>
										<form method="post">
											<td>Keyword</td>
											<td><input name="keyword" type="text" /></td>
											<td><input type="submit" /></td>
										</form>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h5 class="mb-0">
								<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false"
									aria-controls="collapseTwo">Create</button>
							</h5>
						</div>
						<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
							<div class="card-body">
								<table id="create-film" class="table">
									<thead>
										<tr>
											<th colspan="2">Create Film</th>
										</tr>
										<tr>
											<th>Field</th>
											<th>Value</th>
										</tr>
									</thead>
									<tbody>
										<form action="create" method="get">
											<tr>
												<td>Title</td>
												<td><input name="title" /></td>
											</tr>
											<tr>
												<td>Description</td>
												<td><input name="desc" /></td>
											</tr>
											<tr>
												<td>Release Year</td>
												<td><input name="release_year" type="date" /></td>
											</tr>
											<tr>
												<td>Language</td>
												<td><select name="language">
														<option value="1">English</option>
														<option value="2">Italian</option>
														<option value="3">Japanese</option>
														<option value="4">Mandarin</option>
														<option value="5">French</option>
														<option value="6">German</option>
												</select></td>
											</tr>
											<tr>
												<td>Rental Duration</td>
												<td><input name="rental_duration" type="number" placeholder="0" /></td>
											</tr>
											<tr>
												<td>Rental Rate</td>
												<td><input name="rental_rate" type="number" placeholder="0.00" /></td>
											</tr>
											<tr>
												<td>Length</td>
												<td><input name="length" type="number" placeholder="0" /></td>
											</tr>
											<tr>
												<td>Replacement Cost</td>
												<td><input name="replacement_cost" type="number" placeholder="0.00" /></td>
											</tr>
											<tr>
												<td>Rating</td>
												<td><select name="rating">
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
														<label><input type="checkbox" name="special_features[]" value="Trailers">Trailers</label>
													</div>
													<div>
														<label><input type="checkbox" name="special_features[]" value="Commentaries">Commentaries</label>
													</div>
													<div>
														<label><input type="checkbox" name="special_features[]" value="Deleted Scenes">Deleted
															Scenes</label>
													</div>
													<div>
														<label><input type="checkbox" name="special_features[]" value="Behind the Scenes">Behind
															the Scenes</label>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2"><input type="submit" /></td>
											</tr>
										</form>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of left sidebar -->

		<div class="col">
			<c:choose>
				<c:when test="${ success != null }">
					<div class="alert alert-success" role="alert">${ success }</div>
				</c:when>
				<c:when test="${ warning != null }">
					<div class="alert alert-warning" role="alert">${ warning }</div>
				</c:when>
				<c:when test="${ error != null }">
					<div class="alert alert-danger" role="alert">${ error }</div>
				</c:when>
			</c:choose>
			<jsp:include page="results.jsp" />
		</div>

	</div>
	<!-- end of row -->
</div>
<!-- end of container-fluid -->


<jsp:include page="footer.jsp"></jsp:include>