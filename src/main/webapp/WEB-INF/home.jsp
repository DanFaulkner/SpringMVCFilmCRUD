<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"></jsp:include>

<c:if test="${ message != null }">
	${ message }
	<hr>
</c:if>

<c:choose>
	<c:when test="${result != null }">
		<table>
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
			</tbody>
		</table>
	</c:when>
	<c:when test="${results != null }">
		<table>
			<thead>
				<tr>
					<th>ID</th>
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${results}" var="result">
					<tr>
						<td>${result.id}</td>
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
				</c:forEach>
			</tbody>
		</table>
	</c:when>
</c:choose>

<table>
	<thead>
		<tr>
			<th>Method</th>
			<th>Data</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<form action="/search" method="post">
				<td>Search by ID</td>
				<td><input name="id" type="number" /></td>
				<td><input type="submit" /></td>
			</form>
		</tr>
		<tr>
			<form action="/search" method="post">
				<td>Search by Keyword</td>
				<td><input name="keyword" type="text" /></td>
				<td><input type="submit" /></td>
			</form>
		</tr>
	</tbody>
</table>

<table>
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
		<form action="/create" method="get">
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
					<label><input type="checkbox" name="special_features[]" value="Deleted Scenes">Deleted Scenes</label>
				</div>
				<div>
					<label><input type="checkbox" name="special_features[]" value="Behind the Scenes">Behind the Scenes</label>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" /></td>
		</tr>
		</form>
	</tbody>
</table>



<jsp:include page="footer.jsp"></jsp:include>