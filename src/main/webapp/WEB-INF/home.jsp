<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>

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
			<form action="searchById">
			<td>Search by ID</td>
			<td><input name="id" type="number" /></td>
			<td><input type="submit" /></td>
			</form>
		</tr>
		<tr>
			<form action="searchByKeyword">
				<td>Search by Keyword</td>
				<td><input name="keyword" type="text" /></td>
				<td><input type="submit" /></td>
			</form>
		</tr>
	</tbody>
</table>

<jsp:include page="footer.jsp"></jsp:include>