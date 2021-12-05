<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${result != null }">
		<table class="table table-striped table-sm">
			<thead>
				<tr>
					<th>Field</th>
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
									<td>${actor.firstName}${actor.lastName}</td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>
				<tr>
					<td><a href="delete?id=${result.id}">Delete</a></td>
					<td><a href="update?id=${result.id}">Update</a></td>
				</tr>
			</tbody>
		</table>
		<hr>
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
		<hr>
	</c:when>
</c:choose>