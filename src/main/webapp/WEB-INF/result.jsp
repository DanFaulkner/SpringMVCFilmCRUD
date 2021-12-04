<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>

<h1>
	<a href="/">&lt; Back</a>
</h1>

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
	<c:otherwise>
		<h1>No results found!</h1>
	</c:otherwise>
</c:choose>

<jsp:include page="footer.jsp"></jsp:include>