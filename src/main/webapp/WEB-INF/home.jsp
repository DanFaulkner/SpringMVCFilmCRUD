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
							<table id="search-by" class="table table-sm">
								<thead>
									<tr>
										<th>Field</th>
										<th>Value</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<form action="search">
											<td>ID</td>
											<td><input class="form-control form-control-sm" name="id" type="number" /></td>
											<td><input class="btn btn-primary" type="submit" /></td>
										</form>
									</tr>
									<tr>
										<form action="search">
											<td>Keyword</td>
											<td><input class="form-control form-control-sm" name="keyword" /></td>
											<td><input class="btn btn-primary" type="submit" /></td>
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
								<table id="create-film" class="table table-sm">
									<thead>
										<tr>
											<th>Field</th>
											<th>Value</th>
										</tr>
									</thead>
									<tbody>
										<form action="create" method="post">
											<tr>
												<td>Title</td>
												<td><input class="form-control form-control-sm" name="title" /></td>
											</tr>
										<tr>
											<td>Description</td>
											<td><input class="form-control form-control-sm" name="description" /></td>
										</tr>
										<tr>
											<td>Category</td>
											<td><select class="form-control form-control-sm" name="category.id">
													<option value="1">Action</option>
													<option value="2">Animation</option>
													<option value="3">Children</option>
													<option value="4">Classics</option>
													<option value="5">Comedy</option>
													<option value="6">Documentary</option>
													<option value="7">Drama</option>
													<option value="8">Family</option>
													<option value="9">Foreign</option>
													<option value="10">Games</option>
													<option value="11">Horror</option>
													<option value="12">Music</option>
													<option value="13">New</option>
													<option value="14">Sci-Fi</option>
													<option value="15">Sports</option>
													<option value="16">Travel</option>
											</select></td>
										</tr>
										<tr>
											<td>Release Year</td>
											<td><input class="form-control form-control-sm" name="releaseYear" type="number" value="2021" /></td>
										</tr>
										<tr>
											<td>Language</td>
											<td><select class="form-control form-control-sm" name="language.id">
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
											<td>
												<div class="input-group mb-3">
													<input name="rentalDuration" type="number" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">days</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>Rental Rate</td>
											<td>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input name="rentalRate" type="number" class="form-control">
												</div>
											</td>
										</tr>
										<tr>
											<td>Length</td>
											<td>
												<div class="input-group mb-3">
													<input name="length" type="number" class="form-control">
													<div class="input-group-append">
														<span class="input-group-text">minutes</span>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>Replacement Cost</td>
											<td>
												<div class="input-group mb-3">
													<div class="input-group-prepend">
														<span class="input-group-text">$</span>
													</div>
													<input name="replacementCost" type="number" class="form-control">
												</div>
											</td>
										</tr>
										<tr>
											<td>Rating</td>
											<td><select class="form-control form-control-sm" name="rating">
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
													<input type="checkbox" name="specialFeatures[]" id="op1" value="Trailers" /> <label for="op1">Trailers</label>
												</div>
												<div>
													<input type="checkbox" name="specialFeatures[]" id="op2" value="Commentaries" /> <label for="op2">Commentaries</label>
												</div>
												<div>
													<input type="checkbox" name="specialFeatures[]" id="op3" value="Deleted Scenes" /> <label for="op3">Deleted
														Scenes</label>
												</div>
												<div>
													<input type="checkbox" name="specialFeatures[]" id="op4" value="Behind the Scenes" /> <label for="op4">Behind
														the Scenes</label>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2"><input class="btn btn-primary" type="submit" /></td>
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