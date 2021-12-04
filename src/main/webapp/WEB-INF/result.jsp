<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%>

<h1>
	<a href="/">&lt; Back</a>
</h1>

<c:choose>
	<c:when test="${value != null }">
		<h1>Test value: ${ value }</h1>
	</c:when>
	<c:otherwise>
		<h1>No test value</h1>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${result != null }">
		<table>
			<thead>
				<tr>
					<th>field</th>
					<th>value</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>None</td>
					<td>None</td>
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
						<td>${result.languiage}</td>
						<td>${result.rentalDuration}</td>
						<td><fmt:formatNumber type="currency" value="${result.rentalRate}" /></td>
						<td>${result.length}</td>
						<td><fmt:formatNumber type="currency" value="${result.replacementCost}" /></td>
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