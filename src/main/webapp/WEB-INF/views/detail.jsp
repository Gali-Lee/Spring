<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<div class="jumbotron">
		<h1>글 수정 페이지</h1>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="form-group">
				TITLE : <input type="text" class="form-control form-control-sm"
					value="${board.title }" name="text1" id="title">
			</div>
			<div class="form-group">
				<div id="summernote">${board.content }</div>
			</div>
			<button onclick="update()">수정</button>
		</div>
		<div class="sm-sm-1"></div>

	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>
</main>

<script type="text/javascript">

function updateBoard(id){
	let title_el = document.querySelector("#title");
	let content_el = document.querySelector("#content");

	let title = title_el.value;
	let content = content_el.value;

	console.log("id",id);
	console.log("title",title);
	console.log("content",content);

	let board = {
		title: title,
		content: content
	};
	/*  */
	fetch("/board/"+id,{
		method:"put",
		headers:{
			'Content-Type':'application/json; charset=utf-8',	
		},
		body:JSON.stringify(board)
		
	}).then(res=>res.text())
	.then(res=>{
		if(res=="ok"){
			alert("수정완료");
			self.location="/list";
		}else{
			alert("수정실패");
		}
	});
	
}

function deleteBoard(id){
	fetch("/board/"+id,{
		method:"delete"
	}).then(res=>res.text())
	.then(res=>{
		if(res=="ok"){
			alert("삭제성공");
			location.href="/list";
		}
	});
}

</script>

<%@ include file="layout/footer.jsp"%>
