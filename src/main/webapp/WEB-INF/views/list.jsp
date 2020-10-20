<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<div class="jumbotron">
		<h1>게시글 리스트 페이지</h1>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-dark">
				<thead>
					<tr>
						<td>ID</td>
						<td>TITLE</td>
						<td>CONTENT</td>
						<td>READCOUNT</td>
						<td>CREATEDATE</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boards.content}">
						<tr>
							<td>${board.id}</td>
							<td><a href="/board/${board.id}">${board.title}</a></td>
							<td>${board.content}</td>
							<td>${board.readCount}</td>
							<td><fmt:formatDate value="${board.createDate }"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>

	<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${boards.first}">
				<li class="page-item disabled"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber-1}">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber-1}">Previous</a></li>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when test="${boards.last}">
				<li class="page-item disabled"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="/list?page=${boards.pageable.pageNumber+1}">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</main>

<%@ include file="layout/footer.jsp"%>
