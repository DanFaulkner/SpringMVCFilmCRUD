<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<jsp:include page="footer.jsp"></jsp:include>